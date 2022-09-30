local shop = {}
---
local sessiondata_service = require(game.ServerScriptService.libs.sessiondata)
local gemconfig = require(game.ServerScriptService.libs.replicatedinfo)
local leaderboard = require(game.ServerScriptService.libs.leaderboard)
local ReplicatedStorage = game:GetService("ReplicatedStorage")


function shop.get_value(plr)
	local inventory = sessiondata_service.get_gems(plr)
	local shop_values = gemconfig.get_shop_values()
	local _r = 0
	for k,v in inventory do
		if v then
			_r += shop_values[k] * v
		end
	end
	return _r
end

function shop.sell_gems(plr)
	local value = shop.get_value(plr)
	sessiondata_service.remove_gems(plr)
	sessiondata_service.add_gold(plr, value)
end

---
return shop
