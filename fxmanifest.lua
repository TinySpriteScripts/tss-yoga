name "mk-yoga"
author "McKlean - https://discord.gg/DEWp9TP7p6"
version "v2.0"
description "Yoga Script By McKlean"
fx_version "cerulean"
game "gta5"

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'config.lua',
}

escrow_ignore {
    '*.lua*',
    'client/*.lua*',
    'server/*.lua*',
    'locales/*.lua*',
}

lua54 'yes'