--[[
    NEO-ARK: WorldEngine
    Author: EZ-Studios (Sovereign Engine)
    Description: Procedural construction of game environments.
]]

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[
    NEO-ARK: WorldEngine (Procedural Motor)
    Author: EZ-Studios (Sovereign Engine)
    Description: Orchestrates procedural generation of game environments (Zones).
]]

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- System Events
local Events = ReplicatedStorage:FindFirstChild("NeoArkaia_Shared") and ReplicatedStorage.NeoArkaia_Shared.Events

-- Zone Definitions
local ZONES = {
	CALIBRATION = {
		Theme = "WhiteVoid",
		Size = 200,
		GridColor = Color3.fromHex("#39FF14"),
		FloorColor = Color3.fromHex("#F5F5F5"),
		DebrisCount = 15,
		GravityMult = 0.8
	},
	NEON_HUB = {
		Theme = "CyberCity",
		Size = 500,
		GridColor = Color3.fromHex("#7B2CBF"), -- Purple Grid
		FloorColor = Color3.fromHex("#050505"), -- Dark Floor
		BuildingCount = 20,
		GravityMult = 1.0
	}
}

local currentZoneFolder = nil

-- Procedural Logic
local function clearCurrentZone()
	if currentZoneFolder then
		currentZoneFolder:Destroy()
		currentZoneFolder = nil
	end
end

local function generateGrid(folder, params)
	local floor = Instance.new("Part")
	floor.Name = "ZoneFloor"
	floor.Size = Vector3.new(params.Size, 1, params.Size)
	floor.Position = Vector3.new(0, 499, 0)
	floor.Anchored = true
	floor.Color = params.FloorColor
	floor.Material = Enum.Material.Glass
	floor.Reflectance = 0.2
	floor.Parent = folder

	-- Decorative Grid Lines
	for i = -params.Size/2, params.Size/2, 20 do
		local line = Instance.new("Part")
		line.Size = Vector3.new(params.Size, 0.1, 0.1)
		line.Position = Vector3.new(0, 499.6, i)
		line.Anchored = true
		line.CanCollide = false
		line.Color = params.GridColor
		line.Material = Enum.Material.Neon
		line.Transparency = 0.8
		line.Parent = folder

		local lineY = line:Clone()
		lineY.Size = Vector3.new(0.1, 0.1, params.Size)
		lineY.Position = Vector3.new(i, 499.6, 0)
		lineY.Parent = folder
	end
end

local function spawnDebris(folder, params)
	for i = 1, params.DebrisCount do
		local debris = Instance.new("Part")
		debris.Name = "Debris_" .. i
		debris.Size = Vector3.new(math.random(2, 6), math.random(2, 6), math.random(2, 6))
		debris.Position = Vector3.new(math.random(-50, 50), 505, math.random(-50, 50))
		debris.Color = Color3.new(0.1, 0.1, 0.1)
		debris.Material = Enum.Material.Metal
		debris.Parent = folder

		local bodyForce = Instance.new("BodyForce")
		bodyForce.Force = Vector3.new(0, debris:GetMass() * workspace.Gravity * params.GravityMult, 0)
		bodyForce.Parent = debris
		
		debris:SetAttribute("IsCalibrationObject", true)
	end
end

local function spawnBuildings(folder, params)
	for i = 1, params.BuildingCount do
		local w = math.random(20, 50)
		local d = math.random(20, 50)
		local h = math.random(50, 150)
		
		local building = Instance.new("Part")
		building.Name = "Building_" .. i
		building.Size = Vector3.new(w, h, d)
		building.Position = Vector3.new(math.random(-params.Size/2, params.Size/2), 500 + h/2, math.random(-params.Size/2, params.Size/2))
		building.Anchored = true
		building.Material = Enum.Material.Metal
		building.Color = Color3.fromHex("#111111")
		building.Parent = folder
		
		-- Neon Edge
		local highlight = Instance.new("Highlight")
		highlight.FillTransparency = 1
		highlight.OutlineColor = params.GridColor
		highlight.Parent = building
	end
end

local function GenerateZone(zoneType)
	print("[WorldEngine] Generating Zone: " .. zoneType)
	clearCurrentZone()
	
	local params = ZONES[zoneType] or ZONES.CALIBRATION
	local folder = Instance.new("Folder")
	folder.Name = "Zone_" .. zoneType
	folder.Parent = workspace
	currentZoneFolder = folder
	
	generateGrid(folder, params)
	
	if zoneType == "CALIBRATION" then
		spawnDebris(folder, params)
	elseif zoneType == "NEON_HUB" then
		spawnBuildings(folder, params)
	end
	
	print("[WorldEngine] Generation Complete.")
end

-- Initialization
GenerateZone("CALIBRATION") -- Default start
