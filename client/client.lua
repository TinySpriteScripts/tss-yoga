-- ┌──────────────────┐
-- │    CLIENT.lua    │
-- ├─┬────────────────┘
-- │ │
-- │ │

CreateThread(function()
	for k, v in pairs(Locations) do
        if v.ZoneEnable then
            if v.Yoga then
                for l, b in pairs(v.Yoga) do
                    exports.ox_target:addBoxZone({
                        coords= b.Coords.xyz, rotation = b.Coords.w, size = vec3(b.Size.xyz), debug = Debug(), drawSprite = Config.DrawSprite,
                        options = {
                            {
                                onSelect = function() DoYoga() end,
                                job=v.Job, gang=v.Gang, icon = b.Icon, label = b.Label,
                            },
                        },
                    })
                    if b.Prop then GetProp({ Prop=b.Prop.Model, Coords=b.Prop.Coords.xyz, Head=b.Prop.Coords.w }) end
                    if b.Blip then GetBlip({ Coords=b.coords, Sprite=b.Blip.sprite, Color=b.Blip.blipcolor, Scale=b.Blip.scale, Display=b.Blip.display, Label=b.Blip.name }) end
                end
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
