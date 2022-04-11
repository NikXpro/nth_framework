---@author: NikX 2022-04-11 15:42:42

NTH.Entity = {};
NTH.Entity.Edit = {};
local Entity = NTH.Entity;

---@param model string
function Entity.LoadModel(model)
    while not HasModelLoaded(model) do
         RequestModel(model)
         Wait(100)
    end
    return GetHashKey(model)
end

---@param objectName string
---@param coords vector3
---@param cb function
---@param networked boolean
function Entity.SpawnObject(objectName, coords, cb, networked)
	Citizen.CreateThread(function()
        local model = NTH.Entity.LoadModel(objectName)
		local param = type(networked) == "boolean" and type(coords) == "vector4" and type(model) == "number";
		if param then
			local object = CreateObject(model, coords, networked, false, true)
			if cb then
				return cb(object)
			end
		else
			print("^8[ERROR]^3[FUNCTION] ^1parameter error ^7\"^5Entity.SpawnObject^7\"") 
		end
	end)	
end
---@param pedName string
---@param coords vector4
---@param cb function
---@param networked boolean
function Entity.SpawnPed(pedName, coords, cb, networked)
	Citizen.CreateThread(function()
		local model = NTH.Entity.LoadModel(pedName)
		local param = type(pedName) == "string" and type(coords) == "vector4" and type(networked) == "boolean";
		if param then
			local ped = CreatePed(_, model, coords, networked, true)
			if cb then
				return cb(ped)
			end
		else
			print("^8[ERROR]^3[FUNCTION] ^1parameter error ^7\"^5Entity.SpawnPed^7\"") 
		end
	end)
end