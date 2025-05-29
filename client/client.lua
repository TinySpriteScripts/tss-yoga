-- ┌──────────────────┐
-- │    CLIENT.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │

CreateThread(function()
	for k, v in pairs(Locations) do
		if v.ZoneEnable then
			local bossroles, gangroles = {}, {}
			while not Jobs do Wait(10) end
			if not v.Job and not v.Gang then print("^1Error^7: ^1Skipping location^7. ^2No Job or Gang Set^7") return end
			if not Jobs[v.Job] and not Jobs[v.Gang] and not Gangs[v.Gang] then
				print("^1Error^7: ^1Skipping location^7. ^2Can't find the job/gang ^7'^6"..(v.Job or v.Gang).."^7' ^2in ^6Jobs^7") return
			end
			if v.Job and Jobs[v.Job] then bossroles = makeBossRoles(v.Job) elseif v.Gang and (Jobs[v.Gang] or Gangs[v.Gang]) then gangroles = makeBossRoles(v.Gang) end
			if v.Blip.Enable then GetBlip({ Coords=v.Blip.Coords, Sprite=v.Blip.Sprite, Color=v.Blip.Color, Scale=v.Blip.Scale, Display=v.Blip.Display, Label=v.Label }) end 

		-- ┌─────────────┐
		-- │    Yoga     │
		-- └─────────────┘
            for l, b in pairs(v.Yoga) do
                local name = GetCurrentResourceName()..":"..k..":Yoga["..l.."]"
                createBoxTarget({name, b.coords.xyz, b.l, b.w, { name = name, heading = b.coords.w, debugPoly = debugMode, minZ=b.coords.z-1, maxZ=b.coords.z+1 } },
                    {
                        { 	
                            action = function() DoYoga() end, 
                            job = v.Job and bossroles, 
                            gang = v.Gang and gangroles, 
                            icon = b.icon, label = b.label, 
                        },
                    }, 2.0)
                if b.prop then GetProp({ 
                    Prop=b.prop.model, 
                    Coords=b.coords.xyz, 
                    Head=b.coords.w 
                }) end
                if b.blip then GetBlip({ 
                    Coords=b.coords, 
                    Sprite=b.blip.sprite, 
                    Color=b.blip.blipcolor, 
                    Scale=b.blip.scale, 
                    Display=b.blip.display, 
                    Label=b.blip.name 
                }) end
			end
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
