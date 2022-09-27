local shop_block = game.Workspace.exchangeforgold
local prompt = shop_block.ProximityPrompt
local shop_service = require(game.ServerScriptService.libs.shop)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local sell_gems = ReplicatedStorage:WaitForChild("sell_gems") -- just to let the client know



prompt.Triggered:Connect(function(player)
	print("Player [" .. tostring(player.Name) .. "] sold their items!")
	shop_service.sell_gems(player)
end)	


