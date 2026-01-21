-- ==========================================
-- SYMBEON MESH NETWORK: INTRUSION SYSTEM (LUAU)
-- EZ-FUNDATION | Protocol Symbeon
-- ==========================================

local MessagingService = game:GetService("MessagingService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- 1. SETUP DE EVENTOS
local IntrusionAlert = Instance.new("RemoteEvent")
IntrusionAlert.Name = "IntrusionAlert"
IntrusionAlert.Parent = ReplicatedStorage

-- 2. LISTEN PARA ATAQUES NA MALHA (Cross-Server)
MessagingService:SubscribeAsync("SymbeonMesh", function(message)
    local data = message.Data
    
    -- Verifica se este servidor é o alvo
    if data.Type == "INTRUSION_START" and data.TargetJobId == game.JobId then
        print("🚨 [MESH-ALERTA]: Tentativa de invasão detectada!")
        IntrusionAlert:FireAllClients(data.AttackerName)
        
        -- Ativa visibilidade do Artefato Mestre para defesa
        local artifact = workspace:FindFirstChild("MasterArtifact")
        if artifact then
            artifact.Transparency = 0 -- Torna o item visível e vulnerável
        end
    end
end)

-- 3. LOGICA DE INVASOR (In-Server)
local function OnInfiltratorJoined(player)
    -- Verifica se o jogador veio via 'Salto de Malha' (TeleportData)
    local joinData = player:GetJoinData()
    if joinData and joinData.TeleportData and joinData.TeleportData.Role == "INTRUDER" then
        print("🕶️ [MESH-VOID]: Infiltrado " .. player.Name .. " entrou no servidor.")
        player:SetAttribute("IsMeshIntruder", true)
        -- Aplica efeitos visuais de "Glitch" no personagem do intruso
    end
end

Players.PlayerAdded:Connect(OnInfiltratorJoined)

-- 4. BROADCAST DE SUCESSO NO ROUBO
local function OnArtifactStolen(winner)
    local data = {
        Type = "ARTIFACT_STOLEN",
        WinnerName = winner.Name,
        OriginServer = game.JobId
    }
    MessagingService:PublishAsync("SymbeonMesh", data)
end
