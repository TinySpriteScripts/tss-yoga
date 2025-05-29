fx_version "cerulean"
game "gta5"
lua54 'yes'

name "MK-Yoga"
author "McKleans-Scripts - https://discord.gg/DEWp9TP7p6"
version "v2.5"
description "Yoga By McKleans-Scripts"

dependency 'jim_bridge' -- https://github.com/jimathy/jim_bridge

shared_scripts {
	'locales/*.lua',
    'config/*.lua',
    'locations/*.lua',
    'escrowed/functions.lua',
    -- Required scripts
    '@jim_bridge/starter.lua', -- https://github.com/jimathy/jim_bridge
}

client_scripts { 
    'client/*.lua', 'escrowed/client.lua',
}
server_scripts { '@oxmysql/lib/MySQL.lua', 'escrowed/serverfunctions.lua', 'server/*.lua' }

escrow_ignore {
    'client/*.lua*',
    'Install/**',
    'locales/*.lua*',
    'locations/*.lua',
    'server/*.lua*',
    'config.lua',
}

dependency '/assetpacks'