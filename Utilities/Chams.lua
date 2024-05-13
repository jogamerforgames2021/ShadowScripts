-- HighlightModule.lua

local HighlightModule = {}

HighlightModule.Enabled = true
HighlightModule.FillTransparency = 0.5
HighlightModule.OutlineTransparency = 0.5
HighlightModule.OutlineColor = Color3.new(1, 1, 1)
HighlightModule.FillColor = Color3.new(1, 1, 1)

function HighlightModule:SetEnabled(enabled)
    self.Enabled = enabled
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if highlight then
                    highlight.Enabled = enabled
                end
            end
        end
    end
end

function HighlightModule:SetFillTransparency(transparency)
    self.FillTransparency = transparency
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if highlight then
                    highlight.FillTransparency = transparency
                end
            end
        end
    end
end

function HighlightModule:SetOutlineTransparency(transparency)
    self.OutlineTransparency = transparency
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if highlight then
                    highlight.OutlineTransparency = transparency
                end
            end
        end
    end
end

function HighlightModule:SetOutlineColor(color)
    self.OutlineColor = color
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if highlight then
                    highlight.OutlineColor = color
                end
            end
        end
    end
end

function HighlightModule:SetFillColor(color)
    self.FillColor = color
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local character = player.Character
            if character then
                local highlight = character:FindFirstChild("Highlight")
                if highlight then
                    highlight.FillColor = color
                end
            end
        end
    end
end

return HighlightModule
