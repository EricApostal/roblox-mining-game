while not game:IsLoaded() do
	-- Make sure we don't attempt to load unloaded resources
	wait(.2)
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local inv = require(ReplicatedStorage.lib.inventory)
local gem_info = require(ReplicatedStorage.lib.geminfo)
local cooldown = require(game.ReplicatedStorage.lib.cooldown)

gem_data = gem_info.get_all_data()
paths = gem_info.get_gem_paths()
gem_table = gem_info.assume_all_values_equal(0)

function force_update_event(saved_gems)
	if not saved_gems then
		saved_gems = gem_table
	end
	for k,v in saved_gems do
		if v == nil then
			gem_table[k] = 0
		else
			gem_table[k] = saved_gems[k]
		end
	end
	inv.init(gem_table)
	
end

function on_gem_mined(gem)
	if not(cooldown.is_finished()) then return end

	local amount = gem_table[gem]+1
	cooldown.set_cooldown(0.2)
	inv.add_item(gem, amount)
	gem_table[gem] = amount
	ReplicatedStorage:WaitForChild("send_gem_packet"):FireServer(gem, gem_table[gem])
end

for k,v in paths do -- orename, path_to_gem
	v.MouseClick:Connect(function() on_gem_mined(k) end)
end

ReplicatedStorage:WaitForChild("send_gem_packet").OnClientEvent:Connect(force_update_event)