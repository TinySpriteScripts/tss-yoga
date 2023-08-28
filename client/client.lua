local QBCore = exports['qb-core']:GetCoreObject()
local Targets = {}

CreateThread(function()
    ---------- // Map Blips
    for k, v in pairs(Config.YogaLocations) do
        if v.blip then GetBlip({ Coords=v.location, Sprite=v.sprite, Color=v.blipcolor, Scale=v.scale, Display=v.display, Label=v.name }) end 
    ---------- // Yogamat Spawn
        GetProp({ Prop=v.yogamat, Coords=v.location.xyz, Head=v.location.w })
    ---------- // Target Circle Spawn
        local name = v.name..k
        Targets[name] =
            exports['qb-target']:AddCircleZone(name, v.location, 0.88, { name=name, debugPoly=Config.Debug, useZ=true, }, 
                { options = { { icon = "fas fa-walking", label = Lang:t('target.TargetLabel'), event = "mk-yoga:Yoga" }, }, distance = 2.0 })
    end
end)
---------- // Animation and Progressbar
RegisterNetEvent('mk-yoga:Yoga',function()
    if MKProgress({ 
		Label=Config.PbName,
		Time=Config.PbTime, 
		WhileDead=false,  CanCancel=true, 
		DisMovement=true,  DisCarMovement=true,  DisMouse=false,  DiCombat=true, 
		Dict=Config.Anim,  Anim=Config.Dict,  Flags=8,
	}) then
		TriggerServerEvent('hud:server:RelieveStress', Config.Stress)
        SetEntityHealth(ped, GetEntityHealth(ped) + Config.Health)
	else 
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', Lang:t('error.cancelled'), 'error')
	end
end)

---------- // Footer
AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for k, v in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
end)