local QBCore = exports['qb-core']:GetCoreObject()

local Props = {}

if Config.Debug then print("MK-Fence by ^2McKleans-Scripts^7") end

function GetBlip(data)
    blip = AddBlipForCoord(data.Coords)
    SetBlipAsShortRange(blip, true)
    SetBlipSprite(blip, data.Sprite or 487)
    SetBlipColour(blip, data.Color or 69)
    SetBlipScale(blip, data.Scale or 0.5)
    SetBlipDisplay(blip, data.Display or 4)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(data.Label)
    EndTextCommandSetBlipName(blip)
    if Config.Debug then print(Lang:t('clientdebug.debug2', {one = data.Label})) end
end

function MKProgress(data) 
    local result = nil
    if Config.Progbar == "ox" then
        if lib.progressCircle({
            duration = data.Time,
            position = 'bottom',
            useWhileDead = data.WhileDead,
            canCancel = data.CanCancel,
            disable = { move=data.DisMovement, car=data.DisCarMovement, combat=data.DisCombat, mouse=data.DisMouse },
            anim = { dict=data.Dict, clip=data.Anim },
            flag = data.Flag,
			-- prop = { model=data.Prop.Model, pos=data.Prop.Pos, rot=data.Prop.Rot, bone=data.Prop.Bone, },
        }) then 
            result = true
        else
            result = false
        end
    elseif Config.Progbar == "qb" then
        QBCore.Functions.Progressbar(
            'mk_progbar', 
            data.Label, 
            data.Time, 
            data.WhileDead, 
            data.CanCancel,
        { disableMovement=data.DisMovement, disableCarMovement=data.DisCarMovement, disableMouse=data.DisMouse, disableCombat=data.DisCombat }, 
        { animDict=data.Dict, anim=data.Anim, flags=data.Flags },
        {}, {}, function()
            result = true
            StopAnimTask(GetPlayerPed(-1), data.Dict, data.Anim, 1.0)
        end, function() 
        result = false
        end)
    else
        print('^1Debug:^7 Set Progbar in the config.lua to either "qb" or "ox"')
    end
    while result == nil do Wait(10) end
	return result
end

function GetProp(data)
    RequestModel(data.Prop) while not HasModelLoaded(data.Prop) do Wait(2) end 
    Props[#Props+1] = CreateObject(data.Prop, data.Coords,false,false,false)
    SetEntityHeading(Props[#Props], data.Head-90) 
    FreezeEntityPosition(Props[#Props], true)
end

function mkwebhooks(data)
    local DiscordWebhook = {}
    DiscordWebhook = {
        {
            ["color"] = data.Color,
            ["title"] = data.Title,
            ["description"] = data.Message,
            ["footer"] = {
                ["icon_url"] = data.IconURL,
                ["text"] = data.Footer,
            },
        }
    }
    PerformHttpRequest(Config.Webhook, 
    function(err, text, headers) end, 'POST', json.encode({username = data.Username, DiscordWebhook=embed}), { ['Content-Type'] = 'application/json' })
end

---------- // Footer
AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for k,v in pairs(Props) do DeleteObject(v) end
    -- for k,v in pairs(peds) do DeletePed(v) end
end)