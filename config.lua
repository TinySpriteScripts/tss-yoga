-- MK-Yoga by [McKleans-Scripts](https://mckleans-scripts.tebex.io/) | [Discord](https://discord.gg/DEWp9TP7p6) | [BuyMeACoffee](https://www.buymeacoffee.com/mcklean)
local QBCore = exports['qb-core']:GetCoreObject()
Config = {

    Debug = false,
    Stress = 10,    -- Amount of strees relieved
    Health = 0,     -- Amount of Health gained
    Notify = "qb",  -- "qb" | "okok" | "rz"

    ---------- // Progressbar
    PbName = 'Finding the Zen',  -- What you want it to say on the Progressbar
    PbTime = 19000,               -- Recommended if you dont want this to be abused (19000)

    Anim = "amb@world_human_yoga@female@base",    -- Yoga Animation
    Dict = "base_b",

    ---------- // Yoga Locations
    -- Each name needs to be different, they can't be the same
    YogaLocations = {
        [1] = { -- front left
            name = Lang:t('location.label1'),
            blip = true, sprite = 197, display = 4, blipcolor = 69, scale = 0.5, -- (Green) 69 / https://docs.fivem.net/docs/game-references/blips/
            location = vector4(-488.87, -217.8, 35.58, 203.48),
            yogamat = 4062944218,   -- blue
        },
        [2] = { -- front right
            name = Lang:t('location.label2'),
            blip = false, sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            location = vector4(-491.09, -219.26, 35.52, 200.22),
            yogamat = 2057317573,   -- brown
        },
        [3] = { -- back
            name = Lang:t('location.label3'),
            blip = false, sprite = 197, display = 4, blipcolor = 69, scale = 0.5,
            location = vector4(-491.57, -216.18, 35.62, 200.53),
            yogamat = 2316225442,   -- red
        },
    },
}
