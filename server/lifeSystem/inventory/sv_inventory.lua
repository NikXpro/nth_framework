NTH.Items = {}

function GetItemExist(itemName)
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./data/data_items.json")
    local itemsData = json.decode(loadFile)
    for _,item in pairs(itemsData) do
        if item.name == itemName then
            return true
        end
    end
    return false
end

function GetItemStack(src, itemName)
    for _,v in pairs(NTH.PlayerList[src].inventory) do
        if itemName == v.name and v.stack == 0 then
            MySQL.Sync.execute("DELETE FROM items WHERE in = @in AND name = @name", {["in"] = NTH.PlayerList[src].inventoryId, ["name"] = itemName})
        end
    end
end

function GetAllItems()
    local loadFile = LoadResourceFile(GetCurrentResourceName(), "./data/data_items.json")
    local itemsData = json.decode(loadFile)
    for k,v in pairs(itemsData) do
        NTH.Items[v.name] = {
            label = v.label,
            weight = v.weight,
            prop = v.prop
        }
    end
end

RegisterNetEvent("nth:GetCharacterInventory")
AddEventHandler("nth:GetCharacterInventory", function(clientSide, src)
    if clientSide then
        src_ = source
    else
        src_ = src
    end
    NTH.PlayerList[src_].inventory = {}
    NTH.PlayerList[src_].inventoryId = MySQL.Sync.execute("SELECT id FROM containers WHERE type = @type AND of = @of", {["type"] = "character", ["of"] = NTH.PlayerList[src_].charId})
    MySQL.Async.execute("SELECT * FROM containers INNER JOIN items ON (containers.id = items.in) WHERE containers.of = @of AND containers.type = 'character' ", {
        ["of"] = NTH.PlayerList[src_].charId
    }, function(characterInventory)
        for _,item in pairs(characterInventory) do
            if GetItemExist(item.name) and GetItemStack(src_, item.name) then
                table.insert(NTH.PlayerList[src_].inventory, item)
            end
        end
        GetAllItems()
        TriggerClientEvent('nth:SendCharacterInventory', src_, NTH.PlayerList[src_].inventory, NTH.Items)
    end)
end)

function addItem(src, itemName, itemCount)
    for _,item in pairs(NTH.PlayerList[src].inventory) do
        if item.name == itemName then
            if NTH.Table.contains(NTH.PlayerList[src].inventory, itemName) then
                MySQL.Sync.execute("UPDATE items SET stack = @stack WHERE in = @in AND name = @name", {["in"] = NTH.PlayerList[src].inventoryId, ["name"] = itemName, ["stack"] = item.stack + itemCount})
            else
                MySQL.Sync.execute("INSERT INTO items (in, name, stack) VALUES (@in, @name, @stack)", {
                    ["in"] = NTH.PlayerList[src].inventoryId,
                    ["name"] = itemName,
                    ["stack"] = itemCount
                })
            end
            TriggerEvent('nth:GetCharacterInventory', false, src)
        end
    end
end

function removeItem(src, itemName, itemCount)
    for _,item in pairs(NTH.PlayerList[src].inventory) do
        if item.name == itemName and item.stack >= itemCount then
            if item.stack > itemCount then
                MySQL.Sync.execute("UPDATE items SET stack = @stack WHERE in = @in AND name = @name", {["in"] = NTH.PlayerList[src].inventoryId, ["name"] = itemName, ["stack"] = item.stack - itemCount})
            elseif item.stack == itemCount then
                MySQL.Sync.execute("DELETE FROM items WHERE in = @in AND name = @name", {["in"] = NTH.PlayerList[src].inventoryId, ["name"] = itemName})
            end
            TriggerEvent('nth:GetCharacterInventory', false, src)
        end
    end
end

function getItem(src, itemName)
    for _,item in pairs(NTH.PlayerList[src].inventory) do
        if item.name == itemName and item.stack > 0 then
            return item.stack
        end
    end
end