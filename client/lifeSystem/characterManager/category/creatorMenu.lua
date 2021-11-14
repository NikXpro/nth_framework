function createCreatorMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'creator'), function()
        RageUI.List(GetLabelText("FACE_SEX"), {GetLabelText("FACE_FEMALE"), GetLabelText("FACE_MALE")}, NTH.Character.sexe, GetLabelText("FACE_MM_H2"), {}, true, {
            onListChange = function(Index, Item)
                NTH.Character.sexe = Index
                if NTH.Character.sexe == 1 then
                    NTH.Character.face.model = "mp_f_freemode_01"
                elseif NTH.Character.sexe == 2 then
                    NTH.Character.face.model = "mp_m_freemode_01"
                end
                LoadCharacter(NTH.Character.face.model, NTH.Character.face)
            end
        })
        for i = 1, #data_creatorMenu do
            RageUI.Button(data_creatorMenu[i].Title, data_creatorMenu[i].SubTitle, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, RMenu:Get(data_creatorMenu[i].MenuCat, data_creatorMenu[i].MenuName)) 
        end
    end)
end