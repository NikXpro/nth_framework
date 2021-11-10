fx_version 'cerulean'
game 'gta5'
author 'NikX#1717'

client_scripts {
    "@RageUI/RMenu.lua",
    "@RageUI/menu/RageUI.lua",
    "@RageUI/menu/Menu.lua",
    "@RageUI/menu/MenuController.lua",
    
    "@RageUI/components/Audio.lua",
    "@RageUI/components/Enum.lua",
    "@RageUI/components/Keys.lua",
    "@RageUI/components/Rectangle.lua",
    "@RageUI/components/Sprite.lua",
    "@RageUI/components/Text.lua",
    "@RageUI/components/Visual.lua",

    "@RageUI/menu/elements/ItemsBadge.lua",
    "@RageUI/menu/elements/ItemsColour.lua",
    "@RageUI/menu/elements/PanelColour.lua",

    "@RageUI/menu/items/UIButton.lua",
    "@RageUI/menu/items/UICheckBox.lua",
    "@RageUI/menu/items/UIList.lua",
    "@RageUI/menu/items/UISeparator.lua",
    "@RageUI/menu/items/UISlider.lua",
    "@RageUI/menu/items/UISliderHeritage.lua",
    "@RageUI/menu/items/UISliderProgress.lua",
    
    "@RageUI/menu/panels/UIColourPanel.lua",
    "@RageUI/menu/panels/UIGridPanel.lua",
    "@RageUI/menu/panels/UISliderPanel.lua",
    "@RageUI/menu/panels/UIPercentagePanel.lua",
    "@RageUI/menu/panels/UIStatisticsPanel.lua",
    
    "@RageUI/menu/windows/UIHeritage.lua",
}

client_scripts {
    'client/utils/_function.lua',
    'client/utils/anim.lua',
    'client/utils/table.lua',
    'client/utils/visual.lua',
    'client/utils/keys.lua',
    'client/utils/other.lua',

    'Config.lua',

    'client/main.lua',
    'client/lifeSystem/characterManager/_function.lua',
    'client/lifeSystem/characterManager/cl_characterManager.lua',
    'client/lifeSystem/characterManager/category/*.lua',
    'client/lifeSystem/inventory/cl_inventory.lua',
}

server_scripts {
    'server/utils/mysql.js',
    'server/utils/mysql.lua',

    'server/main.lua',
    'server/lifeSystem/characterManager/sv_characterManager.lua',
    'server/lifeSystem/inventory/sv_inventory.lua',
}