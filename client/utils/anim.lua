NTH.Play = {};
local Play = NTH.Play;

function Play.Attitude(ped, lib, anim)
	NTH.RequestAnimSet(lib, function()
		SetPedMovementClipset(ped, anim, true)
	end)
end

function Play.Anim(ped, lib, anim, flag)
	NTH.RequestAnimDict(lib, function()
		TaskPlayAnim(ped, lib, anim, 8.0, 8.0, -1, tonumber(flag), 0.0, false, false, false)
	end)
end

function Play.AdvancedAnim(ped, lib, anim, number1, number2, number3, flag, number4, bool1, bool2, bool3)
	NTH.RequestAnimDict(lib, function()
		TaskPlayAnim(ped, lib, anim, tonumber(number1), tonumber(number2), tonumber(number3), tonumber(flag), tonumber(number4), bool1, bool2, bool3)
	end)
end

function Play.Scenario(ped, anim)
	TaskStartScenarioInPlace(ped, anim, 0, false)
end

function Play.RandomAnim(playerId, animTable)
    local randomAnim = math.random(0, #animTable)
    for k,v in pairs(animTable) do
        if k == randomAnim then
            if v.type == "anim" then
                NTH.Play.Anim(playerId, v.lib, v.anim, v.flag)
            elseif v.type == "attitude" then
                NTH.Play.Attitude(playerId, v.lib, v.anim)
            elseif v.type == "scenario" then
                NTH.Play.Scenario(playerId, v.anim)
            end
        end
    end
end