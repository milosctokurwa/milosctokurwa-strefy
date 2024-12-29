fx_version 'adamant'
game 'gta5'
author 'PAT  (MTK)/CIAPAK'
description 'BOJOWKA-STREFY'
version '1.0.0'

server_script '@oxmysql/lib/MySQL.lua'

shared_script 'shared.lua'

client_scripts {
    'client.lua',
}

server_script 'server.lua'

