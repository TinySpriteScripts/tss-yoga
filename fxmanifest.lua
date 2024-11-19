fx_version "cerulean"
game "gta5"
lua54 'yes'

name "MK-Yoga"
author "McKleans-Scripts - https://discord.gg/DEWp9TP7p6"
version "v2.4"
description "Yoga By McKleans-Scripts"

shared_scripts {
    'locales/*.lua', 'config.lua', 'locations/*.lua', '@ox_lib/init.lua', 'escrowed/functions.lua'
}

client_scripts {
    '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua',
    'client/*.lua', 'escrowed/client.lua',
}
server_scripts { '@oxmysql/lib/MySQL.lua', 'escrowed/serverfunctions.lua', 'server/*.lua', }

escrow_ignore {
    'client/*.lua*',
    'html/**',
    'Install/**',
    'locales/*.lua*',
    'locations/*.lua',
    'server/*.lua*',
    'config.lua',
}

dependency '/assetpacks'