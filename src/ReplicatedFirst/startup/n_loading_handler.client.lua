-- Handles loading communication with the server
-- basically just tells the server when you have loaded

local ReplicatedStorage = game:GetService("ReplicatedStorage")

while not game:IsLoaded() do
	wait(.2)
end

ReplicatedStorage:WaitForChild("player_loaded"):FireServer()