local plrs = game:GetService("Players")
local magnitude = 50

plrs.LocalPlayer.CharacterAppearanceLoaded:Connect(function(char) 
	local weld = Instance.new("Weld")
	local radius = script.Parent.radius
	radius.Shape = Enum.PartType.Cylinder
	radius.CanCollide = false
	radius.Anchored = false
	radius.Parent = char
	radius.Name = "Radius"
	radius.Massless = true
	radius.Size = Vector3.new(0.15 , magnitude, magnitude / 2)
	radius.Color = Color3.fromRGB(201, 221, 255)

	-- Weld radius to the character's torso
	weld.Part0 = char.Torso
	weld.Part1 = radius
	weld.Parent = radius

	-- Set the weld's C0 and C1 to properly position and orient the radius | Overwrites original weld position
	weld.C0 = CFrame.new(0, -3, 0) -- Adjust the offset as needed
	weld.C1 = CFrame.Angles(0, 0, math.rad(90)) -- Adjust the rotation as needed

	print(weld)
end)
