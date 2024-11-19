Locations = Locations or {}

Locations["TownHall"] = {
    ZoneEnable = true,
    Job = nil,
    Gang = nil,
    Yoga = {
        {
            Coords = vector4(-488.87, -217.8, 35.58, 203.48), -- vec4(x,y,z,heading)
            Size = vec3(1.8, 0.8, 1.5), -- vec3(length,width,height)
            Icon = "fas fa-print", Label = Loc[Config.Lan].target["yoga"],
            Prop = {
                Model = "prop_yoga_mat_01",
                Coords = vector4(-488.87, -217.8, 35.58, 203.48),
            },
            Blip = {
                label = Loc[Config.Lan].blip["yogablip"],
                sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            },
        }, {
            Coords = vector4(-491.09, -219.26, 35.52, 200.22), -- vec4(x,y,z,heading)
            Size = vec3(1.8, 0.8, 1.5), -- vec3(length,width,height)
            Icon = "fas fa-print", Label = Loc[Config.Lan].target["yoga"],
            Prop = {
                Model = "prop_yoga_mat_02",
                Coords = vector4(-491.09, -219.26, 35.52, 200.22),
            },
            Blip = {
                label = Loc[Config.Lan].blip["yogablip"],
                sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            },
        }, {
            Coords = vector4(-491.57, -216.18, 35.62, 200.53), -- vec4(x,y,z,heading)
            Size = vec3(1.8, 0.8, 1.5), -- vec3(length,width,height)
            Icon = "fas fa-print", Label = Loc[Config.Lan].target["yoga"],
            Prop = {
                Model = "prop_yoga_mat_03",
                Coords = vector4(-491.57, -216.18, 35.62, 200.53),
            },
            Blip = {
                label = Loc[Config.Lan].blip["yogablip"],
                sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            },
        },
    },
}