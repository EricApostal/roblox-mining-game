local hot_data = {}

--[[
Handles anything to do with ram-based session information
Made so its super easy to call from other scripts, and brainless to use
--]]
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local gem_packet_event = ReplicatedStorage:WaitForChild("send_gem_packet")

local data_service = require(script.Parent.Parent.libs.datastore)
local leaderboard = require(game.ServerScriptService.libs.leaderboard)
local gemconfig = require(game.ServerScriptService.config.gemconfig)
local island_service = require(game.ServerScriptService.libs.islands)
local utils = require(game.ServerScriptService.libs.utils)

data_array = {}
---

function hot_data.remove_gems(player)
	for k,v in gemconfig.get_all_data() do
		data_array[player.UserId]['gems'][k] = 0
	end
	gem_packet_event:FireClient(player, data_array[player.UserId]['gems'])
end
	
function hot_data.init(player)
	--[[
	To be called when a player either joins or loads in (join should be fine, currently uses load in tho)
	Makes sure the data array is nice and tidy for them
	
	THIS SHOULD BE HANDLED BY METATABLES
	I didnt know how to do them when i first started lol
	--]]

	-- data_array[player.UserId]['islands'] = nil
	-- data_array[player.UserId]['coins'] = nil

	if not data_array[player.UserId] then data_array[player.UserId] = {} end
	if not data_array[player.UserId]['gems'] then data_array[player.UserId]['gems'] = {} end
	if not data_array[player.UserId]['coins'] then data_array[player.UserId]['coins'] = 0 end
	if not data_array[player.UserId]['islands'] then data_array[player.UserId]['islands'] = {} data_array[player.UserId]['islands'][1] = 'coal' print('setting island[1] to coal') end -- i dont like how this is hardcoded


	leaderboard.set(player, data_array[player.UserId]['coins'])
	island_service.teleport_player_to(player, hot_data.get_island(player))

end

function hot_data.get_all_data(player)
	return data_array[player.UserId]
end

function hot_data.set_gold(player, amount)
	data_array[player.UserId]['coins'] = amount
	leaderboard.set(player, amount)
end

function hot_data.remove_gold(player, amount)
	if amount > data_array[player.UserId]['coins'] then return false end
	data_array[player.UserId]['coins'] -= amount
	leaderboard.set(player, data_array[player.UserId]['coins'])
	return true
end

function hot_data.add_gold(player, amount)
	data_array[player.UserId]['coins'] += amount
	leaderboard.set(player, data_array[player.UserId]['coins'])
end

function hot_data.get_gold(player)
	return data_array[player.UserId]['coins']
end

function hot_data.save_player_gems(player)
	print('saving data: ')
	print(data_array[player.UserId])
	data_service.save_data(player, data_array[player.UserId])
end
	
	
function hot_data.sync_player_gems(player)
	local data = data_service.retrieve_data(player)
	data_array[player.UserId] = data
	if data then data = data['gems'] end -- because we only want to sync the gems
	gem_packet_event:FireClient(player, data)
end
	
	
function hot_data.add_gem(player, gem, count)
	local player_table = data_array[player.UserId]
	
	if player_table == nil then
		player_table = {}
		player_table['gems'] = {}
	end
	
	player_table['gems'][gem] = count
	data_array[player.UserId] = player_table
end

function hot_data.get_gems(player)
	return data_array[player.UserId]['gems']
end

function hot_data.get_island(player)
	return data_array[player.UserId]['islands'][1]
end

function hot_data.set_island(player, island) -- island should be a string, will index the array for rest of values
	table.insert(data_array[player.UserId]['islands'], 1, island)
end

function hot_data.get_owned_islands(player)
	return data_array[player.UserId]['islands']
end	

return hot_data
