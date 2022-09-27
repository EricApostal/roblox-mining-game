local backpack = script.Parent.Parent.Parent.backpack_main
-- 
function left_click()
	if backpack.Visible then 
		backpack.Visible = false 
	else
		backpack.Visible = true 
	end
	
end

script.Parent.MouseButton1Click:Connect(left_click)