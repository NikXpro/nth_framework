
local featureList = {
    mp_f_freemode_01 = {
        {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        },
    },
    mp_m_freemode = {
        {
            List = { "Standard", "Protubérant", "Plat", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Ouverts", "Plissés", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Saillante", "Incurvée", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Cassé", "Vers le haut", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Larges", "Fines", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Grosses", "Minces", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Épaisses", "Minces", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Carrée", "Ronde", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Large", "Petit", "-" },
            Index = 1,
        },
        {
            List = { "Standard", "Pointu", "Rond", "-" },
            Index = 1,
        }
    }
}

local feature = {
    {Title = "FACE_F_BROW", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][1].List, Index = featureList[NTH.Character.model][1].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.eyebrow.height = 0.5
                NTH.Character.face.features.eyebrow.forward = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.eyebrow.height = 0.9
                NTH.Character.face.features.eyebrow.forward = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.eyebrow.height = 0.30
                NTH.Character.face.features.eyebrow.forward = 0.70
            end
        end,
        type = 1,
        coords = {
            {"eyebrow", "forward"},
            {"eyebrow", "height"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.eyebrow.forward = X
            NTH.Character.face.features.eyebrow.height = Y
        end
    },
    {Title = "FACE_F_EYES", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][2].List, Index = featureList[NTH.Character.model][2].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.eye.opening = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.eye.opening = 0.30
            elseif Index == 3 then
                NTH.Character.face.features.eye.opening = 0.9
            end
        end,
        type = 2,
        coords = {
            {"eye", "opening"}
        },
        text = {"Ouverts", "Plissés"},
        panelFunction = function(X)
            NTH.Character.face.features.eye.opening = X
        end
    },
    {Title = "FACE_F_NOSE", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][3].List, Index = featureList[NTH.Character.model][3].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.width = 0.5
                NTH.Character.face.features.nose.peakLowering = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.width = 0.9
                NTH.Character.face.features.nose.peakLowering = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.width = 0.30
                NTH.Character.face.features.nose.peakLowering = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "width"},
            {"nose", "peakLowering"}
        },
        text = {"Relevé", "Bas", "Fin", "Épais"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.nose.width = X
            NTH.Character.face.features.nose.peakLowering = Y
        end
    },
    {Title = "FACE_F_NOSEP", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][4].List, Index = featureList[NTH.Character.model][4].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.boneHeight = 0.5
                NTH.Character.face.features.nose.boneTwist = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.boneHeight = 0.9
                NTH.Character.face.features.nose.boneTwist = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.boneHeight = 0.30
                NTH.Character.face.features.nose.boneTwist = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "boneHeight"},
            {"nose", "boneTwist"}
        },
        text = {"Saillante", "Incurvée", "Courte", "Longue"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.nose.boneHeight = X
            NTH.Character.face.features.nose.boneTwist = Y
        end
    },
    {Title = "FACE_F_NOSET", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][5].List, Index = featureList[NTH.Character.model][5].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.peakHeight = 0.5
                NTH.Character.face.features.nose.peakLength = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.peakHeight = 0.9
                NTH.Character.face.features.nose.peakLength = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.peakHeight = 0.30
                NTH.Character.face.features.nose.peakLength = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "peakHeight"},
            {"nose", "peakLength"}
        },
        text = {"Bout vers le haut", "Bout vers me nas", "Cassé gauche", "Cassé droite"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.nose.peakHeight = X
            NTH.Character.face.features.nose.peakLength = Y
        end
    },
    {Title = "FACE_F_CHEEK", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][6].List, Index = featureList[NTH.Character.model][6].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.cheeks.boneHeight = 0.5
                NTH.Character.face.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.cheeks.boneHeight = 0.9
                NTH.Character.face.features.cheeks.boneWidth = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.cheeks.boneHeight = 0.30
                NTH.Character.face.features.cheeks.boneWidth = 0.70
            end
        end,
        type = 1,
        coords = {
            {"cheeks", "boneHeight"},
            {"cheeks", "boneWidth"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.cheeks.boneHeight = X
            NTH.Character.face.features.cheeks.boneWidth = Y
        end
    },
    {Title = "FACE_F_CHEEKS", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][7].List, Index = featureList[NTH.Character.model][7].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.cheeks.boneWidth = 0.9
            elseif Index == 3 then
                NTH.Character.face.features.cheeks.boneWidth = 0.30
            end
        end,
        type = 2,
        coords = {
            {"cheeks", "boneWidth"}
        },
        text = {"Émacié", "Bouffi"},
        panelFunction = function(X)
            NTH.Character.face.features.cheeks.boneWidth = X
        end
    },
    {Title = "FACE_F_LIPS", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][8].List, Index = featureList[NTH.Character.model][8].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.lips.thickness = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.lips.thickness = 0.9
            elseif Index == 3 then
                NTH.Character.face.features.lips.thickness = 0.30
            end
        end,
        type = 2,
        coords = {
            {"lips", "thickness"}
        },
        text = {"Minces", "Épaisses"},
        panelFunction = function(X)
            NTH.Character.face.features.lips.thickness = X
        end
    },
    {Title = "FACE_F_JAW", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][9].List, Index = featureList[NTH.Character.model][9].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.jaw.boneWidth = 0.5
                NTH.Character.face.features.jaw.boneBackLength = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.jaw.boneWidth = 0.9
                NTH.Character.face.features.jaw.boneBackLength = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.jaw.boneWidth = 0.30
                NTH.Character.face.features.jaw.boneBackLength = 0.70
            end
        end,
        type = 1,
        coords = {
            {"jaw", "boneWidth"},
            {"jaw", "boneBackLength"}
        },
        text = {"Ronde", "Carrée", "Étroite", "Large"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.jaw.boneWidth = X
            NTH.Character.face.features.jaw.boneBackLength = Y
        end
    },
    {Title = "FACE_F_CHIN", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][10].List, Index = featureList[NTH.Character.model][10].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.chimp.boneLength = 0.5
                NTH.Character.face.features.chimp.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.chimp.boneLength = 0.9
                NTH.Character.face.features.chimp.boneWidth = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.chimp.boneLength = 0.30
                NTH.Character.face.features.chimp.boneWidth = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "boneLength"},
            {"chimp", "boneWidth"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.chimp.boneLength = X
            NTH.Character.face.features.chimp.boneWidth = Y
        end
    },
    {Title = "FACE_F_CHINS", SubTitle = "FACE_FEAT_H", DataList = featureList[NTH.Character.model][11].List, Index = featureList[NTH.Character.model][11].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.chimp.hole = 0.5
                NTH.Character.face.features.chimp.boneLowering = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.chimp.hole = 0.9
                NTH.Character.face.features.chimp.boneLowering = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.chimp.hole = 0.30
                NTH.Character.face.features.chimp.boneLowering = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "hole"},
            {"chimp", "boneLowering"}
        },
        text = {"Arrondi", "Fossette", "Carré", "Pointu"},
        panelFunction = function(X, Y)
            NTH.Character.face.features.chimp.hole = X
            NTH.Character.face.features.chimp.boneLowering = Y
        end

    },
}

function createFeatureMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'feature'), function()
        for i = 1, #feature do
            RageUI.List(GetLabelText(feature[i].Title), feature[i].DataList, feature[i].Index, GetLabelText(feature[i].SubTitle), {}, true, {
                onListChange = function(Index, Item)
                    feature[i].Index = Index
                    feature[i].listFunction(Index)
                    UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                end
            })            
        end
    end, function()
        for i = 1, #feature do
            if feature[i].type == 1 then
                RageUI.Grid(NTH.Character.face.features[feature[i].coords[1][1]][feature[i].coords[1][2]], NTH.Character.face.features[feature[i].coords[2][1]][feature[i].coords[2][2]], feature[i].text[1], feature[i].text[2],feature[i].text[3], feature[i].text[4], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        feature[i].panelFunction(IndexX, IndexY)
                        UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                    end
                }, i)
            elseif feature[i].type == 2 then
                RageUI.GridHorizontal(NTH.Character.face.features[feature[i].coords[1][1]][feature[i].coords[1][2]], feature[i].text[1], feature[i].text[2], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        feature[i].panelFunction(IndexX)
                        UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                    end
                }, i)
            end
        end
    end)
end