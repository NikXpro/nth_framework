NTH.PlayerData = {}
NTH.PlayerData.characterInfo = {
    charSelected = nil,
    charName = ""
}
NTH.PlayerData.charList = {}
NTH.PlayerData.permissions = nil


RegisterNetEvent('nth:sendCharacterList')
AddEventHandler('nth:sendCharacterList', function(charactersList, userPermission)
    NTH.PlayerData.charList = {}
    for k,v in pairs(charactersList) do
        if v.deleted == 0 then
            table.insert(NTH.PlayerData.charList, v)
        end
    end
    NTH.PlayerData.permissions = userPermission
    startCharacterScene()
end)

RegisterNetEvent('nth:characterSelected')
AddEventHandler('nth:characterSelected', function()
    local playerId = PlayerPedId()
    ClearPedTasksImmediately(playerId)
    ClearPedTasks(playerId)
    SetEntityInvincible(playerId, false)
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(false, false, 500, 1, 0)
    DestroyCam(cam)
    DisplayRadar(true)
    SetNuiFocus(false, false)
end)
local animList = {
    {type = "anim", lib = "anim@heists@heist_corona@single_team", anim = "single_team_loop_boss", flag = 1},
    {type = "anim", lib = "random@street_race", anim = "_car_b_lookout", flag = 1},
    {type = "anim", lib = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", flag = 1},
    {type = "anim", lib = "random@shop_gunstore", anim = "_idle", flag = 1}
}

local camPos = {
    ["body"] = {x = 0.17, y = 1.60, z = 0.550, rotx = -13.8, roty = 0.0, rotz = 270.0},
    ["body_face"] = {x = 0.17, y = 1.0, z = 0.610, rotx = -13.8, roty = 0.0, rotz = 270.0},
    ["face"] = {x = 0.0, y = 0.60, z = 0.650, rotx = -10.0, roty = 0.0, rotz = 270.0}
}


function startCharacterScene()
    local pId = PlayerPedId()
    DisplayRadar(false)
    SetEntityCoords(pId, 1158.6204833984, -3195.5803222656, -40.007972717285, false, false, false, true)
    SetEntityHeading(pId, 86.35992431640625)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(pId, camPos["body"].x, camPos["body"].y, camPos["body"].z))
    SetCamRot(cam, camPos["body"].rotx, camPos["body"].roty, camPos["body"].rotz)
    RenderScriptCams(true, false, 500, 1, 0)
    SetBlockingOfNonTemporaryEvents(pId, true)
    NTH.Play.RandomAnim(pId, animList)
    Wait(250)
    if IsInteriorReady(246785) then
        FreezeEntityPosition(pId, true)
        SetEntityInvincible(pId, true)
        SetCanAttackFriendly(pId, true, false)
        NetworkSetFriendlyFireOption(true)
        ClearPlayerWantedLevel(pId)
        SetMaxWantedLevel(0)
        characterManagerMenu()
    else
        startCharacterScene()
    end
end

function EditCam(data)
    local pId = PlayerPedId()
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(pId, data.x, data.y, data.z))
    SetCamRot(cam, data.rotx, data.roty, data.rotz)
end

local characterCreator = {
    firstname = "~m~James",
    pFirstname = nil,
    lastname = "~m~Oconor",
    pLastname = nil,
    birthdate = "~m~00/00/0000",
    pBirthdate = nil,
    size = "~m~1m80",
    pSize = nil,
    nationality = "~m~Américaine",
    pNationality = nil,
    sexe = {
        "mp_m_freemode_01",
        "mp_f_freemode_01"
    },
    dad = 1,
    mom = 1,
    ressemblance = 5,
    teint = 5,
    forehead = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    eyes = {index = 1, standard = 0.5, edited = 0.5},
    nose = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    noseBridge = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    noseTip = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    cheekbones = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    cheeks = {index = 1, standard = 0.5, edited = 0.5},
    lips = {index = 1, standard = 0.5, edited = 0.5},
    jaw = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    chin = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    chin2 = {index = 1, standardX = 0.5, standardY = 0.5, editedX = 0.5, editedY = 0.5},
    hair = 0
}

local ShapeMixData, SkinMixData = 0.5, 0.5

function hairCalculator()
    HairList = {}
    if Config.DefaultSexe == 1 then
        for i = 1, #Config.maleHair do
            table.insert(HairList, Config.maleHair[i].name)
        end
    else
    end
end

function characterManagerMenu()
    local characterManagerMenu = RageUI.CreateMenu("", "Gestion de personnage")
    local identityMenu = RageUI.CreateSubMenu(characterManagerMenu, "", "Enregistrement de l'identite")
    local creatorMenu = RageUI.CreateSubMenu(characterManagerMenu, "", "~b~Creation de personnage")
    local heritageMenu = RageUI.CreateSubMenu(creatorMenu, "", "~b~Heritage du personnage")
    local featursMenu = RageUI.CreateSubMenu(creatorMenu, "", "~b~Traits du visage")
    local apparenceMenu = RageUI.CreateSubMenu(creatorMenu, "", "~b~Apparence")
    local characterMenu = RageUI.CreateSubMenu(characterManagerMenu, "", "~b~Personnage")
    
    characterManagerMenu.Closable = false;
    identityMenu.Closable = false;

    heritageMenu.Closed = function()
        EditCam(camPos["body"])
    end

    featursMenu.Closed = function()
        EditCam(camPos["body"])
    end

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            DisableControlAction(0, 177, true)

                RageUI.IsVisible(characterManagerMenu, function()
                    for k,v in pairs(NTH.PlayerData.charList) do
                        RageUI.Button(v.lastname.." "..v.firstname, nil, {RightLabel = NTH.Emoticon.Droite}, true, {
                            onSelected = function()
                                NTH.PlayerData.characterInfo.charSelected = v.id 
                                NTH.PlayerData.characterInfo.charName = v.lastname.." "..v.firstname
                                characterMenu:SetPageCounter("~b~"..v.lastname.." "..v.firstname)
                                print(NTH.PlayerData.characterInfo.charName)
                            end
                        }, characterMenu)
                    end
                    if #NTH.PlayerData.charList < NTH.PlayerData.permissions.characterAutorized then
                        RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Plus}, true, { onSelected = function() end}, creatorMenu)
                    else
                        RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Cadena}, true, { onSelected = function() end})
                    end
                end)

                RageUI.IsVisible(characterMenu, function()
                    RageUI.Button("Prendre", nil, {RightLabel = NTH.Emoticon.Check}, true, {
                        onSelected = function()
                            TriggerServerEvent('nth:editCharacter', "select", NTH.PlayerData.characterInfo.charSelected)
                            RageUI.CloseAll()
                        end
                    })
                    RageUI.Button("Supprimer ", nil, {RightLabel = NTH.Emoticon.Poubelle}, true, {
                        onSelected = function() 
                            TriggerServerEvent('nth:editCharacter', "delete", NTH.PlayerData.characterInfo.charSelected) 
                        end
                    })
                end)

                RageUI.IsVisible(identityMenu, function()
                    RageUI.Button("Nom", nil, {RightLabel = characterCreator.lastname}, true, {
                        onSelected = function()
                            local lastname = KeyboardInput("Nom", "", 25)
                            if lastname == "" then
                                characterCreator.lastname = "~m~Oconor"
                            else
                                characterCreator.lastname = "~g~"..lastname
                                characterCreator.pLastname = lastname
                            end
                        end
                    })
                    RageUI.Button("Prénom", nil, {RightLabel = characterCreator.firstname}, true, {
                        onSelected = function() 
                            local firstname = KeyboardInput("Nom", "", 25)
                            if firstname == "" then
                                characterCreator.firstname = "~m~James"
                            else
                                characterCreator.firstname = "~g~"..firstname
                                characterCreator.pFirstname = firstname
                            end
                        end
                    })
                    RageUI.Button("Date de naissance", nil, {RightLabel = characterCreator.birthdate}, true, {
                        onSelected = function() 
                            local day = KeyboardInput("Jour", "", 2)
                            if day == "" then
                                NTH.Visual.ShowNotification("Vous devez spécifier un jour")
                            else
                                local month = KeyboardInput("Mois", "", 2)
                                if month == "" then
                                    NTH.Visual.ShowNotification("Vous devez spécifier un mois")
                                else
                                    local years = KeyboardInput("Années", "", 4)
                                    if years == "" then
                                        NTH.Visual.ShowNotification("Vous devez spécifier une années") 
                                    else
                                        characterCreator.birthdate = "~g~"..day.."/"..month.."/"..years
                                        characterCreator.pBirthdate = day.."/"..month.."/"..years
                                    end
                                end
                            end
                        end
                    })
                    RageUI.Button("Taille", nil, {RightLabel = characterCreator.size}, true, {
                        onSelected = function() 
                            local sizeM = KeyboardInput("Métre", "", 1)
                            if sizeM == "" then
                                NTH.Visual.ShowNotification("Vous devez spécifier une taille en métre")
                            else
                                local sizeCm = KeyboardInput("Centimétre", "", 2)
                                if sizeCm == "" then
                                    NTH.Visual.ShowNotification("Vous devez spécifier une années") 
                                else
                                    characterCreator.size = "~g~"..sizeM.."m"..sizeCm
                                    characterCreator.pSize = sizeM.."m"..sizeCm
                                end
                            end
                        end
                    })
                    RageUI.Button("Nationalité", nil, {RightLabel = characterCreator.nationality}, true, {
                        onSelected = function() 
                            local nationality = KeyboardInput("Nationalité", "", 25)
                            if nationality == "" then
                                NTH.Visual.ShowNotification("Vous devez spécifier une nationalité")
                            else
                                characterCreator.nationality = "~g~"..nationality
                                characterCreator.pNationality = nationality
                            end
                        end
                    })
                    RageUI.Button("Continuer", nil, {RightLabel = NTH.Emoticon.Droite, Color = { HightLightColor = { 0, 155, 0, 150 }, BackgroundColor = { 0, 155, 0, 150 } }}, true, {
                        onSelected = function()
                            --if characterCreator.firstname == "~m~James" or characterCreator.lastname == "~m~Oconor" or characterCreator.birthdate == "~m~00/00/0000" or characterCreator.size == "~m~1m80" or characterCreator.nationality == "~m~Américaine" then
                            --    NTH.Visual.ShowNotification("Vous devez remplir tout les champ") 
                            --else
                            --    TriggerServerEvent('nth:editCharacter', "create", characterCreator) 
                            --end
                            
                        end
                    }, creatorMenu)
                end)

                RageUI.IsVisible(creatorMenu, function()
                    RageUI.List('Sexe', {{Name = "Homme", Value = 1},{Name = "Femme", Value = 2}}, Config.DefaultSexe, nil, {}, true, {
                        onListChange = function(Index, Item)
                            Config.DefaultSexe = Index
                            LoadModel(GetHashKey(characterCreator.sexe[Config.DefaultSexe]))
                            SetPlayerModel(PlayerId(), GetHashKey(characterCreator.sexe[Config.DefaultSexe]))
                            SetPedDefaultComponentVariation(PlayerPedId())
                        end
                    })
                    RageUI.Button("Hérédité", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function() EditCam(camPos["body_face"]) end}, heritageMenu)
                    RageUI.Button("Traits du visage", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function() EditCam(camPos["face"]) featursMenu.EnableMouse = true end}, featursMenu)
                    RageUI.Button("Apparence", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function() EditCam(camPos["body_face"]) hairCalculator() end}, apparenceMenu)
                    RageUI.Button("Vêtements", nil, {RightLabel = NTH.Emoticon.Droite}, true, {onSelected = function() end})

                end)

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

                RageUI.IsVisible(featursMenu, function()
                    RageUI.List('Bas du front', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.forehead.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.forehead.index = Index
                            if characterCreator.forehead.index == 1 then
                                characterCreator.forehead.editedX = 0.5
                                characterCreator.forehead.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 6, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 7, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 6, characterCreator.forehead.standardX)
                                SetPedFaceFeature(PlayerPedId(), 7, characterCreator.forehead.standardY)
                                characterCreator.forehead.editedX = characterCreator.forehead.standardX
                                characterCreator.forehead.editedY = characterCreator.forehead.standardY
                            end
                        end
                    })
                    RageUI.List('Yeux', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.eyes.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.eyes.index = Index
                            if characterCreator.eyes.index == 1 then
                                characterCreator.eyes.edited = 0.5
                                SetPedFaceFeature(PlayerPedId(), 11, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 11, characterCreator.eyes.standard)
                                characterCreator.eyes.edited = characterCreator.eyes.standard
                            end
                        end
                    })
                    RageUI.List('Nez', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.nose.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.nose.index = Index
                            if characterCreator.nose.index == 1 then
                                characterCreator.nose.editedX = 0.5
                                characterCreator.nose.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 0, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 1, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 0, characterCreator.nose.standardX)
                                SetPedFaceFeature(PlayerPedId(), 1, characterCreator.nose.standardY)
                                characterCreator.nose.editedX = characterCreator.nose.standardX
                                characterCreator.nose.editedY = characterCreator.nose.standardY
                            end
                        end
                    })
                    RageUI.List('Arête du nez', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.noseBridge.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.noseBridge.index = Index
                            if characterCreator.noseBridge.index == 1 then
                                characterCreator.noseBridge.editedX = 0.5
                                characterCreator.noseBridge.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 2, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 3, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 2, characterCreator.noseBridge.standardX)
                                SetPedFaceFeature(PlayerPedId(), 3, characterCreator.noseBridge.standardY)
                                characterCreator.noseBridge.editedX = characterCreator.noseBridge.standardX
                                characterCreator.noseBridge.editedY = characterCreator.noseBridge.standardY
                            end
                        end
                    })
                    RageUI.List('Bout du nez', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.noseTip.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.noseTip.index = Index
                            if characterCreator.noseTip.index == 1 then
                                characterCreator.noseTip.editedX = 0.5
                                characterCreator.noseTip.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 4, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 5, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 4, characterCreator.noseTip.standardX)
                                SetPedFaceFeature(PlayerPedId(), 5, characterCreator.noseTip.standardY)
                                characterCreator.noseTip.editedX = characterCreator.noseTip.standardX
                                characterCreator.noseTip.editedY = characterCreator.noseTip.standardY
                            end
                        end
                    })
                    RageUI.List('Pommettes', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.cheekbones.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.cheekbones.index = Index
                            if characterCreator.cheekbones.index == 1 then
                                characterCreator.cheekbones.editedX = 0.5
                                characterCreator.cheekbones.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 8, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 9, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 8, characterCreator.cheekbones.standardX)
                                SetPedFaceFeature(PlayerPedId(), 9, characterCreator.cheekbones.standardY)
                                characterCreator.cheekbones.editedX = characterCreator.cheekbones.standardX
                                characterCreator.cheekbones.editedY = characterCreator.cheekbones.standardY
                            end
                        end
                    })
                    RageUI.List('Joues', {{Name = "Standard", Value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.cheeks.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.cheeks.index = Index
                            if characterCreator.cheeks.index == 1 then
                                characterCreator.cheeks.edited = 0.5
                                SetPedFaceFeature(PlayerPedId(), 12, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 12, characterCreator.cheeks.standard)
                                characterCreator.cheeks.edited = characterCreator.cheeks.standard
                            end
                        end
                    })
                    RageUI.List('Lèvres', {{Name = "Standard", value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.lips.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.lips.index = Index
                            
                            if characterCreator.lips.index == 1 then
                                characterCreator.lips.edited = 0.5
                                SetPedFaceFeature(PlayerPedId(), 12, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 12, characterCreator.lips.standard)
                                characterCreator.lips.edited = characterCreator.lips.standard
                            end
                        end
                    })
                    RageUI.List('Mâchoire', {{Name = "Standard", value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.jaw.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.jaw.index = Index
                            if characterCreator.jaw.index == 1 then
                                characterCreator.jaw.editedX = 0.5
                                characterCreator.jaw.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 13, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 14, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 13, characterCreator.jaw.standardX)
                                SetPedFaceFeature(PlayerPedId(), 14, characterCreator.jaw.standardY)
                                characterCreator.jaw.editedX = characterCreator.jaw.standardX
                                characterCreator.jaw.editedY = characterCreator.jaw.standardY
                            end
                        end
                    })
                    RageUI.List('Profil menton', {{Name = "Standard", value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.chin.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.chin.index = Index
                            if characterCreator.chin.index == 1 then
                                characterCreator.chin.editedX = 0.5
                                characterCreator.chin.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 15, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 16, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 15, characterCreator.chin.standardX)
                                SetPedFaceFeature(PlayerPedId(), 16, characterCreator.chin.standardY)
                                characterCreator.chin.editedX = characterCreator.chin.standardX
                                characterCreator.chin.editedY = characterCreator.chin.standardY
                            end
                        end
                    })
                    RageUI.List('Forme du menton', {{Name = "Standard", value = 1}, {Name = "Personnalisé(e)", Value = 2}}, characterCreator.chin2.index, nil, {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.chin2.index = Index
                            if characterCreator.chin2.index == 1 then
                                characterCreator.chin2.editedX = 0.5
                                characterCreator.chin2.editedY = 0.5
                                SetPedFaceFeature(PlayerPedId(), 17, 0.5)
                                SetPedFaceFeature(PlayerPedId(), 18, 0.5)
                            else
                                SetPedFaceFeature(PlayerPedId(), 17, characterCreator.chin2.standardX)
                                SetPedFaceFeature(PlayerPedId(), 18, characterCreator.chin2.standardY)
                                characterCreator.chin2.editedX = characterCreator.chin2.standardX
                                characterCreator.chin2.editedY = characterCreator.chin2.standardY
                            end
                        end
                    })
                end, function()
                    RageUI.Grid(characterCreator.forehead.editedX, characterCreator.forehead.editedY, "Haut", "Bas", "Intérieur", "Extérieur", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.forehead.standardX = IndexX
                            characterCreator.forehead.editedX = IndexX
                            characterCreator.forehead.standardY = IndexY
                            characterCreator.forehead.editedY = IndexY
                            if characterCreator.forehead.editedX ~= 0.5 or characterCreator.forehead.editedY ~= 0.5 then
                                characterCreator.forehead.index = 2
                            else
                                characterCreator.forehead.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 6, characterCreator.forehead.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 7, characterCreator.forehead.editedY)
                        end
                    }, 1)
                    RageUI.GridHorizontal(characterCreator.eyes.edited, 'Plissés', 'Ouverts', {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.eyes.standard = IndexX
                            characterCreator.eyes.edited = IndexX
                            if characterCreator.eyes.edited ~= 0.5 then
                                characterCreator.eyes.index = 2
                            else
                                characterCreator.eyes.index = 1
                            end
		        	        SetPedFaceFeature(PlayerPedId(), 11, characterCreator.eyes.edited)
                        end
                    }, 2)
                    RageUI.Grid(characterCreator.nose.editedX, characterCreator.nose.editedY, "Relevé", "Bas", "Fin", "Épais", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.nose.standardX = IndexX
                            characterCreator.nose.editedX = IndexX
                            characterCreator.nose.standardY = IndexY
                            characterCreator.nose.editedY = IndexY
                            if characterCreator.nose.editedX ~= 0.5 or characterCreator.nose.editedY ~= 0.5 then
                                characterCreator.nose.index = 2
                            else
                                characterCreator.nose.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 0, characterCreator.nose.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 1, characterCreator.nose.editedY)
                        end
                    }, 3)
                    RageUI.Grid(characterCreator.noseBridge.editedX, characterCreator.noseBridge.editedY, "Saillante", "Incurvée", "Courte", "Longue", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.noseBridge.standardX = IndexX
                            characterCreator.noseBridge.editedX = IndexX
                            characterCreator.noseBridge.standardY = IndexY
                            characterCreator.noseBridge.editedY = IndexY
                            if characterCreator.noseBridge.editedX ~= 0.5 or characterCreator.noseBridge.editedY ~= 0.5 then
                                characterCreator.noseBridge.index = 2
                            else
                                characterCreator.noseBridge.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 2, characterCreator.noseBridge.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 3, characterCreator.noseBridge.editedY)
                        end
                    }, 4)
                    RageUI.Grid(characterCreator.noseTip.editedX, characterCreator.noseTip.editedY, "Bout vers le haut", "Bout vers le bas", "Cassé gauche", "Cassé droite", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.noseTip.standardX = IndexX
                            characterCreator.noseTip.editedX = IndexX
                            characterCreator.noseTip.standardY = IndexY
                            characterCreator.noseTip.editedY = IndexY
                            if characterCreator.noseTip.editedX ~= 0.5 or characterCreator.noseTip.editedY ~= 0.5 then
                                characterCreator.noseTip.index = 2
                            else
                                characterCreator.noseTip.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 4, characterCreator.noseTip.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 5, characterCreator.noseTip.editedY)
                        end
                    }, 5)
                    RageUI.Grid(characterCreator.cheekbones.editedX, characterCreator.cheekbones.editedY, "Haut", "Bas", "Intérieur", "Extérieur", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.cheekbones.standardX = IndexX
                            characterCreator.cheekbones.editedX = IndexX
                            characterCreator.cheekbones.standardY = IndexY
                            characterCreator.cheekbones.editedY = IndexY
                            if characterCreator.cheekbones.editedX ~= 0.5 or characterCreator.cheekbones.editedY ~= 0.5 then
                                characterCreator.cheekbones.index = 2
                            else
                                characterCreator.cheekbones.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 8, characterCreator.cheekbones.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 9, characterCreator.cheekbones.editedY)
                        end
                    }, 6)
                    RageUI.GridHorizontal(characterCreator.cheeks.edited, 'Émacié', 'Bouffi', {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.cheeks.standard = IndexX
                            characterCreator.cheeks.edited = IndexX
                            if characterCreator.cheeks.edited ~= 0.5 then
                                characterCreator.cheeks.index = 2
                            else
                                characterCreator.cheeks.index = 1
                            end
		        	        SetPedFaceFeature(PlayerPedId(), 10, characterCreator.cheeks.edited)
                        end
                    }, 7)
                    RageUI.GridHorizontal(characterCreator.lips.edited, 'Minces', 'Épaisses', {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.lips.standard = IndexX
                            characterCreator.lips.edited = IndexX
                            if characterCreator.lips.edited ~= 0.5 then
                                characterCreator.lips.index = 2
                            else
                                characterCreator.lips.index = 1
                            end
		        	        SetPedFaceFeature(PlayerPedId(), 12, characterCreator.lips.edited)
                            print(characterCreator.lips.standard)
                        end
                    }, 8)
                    RageUI.Grid(characterCreator.jaw.editedX, characterCreator.jaw.editedY, "Haut", "Bas", "Intérieur", "Extérieur", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.jaw.standardX = IndexX
                            characterCreator.jaw.editedX = IndexX
                            characterCreator.jaw.standardY = IndexY
                            characterCreator.jaw.editedY = IndexY
                            if characterCreator.jaw.editedX ~= 0.5 or characterCreator.jaw.editedY ~= 0.5 then
                                characterCreator.jaw.index = 2
                            else
                                characterCreator.jaw.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 13, characterCreator.jaw.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 14, characterCreator.jaw.editedY)
                        end
                    }, 9)
                    RageUI.Grid(characterCreator.chin.editedX, characterCreator.chin.editedY, "Haut", "Bas", "Intérieur", "Extérieur", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.chin.standardX = IndexX
                            characterCreator.chin.editedX = IndexX
                            characterCreator.chin.standardY = IndexY
                            characterCreator.chin.editedY = IndexY
                            if characterCreator.chin.editedX ~= 0.5 or characterCreator.chin.editedY ~= 0.5 then
                                characterCreator.chin.index = 2
                            else
                                characterCreator.chin.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 15, characterCreator.chin.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 16, characterCreator.chin.editedY)
                        end
                    }, 10)
                    RageUI.Grid(characterCreator.chin2.editedX, characterCreator.chin2.editedY, "Haut", "Bas", "Intérieur", "Extérieur", {
                        onPositionChange = function(IndexX, IndexY, X, Y)
                            characterCreator.chin2.standardX = IndexX
                            characterCreator.chin2.editedX = IndexX
                            characterCreator.chin2.standardY = IndexY
                            characterCreator.chin2.editedY = IndexY
                            if characterCreator.chin2.editedX ~= 0.5 or characterCreator.chin2.editedY ~= 0.5 then
                                characterCreator.chin2.index = 2
                            else
                                characterCreator.chin2.index = 1
                            end
                            SetPedFaceFeature(PlayerPedId(), 17, characterCreator.chin2.editedX)
		        	        SetPedFaceFeature(PlayerPedId(), 18, characterCreator.chin2.editedY)
                        end
                    }, 11)
                end)
                RageUI.IsVisible(apparenceMenu, function()
                    RageUI.List(GetLabelText("FACE_HAIR"), HairList , characterCreator.hair, GetLabelText("FACE_APP_H"), {}, true, {
                        onListChange = function(Index, Item)
                            characterCreator.hair = Index
                        end
                    })
                end)
        end
    end)
    --if not NTH.Table.empty(NTH.PlayerData.charList) then
        RageUI.Visible(characterManagerMenu, true)
    --else
    --    RageUI.Visible(identityMenu, true)
    --    identityMenu.Closable = false;
    --end
    
end