local ReplicatedStorage = game:GetService("ReplicatedStorage")
local get_stats = ReplicatedStorage:WaitForChild("get_player_stats")

local sessiondata = require( game.ServerScriptService.libs.sessiondata )

function send_player_stats(plr)
	local player_data = sessiondata.get_all_data(plr)
	
	get_stats:FireClient(plr, player_data)
end

get_stats.OnServerEvent:Connect(send_player_stats)