local uis = game:GetService("UserInputService")
local spawnEvent: RemoteEvent = game.ReplicatedStorage.SoldierSignals.Spawn
local plrs = game:GetService("Players")
uis.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		local r = plrs.LocalPlayer.Character.Radius.Position
		print(r)
		spawnEvent:FireServer(r)
	end	

end)