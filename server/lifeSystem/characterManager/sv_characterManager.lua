NTH = {}
NTH.PlayerList = {}
NTH.CharList = {}

RegisterNetEvent('nth:playerJoined')
AddEventHandler('nth:playerJoined', function()
    local src_ = source
    if NTH.PlayerList[src_] == nil then
        NTH.PlayerList[src_] = {
            username = GetPlayerName(src_),
            license = (string.gsub(GetPlayerIdentifiers(src_)[1], "license:", ""))
        }
        getUserCreated(src_, false)
    end
end)

RegisterNetEvent('nth:editCharacter')
AddEventHandler('nth:editCharacter', function(type, charaterData)
    local src_ = source
    if type == "create" then
        if NTH.PlayerList[src_].permissions.characterAutorized > #NTH.PlayerList[src_].charList then
            
            MySQL.Async.execute("INSERT INTO `characters` (user, lastname, firstname, height, sexe, dob, pob, nationality, appearance) VALUES (@user, @lastname, @firstname, @height, @sexe, @dob, @pob, @nationality, @appearance)", {
                ["user"] = NTH.PlayerList[src_].userId,
                ["lastname"] = charaterData.identity.lastname,
                ["firstname"] = charaterData.identity.firstname,
                ["height"] = charaterData.identity.height,
                ["sexe"] = charaterData.identity.sexe,
                ["dob"] = charaterData.identity.dob,
                ["pob"] = charaterData.identity.pob,
                ["nationality"] = charaterData.identity.nationality,
                ["appearance"] = json.encode(charaterData.face)

            }, function()
                local id = MySQL.Sync.execute("SELECT id FROM `characters` WHERE user = @user ORDER BY id DESC LIMIT 1", {["user"] = NTH.PlayerList[src_].userId})
                MySQL.Sync.execute("INSERT INTO positions (of, type, x, y, z) VALUES (@of, @type, @x, @y, @z)", {
                    ["of"] = id[1].id,
                    ["type"] = "character",
                    ["x"] = Config.spawnPoint[1],
                    ["y"] = Config.spawnPoint[2],
                    ["z"] = Config.spawnPoint[3],
                    ["heading"] = Config.spawnPoint[4]
                })
            end)
            characterSelector(src_, false)  
        end
    elseif type == "select" then
        NTH.PlayerList[src_].charId = charaterData
        local characterAppearance = MySQL.Sync.execute("SELECT `characters`.appearance, positions.x, positions.y, positions.z, positions.heading FROM `characters`, positions WHERE `characters`.user = @user AND `characters`.id = @id AND positions.type = 'character' AND positions.of = @id", {["user"] = NTH.PlayerList[src_].userId, ["id"] = NTH.PlayerList[src_].charId})
        if NTH.CharList[NTH.PlayerList[src_].charId] == nil then
            NTH.CharList[NTH.PlayerList[src_].charId] = src_
        end
        print(json.encode(characterAppearance, {indent=true}))
        TriggerClientEvent('nth:characterSelected', src_, characterAppearance[1].appearance)
        SetEntityCoords(GetPlayerPed(src_), tonumber(characterAppearance[1].x), tonumber(characterAppearance[1].y), tonumber(characterAppearance[1].z), false, false, false, false)
        SetEntityHeading(GetPlayerPed(src_), characterAppearance[1].heading)
    elseif type == "delete" then
        if NTH.CharList[NTH.PlayerList[src_].charId] ~= nil then
            table.remove(NTH.CharList, NTH.PlayerList[src_].charId)
        end
        MySQL.Sync.execute("UPDATE `characters` SET deleted = @deleted WHERE user = @user AND id = @id", {["deleted"] = 1, ["user"] = NTH.PlayerList[src_].userId, ["id"] = charaterData})
        characterSelector(src_, false)
    end
end)


function getUserCreated(source, loop)
    MySQL.Async.execute("SELECT id, username, permissions FROM users WHERE license = @license", {["license"] = NTH.PlayerList[source].license}, function(userData)
        if userData[1] then
            NTH.PlayerList[source].userId = userData[1].id
            NTH.PlayerList[source].permissions = json.decode(userData[1].permissions)
            if not userData[1].username == NTH.PlayerList[source].username then
                MySQL.Async.execute("UPDATE users SET username = @username WHERE license = @license", {["username"] = NTH.PlayerList[source].username, ["license"] = NTH.PlayerList[source].license})
            end
            if not loop then
                print("^2[DB] User ^7"..NTH.PlayerList[source].username.."^2 already exists ! Loading data...")
            end

            MySQL.Async.execute("UPDATE users SET lastconnection = NOW() WHERE license = @license", {["license"] = NTH.PlayerList[source].license})

            characterSelector(source, true)
        else
            if loop then
                --Notif de bug au joueur
            elseif not loop then
                MySQL.Async.execute("INSERT INTO users (username, license, permissions) VALUES (@username, @license, @permissions)", {["username"] = NTH.PlayerList[source].username, ["license"] = NTH.PlayerList[source].license, ["permissions"] = '{"characterAutorized":2}'}, function()
                    print("^2[DB] ^1User ^7"..NTH.PlayerList[source].username.." ^1registered ! Loading data...^7")
                    getUserCreated(source, true)
                end)
            end

        end
    
    end)
end

function characterSelector(source, first)
    MySQL.Async.execute("SELECT `characters`.id, `characters`.lastname, `characters`.firstname, `characters`.appearance FROM users INNER JOIN `characters` ON (users.id = `characters`.user) WHERE users.id = @id AND `characters`.deleted = 0", {["id"] = NTH.PlayerList[source].userId}, function(characterList)
        NTH.PlayerList[source].charList = characterList
        TriggerClientEvent('nth:sendCharacterList', source, characterList, NTH.PlayerList[source].permissions, first)
    end)
end