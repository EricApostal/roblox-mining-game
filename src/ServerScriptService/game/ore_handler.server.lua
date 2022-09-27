local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local gem_packet_event = ReplicatedStorage.send_gem_packet
local data_service = require(script.Parent.Parent.libs.datastore)
local sessiondata_service = require(game.ServerScriptService.libs.sessiondata)
local shop = require(game.ServerScriptService.libs.shop)

function on_gem_packet(player, gem, amount)
	sessiondata_service.add_gem(player, gem, amount)
end

function on_player_join(player)
	sessiondata_service.sync_player_gems(player)
end

function on_player_leave(player)
	sessiondata_service.save_player_gems(player)
end

gem_packet_event.OnServerEvent:Connect(on_gem_packet)-- ore_packet_event.OnServerEvent:Connect(on_ore_packet)
Players.PlayerAdded:Connect(on_player_join)
Players.PlayerRemoving:Connect(on_player_leave)