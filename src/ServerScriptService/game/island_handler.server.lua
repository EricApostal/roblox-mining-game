local libs = game.ServerScriptService.libs
local config = game.ServerScriptService.config
local gemconfig = require(libs.replicatedinfo)
local islands = require(libs.islands)
local session = require(libs.sessiondata)

local ps = game:GetService("ProximityPromptService")

-- Get all proximityprompts
local prompts = gemconfig.get_all_advance_prompts()

function on_prompt(plr, island_name)
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local show_island_purchase = ReplicatedStorage:WaitForChild("show_island_purchase_gui")
	
	show_island_purchase:FireClient(plr, island_name)
end

function on_remote_purchase(plr, island_name)
	-- Replacement for prompt; Prompt should now be local call the purchase UI
	islands.buy_island(plr, islands.get_advance_destination(island_name))
end

for k,v in prompts do -- gemname, path_to_prompt
	v.Triggered:Connect(function(plr) on_prompt(plr, k) end)
end

game:GetService("ReplicatedStorage"):WaitForChild("buy_island").OnServerEvent:Connect(function(plr, island_name) on_remote_purchase(plr, island_name) end)