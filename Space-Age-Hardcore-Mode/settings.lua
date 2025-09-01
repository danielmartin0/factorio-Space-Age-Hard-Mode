data:extend({
	{
		type = "bool-setting",
		name = "rocs-hardcore-disable-lighted-electric-poles",
		setting_type = "startup",
		default_value = false,
	},
	{
		type = "bool-setting",
		name = "rocs-hardcore-a-enable-info-gui",
		setting_type = "runtime-per-user",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "rocs-hardcore-expensive-utility-science",
		setting_type = "startup",
		default_value = true,
	},
	{
		type = "bool-setting",
		name = "rocs-hardcore-landmines-disabled",
		setting_type = "runtime-global",
		default_value = false,
	},
	{
		type = "double-setting",
		name = "rocs-hardcore-bonus-shotgun-damage-percent",
		setting_type = "startup",
		default_value = 40,
		minimum_value = 0,
		maximum_value = 10000,
	},
})
