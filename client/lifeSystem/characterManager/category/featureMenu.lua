function createFeatureMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'feature'), function()
        for i = 1, #data_featureMenu do
            RageUI.List(GetLabelText(data_featureMenu[i].Title), data_featureMenu[i].DataList, data_featureMenu[i].Index, GetLabelText(data_featureMenu[i].SubTitle), {}, true, {
                onListChange = function(Index, Item)
                    data_featureMenu[i].Index = Index
                    data_featureMenu[i].listFunction(Index)
                    UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                end
            })            
        end
    end, function()
        for i = 1, #data_featureMenu do
            if data_featureMenu[i].type == 1 then
                RageUI.Grid(NTH.Character.face.features[data_featureMenu[i].coords[1][1]][data_featureMenu[i].coords[1][2]], NTH.Character.face.features[data_featureMenu[i].coords[2][1]][data_featureMenu[i].coords[2][2]], data_featureMenu[i].text[1], data_featureMenu[i].text[2],data_featureMenu[i].text[3], data_featureMenu[i].text[4], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        data_featureMenu[i].panelFunction(IndexX, IndexY)
                        UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                        if IndexX == 0.5 and IndexY == 0.5 then
                            data_featureMenu[i].Index = 1
                        elseif IndexX == 0.9 and IndexY == 0.6 then
                            data_featureMenu[i].Index = 2
                        elseif IndexX == 0.30 and IndexY == 0.70 then
                            data_featureMenu[i].Index = 3
                        else
                            data_featureMenu[i].Index = 4
                        end
                    end
                }, i)
            elseif data_featureMenu[i].type == 2 then
                RageUI.GridHorizontal(NTH.Character.face.features[data_featureMenu[i].coords[1][1]][data_featureMenu[i].coords[1][2]], data_featureMenu[i].text[1], data_featureMenu[i].text[2], {
                    onPositionChange = function(IndexX, IndexY, X, Y)
                        data_featureMenu[i].panelFunction(IndexX)
                        UpdateEntityFace(PlayerPedId(), NTH.Character.face)
                        if IndexX == 0.5 then
                            data_featureMenu[i].Index = 1
                        elseif IndexX == 0.30 then
                            data_featureMenu[i].Index = 2
                        elseif IndexX == 0.9  then
                            data_featureMenu[i].Index = 3
                        else
                            data_featureMenu[i].Index = 4
                        end
                    end
                }, i)
            end
        end
    end)
end