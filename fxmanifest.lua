name "MK-Yoga"
author "McKleans-Scripts - https://discord.gg/DEWp9TP7p6"
version "v2.2"
description "Yoga Script By McKlean-Scripts"


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
    'server/*.lua',
    'shared/version.lua',
}
shared_scripts {
    '@qb-core/shared/locale.lua',
	'locales/en.lua',
    'config.lua',
    'shared/functions.lua'
}
escrow_ignore {
    '*.lua*',
    'client/*.lua*',
    'server/*.lua*',
    'locales/*.lua*',
}

dependency '/assetpacks'