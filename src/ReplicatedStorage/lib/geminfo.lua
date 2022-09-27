local geminfo = {}
--[[
Gets gem information from the server, then displays it here
--]]
ReplicatedStorage = game:GetService("ReplicatedStorage")
inventory_service = require(game.ReplicatedStorage.lib.inventory)
gems = nil

function geminfo.set_server_data(data)
	gems = data
end

function geminfo.get_gem(name)
	while not gems do wait(.1) end
	for k,v in gems do
		if k.lower() == name.lower() then
			return v
		end
		return nil
	end
end

function geminfo.get_shop_values()
	while not gems do wait(.1) end
	local _t = {}
	for k,v in gems do
		_t[k] = v['gold_conversion_value']
	end
	return _t
end

function geminfo.get_inventory_value()
	local inv = inventory_service.get_inventory()
	local _r = 0
	
	for k,v in inv do
		_r += geminfo.get_shop_values()[k]*v
	end
	return _r
end

function geminfo.get_gem_paths()
	while not gems do wait(.1) end
	local _t = {}
	for k,v in gems do
		_t[k] = v['workspace_path']
	end
	return _t
end

function geminfo.get_all_data()
	while not gems do wait(.1) end
	return gems
end

function geminfo.assume_all_values_equal(val)
	local _t = {}
	for k,_ in gems do
		_t[k] = 0
	end
	return _t
end

function geminfo.get_icon_paths()
	local _t = {}
	for k,v in gems do
		_t[k] = v['icon_path']
	end
	return _t
end

return geminfo
