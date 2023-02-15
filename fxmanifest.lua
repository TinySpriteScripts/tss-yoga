name "mk-yoga"
author "McKlean-Scripts - https://discord.gg/DEWp9TP7p6"
version "v2.1"
description "Yoga Script By McKlean-Scripts"
fx_version "cerulean"
game "gta5"

dependencies { 'qb-target', }
client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }
shared_scripts {
    'locales/en.lua',
    'config.lua',
    'shared/*.lua'
}

escrow_ignore {
    'client/*.lua*',
    'server/*.lua*',
    'locales/*.lua*',
}

lua54 'yes'