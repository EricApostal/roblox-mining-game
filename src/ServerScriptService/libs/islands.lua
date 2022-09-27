local islands = {}

local libs = game.ServerScriptService.libs
local datastore = require(libs.datastore)
local utils = require(libs.utils)
local gemconfig = require(game.ServerScriptService.config.gemconfig)


function islands.teleport_player_to(plr, island)
	local session = require(libs.sessiondata) -- bypasses being called recursively, must use in function and not global context
	utils.teleport_player_to_part(plr, gemconfig.get_island_spawn(session.get_island(plr))) -- plr, spawn_part(player_island)
	-- print('Teleporting ' .. tostring(plr.Name) .. ' to island ' .. tostring(gemconfig.get_island_spawn(session.get_island(plr))))
end

function islands.buy_island(plr, island_name)
	local session = require(libs.sessiondata)
	session.remove_gold(plr, gemconfig.get_island_advance_price(island_name))
	print('Attemped to buy island ' .. island_name .. ' for ' .. tostring(gemconfig.get_island_advance_price(island_name)) .. ' coins.')
end


return islands
