local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    Blip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(Blip, 197)
    SetBlipDisplay(Blip, 4)
    SetBlipColour(Blip, 27)
    SetBlipScale(Blip, 0.6)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(Blip)

	local yogamat = CreateObject(4062944218,-488.87, -217.89, 36.58-1.0,false,false,false) -- front left
	SetEntityHeading(yogamat,GetEntityHeading(yogamat)-60)
	FreezeEntityPosition(yogamat, true)

	local yogamat2 = CreateObject(2057317573, -491.09, -219.26, 36.52-1.0,false,false,false) -- front right
	SetEntityHeading(yogamat2,GetEntityHeading(yogamat2)-60)
	FreezeEntityPosition(yogamat2, true)

	local yogamat3 = CreateObject(2316225442, -491.57, -216.18, 36.62-1.0,false,false,false) -- back
	SetEntityHeading(yogamat3,GetEntityHeading(yogamat3)-60)
	FreezeEntityPosition(yogamat3, true)

	for k, v in pairs(Config.YogaLocations) do
		exports['qb-target']:AddBoxZone("Yoga"..k, v.location, v.width, v.height, { name="Yoga"..k, heading = v.heading, debugPoly=Config.Debug, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "mk-yoga:Yoga", icon = "fas fa-walking", label = "Stretch", loc = v.yoga, head = v.heading }, },
				distance = v.distance
		})
	end

end)

RegisterNetEvent('mk-yoga:Yoga')
AddEventHandler('mk-yoga:Yoga',function()
    QBCore.Functions.Progressbar('finding_zen', 'Finding the Zen', Config.Progressbar, false, false, {
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
