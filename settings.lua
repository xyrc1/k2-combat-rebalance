data:extend({
    --- :)
    {
        type = 'bool-setting',
        name = 'xy-rebalance-pistol',
        setting_type = 'startup',
        default_value = true,

        order = 'buff-aaa',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-poison-capsule',
        setting_type = 'startup',
        default_value = true,

        order = 'buff-aab',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-shotgun',
        setting_type = 'startup',
        default_value = true,
        hidden = true,

        order = 'rebal-aac',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-equipment-solar',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-aad',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-spidertron',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-aae',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-combatbot',
        setting_type = 'startup',
        default_value = false,

        order = 'buff-zaa',
    },

    --- :|
    
    {
        type = 'bool-setting',
        name = 'xy-rebalance-rifle',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-baa',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-flamethrower-turret-1',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-bab',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-antimat',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-bac',
    },

    --- :(

    {
        type = 'bool-setting',
        name = 'xy-rebalance-grenade',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-caa',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-tank',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-cab',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-impulse',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-cac',
    },
    {
        type = 'bool-setting',
        name = 'xy-rebalance-nuke',
        setting_type = 'startup',
        default_value = true,

        order = 'rebal-cad',
    },
   
   
})

if mods['Krastorio2-spaced-out'] then
    data:extend({
        {
            type = 'bool-setting',
            name = 'xy-rebalance-flamethrower-turret-2',
            setting_type = 'startup',
            default_value = true,
            hidden = true,

            order = 'sa-aa',
        },
        {
            type = 'bool-setting',
            name = 'xy-rebalance-kr-rocket-turret',
            setting_type = 'startup',
            default_value = false,
            hidden = true,

            order = 'sa-ab',
        },
        {
            type = 'bool-setting',
            name = 'xy-rebalance-teslagun',
            setting_type = 'startup',
            default_value = true,

            order = 'sa-ac',
        },
    })
end