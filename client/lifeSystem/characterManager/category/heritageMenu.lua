function createHeritageMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'heritage'), function()
        RageUI.Window.Heritage(Config.MotherList.Index -1, Config.FatherList.Index -1)
        RageUI.List(GetLabelText("FACE_MUMS"), Config.MotherList.List, Config.MotherList.Index, GetLabelText("CHARC_H_30"), {}, true, {
            onListChange = function(Index, Item)
                Config.MotherList.Index = Index
                NTH.Character.face.parent.mom = Item.Value
            end
        })
        RageUI.List(GetLabelText("FACE_DADS"), Config.FatherList.List, Config.FatherList.Index, GetLabelText("CHARC_H_31"), {}, true, {
            onListChange = function(Index, Item)
                Config.FatherList.Index = Index
                NTH.Character.face.parent.dad = Item.Value
            end
        })
        RageUI.UISliderHeritage(GetLabelText("FACE_H_DOM"), NTH.Character.face.parent.resemblance, GetLabelText("CHARC_H_9"), {
            onSliderChange = function(Float, Index)
                NTH.Character.face.parent.resemblance = Index
            end
        })
        RageUI.UISliderHeritage(GetLabelText("FACE_H_STON"), NTH.Character.face.parent.skinMix, GetLabelText("FACE_HER_ST_H"), {
            onSliderChange = function(Float, Index)
                NTH.Character.face.parent.skinMix = Index
            end
        })
        UpdateEntityFace(PlayerPedId(), NTH.Character.face)
    end)
end