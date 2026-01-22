--[[
    NEO-ARK: LogicHackUI (The Terminal)
    Author: EZ-Studios (Sovereign Engine)
    Description: Handles the visual interface for code-based puzzles (Architect Academy).
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Events = ReplicatedStorage:WaitForChild("NeoArkaia_Shared"):WaitForChild("Events")
local SubmitHackEvent = Events:WaitForChild("SubmitHack")

-- UI Configuration
local TERMINAL_COLOR = Color3.fromHex("#39FF14") -- Neon Green
local ERROR_COLOR = Color3.fromHex("#FF3131") -- Neon Red
local BACKGROUND_COLOR = Color3.fromHex("#0A0A0F")
local FONT = Enum.Font.Code

local function createLogicHackUI(challengeData)
    -- Cleanup existing
    if PlayerGui:FindFirstChild("LogicHackConsole") then
        PlayerGui.LogicHackConsole:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LogicHackConsole"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    -- Main Terminal Window
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.fromScale(0.7, 0.8)
    mainFrame.Position = UDim2.fromScale(0.5, 0.5)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = BACKGROUND_COLOR
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = TERMINAL_COLOR
    mainFrame.Parent = screenGui

    -- Header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0.08, 0)
    header.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    header.BorderSizePixel = 0
    header.Parent = mainFrame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.5, 0, 1, 0)
    title.Position = UDim2.new(0.02, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "/// NEO_ARK // LOGIC_HACK_PROTOCOL // v1.0"
    title.TextColor3 = TERMINAL_COLOR
    title.Font = FONT
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextSize = 16
    title.Parent = header
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0.05, 0, 1, 0)
    closeBtn.Position = UDim2.new(0.95, 0, 0, 0)
    closeBtn.BackgroundTransparency = 1
    closeBtn.Text = "[X]"
    closeBtn.TextColor3 = ERROR_COLOR
    closeBtn.Font = FONT
    closeBtn.Parent = header
    closeBtn.MouseButton1Click:Connect(function() screenGui:Destroy() end)

    -- Instructions Panel
    local leftPanel = Instance.new("Frame")
    leftPanel.Size = UDim2.new(0.3, -4, 0.92, -4)
    leftPanel.Position = UDim2.new(0, 2, 0.08, 2)
    leftPanel.BackgroundColor3 = Color3.new(0.08, 0.08, 0.08)
    leftPanel.BorderSizePixel = 0
    leftPanel.Parent = mainFrame

    local instructionTitle = Instance.new("TextLabel")
    instructionTitle.Size = UDim2.new(0.9, 0, 0.1, 0)
    instructionTitle.Position = UDim2.new(0.05, 0, 0, 0)
    instructionTitle.BackgroundTransparency = 1
    instructionTitle.Text = "> MISSION_OBJECTIVE"
    instructionTitle.TextColor3 = TERMINAL_COLOR
    instructionTitle.Font = FONT
    instructionTitle.TextXAlignment = Enum.TextXAlignment.Left
    instructionTitle.Parent = leftPanel

    local instructionText = Instance.new("TextLabel")
    instructionText.Size = UDim2.new(0.9, 0, 0.8, 0)
    instructionText.Position = UDim2.new(0.05, 0, 0.1, 0)
    instructionText.BackgroundTransparency = 1
    instructionText.Text = challengeData.Question or "Debug the corrupted code segment to restore functionality."
    instructionText.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    instructionText.Font = FONT
    instructionText.TextSize = 14
    instructionText.TextWrapped = true
    instructionText.TextXAlignment = Enum.TextXAlignment.Left
    instructionText.TextYAlignment = Enum.TextYAlignment.Top
    instructionText.Parent = leftPanel

    -- Code Editor Area
    local editorFrame = Instance.new("Frame")
    editorFrame.Size = UDim2.new(0.68, -4, 0.6, -4)
    editorFrame.Position = UDim2.new(0.31, 0, 0.08, 2)
    editorFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    editorFrame.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    editorFrame.Parent = mainFrame

    local lineNumbers = Instance.new("TextLabel")
    lineNumbers.Size = UDim2.new(0.05, 0, 1, 0)
    lineNumbers.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    lineNumbers.Text = "1\n2\n3\n4\n5\n6\n7\n8\n9\n10"
    lineNumbers.TextColor3 = Color3.new(0.5, 0.5, 0.5)
    lineNumbers.Font = FONT
    lineNumbers.TextYAlignment = Enum.TextYAlignment.Top
    lineNumbers.Parent = editorFrame

    local codeBox = Instance.new("TextBox")
    codeBox.Size = UDim2.new(0.95, 0, 1, 0)
    codeBox.Position = UDim2.new(0.05, 0, 0, 0)
    codeBox.BackgroundTransparency = 1
    codeBox.TextColor3 = TERMINAL_COLOR
    codeBox.Font = FONT
    codeBox.TextSize = 16
    codeBox.TextXAlignment = Enum.TextXAlignment.Left
    codeBox.TextYAlignment = Enum.TextYAlignment.Top
    codeBox.ClearTextOnFocus = false
    codeBox.MultiLine = true
    codeBox.Text = challengeData.GlitchedCode or "-- Code unavailable"
    codeBox.Parent = editorFrame

    -- Console Output
    local outputFrame = Instance.new("ScrollingFrame")
    outputFrame.Size = UDim2.new(0.68, -4, 0.2, 0)
    outputFrame.Position = UDim2.new(0.31, 0, 0.7, 0)
    outputFrame.BackgroundColor3 = Color3.new(0.02, 0.02, 0.02)
    outputFrame.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
    outputFrame.Parent = mainFrame

    local outputText = Instance.new("TextLabel")
    outputText.Size = UDim2.new(1, 0, 0, 0)
    outputText.AutomaticSize = Enum.AutomaticSize.Y
    outputText.BackgroundTransparency = 1
    outputText.Text = "> System Ready..."
    outputText.TextColor3 = Color3.new(0.7, 0.7, 0.7)
    outputText.Font = FONT
    outputText.TextXAlignment = Enum.TextXAlignment.Left
    outputText.Parent = outputFrame

    -- Action Bar
    local executeBtn = Instance.new("TextButton")
    executeBtn.Size = UDim2.new(0.2, 0, 0.08, 0)
    executeBtn.Position = UDim2.new(0.78, 0, 0.91, 0)
    executeBtn.BackgroundColor3 = TERMINAL_COLOR
    executeBtn.Text = "EXECUTE (COMPILE)"
    executeBtn.Font = FONT
    executeBtn.TextSize = 14
    executeBtn.Parent = mainFrame
    
    executeBtn.MouseButton1Click:Connect(function()
        outputText.Text = "> Compiling..."
        outputText.TextColor3 = Color3.new(1, 1, 0)
        
        task.wait(0.5)
        
        local result = SubmitHackEvent:InvokeServer(challengeData.ID, codeBox.Text)
        
        if result then
            outputText.Text = "> COMPILATION SUCCESSFUL.\n> SYSTEM RESTORED."
            outputText.TextColor3 = TERMINAL_COLOR
            executeBtn.Text = "ACCESS GRANTED"
            executeBtn.BackgroundColor3 = Color3.new(0, 1, 0)
            
            task.wait(1.5)
            screenGui:Destroy()
        else
            outputText.Text = "> ERROR: SYNTAX INVALID OR LOGIC FLAWED.\n> RETRY."
            outputText.TextColor3 = ERROR_COLOR
            mainFrame.BorderColor3 = ERROR_COLOR
            
            task.delay(1, function() mainFrame.BorderColor3 = TERMINAL_COLOR end)
        end
    end)

    return screenGui
end

-- Global API
_G.StartLogicHack = function(challengeData)
    createLogicHackUI(challengeData)
end
