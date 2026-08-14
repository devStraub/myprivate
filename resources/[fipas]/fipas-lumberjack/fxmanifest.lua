fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'

author 'VORP contributors; port RSG by Fipas Roleplay'
description 'Coleta segura de madeira para RSG, adaptada do VORP Lumberjack'
version '1.0.0'
repository 'https://github.com/VORPCORE/vorp_lumberjack'

shared_scripts { '@ox_lib/init.lua', 'config.lua' }
client_script 'client/main.lua'
server_script 'server/main.lua'
files { 'locales/*.json' }

dependencies { 'rsg-core', 'rsg-inventory', 'ox_lib', 'ox_target' }
