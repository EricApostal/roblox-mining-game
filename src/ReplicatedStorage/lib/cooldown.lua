local cooldown = {}

local progress_bar = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui'):WaitForChild("ScreenGui").gui_parent.progress_bar_frame.progress_bar
progress_bar.Size = UDim2.new(0.7, 0, 0.96, 0)

cooldown_progress = 0
finish_timestamp = 0

function cooldown.set_progress_bar(sec)
	progress_bar:TweenSize(UDim2.new(0.7, 0, 0.07, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine,  .1, true)
	wait(.2)
	progress_bar:TweenSize(UDim2.new(0.7, 0, 0.96, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine,  sec-.2, true)
end

function cooldown.is_finished()
	if finish_timestamp == 0 then return true end -- if no cooldown has been set, there is no cooldown to finish
	if tick() >= finish_timestamp then return true end  -- if the current time is greater than finish time
	if tick() < finish_timestamp then return false end -- if the current time hasn't quite reached the finish time
end

function cooldown.get_cooldown_progress()
	if finish_timestamp == 0 then finish_timestamp = tick() end
	return finish_timestamp-tick() -- if 0, cooldown is finished
end

function cooldown.set_cooldown(sec)
	if not cooldown.is_finished() then return end
	finish_timestamp = tick()+sec
	cooldown.set_progress_bar(sec)
end


return cooldown
