data:extend({
	{
		type = "double-setting",
		name = "hard-nauvis-locomotive-fuel-spend-multiplier",
		setting_type = "startup",
		default_value = 3,
		minimum_value = 0.0001,
		maximum_value = 10000,
		order = "b",
	},
	{
		type = "bool-setting",
		name = "hard-nauvis-half-mixed-ores",
		setting_type = "runtime-global",
		default_value = true,
		order = "c",
	},
	{
		type = "bool-setting",
		name = "hard-nauvis-fully-mixed-ores",
		setting_type = "runtime-global",
		default_value = false,
		order = "d",
	},
})
