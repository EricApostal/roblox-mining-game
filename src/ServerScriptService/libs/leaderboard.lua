local leaderboard = {}

function leaderboard.set(player, coins)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = coins
	Coins.Parent = leaderstats
end
 
function leaderboard.add(player, coins)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = Coins.Value + coins
	Coins.Parent = leaderstats
end

return leaderboard
