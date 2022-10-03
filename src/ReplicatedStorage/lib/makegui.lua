local gui_lib = {}
local ScreenGui = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
local replicatedinfo = require(game.ReplicatedStorage.lib.geminfo )

local utils = require( game.ReplicatedStorage.lib.utils )

gui_open = false -- so we dont accidentally open 2 uis at once


function gui_lib:confim_payment(table_gui)
	if gui_open then return false end
	gui_open = true
	local gui = script.Parent.Parent.guistorage.payment_lib
	
	local cloned_gui = gui:Clone()
	local anim = require(cloned_gui.animation_handler)
	
	cloned_gui.title.Text = table_gui['title']
	cloned_gui.body.prompt.Text = table_gui['prompt']
	cloned_gui.body.pricebox_outline.pricebox.price.Text = table_gui['price']
	
	local confirm = cloned_gui.body.confirm
	local cancel = cloned_gui.body.cancel
	
	local lp_money = replicatedinfo.get_money()
	
	if lp_money < table_gui['price'] then 
		confirm.TextLabel.Text = "Not Enough Coins!"
		confirm.Active = false
		confirm.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
		confirm.Shadow.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	end
	
	if utils.has_value(table_gui['owned_items'], table_gui['item_purchasing']) then
		confirm.TextLabel.Text = "Already Owned!"
		confirm.Active = false
		confirm.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
		confirm.Shadow.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
	end

	cloned_gui.Parent = ScreenGui
	anim:open_menu(gui)
		
	local user_input_return = nil
	
	confirm.MouseButton1Click:Connect(function() if confirm.Active then user_input_return = true end end)
	cancel.MouseButton1Click:Connect(function() user_input_return = false end)
	
	while user_input_return == nil do wait(.1) end
	anim:close_menu(cloned_gui)
	gui_open = false
	
	return user_input_return
	
end

return gui_lib