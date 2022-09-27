local utils = {}

function utils.teleport_player_to_part(player, p)
	utils.teleport_player_to_pos(player, p.Position.x,p.Position.y,p.Position.z)
end

function utils.teleport_player_to_pos(player, x,y,z)
	local character = player.Character or player.CharacterAdded:Wait()
	local rpart = character:WaitForChild("HumanoidRootPart")
	--[[
	I kept having loads of problems with getting players to reliably teleport
	This loops until the current position matches the position wanted
	--]]
	
	while tostring(x) + tostring(y) + tostring(z) ~= tostring(rpart.Position.x) + tostring(rpart.Position.y) + tostring(rpart.Position.z) do
		local character = player.Character or player.CharacterAdded:Wait()
		character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(x,y,z)
		wait(.1)
	end
end

return utils
