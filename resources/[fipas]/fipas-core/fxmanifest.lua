fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources will become incompatible once RedM ships.'

author 'Fipas Roleplay'
description 'Camada central de configuracao e extensoes do Fipas Roleplay'
version '0.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies {
    'ox_lib',
    'rsg-core'
}
