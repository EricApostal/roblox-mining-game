local islands = {}

local libs = game.ServerScriptService.libs
local datastore = require(libs.datastore)
local utils = require(libs.utils)
local gemconfig = require(game.ServerScriptService.config.gemconfig)


function islands.teleport_player_to(plr, island) -- I need to specify the island, rn it checks for the player's island
	local session = require(libs.sessiondata)
	utils.teleport_player_to_part(plr, gemconfig.get_island_spawn(session.get_island(plr)))
	-- print('Teleporting ' .. tostring(plr.Name) .. ' to island ' .. tostring(gemconfig.get_island_spawn(session.get_island(plr))))
end

function islands.check_player_ownage(plr, island_name)
	local session = require(libs.sessiondata)
	local owned_islands = session.get_owned_islands(plr)
	if utils.has_value(owned_islands, island_name) then
		return true
	else
		return false
	end
end

function islands.buy_island(plr, island_name)
	local session = require(libs.sessiondata)

	if islands.check_player_ownage(plr, island_name) then print('Player already owns the island!') return false end

	if session.remove_gold(plr, gemconfig.get_island_advance_price(island_name)) then
		session.set_island(plr, island_name)
		print('Bought island ' .. island_name .. ' for ' .. tostring(gemconfig.get_island_advance_price(island_name)) .. ' coins!')
		print(session.get_owned_islands(plr))
	else
		print(plr.Name .. ' tried to buy ' .. island_name .. ', but they didn\'t have enough money!')
	end
	-- print('Attemped to buy island ' .. island_name .. ' for ' .. tostring(gemconfig.get_island_advance_price(island_name)) .. ' coins.')
end

function islands.get_advance_destination(island_name)
	-- Returns the desination of the island purchase prompt [coal will return iron, for example]
	return gemconfig.get_island_advance_destination(island_name)
end

return islands
