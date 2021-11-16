data_featureMenu = {
    {Title = "FACE_F_BROW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][1].List, Index = data_featureList[NTH.Character.face.model][1].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.eyebrow.height = 0.5
                NTH.Index.features.eyebrow.height = 0.5
                NTH.Character.face.features.eyebrow.forward = 0.5
                NTH.Index.features.eyebrow.forward = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.eyebrow.height = 0.9
                NTH.Index.features.eyebrow.height = 0.9
                NTH.Character.face.features.eyebrow.forward = 0.6
                NTH.Index.features.eyebrow.forward = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.eyebrow.height = 0.30
                NTH.Index.features.eyebrow.height = 0.30
                NTH.Character.face.features.eyebrow.forward = 0.70
                NTH.Index.features.eyebrow.forward = 0.70
            end
        end,
        type = 1,
        coords = {
            {"eyebrow", "forward"},
            {"eyebrow", "height"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.eyebrow.forward = -(X)
            NTH.Character.face.features.eyebrow.height = Y
            NTH.Index.features.eyebrow.forward = IndexX
            NTH.Index.features.eyebrow.height = IndexY
        end
    },
    {Title = "FACE_F_EYES", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][2].List, Index = data_featureList[NTH.Character.face.model][2].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.eye.opening = 0.5
                NTH.Index.features.eye.opening = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.eye.opening = 0.30
                NTH.Index.features.eye.opening = 0.30
            elseif Index == 3 then
                NTH.Character.face.features.eye.opening = 0.9
                NTH.Index.features.eye.opening = 0.9
            end
        end,
        type = 2,
        coords = {
            {"eye", "opening"}
        },
        text = {"Ouverts", "Plissés"},
        panelFunction = function(X, IndexX)
            NTH.Character.face.features.eye.opening = X
            NTH.Index.features.eye.opening = IndexX
        end
    },
    {Title = "FACE_F_NOSE", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][3].List, Index = data_featureList[NTH.Character.face.model][3].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.width = 0.5
                NTH.Character.face.features.nose.peakHeight = 0.5
                NTH.Index.features.nose.width = 0.5
                NTH.Index.features.nose.peakHeight = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.width = 0.9
                NTH.Character.face.features.nose.peakHeight = 0.6
                NTH.Index.features.nose.width = 0.9
                NTH.Index.features.nose.peakHeight = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.width = 0.30
                NTH.Character.face.features.nose.peakHeight = 0.70
                NTH.Index.features.nose.width = 0.30
                NTH.Index.features.nose.peakHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "width"},
            {"nose", "peakHeight"}
        },
        text = {"Relevé", "Bas", "Fin", "Épais"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.nose.width = -(X)
            NTH.Character.face.features.nose.peakHeight = Y
            NTH.Index.features.nose.width = IndexX
            NTH.Index.features.nose.peakHeight = IndexY
        end
    },
    {Title = "FACE_F_NOSEP", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][4].List, Index = data_featureList[NTH.Character.face.model][4].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.peakLength = 0.5
                NTH.Character.face.features.nose.boneHeight = 0.5
                NTH.Index.features.nose.peakLength = 0.5
                NTH.Index.features.nose.boneHeight = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.peakLength = 0.9
                NTH.Character.face.features.nose.boneHeight = 0.6
                NTH.Index.features.nose.peakLength = 0.9
                NTH.Index.features.nose.boneHeight = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.peakLength = 0.30
                NTH.Character.face.features.nose.boneHeight = 0.70
                NTH.Index.features.nose.peakLength = 0.30
                NTH.Index.features.nose.boneHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "peakLength"},
            {"nose", "boneHeight"}
        },
        text = {GetLabelText("FACE_F_P1_0"), GetLabelText("FACE_F_P1_1"), GetLabelText("FACE_F_SHORT"), GetLabelText("FACE_F_LONG")},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.nose.peakLength = -(X)
            NTH.Character.face.features.nose.boneHeight = Y
            NTH.Index.features.nose.peakLength = IndexX
            NTH.Index.features.nose.boneHeight = IndexY
        end
    },
    {Title = "FACE_F_NOSET", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][5].List, Index = data_featureList[NTH.Character.face.model][5].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.nose.peakLowering = 0.5
                NTH.Character.face.features.nose.boneTwist = 0.5
                NTH.Index.features.nose.peakLowering = 0.5
                NTH.Index.features.nose.boneTwist = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.nose.peakLowering = 0.9
                NTH.Character.face.features.nose.boneTwist = 0.6
                NTH.Index.features.nose.peakLowering = 0.9
                NTH.Index.features.nose.boneTwist = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.nose.peakLowering = 0.30
                NTH.Character.face.features.nose.boneTwist = 0.70
                NTH.Index.features.nose.peakLowering = 0.30
                NTH.Index.features.nose.boneTwist = 0.70
            end
        end,
        type = 1,
        coords = {
            {"nose", "boneTwist"},
            {"nose", "peakLowering"}
        },
        text = {"Bout vers le haut", "Bout vers me nas", "Cassé gauche", "Cassé droite"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.nose.boneTwist = -(X)
            NTH.Character.face.features.nose.peakLowering = Y
            NTH.Index.features.nose.boneTwist = IndexX
            NTH.Index.features.nose.peakLowering = IndexY
        end
    },
    {Title = "FACE_F_CHEEK", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][6].List, Index = data_featureList[NTH.Character.face.model][6].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.cheeks.boneHeight = 0.5
                NTH.Character.face.features.cheeks.boneWidth = 0.5
                NTH.Index.features.cheeks.boneHeight = 0.5
                NTH.Index.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.cheeks.boneWidth = 0.9
                NTH.Character.face.features.cheeks.boneHeight = 0.6
                NTH.Index.features.cheeks.boneWidth = 0.9
                NTH.Index.features.cheeks.boneHeight = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.cheeks.boneWidth = 0.30
                NTH.Character.face.features.cheeks.boneHeight = 0.70
                NTH.Index.features.cheeks.boneWidth = 0.30
                NTH.Index.features.cheeks.boneHeight = 0.70
            end
        end,
        type = 1,
        coords = {
            {"cheeks", "boneWidth"},
            {"cheeks", "boneHeight"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.cheeks.boneWidth = -(X)
            NTH.Character.face.features.cheeks.boneHeight = Y
            NTH.Index.features.cheeks.boneWidth = IndexX
            NTH.Index.features.cheeks.boneHeight = IndexY
        end
    },
    {Title = "FACE_F_CHEEKS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][7].List, Index = data_featureList[NTH.Character.face.model][7].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.cheeks.boneWidth = 0.5
                NTH.Index.features.cheeks.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.cheeks.boneWidth = 0.30
                NTH.Index.features.cheeks.boneWidth = 0.30
            elseif Index == 3 then
                NTH.Character.face.features.cheeks.boneWidth = 0.9
                NTH.Index.features.cheeks.boneWidth = 0.9
            end
        end,
        type = 2,
        coords = {
            {"cheeks", "boneWidth"}
        },
        text = {"Émacié", "Bouffi"},
        panelFunction = function(X, IndexX)
            NTH.Character.face.features.cheeks.boneWidth = X
            NTH.Index.features.cheeks.boneWidth = IndexX
        end
    },
    {Title = "FACE_F_LIPS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][8].List, Index = data_featureList[NTH.Character.face.model][8].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.lips.thickness = 0.5
                NTH.Index.features.lips.thickness = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.lips.thickness = 0.9
                NTH.Index.features.lips.thickness = 0.9
            elseif Index == 3 then
                NTH.Character.face.features.lips.thickness = 0.30
                NTH.Index.features.lips.thickness = 0.30
            end
        end,
        type = 2,
        coords = {
            {"lips", "thickness"}
        },
        text = {"Épaisses", "Minces"},
        panelFunction = function(X, IndexX)
            NTH.Character.face.features.lips.thickness = X
            NTH.Index.features.lips.thickness = IndexX
        end
    },
    {Title = "FACE_F_JAW", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][9].List, Index = data_featureList[NTH.Character.face.model][9].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.jaw.boneBackLength = 0.5
                NTH.Character.face.features.jaw.boneWidth = 0.5
                NTH.Index.features.jaw.boneBackLength = 0.5
                NTH.Index.features.jaw.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.jaw.boneBackLength = 0.9
                NTH.Character.face.features.jaw.boneWidth = 0.6
                NTH.Index.features.jaw.boneBackLength = 0.9
                NTH.Index.features.jaw.boneWidth = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.jaw.boneBackLength = 0.30
                NTH.Character.face.features.jaw.boneWidth = 0.70
                NTH.Index.features.jaw.boneBackLength = 0.30
                NTH.Index.features.jaw.boneWidth = 0.70
            end
        end,
        type = 1,
        coords = {
            {"jaw", "boneBackLength"},
            {"jaw", "boneWidth"}
        },
        text = {"Ronde", "Carrée", "Étroite", "Large"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.jaw.boneBackLength = -(X)
            NTH.Character.face.features.jaw.boneWidth = Y
            NTH.Index.features.jaw.boneBackLength = IndexX
            NTH.Index.features.jaw.boneWidth = IndexY
        end
    },
    {Title = "FACE_F_CHIN", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][10].List, Index = data_featureList[NTH.Character.face.model][10].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.chimp.boneLength = 0.5
                NTH.Character.face.features.chimp.boneWidth = 0.5
                NTH.Index.features.chimp.boneLength = 0.5
                NTH.Index.features.chimp.boneWidth = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.chimp.boneWidth = 0.9
                NTH.Character.face.features.chimp.boneLength = 0.6
                NTH.Index.features.chimp.boneWidth = 0.9
                NTH.Index.features.chimp.boneLength = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.chimp.boneWidth = 0.30
                NTH.Character.face.features.chimp.boneLength = 0.70
                NTH.Index.features.chimp.boneWidth = 0.30
                NTH.Index.features.chimp.boneLength = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "boneWidth"},
            {"chimp", "boneLength"}
        },
        text = {"Haut", "Bas", "Intérieur", "Extérieur"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.chimp.boneWidth = X
            NTH.Character.face.features.chimp.boneLength = Y
            NTH.Index.features.chimp.boneWidth = IndexX
            NTH.Index.features.chimp.boneLength = IndexY
        end
    },
    {Title = "FACE_F_CHINS", SubTitle = "FACE_FEAT_H", DataList = data_featureList[NTH.Character.face.model][11].List, Index = data_featureList[NTH.Character.face.model][11].Index,
        listFunction = function(Index)
            if Index == 1 then
                NTH.Character.face.features.chimp.hole = 0.5
                NTH.Character.face.features.chimp.boneLowering = 0.5
                NTH.Index.features.chimp.hole = 0.5
                NTH.Index.features.chimp.boneLowering = 0.5
            elseif Index == 2 then
                NTH.Character.face.features.chimp.hole = 0.9
                NTH.Character.face.features.chimp.boneLowering = 0.6
                NTH.Index.features.chimp.hole = 0.9
                NTH.Index.features.chimp.boneLowering = 0.6
            elseif Index == 3 then
                NTH.Character.face.features.chimp.hole = 0.30
                NTH.Character.face.features.chimp.boneLowering = 0.70
                NTH.Index.features.chimp.hole = 0.30
                NTH.Index.features.chimp.boneLowering = 0.70
            end
        end,
        type = 1,
        coords = {
            {"chimp", "hole"},
            {"chimp", "boneLowering"}
        },
        text = {"Arrondi", "Fossette", "Carré", "Pointu"},
        panelFunction = function(X, Y, IndexX, IndexY)
            NTH.Character.face.features.chimp.hole = -(X)
            NTH.Character.face.features.chimp.boneLowering = Y
            NTH.Index.features.chimp.hole = IndexX
            NTH.Index.features.chimp.boneLowering = IndexY
        end

    },
}
