-- TSS-Yoga by [TinySprite]("https://tinysprite.dev/")
Config = {
	Lan = "en",
	Debug = false,				-- set true to view target zones and debug prints

	-- Presentation providers used through tss_bridge ("auto" follows the tss_bridge config)
	TSS = {
		Target = "auto",		-- "auto", "ox", "qb", ...
		Notify = "auto",		-- "auto", "ox", "qb", "okok", "native", ...
		ProgressBar = "auto",	-- "auto", "ox", "qb", ...
	},

	Duration = 19000,			-- Yoga progress time in ms (set long by default to stop abuse)
	Animation = {
		dict = "amb@world_human_yoga@female@base",
		clip = "base_b",
		flag = 8,
		headingOffset = 90.0,	-- Degrees added to the mat heading so the pose lines up with the mat (try -90.0 / 180.0 if facing the wrong way)
	},

    Stress = 10,        -- Amount of stress relieved
    Health = 0,         -- Amount of Health gained
}
