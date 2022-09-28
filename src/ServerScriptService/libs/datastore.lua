local DataStoreService = game:GetService("DataStoreService")
local database = DataStoreService:GetDataStore("reeeeet54423q")

local datastore = {}

function datastore.save_data(player, value)
	local success, errormessage = pcall(function()
		database:SetAsync(player.UserId, value)
	end)
	if not success then
		print(errormessage)
		return false
	end
	return true
end

function datastore.retrieve_data(player, value)
	local success, errormessage = pcall(function()
		_r = database:GetAsync(player.UserId)
	end)
	if not success then
		print(errormessage)
		return false
	end
	return _r
end



return datastore
