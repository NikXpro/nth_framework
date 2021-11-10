local creatorMenu = {
    {Title = "FACE_HERI", SubTitle = "FACE_MM_H3", MenuCat = "characterManager", MenuName = "heritage"},
    {Title = "FACE_FEAT", SubTitle = "FACE_MM_H4", MenuCat = "characterManager", MenuName = "feature"},
    {Title = "FACE_APP", SubTitle = "FACE_MM_H6", MenuCat = "characterManager", MenuName = "apparence"},
    {Title = "FACE_APPA", SubTitle = "FACE_MM_H7", MenuCat = "characterManager", MenuName = "cloth"},

}

function createCreatorMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'creator'), function()
        RageUI.List(GetLabelText("FACE_SEX"), {GetLabelText("FACE_FEMALE"), GetLabelText("FACE_MALE")}, NTH.Character.sexe, GetLabelText("FACE_MM_H2"), {}, true, {
            onListChange = function(Index, Item)
                NTH.Character.sexe = Index
                if NTH.Character.sexe == 1 then
                    NTH.Character.model = "mp_f_freemode_01"
                elseif NTH.Character.sexe == 2 then
                    NTH.Character.model = "mp_m_freemode_01"
                end
                updateFreemodeCharacter(PlayerPedId(), NTH.Character.model, nil, nil, nil)
            end
        })
        for i = 1, #creatorMenu do
            RageUI.Button(GetLabelText(creatorMenu[i].Title), GetLabelText(creatorMenu[i].SubTitle), {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function()end}, RMenu:Get(creatorMenu[i].MenuCat, creatorMenu[i].MenuName)) 
        end
    end)
end