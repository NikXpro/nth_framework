NTH.Keys = {};
local Keys = NTH.Keys;

---@param controls string
---@param controlName string
---@param description string
---@param print boolean
---@param cb function
function Keys.Register(controls, controlName, description, print, cb)
    local _Keys = {
        CONTROLS = controls
    }
    RegisterKeyMapping(string.format('+NTH-%s', controlName), description, "keyboard", controls)
    RegisterCommand(string.format('+NTH-%s', controlName), function(source, args)
        if (cb ~= nil) then
            cb();
        end
    end, false)
    return setmetatable(_Keys, NTH.Keys)
end

---@param controls string
---@param controlName string
---@param description string
---@param print boolean
---@param cb function
---@param time number
function Keys.HoldRegister(controls, controlName, description, print, cb, time)
    local _Keys = {
        [controlName] = true
    }

    RegisterKeyMapping(string.format('+NTH-%s', controlName), description, "keyboard", controls)
    RegisterCommand(string.format('+NTH-%s', controlName), function(source, args)
        if (cb ~= nil) then
            _Keys[controlName] = true
            Citizen.CreateThread(function()
                while _Keys[controlName] do
                    cb()
                    Citizen.Wait(time)
                end
            end)
        end
    end, false)
    
    RegisterCommand(string.format('-NTH-%s', controlName), function(source, args)
        _Keys[controlName] = false
    end, false)
end