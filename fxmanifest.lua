fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'bucu_shared'
author 'BUCU SuperApp Team'
description 'Shared items registry, constants, configurations, and database schemas for BUCU Scripts Suite'
version '1.0.0'

shared_scripts {
    'shared/constants.lua',
    'shared/config.lua',
    'shared/items.lua',
    'shared/helpers.lua'
}

server_scripts {
    'server/init.lua'
}

client_scripts {
    'client/init.lua'
}

exports {
    'GetItems',
    'GetItem',
    'GetConfig',
    'ItemExists',
    'FormatWeight'
}
