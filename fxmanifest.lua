fx_version "cerulean"
game "gta5"
lua54 'yes'

name "TSS-Yoga"
author "TinySprite"
description "Yoga"
version "2.5.1"
discord "https://discord.gg/ZMFfC54FdJ"
tebex "https://tinysprite.dev/"

dependency 'tss_bridge'

shared_scripts {
	'locales/*.lua',
    'config.lua',
    'locations/*.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

