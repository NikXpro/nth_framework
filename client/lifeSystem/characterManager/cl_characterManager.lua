NTH.PlayerData = {}

RegisterNetEvent('nth:sendCharacterList')
AddEventHandler('nth:sendCharacterList', function(charactersList, userPermissions, first)
    NTH.PlayerData.charList = charactersList
    NTH.PlayerData.permissions = userPermissions
    if first then
        startCharacterScene()
    end
end)

RegisterNetEvent('nth:characterSelected')
AddEventHandler('nth:characterSelected', function(data)
    local playerId = PlayerPedId()
    ClearPedTasksImmediately(playerId)
    ClearPedTasks(playerId)
    SetEntityInvincible(playerId, false)
    FreezeEntityPosition(PlayerPedId(), false)
    RenderScriptCams(false, false, 500, 1, 0)
    DestroyCam(cam)
    DisplayRadar(true)
    print(data.model)
    LoadCharacter(data.model, data)
end)

function loadIpl(iplName, iplId, propsList)
    RequestIpl(iplName)
    PinInteriorInMemory(iplId)
    RefreshInterior(iplId)
    for i = 1, #propsList, 1 do
        ActivateInteriorEntitySet(iplId, propsList[i])
    end
end

local sceneProps = {"chair01","chair02","chair03","chair04","chair05","chair06","chair07","equipment_upgrade","interior_upgrade","production","security_high","set_up"}

function startCharacterScene()
    DisplayRadar(false)
    RequestCollisionAtCoord(1158.6204833984, -3195.5803222656, -40.007972717285)
    SetEntityCoordsNoOffset(PlayerPedId(), 1158.6204833984, -3195.5803222656, -40.007972717285, false, false, false, true)
    NetworkResurrectLocalPlayer(1158.6204833984, -3195.5803222656, -40.007972717285, 86.35992431640625, true, true, false)
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), Config.camPos["body"].x, Config.camPos["body"].y, Config.camPos["body"].z))
    SetCamRot(cam, Config.camPos["body"].rotx, Config.camPos["body"].roty, Config.camPos["body"].rotz)
    RenderScriptCams(true, false, 500, 1, 0)
    if #NTH.PlayerData.charList > 0 then
        LoadCharacter(NTH.PlayerData.charList[1].appearance.model, NTH.PlayerData.charList[1].appearance)
    else
        LoadCharacter(NTH.Character.face.model, NTH.Character.face)
    end
    SetBlockingOfNonTemporaryEvents(PlayerPedId(), true)
    NTH.Play.RandomAnim(PlayerPedId(), Config.cmAnimList)
    loadIpl("bkr_biker_interior_placement_interior_6_biker_dlc_int_ware05_milo", 246785, sceneProps)
    Wait(250)
    if IsInteriorReady(246785) then
        FreezeEntityPosition(PlayerPedId(), true)
        SetEntityInvincible(PlayerPedId(), true)
        SetCanAttackFriendly(PlayerPedId(), true, false)
        NetworkSetFriendlyFireOption(true)
        ClearPlayerWantedLevel(PlayerPedId())
        SetMaxWantedLevel(0)
        characterManagerMenu()
    else
        startCharacterScene()
    end
end

NTH.Character = {sexe = 1,identity = {["lastname"] = "",["firstname"] = "",["nationality"] = "",["dob"] = "",["pob"] = "",["sexe"] = "Homme",["height"] = ""},face = {model = "mp_f_freemode_01",parent = {mom = 1,dad = 1,resemblance = 5,skinMix = 5},features = {["eyebrow"] = {["height"] = 0.5, ["forward"] = 0.5},["eye"] = {["opening"] = 0.5},["nose"] = {["width"] = 0.5,["peakHeight"] = 0.5,["peakLength"] = 0.5,["peakLowering"] = 0.5,["boneHeight"] = 0.5,["boneTwist"] = 0.5},["cheeks"] = {["boneHeight"] = 0.5, ["boneWidth"] = 0.5},["lips"] = {["thickness"] = 0.5},["jaw"] = {["boneWidth"] = 0.5, ["boneBackLength"] = 0.5},["chimp"] = {["hole"] = 0.5, ["boneLength"] = 0.5, ["boneWidth"] = 0.5, ["boneLowering"] = 0.5}},apparence = {["hair"] = {["style"] = -1,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["beard"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["eyebrows"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1,["ColorSecondary"] = 1,["MinSecondary"] = 1},["blemishes"] = {["style"] = -1,["opacity"] = 1.0},["ageing"] = {["style"] = -1,["opacity"] = 1.0},["complexion"] = {["style"] = -1,["opacity"] = 1.0},["freckles"] = {["style"] = -1,["opacity"] = 1.0},["sundamage"] = {["style"] = -1,["opacity"] = 1.0},["eye"] = {["style"] = -1},["eyemackeup"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1},["lipstick"] = {["style"] = -1,["opacity"] = 1.0,["ColorPrimary"] = 1,["MinPrimary"] = 1}}}}

local characterManagerIsActif = false
function characterManagerMenu()

    RMenu.Add('characterManager', 'home', RageUI.CreateMenu("", "~b~Gestion personnage"))
    RMenu:Get('characterManager', 'home').Closable = false
    RMenu.Add('characterManager', 'character', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'home'), "", "~b~Personnage"))
    RMenu.Add('characterManager', 'creator', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'home'), "", "~b~Creation de personnage"))
    RMenu.Add('characterManager', 'heritage', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Hérédité"))
    RMenu.Add('characterManager', 'feature', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Feature"))
    RMenu.Add('characterManager', 'apparence', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Apparence"))
    RMenu.Add('characterManager', 'cloth', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Vétements"))
    RMenu.Add('characterManager', 'identity', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'creator'), "", "~b~Identité"))
    RMenu.Add('characterManager', 'nationality', RageUI.CreateSubMenu(RMenu:Get('characterManager', 'identity'), "", "~b~Nationalité"))
    RMenu:Get('characterManager', 'feature').EnableMouse = true
    RMenu:Get('characterManager', 'apparence').EnableMouse = true

    RMenu:Get('characterManager', 'character').Closed = function(close)
        if close then
            characterManagerIsActif = false
        end
    end
    RMenu:Get('characterManager', 'home').onIndexChange = function(Index)
        for i = 1, #NTH.PlayerData.charList do
            if i == Index then
                LoadCharacter(NTH.PlayerData.charList[i].appearance.model, NTH.PlayerData.charList[i].appearance)
                local pedId = PlayerPedId()
                NTH.Play.RandomAnim(pedId, Config.cmAnimList)
                FreezeEntityPosition(pedId, true)
                SetEntityInvincible(pedId, true)
                SetCanAttackFriendly(pedId, true, false)
                NetworkSetFriendlyFireOption(true)
                SetBlockingOfNonTemporaryEvents(pedId, true)
            end
        end
    end
    RageUI.Visible(RMenu:Get('characterManager', 'home'), not RageUI.Visible(RMenu:Get('characterManager', 'home')))
    characterManagerIsActif = true
    while characterManagerIsActif do
        Citizen.Wait(0)
        if RageUI.Visible(RMenu:Get('characterManager', 'home')) then
            RageUI.IsVisible(RMenu:Get('characterManager', 'home'), function()
                if #NTH.PlayerData.charList == 0 then
                    RageUI.Separator("~r~Vous n'avez aucun personnage !")
                else
                    for k,v in pairs(NTH.PlayerData.charList) do
                        RageUI.Button(v.lastname.." "..v.firstname, nil, {RightLabel = NTH.Emoticon.Droite}, true, {
                            onActivated = function()
                                print(k)
                            end,
                            onSelected = function()
                                NTH.PlayerData.charSelected = v.id
                                NTH.PlayerData.charName = v.lastname.." "..v.firstname
                                RMenu:Get('characterManager', 'character'):SetPageCounter("~b~"..NTH.PlayerData.charName)
                            end
                        }, RMenu:Get('characterManager', 'character'))
                    end
                end
                if #NTH.PlayerData.charList < NTH.PlayerData.permissions.characterAutorized then
                    RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Plus}, true, { onSelected = function() LoadCharacter(NTH.Character.face.model, NTH.Character.face) end}, RMenu:Get('characterManager', 'creator'))
                else
                    RageUI.Button("Nouveau personnage", nil, {RightLabel = NTH.Emoticon.Cadena}, true, { onSelected = function() end})
                end
            end)
        end

        if RageUI.Visible(RMenu:Get('characterManager', 'character')) then
            createCharacterMenu()
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

        if RageUI.Visible(RMenu:Get('characterManager', 'identity')) then
            createIdentityMenu()
        end
        
        if RageUI.Visible(RMenu:Get('characterManager', 'nationality')) then
            createNationalityMenu()
        end
    end
end