-- ┌──────────────────┐
-- │    CLIENT.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │
---@type TSSClientModules
local TSS = exports.tss_bridge:GetModules({ 'Targets', 'Props', 'Blips', 'ProgressBar', 'Notify' }, Config.TSS)

local resource = GetCurrentResourceName()
local busy = false

local function L(section, key)
    local lang = Loc[Config.Lan] or Loc.en
    return lang[section] and lang[section][key] or key
end

local function Debug(message, ...)
    if Config.Debug then print(('^5[%s]^7 ' .. message):format(resource, ...)) end
end

---------- // Walk to the middle of the mat
-- Returns true once the player is standing on the mat centre, facing along it.
local function WalkToMat(coords)
    local ped = PlayerPedId()
    local target = vector3(coords.x, coords.y, coords.z)
    local heading = (coords.w + (Config.Animation.headingOffset or 0.0)) % 360.0

    if #(GetEntityCoords(ped) - target) > 0.35 then
        ClearPedTasks(ped)
        TaskGoStraightToCoord(ped, target.x, target.y, target.z, 1.0, 10000, heading, 0.1)

        local timeout = GetGameTimer() + 10000
        while #(GetEntityCoords(ped).xy - target.xy) > 0.35 do
            if GetGameTimer() > timeout or IsPedRagdoll(ped) or IsPedInAnyVehicle(ped, true) then
                ClearPedTasks(ped)
                return false
            end
            Wait(50)
        end
        ClearPedTasks(ped)
    end

    -- Line the player up with the mat so the stretch happens on it.
    SetEntityCoords(ped, target.x, target.y, GetEntityCoords(ped).z - 1.0, false, false, false, false)
    SetEntityHeading(ped, heading)
    Wait(100)
    return true
end

---------- // Animation and Progressbar
local function DoYoga(location, index)
    if busy then return end
    busy = true

    local mat = Locations[location].Yoga[index]
    if not WalkToMat(mat.coords) then
        TSS.Notify.Send({ message = L('error', 'cancelled'), type = 'error' })
        busy = false
        return
    end

    local anim = Config.Animation
    local success = TSS.ProgressBar.Start({
        label = L('progress', 'yoga'),
        duration = Config.Duration,
        canCancel = true,
        dict = anim.dict,
        anim = anim.clip,
        flag = anim.flag,
    })

    if success then
        -- Rewards are applied and validated by the server.
        TriggerServerEvent(resource .. ':server:FinishYoga', location, index)
    else
        TSS.Notify.Send({ message = L('error', 'cancelled'), type = 'error' })
    end
    busy = false
end

RegisterNetEvent(resource .. ':client:AddHealth', function(amount)
    local ped = PlayerPedId()
    SetEntityHealth(ped, math.min(GetEntityMaxHealth(ped), GetEntityHealth(ped) + amount))
end)

---------- // Zones, Props and Blips
CreateThread(function()
    for name, location in pairs(Locations) do
        if location.ZoneEnable then
            if location.Blip then
                TSS.Blips.Create({
                    coords = location.Blip.coords,
                    label = location.Blip.label,
                    sprite = location.Blip.sprite,
                    display = location.Blip.display,
                    colour = location.Blip.blipcolor,
                    scale = location.Blip.scale,
                    shortRange = true,
                })
                Debug('Blip created for: %s', location.Blip.label)
            end

            for index, mat in ipairs(location.Yoga or {}) do
                TSS.Targets.Box({
                    name = ('%s:%s:Yoga[%s]'):format(resource, name, index),
                    coords = mat.coords.xyz,
                    length = mat.l,
                    width = mat.w,
                    heading = mat.coords.w,
                    minZ = mat.minZ or (mat.coords.z - 1),
                    maxZ = mat.maxZ or (mat.coords.z + 1),
                    debug = Config.Debug,
                }, {
                    { icon = mat.icon, label = mat.label, action = function() DoYoga(name, index) end },
                }, 2.0)

                for _, prop in ipairs(mat.prop or {}) do
                    TSS.Props.Create({
                        model = prop.model,
                        coords = vector4(prop.coords.x, prop.coords.y, prop.coords.z, prop.coords.w - 180.0),
                    }, nil, { freeze = true })
                end
            end
        end
    end
end)
