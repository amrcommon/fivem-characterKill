ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


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


