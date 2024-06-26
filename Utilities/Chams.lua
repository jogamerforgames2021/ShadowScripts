local HighlightModule = {}

-- Settings
HighlightModule.Settings = {
    Enabled = true,
    FillTransparency = 0,
    OutlineTransparency = 0,
    OutlineColor = Color3.fromRGB(255, 255, 255),
    FillColor = Color3.fromRGB(255, 255, 255),
}

-- Update function
function HighlightModule.Update()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "Highlight"
                    highlight.Parent = character
                end

                highlight.Enabled = HighlightModule.Settings.Enabled
                highlight.FillColor = HighlightModule.Settings.FillColor
                highlight.FillTransparency = HighlightModule.Settings.FillTransparency
                highlight.OutlineColor = HighlightModule.Settings.OutlineColor
                highlight.OutlineTransparency = HighlightModule.Settings.OutlineTransparency
            end
        end
    end
end

-- Toggle function
function HighlightModule.Toggle(enabled)
    HighlightModule.Settings.Enabled = enabled
    HighlightModule.Update()
end

-- Example usage
HighlightModule.Update() -- Initial update
HighlightModule.Toggle(false) -- Disable highlights
local RunService = game:GetService("RunService")
RunService.Heartbeat:Connect(function()
    HighlightModule.Update()
end)
return HighlightModule
