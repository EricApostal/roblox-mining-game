local anim = require(script.Parent.Parent.animation_handler)
local ui = script.Parent.Parent
	
function left_click()
	anim:close_menu(ui)
end

script.Parent.MouseButton1Click:Connect(left_click)