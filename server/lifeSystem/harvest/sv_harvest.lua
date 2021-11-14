function harvest(id)
    MySQL.Async.execute('UPDATE harvest SET stock = stock - 1 WHERE id = @id AND stock > 0', {["id"] = id}, function(harvestData)
        if harvestData.affectedRows == 1 then
            --Recolte reussi
        else
            --Recolte impossible le stock et vide
        end
    end)
end



function selectHarvest()
    MySQL.Async.execute('SELECT harvest.id, harvest.type, harvest.stock, positions.x, positions.y, positions.z FROM `harvest`, `positions` WHERE positions.type = "harvest" AND harvest.id = positions.of LIMIT 0, 300', {}, function(harvestData)
        if harvestData[1] then
           print(json.encode(harvestData, {indent=true})) 
        end
    end)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.Harvest.RemainingTime * 60000)
        local harvestData = MySQL.Sync.execute("UPDATE harvest SET stock = stock + 1 WHERE stock < @stock", {["stock"] = Config.Harvest.MaxStock})
        if harvestData.affectedRows > 0 then
            print("^2[DB]^3[HARVEST] ^5The stock of ^3"..harvestData.affectedRows.." ^5harvest points has been increased by ^31^5.^7")
        end
    end
end)