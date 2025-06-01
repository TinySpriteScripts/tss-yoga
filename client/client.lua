-- ┌──────────────────┐
-- │    CLIENT.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │

CreateThread(function()
	for k, v in pairs(Locations) do
		if v.ZoneEnable then
		-- ┌─────────────┐
		-- │    Yoga     │
		-- └─────────────┘
            for l, b in pairs(v.Yoga) do
                local name = GetCurrentResourceName()..":"..k..":Yoga["..l.."]"
                createBoxTarget({name, b.coords.xyz, b.l, b.w, { name = name, heading = b.coords.w, debugPoly = debugMode, minZ=b.coords.z-1, maxZ=b.coords.z+1 } },
                    {
                        { 	
                            action = function() DoYoga() end,
                            icon = b.icon,
                            label = b.label,
                        },
                    }, 2.0)
                if b.prop then 
                    for _, propData in pairs(b.prop) do 
                        GetProp({ 
                            Prop = propData.model, 
                            Coords = propData.coords.xyz, 
                            Head = propData.coords.w 
                        }) 
                    end 
                end
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
