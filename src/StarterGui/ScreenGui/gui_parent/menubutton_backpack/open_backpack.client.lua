local backpack = script.Parent.Parent.Parent.backpack_main
local anim = require (backpack.animation_handler )
-- 
function left_click()
	if backpack.Visible then 
		anim:close_menu(backpack)
	else
		anim:open_menu(backpack)
	end
	
end

script.Parent.MouseButton1Click:Connect(left_click)