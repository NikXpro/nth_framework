LEEDS.VehicleLock = {}

RegisterNetEvent("leeds:setVehicleDoorEveryone")
AddEventHandler("leeds:setVehicleDoorEveryone", function(veh, lockStatus)
    LEEDS.VehicleLock[veh] = lockStatus
    TriggerClientEvent('leeds:setVehicleDoors', -1, veh, LEEDS.VehicleLock)
end)