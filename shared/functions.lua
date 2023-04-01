local QBCore = exports['qb-core']:GetCoreObject()

if Config.Debug then print("MK-Fence by ^2McKleans-Scripts^7") end

local nameTable, resStart = table.unpack({{"MK-Fence", "MK-fence", "mk-fence"}, false})
for _, name in pairs(nameTable) do if GetCurrentResourceName() == name then reStart = true break end end
if not nameTable then print("^5Rename the script back to^7: ^2mk^7-^2fence^7 To Receive Support!^7") end

function Notification(Title, Message, type, source)
    if Config.Notify == "qb" then
        if not source then	TriggerEvent("QBCore:Notify", Message, type)
		else TriggerClientEvent("QBCore:Notify", source, Message, type) end
    elseif Config.Notify == "okok" then
        if not source then exports['okokNotify']:Alert(Title, Message, 6000, type)
        else TriggerClientEvent('okokNotify:Alert', source, Title, Message, 6000, type) end
    elseif Config.Notify == "rz" then
        if not source then exports['redutzu-notify']:Notify({Title, Message, 6000, type })
        else TriggerClientEvent('rz-notify:client:notify', source, { Title, Message, 6000, type}) end
    end
end