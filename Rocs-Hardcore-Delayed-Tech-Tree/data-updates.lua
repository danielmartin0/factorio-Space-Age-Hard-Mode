local util = require("util")
local lib = require("lib")
local find = lib.find

if settings.startup["rocs-hardcore-push-back-repair-pack"].value then
	if data.raw.technology["repair-pack"] then
		data.raw.technology["repair-pack"].prerequisites = {
			"logistic-science-pack",
		}
		data.raw.technology["repair-pack"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
		}
	end
end

if
	settings.startup["rocs-hardcore-push-back-logistic-system"].value
	and data.raw.technology["logistic-system"]
	and data.raw.technology["logistic-system"].effects
then
	data:extend({
		{
			type = "technology",
			name = "hardcore-active-provider-chests",
			effects = {
				{
					type = "unlock-recipe",
					recipe = "active-provider-chest",
				},
			},
			prerequisites = {
				"agricultural-science-pack",
			},
			icon = "__Rocs-Hardcore-Delayed-Tech-Tree__/graphics/technology/active-provider-chest.png",
			icon_size = 96,
			unit = {
				count = 1000,
				ingredients = {
					{ "automation-science-pack", 1 },
					{ "logistic-science-pack", 1 },
					{ "chemical-science-pack", 1 },
					{ "utility-science-pack", 1 },
					{ "space-science-pack", 1 },
					{ "agricultural-science-pack", 1 },
				},
				time = 60,
			},
		},
	})

	for i = #data.raw.technology["logistic-system"].effects, 1, -1 do
		local effect = data.raw.technology["logistic-system"].effects[i]
		if effect.type == "unlock-recipe" and effect.recipe == "active-provider-chest" then
			table.remove(data.raw.technology["logistic-system"].effects, i)
		end
	end

	data.raw.technology["logistic-system"].prerequisites = {
		"electromagnetic-science-pack",
		"metallurgic-science-pack",
		"agricultural-science-pack",
		"utility-science-pack",
	}
	data.raw.technology["logistic-system"].unit.count = 5000
	data.raw.technology["logistic-system"].unit.ingredients = {
		{ "automation-science-pack", 1 },
		{ "logistic-science-pack", 1 },
		{ "chemical-science-pack", 1 },
		{ "utility-science-pack", 1 },
		{ "space-science-pack", 1 },
		{ "agricultural-science-pack", 1 },
		{ "electromagnetic-science-pack", 1 },
		{ "metallurgic-science-pack", 1 },
	}

	-- Disabled moving tank logistics as it allows you to use tanks as blue chests:
	-- if data.raw.technology["logistic-robotics"] then
	-- 	local has_vehicle_logistics = false

	-- 	for i = #data.raw.technology["logistic-system"].effects, 1, -1 do
	-- 		local effect = data.raw.technology["logistic-system"].effects[i]
	-- 		if effect.type == "vehicle-logistics" and effect.modifier == true then
	-- 			has_vehicle_logistics = true
	-- 			table.remove(data.raw.technology["logistic-system"].effects, i)
	-- 		end
	-- 	end

	-- 	if has_vehicle_logistics then
	-- 		data.raw.technology["logistic-robotics"].effects = data.raw.technology["logistic-robotics"].effects or {}
	-- 		table.insert(data.raw.technology["logistic-robotics"].effects, {
	-- 			type = "vehicle-logistics",
	-- 			modifier = true,
	-- 		})
	-- 	end
	-- end
end

if settings.startup["rocs-hardcore-push-back-cliff-explosives"].value then
	if data.raw.technology["cliff-explosives"] then
		data.raw.technology["cliff-explosives"].prerequisites = {
			"metallurgic-science-pack",
			"explosives",
			"military-science-pack",
			"electromagnetic-science-pack",
			"agricultural-science-pack",
		}
		data.raw.technology["cliff-explosives"].unit.count = 2000
		data.raw.technology["cliff-explosives"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "metallurgic-science-pack", 1 },
			{ "electromagnetic-science-pack", 1 },
			{ "agricultural-science-pack", 1 },
		}
	end
end

if settings.startup["rocs-hardcore-push-back-kovarex-nuclear-fuel-and-atomic-bomb"].value then
	if data.raw.technology["kovarex-enrichment-process"] then
		data.raw.technology["kovarex-enrichment-process"].prerequisites = {
			"production-science-pack",
			"electromagnetic-science-pack",
			"agricultural-science-pack",
		}
		data.raw.technology["kovarex-enrichment-process"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "electromagnetic-science-pack", 1 },
			{ "agricultural-science-pack", 1 },
		}
		data.raw.technology["kovarex-enrichment-process"].unit.count = 2000
	end

	if data.raw.technology["atomic-bomb"] then
		data.raw.technology["atomic-bomb"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "military-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "production-science-pack", 1 },
			{ "utility-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "electromagnetic-science-pack", 1 },
			{ "agricultural-science-pack", 1 },
		}
	end
end

if settings.startup["rocs-hardcore-push-back-night-vision-equipment"].value then
	if data.raw.technology["night-vision-equipment"] then
		data.raw.technology["night-vision-equipment"].prerequisites = {
			"agricultural-science-pack",
		}
		data.raw.technology["night-vision-equipment"].unit.ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "space-science-pack", 1 },
			{ "agricultural-science-pack", 1 },
		}
	end
end
