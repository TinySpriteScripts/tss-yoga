fx_version "cerulean"
game "gta5"
lua54 'yes'

name "MK-Yoga"
author "McKleans-Scripts - https://discord.gg/DEWp9TP7p6"
version "v2.2"
description "Yoga By McKleans-Scripts"

dependencies { 'qb-target', }
client_scripts { 
    '@PolyZone/client.lua', 
    '@PolyZone/BoxZone.lua', 
    '@PolyZone/EntityZone.lua', 
    '@PolyZone/CircleZone.lua', 
    '@PolyZone/ComboZone.lua', 
    'client/*.lua', 
}
server_scripts { 
    '@oxmysql/lib/MySQL.lua',
    'shared/version.lua',
}
shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
    'config.lua',
    'shared/functions.lua'
}

escrow_ignore {
    'client/*.lua*',
    'server/*.lua*',
    'locales/*.lua*',
    'config.lua',
}

dependency '/assetpacks'