local HeritageMom = { "Adelyn", "Emily", "Abigail", "Beverly", "Kristen", "Hailey", "June", "Daisy", "Elizabeth", "Addison", "Ava", "Cameron", "Samantha", "Madison", "Amber", "Heather", "Hillary", "Courtney", "Ashley", "Alyssa", "Mia", "Brittany" }
local HeritageDad = { "Benjamin", "Daniel", "Joshua", "Noah", "Andrew", "Juan", "Alex", "Isaac", "Evan", "Ethan", "Vincent", "Angel", "Diego", "Adrian", "Gabriel", "Michael", "Santiago", "Kevin", "Louis", "Samuel", "Anthony", "Pierre", "Niko" }


function createHeritageMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'heritage'), function()
        RageUI.Window.Heritage(NTH.Character.face.parent.mom, NTH.Character.face.parent.dad)
        RageUI.List(GetLabelText("FACE_DADS"), HeritageDad, NTH.Character.face.parent.dad, GetLabelText("CHARC_H_30"), {}, true, {
            onListChange = function(Index, Item)
                NTH.Character.face.parent.dad = Index
            end
        })
        RageUI.List(GetLabelText("FACE_MUMS"), HeritageMom, NTH.Character.face.parent.mom, GetLabelText("CHARC_H_31"), {}, true, {
            onListChange = function(Index, Item)
                NTH.Character.face.parent.mom = Index
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