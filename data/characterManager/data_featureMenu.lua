data_featureMenu = {
    {Title = "FACE_F_BROW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][1].List, Index = data_featureList[NTH.Character.face.model][1].Index,
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
    {Title = "FACE_F_EYES", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][2].List, Index = data_featureList[NTH.Character.face.model][2].Index,
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
    {Title = "FACE_F_NOSE", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][3].List, Index = data_featureList[NTH.Character.face.model][3].Index,
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
    {Title = "FACE_F_NOSEP", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][4].List, Index = data_featureList[NTH.Character.face.model][4].Index,
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
    {Title = "FACE_F_NOSET", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][5].List, Index = data_featureList[NTH.Character.face.model][5].Index,
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
    {Title = "FACE_F_CHEEK", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][6].List, Index = data_featureList[NTH.Character.face.model][6].Index,
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
    {Title = "FACE_F_CHEEKS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][7].List, Index = data_featureList[NTH.Character.face.model][7].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.cheeks.boneWidth = 0.30
            elseif Index == 3 then
                NTH.Character.face.features.cheeks.boneWidth = 0.9
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
    {Title = "FACE_F_LIPS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][8].List, Index = data_featureList[NTH.Character.face.model][8].Index,
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
        text = {"Épaisses", "Minces"},
        panelFunction = function(X)
            NTH.Character.face.features.lips.thickness = X
        end
    },
    {Title = "FACE_F_JAW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][9].List, Index = data_featureList[NTH.Character.face.model][9].Index,
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
    {Title = "FACE_F_CHIN", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][10].List, Index = data_featureList[NTH.Character.face.model][10].Index,
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
    {Title = "FACE_F_CHINS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][11].List, Index = data_featureList[NTH.Character.face.model][11].Index,
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
