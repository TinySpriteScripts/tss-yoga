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
end)

CreateThread(function()
	local yogamat = CreateObject(4062944218,-488.87, -217.89, 36.58-1.0,false,false,false) -- front left
	SetEntityHeading(yogamat,GetEntityHeading(yogamat)-60)
	FreezeEntityPosition(yogamat, true)

	local yogamat2 = CreateObject(2057317573, -491.09, -219.26, 36.52-1.0,false,false,false) -- front right
	SetEntityHeading(yogamat2,GetEntityHeading(yogamat2)-60)
	FreezeEntityPosition(yogamat2, true)

	local yogamat3 = CreateObject(2316225442, -491.57, -216.18, 36.62-1.0,false,false,false) -- back
	SetEntityHeading(yogamat3,GetEntityHeading(yogamat3)-60)
	FreezeEntityPosition(yogamat3, true)
end)

Citizen.CreateThread(function()
	for k, v in pairs(Config.Yoga) do
		exports['qb-target']:AddBoxZone("Yoga"..k, v.location, v.width, v.height, { name="Yoga"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
			{ options = { { event = "8bit-yoga:Yoga", icon = "fas fa-walking", label = "Stretch", loc = v.yoga, head = v.heading }, },
				distance = v.distance
		})
	end
end)

RegisterNetEvent('8bit-yoga:Yoga')
AddEventHandler('8bit-yoga:Yoga',function()
    QBCore.Functions.Progressbar('washing_hands', 'Finding the Zen', 18500, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_yoga@female@base", 
        anim = "base_b", 
        flags = 8,
    }, {}, {}, function()  
        TriggerServerEvent('hud:server:RelieveStress', Config.Stress) -- Default 10 Stress Relief
    end, function() -- Cancel
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "Cancelled", 'error')
    end)
end)
