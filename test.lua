-- wait for load
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- place check
if game.PlaceId ~= 6839171747 then return end

-- teleport requeue
local queueTeleport =
	queue_on_teleport
	or queueteleport
	or (syn and syn.queue_on_teleport)

if queueTeleport then
	player.OnTeleport:Connect(function(state)
		if state == Enum.TeleportState.Started then
			queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/jogamerforgames2021/ShadowScripts/refs/heads/main/test.lua'))()")
		end
	end)
end

-- main logic
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.Died:Connect(function()
	ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
end)

humanoid.Health = 0
