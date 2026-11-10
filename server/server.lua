-- ┌──────────────────┐
-- │    SERVER.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │
---@type TSSServerModules
local TSS = exports.tss_bridge:GetModules({ 'Player', 'Notify' }, Config.TSS)

local resource = GetCurrentResourceName()
local lastFinished = {}

-- Called by the client once the yoga progress bar completes.
RegisterNetEvent(resource .. ':server:FinishYoga', function(location, index)
    local src = source
    local mat = Locations[location] and Locations[location].ZoneEnable and Locations[location].Yoga
        and Locations[location].Yoga[tonumber(index) or -1]
    if not mat then return end

    -- Must be standing at the mat that was used.
    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - mat.coords.xyz) > 5.0 then return end

    -- Cannot be rewarded faster than the progress bar allows.
    local now = GetGameTimer()
    if lastFinished[src] and now - lastFinished[src] < Config.Duration - 1000 then return end
    lastFinished[src] = now

    if Config.Stress > 0 then
        TSS.Player.AddNeeds(src, { stress = -Config.Stress })
    end
    if Config.Health > 0 then
        TriggerClientEvent(resource .. ':client:AddHealth', src, Config.Health)
    end
end)

AddEventHandler('playerDropped', function()
    lastFinished[source] = nil
end)
