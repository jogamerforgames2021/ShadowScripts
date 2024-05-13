-- HighlightModule.lua

local HighlightModule = {}

-- Default settings
local Settings = {
    Enabled = true,
    FillTransparency = 0.5,
    OutlineTransparency = 0.5,
    OutlineColor = Color3.new(1, 1, 1),
    FillColor = Color3.new(1, 1, 1),
}

-- Create highlights for all players except the local player
function HighlightModule:Initialize()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = character
                highlight.FillTransparency = Settings.FillTransparency
                highlight.OutlineTransparency = Settings.OutlineTransparency
                highlight.OutlineColor = Settings.OutlineColor
                highlight.FillColor = Settings.FillColor
                highlight.Enabled = Settings.Enabled
                highlight.Parent = character
                print("Created highlight for player:", player.Name)
            end
        end
    end
end

-- Toggle the highlights for all players except the local player
function HighlightModule:SetEnabled(enabled)
    Settings.Enabled = enabled
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChildOfClass("Highlight")
                if highlight then
                    highlight.Enabled = enabled
                    print("Highlight for player", player.Name, "is now", enabled and "enabled" or "disabled")
                end
            end
        end
    end
end

-- Update settings
function HighlightModule:SetSettings(settings)
    for key, value in pairs(settings) do
        if Settings[key] ~= nil then
            Settings[key] = value
        end
    end
    print("Updated highlight settings")
end

return HighlightModule
