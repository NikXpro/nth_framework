Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000 * 5)
        for i = 1, #NTH.CharList do
            saveCharacterCoords(i)
        end
    end
end)

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
