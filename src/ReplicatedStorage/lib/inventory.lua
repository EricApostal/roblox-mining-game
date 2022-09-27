local inv = {}
---
items = nil
slots_list = {}
--[[
ISSUE:
When re-drawing the slots, it won't delete old clones of the icon

Solution:
Add each clone to a list, iterate through the loop then delete that clone upon updating the inventory
--]]

function inv.init(tbl)
	items = tbl
	
	while not game:IsLoaded() do
		wait(.1)
	end

	inv.draw_slots(items)
end

function inv.add_item(item, count)
	local item_with_count = {}
	items[item] = count
	inv.draw_slots(items)
end

function inv.delete_all_copies()
	for k,v in slots_list do
		v:Remove()
	end
end

function inv.draw_slots(tbl)
	inv.delete_all_copies()
	
	local images = game.ReplicatedStorage.images
	local frame = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui").backpack_main
	
	local RS = game:GetService("ReplicatedStorage")
	local geminfo = require(game.ReplicatedStorage.lib.geminfo)
	
	local icons = geminfo.get_icon_paths()
	
	local i = 1 -- There might be a better way to do this, idk im a python guy
	for k,v in tbl do		
		if v > 0 then
			local box = icons[k]
			local copy = box:Clone()
			copy.ZIndex = 2
			copy.count.Text = tostring(v) .. 'x'
			copy.count.ZIndex = 2
			local scaled_slot = ((i-1)/10)*1.6
			copy.Position = UDim2.new(0.092+scaled_slot,0,-0.002,0)
			copy.Visible = true
			copy.Parent = frame.inventory_body.ScrollingFrame
			table.insert(slots_list, copy)
			i+=1
		end
	end
end

function inv.get_inventory()
	while not items do wait(.1) end
	
	return items
end

---
return inv
