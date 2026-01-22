--[[
    NEO-ARK: Sovereign Skin Manager
    Author: EZ-Studios (Sovereign Engine)
    Description: Manages the application of visual archetypes to player characters.
]]

local SovereignSkinManager = {}

-- Sovereign Palette Definitions
local PALETTES = {
    ["Architect"] = {
        Primary = Color3.fromHex("#39FF14"), -- Neon Green
        Secondary = Color3.fromHex("#000000"), -- Void Black
        Highlight = Color3.fromHex("#CCFFCC"),
        Description = "Logic & Structure"
    },
    ["Oracle"] = {
        Primary = Color3.fromHex("#7B2CBF"), -- Deep Purple
        Secondary = Color3.fromHex("#1A0033"), -- Dark Violet
        Highlight = Color3.fromHex("#E0B0FF"),
        Description = "Data & Discovery"
    },
    ["Executor"] = {
        Primary = Color3.fromHex("#FF3131"), -- Aggressive Red
        Secondary = Color3.fromHex("#330000"), -- Blood Black
        Highlight = Color3.fromHex("#FFCCCC"),
        Description = "Combat & Entropy"
    },
    ["Phantom"] = {
        Primary = Color3.fromHex("#FF006E"), -- Cyber Magenta
        Secondary = Color3.fromHex("#220011"), -- Deep Pink/Black
        Highlight = Color3.fromHex("#FFCCE6"),
        Description = "Stealth & Infiltration"
    },
    ["Broker"] = {
        Primary = Color3.fromHex("#00F5FF"), -- Electric Cyan
        Secondary = Color3.fromHex("#002233"), -- Deep Sea Black
        Highlight = Color3.fromHex("#CCFFFF"),
        Description = "Economy & Trade"
    },
    ["Null"] = {
        Primary = Color3.fromHex("#666666"), -- Grey
        Secondary = Color3.fromHex("#111111"),
        Highlight = Color3.fromHex("#AAAAAA"),
        Description = "Uncalibrated"
    }
}

-- Apply the visual style to a character
function SovereignSkinManager.ApplyArchetype(character, archetypeKey)
    local palette = PALETTES[archetypeKey] or PALETTES["Null"]
    
    print("[SkinManager] Applying archetype: " .. archetypeKey)

    -- 1. Apply Base Colors (Body Parts)
    for _, part in ipairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            if part.Name == "Head" then
                part.Color = palette.Highlight
                part.Material = Enum.Material.Neon
            elseif part.Name == "Torso" or part.Name == "UpperTorso" or part.Name == "LowerTorso" then
                part.Color = palette.Secondary
                part.Material = Enum.Material.Metal
            else
                -- Limbs
                part.Color = palette.Secondary
                part.Material = Enum.Material.Plastic
            end
        end
    end

    -- 2. Create/Update "Circuitry" (Neon Highlights)
    -- This would ideally use textured meshes, but we simulate with a Highlight or Aura for now
    local highlight = character:FindFirstChild("ArchetypeAura")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "ArchetypeAura"
        highlight.Parent = character
    end
    
    highlight.FillColor = palette.Primary
    highlight.OutlineColor = palette.Highlight
    highlight.FillTransparency = 0.8 -- Subtle internal glow
    highlight.OutlineTransparency = 0 -- Sharp outline
    
    -- 3. Add Particle Emitter (Subtle Glitch Effect)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local particles = rootPart:FindFirstChild("ArchetypeGlitch")
        if not particles then
            particles = Instance.new("ParticleEmitter")
            particles.Name = "ArchetypeGlitch"
            particles.Texture = "rbxassetid://243098098" -- Generic square/pixel texture
            particles.Parent = rootPart
        end
        
        particles.Color = ColorSequence.new(palette.Primary)
        particles.Size = NumberSequence.new(0.2, 0)
        particles.Lifetime = NumberRange.new(0.5, 1)
        particles.Rate = 5
        particles.Speed = NumberRange.new(2, 4)
        particles.SpreadAngle = Vector2.new(180, 180)
    end
    
    return true
end

-- Get palette data for UI or other uses
function SovereignSkinManager.GetPalette(archetypeKey)
    return PALETTES[archetypeKey] or PALETTES["Null"]
end

return SovereignSkinManager
