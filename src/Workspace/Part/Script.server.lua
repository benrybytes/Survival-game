local drone = script.Parent  -- Assuming the script is a child of the drone model
local detectionRange = 10  -- Adjust this to control the range at which the drone detects players
local movementSpeed = 30  -- Adjust this to control the speed of the movement
local explosionRadius = 10  -- Adjust this to control the blast radius of the explosion

local function findNearestPlayer()
	local players = game:GetService("Players"):GetPlayers()
	local nearestPlayer = nil
	local minDistance = math.huge

	for _, player in ipairs(players) do
		local character = player.Character
		if character and character:FindFirstChild("HumanoidRootPart") then
			local distance = (character.HumanoidRootPart.Position - drone.Position).magnitude
			if distance < minDistance then
				nearestPlayer = player
				minDistance = distance
			end
		end
	end

	return nearestPlayer, minDistance
end

local function explode(player)
	-- Create an explosion effect at the player's position
	local explosion = Instance.new("Explosion")
	explosion.Position = player.Character.HumanoidRootPart.Position
	explosion.Parent = game.Workspace
	explosion.BlastRadius = explosionRadius
	explosion.BlastPressure = 100000  -- Adjust the blast pressure as needed
end

while true do
	local nearestPlayer, distance = findNearestPlayer()
	if nearestPlayer and distance <= detectionRange then
		-- If a player is detected within the detection range, target the player
		local direction = (nearestPlayer.Character.HumanoidRootPart.Position - drone.Position).unit
		drone.CFrame = CFrame.new(drone.Position, nearestPlayer.Character.HumanoidRootPart.Position)

		-- Move the drone towards the player
		drone.Position = drone.Position + direction * movementSpeed * game:GetService("RunService").RenderStepped:Wait()

		-- Check for collision with players
		local character = nearestPlayer.Character
		if character and character:FindFirstChild("HumanoidRootPart") then
			local playerDistance = (character.HumanoidRootPart.Position - drone.Position).magnitude
			if playerDistance < 5 then
				-- If the drone is close enough to the player, explode
				explode(nearestPlayer)
				drone:Destroy()
			end
		end
	end

	wait(0.1)  -- Adjust this to control how frequently the drone checks for players
end
