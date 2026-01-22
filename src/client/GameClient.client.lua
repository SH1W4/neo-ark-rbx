--[[
    NEO-ARK: GameClient (Main Controller)
    Author: EZ-Studios (Sovereign Engine)
    Description: Orchestrates the "First 5 Minutes" experience: Boot -> Narrative -> Gameplay.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Modules
local TerminalBootManager = require(script.Parent:WaitForChild("TerminalBootManager"))
local HUDSystem = require(script.Parent:WaitForChild("HUDSystem"))

-- Shared Modules
local SharedModules = ReplicatedStorage:WaitForChild("NeoArkaia_Shared"):WaitForChild("Modules")
local InkRuntime = require(SharedModules:WaitForChild("InkRuntime"))

-- Narrative Data
local NarrativeFolder = ReplicatedStorage:WaitForChild("NeoArkaia_Shared"):WaitForChild("Narratives"):WaitForChild("Compiled")
local TimelineNarrative = require(NarrativeFolder:WaitForChild("timeline_narrative"))

-- State
local player = Players.LocalPlayer
local currentStory = nil

-- Logic
local function startTimelineNarrative()
    print("[GameClient] Starting Timeline Narrative...")
    
    -- Initialize Ink Story
    currentStory = InkRuntime.new(TimelineNarrative)
    local state = currentStory:Start("timeline_start")
    
    local function onChoiceSelected(choiceIndex)
        local newState = currentStory:ChooseChoice(choiceIndex)
        updateNarrativeUI(newState)
    end
    
    function updateNarrativeUI(state)
        if not state then
            -- Initial Start?
            return 
        end
        
        -- Display on HUD
        HUDSystem:DisplayNarrative(player, state.text, state.choices, onChoiceSelected)
        
        -- Check if end of story
        if not state.choices or #state.choices == 0 then
            task.wait(3) -- Read time
            HUDSystem:CloseNarrative(player)
            
            -- Transition to Calibration
            print("[GameClient] Timeline Complete. Initiating Calibration...")
            local Events = ReplicatedStorage:WaitForChild("NeoArkaia_Shared"):WaitForChild("Events")
            Events:WaitForChild("StartCalibration"):FireServer()
        end
    end
    
    updateNarrativeUI(state)
end

local function onBootComplete()
    print("[GameClient] Boot Sequence Complete.")
    
    -- Initialize HUD
    local hud = HUDSystem:CreateHUD(player)
    
    -- Start Narrative
    startTimelineNarrative()
end

-- Main Entry Point
task.wait(2) -- Wait for game load
TerminalBootManager:Run(onBootComplete)

-- Debug/Test: Trigger Logic Hack on 'H' key
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.H then
        print("[GameClient] Debug: Starting Test Logic Hack...")
        if _G.StartLogicHack then
            _G.StartLogicHack({
                ID = "logic_01_if",
                Category = "DEBUG_TEST (Control Flow)",
                Question = "DEBUG: Corrija a condição para abrir a porta (Target: >= 10).",
                GlitchedCode = "if player.EB > 5 then open_door() end",
            })
        end
    end
end)
