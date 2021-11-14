function createCharacterMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'character'), function()
        RageUI.Button("Prendre", nil, {RightLabel = NTH.Emoticon.Check}, true, {
            onSelected = function()
                TriggerServerEvent('nth:editCharacter', "select", NTH.PlayerData.charSelected)
                RMenu:Get('characterManager', 'home').Closable = true
                RageUI.CloseAll(true)
            end
        })
        RageUI.Button("Supprimer ", nil, {RightLabel = NTH.Emoticon.Poubelle}, true, {
            onSelected = function()
                TriggerServerEvent('nth:editCharacter', "delete", NTH.PlayerData.charSelected)
                RageUI.GoBack()
            end
        })
    end)
end