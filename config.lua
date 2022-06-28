print("8Bit-Yoga - Yoga Script by McKlean")

Config = {}

Config.Debug = true

Config.Locations = { ["main"] = { label = "Yoga", coords = vector3(-494.15, -212.3, 36.7), } }  -- Name and Location of the Blip

Config.Stress = 10  -- Amount of strees relieved
Config.Progressbar = 18500  -- Recommended if you dont want this to be abused
Config.Anim = "amb@world_human_yoga@female@base"
Config.Dict = "base_b"

Config.Yoga = {
    { location = vector3(-488.89, -217.9, 36.64), 	heading = 30,	width = 1.9, height = 0.9, minZ=35.44, maxZ=36.04, distance = 2.1, yoga = vector3(-488.87, -217.83, 36.6) },
    { location = vector3(-491.04, -219.21, 36.54), 	heading = 30,	width = 1.9, height = 0.9, minZ=35.44, maxZ=36.04, distance = 2.1, yoga = vector3(-491.04, -219.21, 36.6) },
    { location = vector3(-491.59, -216.27, 36.66), 	heading = 30,	width = 1.9, height = 0.9, minZ=35.44, maxZ=36.04, distance = 2.1, yoga = vector3(-491.59, -216.27, 36.6) },
}

Config.YogaLocations = {
    [1] = { name = "Matt1", location = vector4(-603.5, 277.86, 80.98, 227.23), blipTrue = false, Sprite = 642, Scale = 0.5, Colour = 2,},
}