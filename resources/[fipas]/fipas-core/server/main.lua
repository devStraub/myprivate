local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Commands.Add('fipas', 'Exibe o estado da base Fipas', {}, false, function(source)
    TriggerClientEvent('fipas-core:client:notify', source, 'Base RSG carregada com sucesso.', 'success')
end, 'user')
