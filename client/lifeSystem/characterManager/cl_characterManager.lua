NTH.PlayerData = {}
NTH.PlayerData.charList = {}

RegisterNetEvent('nth:sendCharacterList')
AddEventHandler('nth:sendCharacterList', function(charactersList, userPermission)
    NTH.PlayerData.charList = {}
    for k,v in pairs(charactersList) do
        if v.deleted == 0 then
            table.insert(NTH.PlayerData.charList, v)
        end
    end
    NTH.PlayerData.permissions = userPermission
    RageUI.Visible(RMenu:Get('characterManager', 'home'), true)
end)

NTH.Character = {
    sexe = 1,
    model = "mp_f_freemode_01",
    face = {
        parent = {
            mom = 1,
            dad = 1,
            resemblance = 5,
            skinMix = 5
        },
        features = {
            ["eyebrow"] = {["height"] = 0.5, ["forward"] = 0.5},
            ["eye"] = {["opening"] = 0.5},
            ["nose"] = {["width"] = 0.5,["peakHeight"] = 0.5,["peakLength"] = 0.5,["peakLowering"] = 0.5,["boneHeight"] = 0.5,["boneTwist"] = 0.5},
            ["cheeks"] = {["boneHeight"] = 0.5, ["boneWidth"] = 0.5},
            ["lips"] = {["thickness"] = 0.5},
            ["jaw"] = {["boneWidth"] = 0.5, ["boneBackLength"] = 0.5},
            ["chimp"] = {["hole"] = 0.5, ["boneLength"] = 0.5, ["boneWidth"] = 0.5, ["boneLowering"] = 0.5}
        }
    }

}


RMenu.Add('characterManager', 'home', RageUI.CreateMenu("", "~b~Gestion personnage"))
RMenu:Get('characterManager', 'home').Closable = false

RMenu.Add('characterManager', 'character', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'home'), "", "~b~Personnage"))

RMenu.Add('characterManager', 'creator', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'home'), "", "~b~Creation de personnage"))

RMenu.Add('characterManager', 'heritage', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Hérédité"))
RMenu.Add('characterManager', 'feature', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Feature"))
RMenu.Add('characterManager', 'apparence', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Apparence"))
RMenu.Add('characterManager', 'cloth', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Vétements"))
RMenu:Get('characterManager', 'feature').EnableMouse = true
RMenu:Get('characterManager', 'apparence').EnableMouse = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if RageUI.Visible(RMenu:Get('characterManager', 'home')) then
            RageUI.IsVisible(RMenu:Get('characterManager', 'home'), function()
                for k,v in pairs(NTH.PlayerData.charList) do
                    RageUI.Button(v.lastname.." "..v.firstname, nil, {RightLabel = NTH.Emoticon.Droite}, true, {
                        onSelected = function()
                            NTH.PlayerData.characterInfo.charSelected = v.id 
                            NTH.PlayerData.characterInfo.charName = v.lastname.." "..v.firstname
                            characterMenu:SetPageCounter("~b~"..v.lastname.." "..v.firstname)
                            print(NTH.PlayerData.characterInfo.charName)
                        end
                    }, RMenu:Get('characterManager', 'character'))
                end
                if #NTH.PlayerData.charList < NTH.PlayerData.permissions.characterAutorized then
                    RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Plus}, true, { onSelected = function() end}, RMenu:Get('characterManager', 'creator'))
                else
                    RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Cadena}, true, { onSelected = function() end})
                end
            end)
        end

        if RageUI.Visible(RMenu:Get('characterManager', 'creator')) then
            createCreatorMenu()
        end

        if RageUI.Visible(RMenu:Get('characterManager', 'heritage')) then
            createHeritageMenu()
        end

        if RageUI.Visible(RMenu:Get('characterManager', 'feature')) then
            createFeatureMenu()
        end

        if RageUI.Visible(RMenu:Get('characterManager', 'apparence')) then
            createApparenceMenu()
        end
            
        createVetementMenu()
    end
end)