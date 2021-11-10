function heritageMenu()
    RageUI.IsVisible(heritageMenu, function()
        RageUI.Window.Heritage(characterCreator.mom, characterCreator.dad)
        RageUI.List('Pére', Config.FatherList, characterCreator.dad, nil, {}, true, {
            onListChange = function(Index, Item)
                characterCreator.dad = Index
                SetPedHeadBlendData(GetPlayerPed(-1), characterCreator.mom, characterCreator.dad, nil, characterCreator.mom, characterCreator.dad, nil, ShapeMixData, SkinMixData, nil, true)
            end
        })
        RageUI.List('Mére', Config.MotherList, characterCreator.mom, nil, {}, true, {
            onListChange = function(Index, Item)
                characterCreator.mom = Index
                SetPedHeadBlendData(GetPlayerPed(-1), characterCreator.mom, characterCreator.dad, nil, characterCreator.mom, characterCreator.dad, nil, ShapeMixData, SkinMixData, nil, true)
            end
        })
        RageUI.UISliderHeritage("Ressemblance", characterCreator.ressemblance, nil, {
            onSliderChange = function(Float, Index)
                characterCreator.ressemblance = Index
                ShapeMixData = Index / 10
                SetPedHeadBlendData(GetPlayerPed(-1), characterCreator.mom, characterCreator.dad, nil, characterCreator.mom, characterCreator.dad, nil, ShapeMixData, SkinMixData, nil, true)
            end
            
        })
        RageUI.UISliderHeritage("Teint", characterCreator.teint, nil, {
            onSliderChange = function(Float, Index)
                characterCreator.teint = Index
                SkinMixData = Index / 10
                SetPedHeadBlendData(GetPlayerPed(-1), characterCreator.mom, characterCreator.dad, nil, characterCreator.mom, characterCreator.dad, nil, ShapeMixData, SkinMixData, nil, true)
            end
        })
    end)
end