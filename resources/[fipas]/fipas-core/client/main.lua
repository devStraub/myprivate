RegisterNetEvent('fipas-core:client:notify', function(message, notificationType)
    lib.notify({
        title = Config.ServerName,
        description = message,
        type = notificationType or 'inform'
    })
end)
