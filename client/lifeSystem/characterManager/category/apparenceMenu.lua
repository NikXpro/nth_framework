function createApparenceMenu()
    RageUI.IsVisible(RMenu:Get('characterManager', 'apparence'), function()
        RageUI.Button("r", nil, {RightLabel = ""}, true, {
            onSelected = function()
            end
        });
    end)
end