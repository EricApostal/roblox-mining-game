local ReplicatedStorage = game:GetService("ReplicatedStorage")
local on_player_load = ReplicatedStorage:WaitForChild("player_loaded")
gem_config = require(game.ServerScriptService.config.gemconfig)
session = require(game.ServerScriptService.libs.sessiondata)
utils = require(game.ServerScriptService.libs.utils)


local function on_player_loaded(player)
	
	
	-- Send all the gem data to the client
	local gem_info = gem_config.get_all_data()
	ReplicatedStorage:WaitForChild('get_gem_information'):FireClient(player, gem_info)

	session.init(player)

	print(player.name .. ' has loaded into the game with data:')
	print(session.get_all_data(player))
	
end

on_player_load.OnServerEvent:Connect(on_player_loaded)