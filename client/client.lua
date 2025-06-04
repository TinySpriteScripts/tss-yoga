-- ┌──────────────────┐
-- │    CLIENT.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │
CreateThread(function()
	for k, v in pairs(Locations) do
		if v.ZoneEnable then
            if v.Blip then
                GetBlip({ 
                    Coords=v.Blip.coords, 
                    Label=v.Blip.label, 
                    Sprite=v.Blip.sprite, 
                    Display=v.Blip.display, 
                    Color=v.Blip.blipcolor, 
                })
            end

            local function buildTargets(category, list, actionCallback, getOptions)
                for l, b in pairs(list or {}) do
                    local minZ = b.minZ ~= nil and b.minZ or (b.coords.z - 1)
                    local maxZ = b.maxZ ~= nil and b.maxZ or (b.coords.z + 1)
                    local zoneName = ("%s:%s:%s[%s]"):format(GetCurrentResourceName(), k, category, l)
                    local zoneOptions = getOptions and getOptions(b, l, zoneName) or {}

                    CreateZoneAndProps(zoneName, b.coords.xyz, b.l, b.w, b.coords.w, minZ, maxZ, zoneOptions, b.prop)
                end
            end

            buildTargets("Yoga", v.Yoga, nil, function(b)
                return {
                    { action = function() DoYoga() end, icon = b.icon, label = b.label, }
                }, b.prop
            end)
        end
    end
end)

---------- // Animation and Progressbar
function DoYoga()
    local Anim, Dict = "amb@world_human_yoga@female@base", "base_b"
    local success = MKProgress({
        Label = Loc[Config.Lan].progress["yoga"], Time = 19000, WhileDead = false, CanCancel = true, 
        DisMovement = true, DisCarMovement = true, DisCombat = true, DisMouse = false,
        Dict = Anim, Anim = Dict, Flag = 8, ProgressType = "bar", position = "bottom",
    })
    if success then
        TriggerServerEvent('hud:server:RelieveStress', Config.Stress)
        SetEntityHealth(ped, GetEntityHealth(ped) + Config.Health)
    else
        TriggerEvent('inventory:client:busy:status', false)
        Notify(nil, Loc[Config.Lan].error["cancelled"], "error")
    end
end
