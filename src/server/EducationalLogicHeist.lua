--[[
    NEO-ARK: EducationalLogicHeist
    Author: EZ-Studios (Sovereign Engine)
    Description: Mechanics for "Logic Hacks" - teaching code through gameplay.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local EducationalLogicHeist = {}

-- Challenges Database (Curriculum: Script Kiddie)
local CHALLENGES = {
    -- LOGIC_01: Variáveis (Variables)
	{
		ID = "logic_01_var",
		Category = "Variables",
		Question = "MISSION: Hack the Vault Door.\nOBJECTIVE: Define the correct 'password' variable to match the secure hash.",
		GlitchedCode = "local password = 'wrong_pass'\nopen_vault(password)",
		TargetCode = "local password = 'access_granted'\nopen_vault(password)",
		XPReward = 100
	},
    -- LOGIC_02: Tipos de Dados (Data Types)
	{
		ID = "logic_02_type",
		Category = "Data Types",
		Question = "MISSION: Stabilize Generator.\nOBJECTIVE: The voltage must be a Number, not a String.",
		GlitchedCode = "local voltage = '500'\nset_power(voltage)",
		TargetCode = "local voltage = 500\nset_power(voltage)",
		XPReward = 150
	},
    -- LOGIC_03: Operadores (Operators)
	{
		ID = "logic_03_op",
		Category = "Operators",
		Question = "MISSION: Activate Turret.\nOBJECTIVE: Calculate total ammo supply (clip + reserve) to enable fire mode.",
		GlitchedCode = "local clip = 30\nlocal reserve = 90\nlocal total = clip - reserve\nactivate_turret(total)",
		TargetCode = "local clip = 30\nlocal reserve = 90\nlocal total = clip + reserve\nactivate_turret(total)",
		XPReward = 200
	}
}

-- Active sessions tracking
local activeSessions = {}

function EducationalLogicHeist.GetChallenge(challengeID)
    for _, c in ipairs(CHALLENGES) do
		if c.ID == challengeID then
			return c
		end
	end
    return nil
end

function EducationalLogicHeist.StartHack(player, challengeID)
    local challenge = EducationalLogicHeist.GetChallenge(challengeID)
	if not challenge then return end
	
    -- Record session
    activeSessions[player.UserId] = challengeID
    
	print(string.format("[LogicHeist] Player %s started challenge: %s", player.Name, challenge.Category))
    
    -- In a real scenario, we might FireClient here if triggered by server, 
    -- but usually Client requests start via interaction.
    -- For now, we assume Client UI has the data or requests it.
    return challenge
end

function EducationalLogicHeist.SolveHack(player, challengeID, submittedCode)
    -- Validate session
    if activeSessions[player.UserId] ~= challengeID then
        warn(string.format("[LogicHeist] Security Alert: Player %s tried to solve %s without active session.", player.Name, challengeID))
        return false
    end

    local challenge = EducationalLogicHeist.GetChallenge(challengeID)
	if not challenge then return false end
	
    -- Normalize code for comparison (very basic, in product use AST or robust tokenizer)
    local cleanSubmitted = string.gsub(submittedCode, "%s+", " ")
    local cleanTarget = string.gsub(challenge.TargetCode, "%s+", " ")

    -- Exact match for MVP
    -- NOTE: In production, we'd want a more flexible evaluator or specific test cases.
	if cleanSubmitted == cleanTarget or submittedCode == challenge.TargetCode then
		print(string.format("[LogicHeist] SUCCESS! Player %s solved %s", player.Name, challengeID))
		
		-- Apply Rewards
		player:SetAttribute("PoL_XP", (player:GetAttribute("PoL_XP") or 0) + challenge.XPReward)
		
		-- Apply PoL Multiplier (Proof of Learning Effect)
		local currentMult = player:GetAttribute("XPMultiplier") or 1
		player:SetAttribute("XPMultiplier", currentMult + 0.05) -- +5% per successful hack
        
        -- Clear session
        activeSessions[player.UserId] = nil
		
		return true
	else
		print(string.format("[LogicHeist] FAILURE. Player %s failed %s", player.Name, challengeID))
		return false
	end
end

-- Remote Integration
local Events = ReplicatedStorage:WaitForChild("NeoArkaia_Shared"):WaitForChild("Events")
local SubmitHackEvent = Events:WaitForChild("SubmitHack")

SubmitHackEvent.OnServerInvoke = function(player, challengeID, submittedCode)
	return EducationalLogicHeist.SolveHack(player, challengeID, submittedCode)
end

return EducationalLogicHeist
