function GetIfVehicleExist(plate)
    MySQL.Async.execute("SELECT * FROM vehicles", {}, function(vehicleList)
        for i = 1, #vehicleList do
            if plate == vehicleList[i].plate then
                return true
            end
        end
    end)
end