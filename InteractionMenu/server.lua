local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterServerCallback("HUD_Menu:GetAcc", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb(xPlayer,source)
    else
        cb(nil)
    end
end)

ESX.RegisterServerCallback("HUD_Menu:GetCC", function(source, cb)
    local coin = exports.CoinSystem:Q_Show_Coin_Player(source)
    cb(coin or 0)
end)

ESX.RegisterServerCallback("HUD_Menu:GetQuests", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM quest WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
		cb(json.decode(result[1].quests))
	end)
end)

ESX.RegisterServerCallback("HUD_Menu:GetAllPLayers", function(source, cb)
    local xPlayers = ESX.GetPlayers()
	local allplayers = {}
	for i=1, #xPlayers, 1 do
		table.insert(allplayers,{id = xPlayers[i] , name = GetPlayerName(xPlayers[i])})
	end
	cb(allplayers)
end)