LEEDS.VehicleLockData = {}

function randomChance(percent)
    assert(percent >= 0 and percent <= 100)
    return percent >= math.random(1, 100)
end

Citizen.CreateThread(function()
    local playerId = PlayerId()
    local pedId = PlayerPedId()
    while true do
        Citizen.Wait(500)
        local veh = GetVehiclePedIsTryingToEnter(pedId)

        if veh ~= nil and DoesEntityExist(veh) then
            if LEEDS.VehicleLockData[veh] == nil then
                if not (GetVehicleClass(veh) == 8 or GetVehicleClass(veh) == 13) then
                    local lockStatus = GetVehicleDoorLockStatus(veh)
                    local ped = GetPedInVehicleSeat(veh, -1)
                    if lockStatus == 7 or lockStatus == 1 then
                        --local doorRotation = GetVehicleDoorAngleRatio(vehicle, door)
                        if randomChance(20) then
                            SetVehicleDoorsLocked(veh, 1)
                            TriggerServerEvent('leeds:setVehicleDoorEveryone', veh, 1)
                            print("Le véhicule et déverouiller !")                  
                        else
                            SetVehicleDoorsLocked(veh, 2)
                            TriggerServerEvent('leeds:setVehicleDoorEveryone', veh, 2)
                            print("Le véhicule et verouiller !")                
                        end

                    end               
                end
            else
                print("le vehicule et deja enregistrer !")
            end            
        end
    end
end)

RegisterNetEvent("leeds:setVehicleDoors")
AddEventHandler("leeds:setVehicleDoors", function(veh, vehicleLockList)
    SetVehicleDoorsLocked(veh, vehicleLockList[veh])
    LEEDS.VehicleLockData = vehicleLockList
end)