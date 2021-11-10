local menuIsActive = false

RegisterNetEvent("nth:SendCharacterInventory")
AddEventHandler("nth:SendCharacterInventory", function(characterInventory, itemsList)
    NTH.PlayerData.inventory = characterInventory
    NTH.ItemsList = itemsList
    print(json.encode(NTH.PlayerData.inventory, {indent=true}))
end)

function personalMenu()
    local mainPersonalMenu = RageUI.CreateMenu("", "Menu personnel")
    local backpackMenu = RageUI.CreateSubMenu(mainPersonalMenu, "", "Sac a dos")
    local objetMenu = RageUI.CreateSubMenu(backpackMenu, "", "Objets")

    mainPersonalMenu.Closed = function()
        menuIsActive = false
    end

    Citizen.CreateThread(function()
        while menuIsActive do
            Citizen.Wait(3)
            if RageUI.Visible(mainPersonalMenu) then
                RageUI.IsVisible(mainPersonalMenu, function()
                    RageUI.Button("Sac a dos", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, backpackMenu)
                end)
            elseif RageUI.Visible(backpackMenu) then
                RageUI.IsVisible(backpackMenu, function()
                    RageUI.Button("Objet/Arme", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, objetMenu)
                end)
            elseif RageUI.Visible(objetMenu) then
                RageUI.IsVisible(objetMenu, function()
                    for _,v in pairs(NTH.PlayerData.inventory) do
                        if v.stack > 0 then
                            RageUI.Button('~s~' ..NTH.ItemsList[v.name].label, nil, {RightLabel = '~g~' ..v.stack.." ~s~"..NTH.Emoticon.Droite}, true, {
                                onSelected = function()
                                    --PM.ItemSelected = NTH.PlayerData.inventory[i]
                                end
                            });
                        end
                    end
                end)
            end
        end
    end)
    RageUI.Visible(mainPersonalMenu, true)
end

Keys.Register('F5', 'F5', 'Menu personnel.', function()
    TriggerServerEvent('nth:GetCharacterInventory', true, nil)
    menuIsActive = true
    personalMenu()
end)