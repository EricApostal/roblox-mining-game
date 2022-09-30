local replicatedassets = {}
--[[
Previously "gemconfig"
Will contain all info between the server and client
This incudes, eggs, pets, shop information, literally anything they both need to know
--]]

gems_registered = false

info = {}
info['gems'] = {}
info['pets'] = {}

function replicatedassets.register_gems(gem_info) -- array of arrays
	--[[
	name: Name of the desired ore stash
	icon_path: Path of the desired graphic, shows up in sidebar inventory
	workspace_path: path of the physical stash in workspace
	spawn_location: The position the player spawns in when at this island
	gold_conversion_value: how much gold each item is worth
	--]]
	for k,v in gem_info do
		info['gems'][v['name']] = v
	end
	gems_registered = true
end

function replicatedassets.get_all_data()
	return info
end

function replicatedassets.get_gem(name)
	for k,v in info['gems'] do
		if k.lower() == name.lower() then
			return v
		end
		return nil
	end
end

function replicatedassets.reset_all_gems()
	for k,v in info['gems'] do
		info['gems'][k] = 0
	end
	return info['gems']
end

function replicatedassets.assume_all_values_equal(val)
	local _t = {}
	for k,_ in info['gems'] do
		_t[k] = 0
	end
	return _t
end

function replicatedassets.get_shop_values()
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['gold_conversion_value']
	end
	return _t
end

function replicatedassets.get_icon_paths()
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['icon_path']
	end
	return _t
end

function replicatedassets.get_island_spawn(island_name)
	repeat wait() until gems_registered
	
	if info['gems'][island_name] then return info['gems'][island_name]['spawn_part'] else return nil end
end

function replicatedassets.get_island_advance_price(island_name)
	repeat wait() until gems_registered
	
	if info['gems'][island_name] then return info['gems'][island_name]['price'] end
end

function replicatedassets.get_all_advance_prompts()
	repeat wait() until gems_registered
	local _t = {}
	for k,v in info['gems'] do
		_t[k] = v['advance_prompt']
	end
	return _t
end

function replicatedassets.get_island_name_by_prompt_path(path)
	repeat wait() until gems_registered
	for k,v in info['gems'] do
		print('checking if [' .. tostring(v['advance_prompt']) .. '] equals [' .. tostring(path) .. ']')
		if v['advance_prompt'] == path then
			return k
		end
	end
end

function replicatedassets.get_island_advance_destination(island)
	return info['gems'][island]['advance_to_island']
end

return replicatedassets
