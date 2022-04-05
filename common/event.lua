NTH.Event = {};
local Event = NTH.Event;

local cooldown = {}

local function getCooldown(source)
    for _, id in pairs(cooldown) do
        if (source == id) then
            return true
        end
    end
    return false
end

local function addCooldown(source)
    table.insert(cooldown, source)
end

local function removeCooldown(source)
    for k, v in pairs(cooldown) do
        if (source == v) then
            cooldown[k] = nil
        end
    end
end

function Event.Register(eventName, eventRoutine, param)
    RegisterNetEvent(eventName)
    NTH.Event.Handler(eventName, eventRoutine, param)
end

function Event.Handler(eventName, eventRoutine, param)
    AddEventHandler(eventName, function()
        local src_ = source
        local pedId = GetPlayerPed(src_)
        if param.cooldown then
            if getCooldown(src_) then
                print('[ANTICHEAT] La personne '..GetPlayerName(src_)..' a tenté d\'executé l\'event '..eventName..' trop rapidement !')
                return
            end
            addCooldown(src_)
            SetTimeout(param.cooldown, function()
                removeCooldown(src_)
            end)
        end

        if param.dst then
            local dst = #(param.dst[1]-GetEntityCoords(pedId))
            if not dst <= param.dst[2] then
                return
                print('[ANTICHEAT] La personne '..GetPlayerName(src_)..' a tenté d\'executer l\'event '..eventName..' en dehors de sa zone !')
            end
        end
        eventRoutine(...)
    end)
end