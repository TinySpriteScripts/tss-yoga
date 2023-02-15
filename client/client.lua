local QBCore = exports['qb-core']:GetCoreObject()
local Targets = {}

if Config.Debug then print("MK-Yoga - Yoga Script by McKlean-Scripts") end

CreateThread(function()
    ---------- // Map Blips
    for k, v in pairs(Config.YogaLocations) do
        if v.blip then
            Blip = AddBlipForCoord(v.location)
            SetBlipSprite(Blip, v.sprite)
            SetBlipDisplay(Blip, v.display)
            SetBlipColour(Blip, v.blipcolor)
            SetBlipScale(blip, v.scale)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.name)
            EndTextCommandSetBlipName(Blip)
            if Config.Debug then print(Lang:t('clientdebug.debug1', {one = v.name})) end
        end
    ---------- // Yogamat Spawn
        local yogamat = CreateObject(v.yogamat, v.location,false,false,false)
        SetEntityHeading(yogamat,GetEntityHeading(yogamat)-60)
        FreezeEntityPosition(yogamat, true)
    ---------- // Target Circle Spawn
        local name = v.name
        Targets[name] =
            exports['qb-target']:AddCircleZone(name, v.location, 0.88, { name=name, debugPoly=Config.Debug, useZ=true, }, 
                { options = { { event = "mk-yoga:Yoga", icon = "fas fa-walking", label = Lang:t('target.TargetLabel') }, }, distance = 2.0 })
    end
end)
---------- // Animation and Progressbar
RegisterNetEvent('mk-yoga:Yoga')
AddEventHandler('mk-yoga:Yoga',function()
    QBCore.Functions.Progressbar('finding_zen', Config.PbName, Config.PbTime, false, false, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {
        animDict = Config.Anim, anim = Config.Dict, flags = 8,
    }, {}, {}, function()  
        TriggerServerEvent('hud:server:RelieveStress', Config.Stress)
        SetEntityHealth(ped, GetEntityHealth(ped) + Config.Health)
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for k, v in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
end)