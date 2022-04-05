Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000 * 5)
        for i = 1, #NTH.CharList do
            saveCharacterCoords(i)
        end
    end
end)


local onlinePlayer = {}

AddEventHandler("nth:playerJoined", function()
    table.insert(onlinePlayer, {id = source})
end)

local zoneCoords = vector3(11.7, 52.01, 71.65)
local showing = false

local zoneList = {
    {pos = vector3(11.7, 52.01, 71.65)},
    {pos = vector3(114.45, -4.88, 67.82)}
}

Citizen.CreateThread(function()
    while true do
        local waitTime = 5000
        for i = 1, #onlinePlayer do
            local pedId = GetPlayerPed(onlinePlayer[i].id)
            local pedCoords = GetEntityCoords(pedId)
            if (onlinePlayer[i].coords ~= pedCoords) then
                onlinePlayer[i].coords = pedCoords

                local dst = #(pedCoords - zoneCoords)
                if dst <= 50 then
                    waitTime = 800
                    if dst <= 1.5 then
                        waitTime = 250
                        if not showing then
                            print("in zone")
                            TriggerClientEvent("testZone", onlinePlayer[i].id)
                            showing = true
                        end
                    else
                        if showing then
                            print("out zone")
                            TriggerClientEvent("testZone", onlinePlayer[i].id)
                            showing = false
                        end
                    end
                end

            end
        end
        Citizen.Wait(waitTime)
    end
end)

--local showing = false
--local inMarker =false
--CreateThread(function()
--	while true do
--		local sleep = 1000
--		local ped = GetPlayerPed(1)
--		local coords = GetEntityCoords(ped)
--		local Pos = vector3(11.7, 52.01, 71.65)
--		local distance = #(coords - Pos)
--			if distance < 3 then
--				sleep = 5
--				inMarker = true
--				if not showing then
--                    print("in marker")
--    				showing = true
--				end
--			else
--				inMarker = false
--				if showing then
--                    print("out marker")
--					showing = false
--				end
--			end
--	    Wait(sleep)
--	end
--end)

function saveCharacterCoords(charId)
    local pedId = GetPlayerPed(NTH.CharList[charId])
    local pedCoords = GetEntityCoords(pedId)
    local pedHeading = GetEntityHeading(pedId)
    local posX, posY, posZ = table.unpack(pedCoords)
    MySQL.Sync.execute("UPDATE positions SET x = @x, u = @y, z = @z, heading = @heading WHERE type = `characters` AND of = @of", {
        ["x"] = posX,
        ["y"] = posY,
        ["z"] = posZ,
        ["heading"] = pedHeading,
        ["of"] = charId
    })
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    for i = 1, #NTH.CharList do
        saveCharacterCoords(i)
    end
    print("Resource "..GetCurrentResourceName().. "Stoped ! All player have saved !")
end)

AddEventHandler('playerDropped', function (reason)
    local src_ = source
    print("Player "..GetPlayerName(src_).." disconected from this server !")
end)