print("MK-Yoga v2.0 - Yoga Script by McKlean")

Config = {}

Config.Debug = false
Config.Stress = 10  -- Amount of strees relieved
Config.Health = 0   -- Amount of Health gained

---------- // Progressbar
Config.PbName = 'Finding the Zen'   -- What you want it to say on the Progressbar
Config.PbTime = 19000               -- Recommended if you dont want this to be abused (18500)

Config.Anim = "amb@world_human_yoga@female@base"    -- Yoga Animation
Config.Dict = "base_b"

---------- // Yoga Locations
-- Each name needs to be different, they can't be the same
Config.YogaLocations = {
    [1] = { -- front left
        name = "Town Hall - Yoga Class",
        blip = true,
        blipcolor = 69, -- (Green) 69 / https://docs.fivem.net/docs/game-references/blips/
        location = vector4(-488.87, -217.8, 35.58, 203.48),
        yogamat = 4062944218,   -- blue
    },
    [2] = { -- front right
        name = "Front Right",
        blip = false,
        blipcolor = 69,
        location = vector4(-491.09, -219.26, 35.52, 200.22),
        yogamat = 2057317573,   -- brown
    },
    [3] = { -- back
        name = "Back",
        blip = false,
        blipcolor = 69,
        location = vector4(-491.57, -216.18, 35.62, 200.53),
        yogamat = 2316225442,   -- red
    },
}