local anim = {}

function anim:open_menu(backpack)
	backpack.Position = UDim2.new(0.5, 0, 1.5, 0)
	backpack.Visible = true
	backpack:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,  .3, true)
	wait(.4)
end

function anim:close_menu(backpack)
	backpack:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,  .3, true)
	wait(.4)
	backpack.Visible = false
end

return anim
