local inZone = false
RegisterNetEvent("testZone")
AddEventHandler("testZone", function()
    zoneTest()
end)

function zoneTest()
    inZone = not inZone
    print(inZone)
    Citizen.CreateThread(function()
        while inZone do
            Citizen.Wait(1)
            NTH.Visual.ShowHelpNotification("Dans la zone")
        end
    end)
end
