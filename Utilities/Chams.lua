local HighlightModule = {}

-- Settings
HighlightModule.Settings = {
    Enabled = true,
    FillTransparency = 0.5,
    OutlineTransparency = 0.5,
    OutlineColor = Color3.new(1, 1, 1),
    FillColor = Color3.new(1, 1, 1)
}

-- Internal
local Players = game:GetService("Players")
local HighlightService = game:GetService("Highlight")
local HighlightObjects = {}

-- Create Highlight
function HighlightModule.CreateHighlight(player)
    if not player.Character or HighlightObjects[player.UserId] then
        return
    end

    local character = player.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerHighlight"
    highlight.Parent = character
    highlight.Enabled = HighlightModule.Settings.Enabled
    highlight.FillTransparency = HighlightModule.Settings.FillTransparency
    highlight.OutlineTransparency = HighlightModule.Settings.OutlineTransparency
    highlight.OutlineColor = HighlightModule.Settings.OutlineColor
    highlight.FillColor = HighlightModule.Settings.FillColor

    HighlightObjects[player.UserId] = highlight

    humanoid.Died:Connect(function()
        HighlightObjects[player.UserId] = nil
        highlight:Destroy()
    end)
end

-- Initialize Highlights for existing players
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Players.LocalPlayer then
        HighlightModule.CreateHighlight(player)
    end
end

-- Player Added Event
Players.PlayerAdded:Connect(function(player)
    if player ~= Players.LocalPlayer then
        HighlightModule.CreateHighlight(player)
    end
end)

return HighlightModule
