label = script.Parent
RS = game:GetService("ReplicatedStorage")

local gem_info = require(game.ReplicatedStorage.lib.geminfo)

while true do
	label.Text = gem_info.get_inventory_value()
	wait(.1)
end