
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

function getUserCreated(src_, loop)
    MySQL.Async.execute("SELECT * FROM users WHERE license = @license", {["license"] = NTH.PlayerList[src_].license}, function(userData)
        if userData[1] then
            NTH.PlayerList[src_].userId = userData[1].id
            NTH.PlayerList[src_].permissions = json.decode(userData[1].permissions)
            if not loop then
                print("^2[DB] User ^7"..NTH.PlayerList[src_].username.."^2 already exists ! Loading data...")
            end
            characterSelector(src_)
        else
            if loop then
                --Notif de bug au joueur
            elseif not loop then
                MySQL.Async.execute("INSERT INTO users (username, license, permissions) VALUES (@username, @license, @permissions)", {["username"] = NTH.PlayerList[src_].username, ["license"] = NTH.PlayerList[src_].license, ["permissions"] = '{"characterAutorized":2}'}, function()
                    print("^2[DB] ^1User ^7"..NTH.PlayerList[src_].username.." ^1registered ! Loading data...^7")
                    getUserCreated(src_, true)
                end)
            end

        end
    
    end)
end

function characterSelector(src_)
    MySQL.Async.execute("SELECT * FROM users INNER JOIN `characters` ON (users.id = `characters`.user) WHERE users.id = @id", {["id"] = NTH.PlayerList[src_].userId}, function(characterList)
        TriggerClientEvent('nth:sendCharacterList', src_, characterList, NTH.PlayerList[src_].permissions)
    end)
end