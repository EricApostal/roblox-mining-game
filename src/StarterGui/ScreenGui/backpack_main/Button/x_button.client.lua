local backpack = script.Parent.Parent

function left_click()
	backpack.Visible = false
end

script.Parent.MouseButton1Click:Connect(left_click)