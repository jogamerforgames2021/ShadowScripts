-- wait for game to load
if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- place check
if game.PlaceId ~= 6839171747 then return end

-- teleport requeue
local queueTeleport = queue_on_teleport or queueteleport or (syn and syn.queue_on_teleport)
if queueTeleport then
	player.OnTeleport:Connect(function(state)
		if state == Enum.TeleportState.Started then
			queueTeleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/jogamerforgames2021/ShadowScripts/refs/heads/main/test1.lua?cache_bust='..tick()))()")
		end
	end)
end

-- safe function to get character & humanoid
local function getHumanoid()
	local char = player.Character
	if not char then
		char = player.CharacterAdded:Wait()
	end

	local humanoid = char:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		humanoid = char:WaitForChild("Humanoid")
	end

	return char, humanoid
end

-- main execution
local character, humanoid = getHumanoid()

humanoid.Died:Connect(function()
	ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
end)

humanoid.Health = 0
