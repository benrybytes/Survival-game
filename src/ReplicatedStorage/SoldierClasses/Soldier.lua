type SoliderType = {

	Position: Vector3,
	Health: number,
	Player: Player,
	Model: Model,
}

local Soldier:SoliderType = {}
-- Default value
Soldier.__index = Soldier



function Soldier.new(name: string, position: Vector3, health: number, parent: Player, model: Model): SoldierType
	local newSoldier = {}
	
	-- Local object inherits the properties from Default value
	setmetatable(newSoldier, Soldier)

print("Running")
	
	newSoldier.Model = model:Clone()
	
	newSoldier.Model.Humanoid.Health = health
	newSoldier.Player = parent
	newSoldier.Model.Parent = game.Workspace.Spawned.Soldiers
	print(newSoldier.Model)
	newSoldier.Model:MoveTo(position)
	newSoldier.Model.Name = name

	return newSoldier
end

-- Helper method pointed to the instance
function Soldier.idle(self: SoliderType, localRadius: Position) 
	local model = self.Model

	local mag =  (self.Player.Character:WaitForChild("Head").Position - self.Model.PrimaryPart.Position).magnitude
	local maxDistance = localRadius.Magnitude
	local pos = model.PrimaryPart.Position
	local targetPos = Vector3.new(
		pos.X + math.random(-maxDistance, maxDistance),
		0,
		pos.Z + math.random(-maxDistance, maxDistance)
	)
	local distance = (targetPos - pos).magnitude

	if distance <= maxDistance then
		model:MoveTo(targetPos)
	end
end

return Soldier
