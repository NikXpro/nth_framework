
local menuIsActive = false

function bankMenu()
    local bankMenu = RageUI.CreateMenu("", "Banque menu")
    local connectMenu = RageUI.CreateSubMenu(bankMenu, "", "Connection au compte")
    local registerMenu = RageUI.CreateSubMenu(bankMenu, "", "Creation de compte")
    local clientMenu = RageUI.CreateSubMenu(bankMenu, "", "Compte client:")

    bankMenu.Closed = function()
        menuIsActive = false
    end
    RageUI.Visible(bankMenu, not RageUI.Visible(bankMenu))

    Citizen.CreateThread(function()
        while menuIsActive do
            Citizen.Wait(5)

            if RageUI.Visible(bankMenu) then
                RageUI.IsVisible(bankMenu, function()
                    RageUI.Button("Se connecter", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, connectMenu)
                    RageUI.Button("Devenir client", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, registerMenu)
                end)
            end

            if RageUI.Visible(connectMenu) then
                RageUI.IsVisible(connectMenu, function()
                    RageUI.Button("Numéraux de client", nil, {RightLabel = ""}, true, {onSelected = function()end})
                    RageUI.Button("Code de sécurité", nil, {RightLabel = ""}, true, {onSelected = function()end})
                    RageUI.Button(nil, nil, {CenterLabel = "Connexion"}, true, {onSelected = function()end})
                end)
            end

            if RageUI.Visible(registerMenu) then
                RageUI.IsVisible(registerMenu, function()
                    RageUI.Button("Nom", nil, {RightLabel = ""}, true, {onSelected = function()end})
                    RageUI.Button("Prénom", nil, {RightLabel = ""}, true, {onSelected = function()end})
                    RageUI.Button("Date de naissance", nil, {RightLabel = ""}, true, {onSelected = function()end})
                    RageUI.Button(nil, nil, {CenterLabel = "Créer"}, true, {onSelected = function()end})
                end)
            end

        end
    end)
end


Keys.Register('F6', 'F6', 'Menu banque.', function()
    menuIsActive = true
    bankMenu()
end)