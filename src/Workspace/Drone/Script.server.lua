local drone = script.Parent
local base = drone.Base
local mover = base.AlignPosition
local pickupPoint = workspace.Depot.PickUpPoint

local TICK_SPEED = 0.5

local function getPackage()
	local detectedParts = workspace:GetPartBoundsInRadius(drone:GetPivot().Position, 1)
	
	for i, part in detectedParts do
		if part:GetAttribute("Target") then
			return part
		end
	end
end

local state = {}
local currentState = nil

function state.Returning()
	mover.Position = pickupPoint.Position
	
	if getPackage() then
		currentState = state.Delivering
	end
end

function state.Delivering()
	local package = getPackage()
	
	if package then
		local targetPos = package:GetAttribute("Target")
		mover.Position = targetPos
	else 
		currentState = state.Returning
	end
end

currentState = state.Returning
while true do
	currentState()
	task.wait(TICK_SPEED)
end