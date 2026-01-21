-- ==========================================
-- NEO-ARKAIA: NPC INITIALIZER
-- EZ-FUNDATION | Protocol Symbeon
-- Inicializa os NPCs no mundo e conecta suas histórias
-- ==========================================

local ServerScriptService = game:GetService("ServerScriptService")
local Workspace = game:GetService("Workspace")

-- Aguardar carregamento dos módulos
task.wait(2) 

local NPCControllerModule = ServerScriptService:WaitForChild("NeoArkaia_Server"):FindFirstChild("NPCController")
if not NPCControllerModule then
    warn("[INIT]: NPCController não encontrado em NeoArkaia_Server!")
    return
end

local NPCController = require(NPCControllerModule)

print("💠 [INIT]: Iniciando Protocolo de NPCs...")

-- Função auxiliar para configurar NPC se ele existir
local function SetupIfModelsExists(npcName, storyName, knotName)
    local npcModel = Workspace:FindFirstChild(npcName)
    if npcModel then
        NPCController:SetupNPC(npcModel, storyName, knotName)
        print("✅ [INIT]: " .. npcName .. " conectado à história '" .. storyName .. "'.")
    else
        warn("⚠️ [INIT]: NPC '" .. npcName .. "' não encontrado no Workspace. Crie um Model com este nome para ativar.")
    end
end

-- ==========================================
-- REGISTRO DE NPCS
-- ==========================================

-- 1. O ARQUITETO (Kairos-7)
SetupIfModelsExists("ArchitectNPC", "main_story", "meet_architect")

-- 2. LYRA (Cartógrafa) - Futuro
-- SetupIfModelsExists("LyraNPC", "lyra_story", "meet_lyra")

print("💠 [INIT]: Inicialização de NPCs concluída.")
