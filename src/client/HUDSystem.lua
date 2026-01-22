-- ==========================================
-- NEO-ARK: HUD SYSTEM (SYNCHRONIZER INTERFACE)
-- EZ-FUNDATION | Protocol Symbeon
-- ==========================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local HUDSystem = {}

-- 1. CRIAR HUD PARA JOGADOR
function HUDSystem:CreateHUD(player)
    local playerGui = player:WaitForChild("PlayerGui")
    
    -- Screen GUI Principal
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SynchronizerHUD"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    -- Frame Principal (Glassmorphism)
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainHUD"
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundTransparency = 1
    mainFrame.Parent = screenGui
    
    -- BARRA DE VIDA (Top Left)
    local healthBar = Instance.new("Frame")
    healthBar.Name = "HealthBar"
    healthBar.Position = UDim2.new(0.02, 0, 0.02, 0)
    healthBar.Size = UDim2.new(0.25, 0, 0.03, 0)
    healthBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    healthBar.BackgroundTransparency = 0.3
    healthBar.BorderSizePixel = 0
    healthBar.Parent = mainFrame
    
    local healthFill = Instance.new("Frame")
    healthFill.Name = "Fill"
    healthFill.Size = UDim2.new(1, 0, 1, 0)
    healthFill.BackgroundColor3 = Color3.fromRGB(57, 255, 20) -- Verde Neon
    healthFill.BorderSizePixel = 0
    healthFill.Parent = healthBar
    
    -- CONTADOR DE EB (Top Right)
    local ebCounter = Instance.new("TextLabel")
    ebCounter.Name = "EBCounter"
    ebCounter.Position = UDim2.new(0.73, 0, 0.02, 0)
    ebCounter.Size = UDim2.new(0.25, 0, 0.05, 0)
    ebCounter.BackgroundTransparency = 1
    ebCounter.Text = "EB: 0"
    ebCounter.TextColor3 = Color3.fromRGB(123, 44, 191) -- Ultravioleta Symbeon
    ebCounter.TextScaled = true
    ebCounter.Font = Enum.Font.Code
    ebCounter.Parent = mainFrame
    
    -- FEED DE CONVERGÊNCIA (Bottom Center)
    local convergenceFeed = Instance.new("ScrollingFrame")
    convergenceFeed.Name = "ConvergenceFeed"
    convergenceFeed.Position = UDim2.new(0.3, 0, 0.85, 0)
    convergenceFeed.Size = UDim2.new(0.4, 0, 0.12, 0)
    convergenceFeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    convergenceFeed.BackgroundTransparency = 0.5
    convergenceFeed.BorderSizePixel = 0
    convergenceFeed.ScrollBarThickness = 4
    convergenceFeed.Parent = mainFrame
    
    return screenGui
end

-- 2. ATUALIZAR VIDA
function HUDSystem:UpdateHealth(player, currentHealth, maxHealth)
    local hud = player.PlayerGui:FindFirstChild("SynchronizerHUD")
    if not hud then return end
    
    local healthFill = hud.MainHUD.HealthBar.Fill
    local targetSize = UDim2.new(currentHealth / maxHealth, 0, 1, 0)
    
    local tween = TweenService:Create(healthFill, TweenInfo.new(0.3), {Size = targetSize})
    tween:Play()
end

-- 3. ATUALIZAR EB
function HUDSystem:UpdateEB(player, amount)
    local hud = player.PlayerGui:FindFirstChild("SynchronizerHUD")
    if not hud then return end
    
    local ebCounter = hud.MainHUD.EBCounter
    ebCounter.Text = "EB: " .. tostring(amount)
end

-- 4. ADICIONAR ITEM AO FEED DE CONVERGÊNCIA
function HUDSystem:AddToConvergenceFeed(player, itemName, serverID, progress)
    local hud = player.PlayerGui:FindFirstChild("SynchronizerHUD")
    if not hud then return end
    
    local feed = hud.MainHUD.ConvergenceFeed
    
    local feedItem = Instance.new("TextLabel")
    feedItem.Size = UDim2.new(1, 0, 0, 30)
    feedItem.BackgroundTransparency = 1
    feedItem.Text = string.format("[Node %s] Compilando: %s (%d%%)", serverID, itemName, progress)
    feedItem.TextColor3 = Color3.fromRGB(255, 0, 110) -- Magenta
    feedItem.Font = Enum.Font.Code
    feedItem.TextScaled = true
    feedItem.Parent = feed
end

-- 5. EXIBIR NARRATIVA (TERMINAL STYLE)
function HUDSystem:DisplayNarrative(player, text, choices, callback)
    local hud = player.PlayerGui:FindFirstChild("SynchronizerHUD")
    if not hud then return end
    
    -- Verificar se já existe janela de narrativa
    local narrativeFrame = hud:FindFirstChild("NarrativeTerminal")
    if not narrativeFrame then
        narrativeFrame = Instance.new("Frame")
        narrativeFrame.Name = "NarrativeTerminal"
        narrativeFrame.Size = UDim2.new(0.6, 0, 0.4, 0)
        narrativeFrame.Position = UDim2.new(0.2, 0, 0.3, 0)
        narrativeFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
        narrativeFrame.BorderSizePixel = 2
        narrativeFrame.BorderColor3 = Color3.fromRGB(57, 255, 20) -- Neon Green Border
        narrativeFrame.Parent = hud
        
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = narrativeFrame
        
        -- Header
        local header = Instance.new("TextLabel")
        header.Size = UDim2.new(1, 0, 0.15, 0)
        header.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
        header.Text = "> SOVEREIGN_ARCHIVE.LOG"
        header.TextColor3 = Color3.fromRGB(57, 255, 20)
        header.TextXAlignment = Enum.TextXAlignment.Left
        header.Font = Enum.Font.Code
        header.Parent = narrativeFrame
        
        -- Content Area
        local content = Instance.new("ScrollingFrame")
        content.Name = "Content"
        content.Size = UDim2.new(0.95, 0, 0.6, 0)
        content.Position = UDim2.new(0.025, 0, 0.18, 0)
        content.BackgroundTransparency = 1
        content.Parent = narrativeFrame
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Name = "TextDisplay"
        textLabel.Size = UDim2.new(1, 0, 0, 0) -- Auto-scale
        textLabel.AutomaticSize = Enum.AutomaticSize.Y
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(230, 230, 230)
        textLabel.TextWrapped = true
        textLabel.TextXAlignment = Enum.TextXAlignment.Left
        textLabel.Font = Enum.Font.Code
        textLabel.TextSize = 18
        textLabel.Parent = content
    end
    
    local textDesc = narrativeFrame.Content.TextDisplay
    textDesc.Text = text
    
    -- Limpar escolhas antigas
    for _, child in ipairs(narrativeFrame:GetChildren()) do
        if child.Name == "ChoiceButton" then child:Destroy() end
    end
    
    -- Gerar Botões de Escolha
    local yOffset = 0.8
    for i, choice in ipairs(choices) do
        local btn = Instance.new("TextButton")
        btn.Name = "ChoiceButton"
        btn.Size = UDim2.new(0.95, 0, 0.1, 0)
        btn.Position = UDim2.new(0.025, 0, yOffset, 0)
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        btn.Text = "> " .. choice.text
        btn.TextColor3 = Color3.fromRGB(57, 255, 20)
        btn.Font = Enum.Font.Code
        btn.Parent = narrativeFrame
        
        -- Hover Effect
        btn.MouseEnter:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60) end)
        btn.MouseLeave:Connect(function() btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40) end)
        
        btn.MouseButton1Click:Connect(function()
            if callback then callback(choice.index) end
        end)
        
        yOffset = yOffset + 0.12
    end
    
    narrativeFrame.Visible = true
end

-- 6. FECHAR NARRATIVA
function HUDSystem:CloseNarrative(player)
    local hud = player.PlayerGui:FindFirstChild("SynchronizerHUD")
    if hud and hud:FindFirstChild("NarrativeTerminal") then
        hud.NarrativeTerminal.Visible = false
    end
end

return HUDSystem
