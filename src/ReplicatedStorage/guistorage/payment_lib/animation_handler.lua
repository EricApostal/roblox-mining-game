local anim = {}

function anim:open_menu(gui_frame)
	gui_frame.Position = UDim2.new(0.5, 0, 1.5, 0)
	gui_frame.Visible = true
	gui_frame:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,  .3, true)
	wait(.4)
end

function anim:close_menu(gui_frame)
	gui_frame:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine,  .3, true)
	wait(.4)
	gui_frame.Visible = false
end

return anim
