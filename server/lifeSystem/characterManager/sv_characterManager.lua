
NTH = {}
NTH.PlayerList = {}

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
AddEventHandler('nth:editCharacter', function(type, playerData)
    local src_ = source
    if type == "create" then
        MySQL.Sync.execute("INSERT INTO `characters` (user, firstname, lastname, birthdate, size, nationality) VALUES (@user, @firstname, @lastname, @birthdate, @size, @nationality)", {
            ["user"] = NTH.PlayerList[src_].userId,
            ["firstname"] = playerData.pFirstname,
            ["lastname"] = playerData.pLastname,
            ["birthdate"] = playerData.pBirthdate,
            ["size"] = playerData.pSize,
            ["nationality"] = playerData.pNationality
        })
    elseif type == "select" then
        NTH.PlayerList[src_].charId = playerData
        TriggerClientEvent('nth:characterSelected', src_)
    elseif type == "delete" then
        MySQL.Sync.execute("UPDATE `characters` SET deleted = @deleted WHERE user = @user AND id = @id", {["deleted"] = 1, ["user"] = NTH.PlayerList[src_].userId, ["id"] = playerData})
        characterSelector(src_)
    end
end)

RegisterNetEvent('nth:createCharacter')
AddEventHandler('nth:createCharacter', function(playerData)
    local src_ = source
    MySQL.Sync.execute("INSERT INTO `characters` (user, firstname, lastname, birthdate, size, nationality) VALUES (@user, @firstname, @lastname, @birthdate, @size, @nationality)", {
        ["user"] = NTH.PlayerList[src_].userId,
        ["firstname"] = playerData.pFirstname,
        ["lastname"] = playerData.pLastname,
        ["birthdate"] = playerData.pBirthdate,
        ["size"] = playerData.pSize,
        ["nationality"] = playerData.pNationality
    })
end)

function getUserCreated(source, loop)
    MySQL.Async.execute("SELECT id, username FROM users WHERE license = @license", {["license"] = NTH.PlayerList[source].license}, function(userData)
        if userData[1] then
            NTH.PlayerList[source].userId = userData[1].id
            NTH.PlayerList[source].permissions = json.decode(userData[1].permissions)
            if not userData[1].username == LEEDS.PlayerList[source].username then
                MySQL.Async.execute("UPDATE users SET username = @username WHERE license = @license", {["username"] = LEEDS.PlayerList[source].username, ["license"] = LEEDS.PlayerList[source].license})
            end
            if not loop then
                print("^2[DB] User ^7"..NTH.PlayerList[source].username.."^2 already exists ! Loading data...")
            end

            MySQL.Async.execute("UPDATE users SET lastconnection = NOW() WHERE license = @license", {["license"] = LEEDS.PlayerList[source].license})

            characterSelector(source)
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

function characterSelector(source)
    MySQL.Async.execute("SELECT * FROM users INNER JOIN `characters` ON (users.id = `characters`.user) WHERE users.id = @id", {["id"] = NTH.PlayerList[source].userId}, function(characterList)
        TriggerClientEvent('nth:sendCharacterList', src_, characterList, NTH.PlayerList[src_].permissions)
    end)
end