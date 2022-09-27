while not game:IsLoaded() do
	wait(.1)
end

RS = game:GetService("ReplicatedStorage")
local gem_info = require(game.ReplicatedStorage.lib.geminfo)

function handle_gem_data(data)
	gem_info.set_server_data(data)
end


RS:WaitForChild("get_gem_information").OnClientEvent:Connect(function(data) handle_gem_data(data) end)
