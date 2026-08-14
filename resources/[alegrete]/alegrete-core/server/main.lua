local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add('alegrete', 'Exibe o estado da base Alegrete', {}, false, function(source)
    TriggerClientEvent('alegrete-core:client:notify', source, 'Base RSG carregada com sucesso.', 'success')
end, 'user')

