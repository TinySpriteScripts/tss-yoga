local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    ---------- // Map Blips
    for k, v in pairs(Config.YogaLocations) do
        if Config.YogaLocations[k].blip then
            Blip = AddBlipForCoord(Config.YogaLocations[k].location)
            SetBlipSprite(Blip, 197)
            SetBlipDisplay(Blip, 4)
            SetBlipColour(Blip, Config.YogaLocations[k].blipcolor)
            SetBlipScale(Blip, 0.6)
            SetBlipAsShortRange(Blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.YogaLocations[k].name)
            EndTextCommandSetBlipName(Blip)
        end
    end
    ---------- // Yogamat Spawn
    for k, v in pairs(Config.YogaLocations) do
        local yogamat = CreateObject(Config.YogaLocations[k].yogamat, vector3(Config.YogaLocations[k].location.x, Config.YogaLocations[k].location.y, Config.YogaLocations[k].location.z),false,false,false)
        SetEntityHeading(yogamat,GetEntityHeading(yogamat)-60)
        FreezeEntityPosition(yogamat, true)
    end
    ---------- // Target Circle Spawn
    for k, v in pairs(Config.YogaLocations) do
        exports['qb-target']:AddCircleZone(Config.YogaLocations[k].name, vector3(Config.YogaLocations[k].location.x, Config.YogaLocations[k].location.y, Config.YogaLocations[k].location.z), 0.88, 
        { name=Config.YogaLocations[k].name, debugPoly=Config.Debug, useZ=true, }, { options = { { event = "mk-yoga:Yoga", icon = "fas fa-walking", label = "Stretch" }, }, distance = 2.0 })
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
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)