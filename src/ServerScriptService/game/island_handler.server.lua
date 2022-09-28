local libs = game.ServerScriptService.libs
local config = game.ServerScriptService.config
local gemconfig = require(config.gemconfig)
local islands = require(libs.islands)
local session = require(libs.sessiondata)

local ps = game:GetService("ProximityPromptService")

-- Get all proximityprompts
local prompts = gemconfig.get_all_advance_prompts()

function on_prompt(plr, island_name)
	-- I need some sort of way to index a name from path_to_prompt
	-- print(gemconfig.get_island_advance_price(island_name))
	islands.buy_island(plr, islands.get_advance_destination(island_name))
end

for k,v in prompts do -- gemname, path_to_prompt
	v.Triggered:Connect(function(plr) on_prompt(plr, k) end)
end