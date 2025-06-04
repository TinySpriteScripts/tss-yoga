Locations = Locations or {}

Locations["TownHall"] = {
    ZoneEnable = true,
    Blip = {    -- https://docs.fivem.net/docs/game-references/blips/
        coords = vec3(-488.87, -217.8, 35.58),
        label = Loc[Config.Lan].blip["yogablip"],
        sprite = 197,
        display = 4,
        blipcolor = 69,
        scale = 0.5,
    },
    Yoga = {
        {
            coords = vec4(-488.87, -217.8, 35.58, 203.48), l= 0.9, w = 1.9,  -- vec4(x,y,z,heading)
            icon = "fas fa-dumbbell",
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                { model = "prop_yoga_mat_01", coords = vec4(-488.87, -217.8, 35.58, 203.48) }, -- https://forge.plebmasters.de/objects/prop_yoga_mat_01?search=prop_yoga_mat_01
            },
        }, {
            coords = vec4(-491.09, -219.26, 35.52, 200.22), l= 0.9, w = 1.9,
            icon = "fas fa-dumbbell",
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                { model = "prop_yoga_mat_02", coords = vec4(-491.09, -219.26, 35.52, 200.22) },
            },
        }, {
            coords = vec4(-491.57, -216.18, 35.62, 200.53), l= 0.9, w = 1.9,
            icon = "fas fa-dumbbell",
            label = Loc[Config.Lan].target["yoga"],
            prop = {
                { model = "prop_yoga_mat_03", coords = vec4(-491.57, -216.18, 35.62, 200.53) },
            },
        },
    },
}