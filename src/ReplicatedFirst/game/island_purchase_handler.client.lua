local gui_lib = require( game:WaitForChild("ReplicatedStorage"):WaitForChild("lib").makegui )
local replicatedinfo = require(game.ReplicatedStorage.lib.geminfo)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local buy_island = ReplicatedStorage:WaitForChild("buy_island")
local show_island_purchase = ReplicatedStorage:WaitForChild("show_island_purchase_gui")

function display_purchase_ui(island_name)
	local payment_ui_properties = {}
	while not game:IsLoaded() do wait(.1) end
	payment_ui_properties['price'] = replicatedinfo.get_island_advancement_price(island_name)
	payment_ui_properties['title'] = replicatedinfo.get_island_advancement(island_name) .. ' island purchase'
	payment_ui_properties['prompt'] = "You are purchasing an advancement to the " .. replicatedinfo.get_island_advancement(island_name) .. " island!"
	
	if gui_lib:confim_payment(payment_ui_properties) then buy_island:FireServer(island_name) else print('User tried to buy island, lib returned false') end
end



show_island_purchase.OnClientEvent:Connect(function(island_name) display_purchase_ui(island_name) end)