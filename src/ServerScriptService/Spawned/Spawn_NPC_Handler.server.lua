local soldierModel = game.ServerStorage.Soldat
local soldier:ModuleScript = require(game.ReplicatedStorage.SoldierClasses.Soldier)
local spawnEvent: RemoteEvent = game.ReplicatedStorage.SoldierSignals.Spawn

spawnEvent.OnServerEvent:Connect(function(plr, localRadius: Vector3)
	local spawned = soldier.new("ok", localRadius, 100, plr, soldierModel)
	while true do
		task.wait(0.1)
		spawned:idle(localRadius)
	end
end)
	

