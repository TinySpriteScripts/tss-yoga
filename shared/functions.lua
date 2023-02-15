local QBCore = exports['qb-core']:GetCoreObject()

local nameTable, resStart = table.unpack({{"MK-Yoga", "mk-yoga"}, false})
for _, name in pairs(nameTable) do if GetCurrentResourceName() == name then reStart = true break end end
if not nameTable then print("^5Rename the script back to^7: ^2mk^7-^2yoga^7 To Receive Support!^7") end