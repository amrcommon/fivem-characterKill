ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent('test:test')
AddEventHandler('test:test', function(amount)
  
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('esx:showNotification', source, 'iniciando ck')

  
end)



ESX.RegisterServerCallback('killchar', function(source)
	
	local xPlayer = ESX.GetPlayerFromId(source)

  
 MySQL.Async.execute('call deleteplayer(@steamId)',
    {
        ['@steamId'] = xPlayer.identifier
    }, function(rowsChanged)

        if rowsChanged >= 1 then
            TriggerClientEvent('esx:showNotification', source, 'CK con exito')
			Citizen.wait(2000)
			DropPlayer(source, "Has solicitado un CK. Vuelve a entrar para crear un usuario nuevo")

            --cb(true)
        else
            TriggerClientEvent('esx:showNotification', source,'CK fallido.')
           -- cb(false)
        end
        end)

end)


RegisterServerEvent('amr:characterCK')
AddEventHandler('amr:characterCK', function()
	
	local xPlayer = ESX.GetPlayerFromId(source)
	print("Start "..xPlayer.identifier)
	local _source = source
	
MySQL.Async.execute('call deleteplayer(@steamId)', {
			['@steamId'] = xPlayer.identifier,
			 
		}, function (rowsChanged)
			if rowsChanged == 0 then
				             TriggerClientEvent('esx:showNotification', source,'CK fallido.')

			else
				            DropPlayer(_source,'Acabas de cometer un CK. Todo lo que eras es un mero recuerdo del pasado.')

			end
		end)
end)


