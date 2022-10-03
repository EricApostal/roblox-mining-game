local geminfo = {}
--[[
Gets gem information from the server, then displays it here
--]]
ReplicatedStorage = game:GetService("ReplicatedStorage")
inventory_service = require(game.ReplicatedStorage.lib.inventory)
info = nil

function geminfo.set_server_data(data)
	info = data
end

function geminfo.get_all_stats()
	local get_player_stats = ReplicatedStorage:WaitForChild("get_player_stats")
	get_player_stats:FireServer()
	local player_stats_return = nil
	
	get_player_stats.OnClientEvent:Connect(function(player_stats)  player_stats_return = player_stats end)
	
	while player_stats_return == nil do wait(.1) end
	return player_stats_return
end

function geminfo.get_owned_islands()
	return geminfo.get_all_stats()['islands']
end

function geminfo.get_money()
	return geminfo.get_all_stats()['coins']
end

function geminfo.get_valid_gems()
	-- Should return all valid gems
	while not info do wait(.1) end
	local _t = {}
	for k,v in info['gems'] do
		table.insert(_t, #(_t), k)
		return nil
	end
end

function geminfo.get_island_price(island_name)
	return info['gems']['island_name']['price']
end

function geminfo.get_island_advancement_price(island_name)
	while not info do wait(.1) end
	return info['gems'] [info['gems'][island_name]['advance_to_island']] ['price']
end

function geminfo.get_island_advancement(island_name)
	return info['gems'][island_name]['advance_to_island']
end

function geminfo.get_gem(name)
	while not info do wait(.1) end
	for k,v in info['gems'] do
		if k.lower() == name.lower() then
			return v
		end
		return nil
	end
end

function geminfo.get_shop_values()
	while not info do wait(.1) end
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['gold_conversion_value']
	end
	return _t
end

function geminfo.get_inventory_value()
	local utils = require(game.ReplicatedStorage.lib.utils)

	local inv = inventory_service.get_inventory()
	local _r = 0
	for k,v in inv do
		if v and utils.has_value(geminfo.get_shop_values(), k) then _r += geminfo.get_shop_values()[k]*v end
	end
	return _r
end

function geminfo.get_gem_paths()
	while not info do wait(.1) end
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['workspace_path']
	end
	return _t
end

function geminfo.get_all_data()
	while not info do wait(.1) end
	return info['gems']
end

function geminfo.assume_all_values_equal(val)
	local _t = {}
	for k,_ in info['gems'] do
		_t[k] = 0
	end
	return _t
end

function geminfo.get_icon_paths()
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['icon_path']
	end
	return _t
end

return geminfo
