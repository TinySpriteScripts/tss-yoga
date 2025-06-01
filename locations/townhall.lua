Locations = Locations or {}

Locations["TownHall"] = {
    ZoneEnable = true,
    Yoga = {
        {
            coords = vector4(-488.87, -217.8, 35.58, 203.48), l= 0.9, w = 1.9, -- vec4(x,y,z,heading)
            icon = "fas fa-print", 
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                model = "prop_yoga_mat_01", -- https://forge.plebmasters.de/objects/prop_yoga_mat_01?search=prop_yoga_mat_01
            },
            blip = {    -- https://docs.fivem.net/docs/game-references/blips/
                label = Loc[Config.Lan].blip["yogablip"],
                sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            },
        }, {
            coords = vector4(-491.09, -219.26, 35.52, 200.22), l= 0.9, w = 1.9,
            icon = "fas fa-print", 
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                model = "prop_yoga_mat_02",
            },
            -- blip = {
            --     label = Loc[Config.Lan].blip["yogablip"],
            --     sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            -- },
        }, {
            coords = vector4(-491.57, -216.18, 35.62, 200.53), l= 0.9, w = 1.9,
            icon = "fas fa-print", 
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                model = "prop_yoga_mat_03",
            },
            -- blip = {
            --     label = Loc[Config.Lan].blip["yogablip"],
            --     sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            -- },
        },
    },
}