local dropPoint = script.Parent.DropPoint
local package = game:GetService("ServerStorage").Package

local TICK_SPEED = 3

while true do 
	local cast = workspace:Raycast(dropPoint.Position, Vector3.yAxis * -5)
	if cast and cast.Instance then
		local newPackage = package:Clone()
		newPackage.Position = dropPoint.Position
		newPackage.Parent = workspace
	end
	
	task.wait(TICK_SPEED)
end