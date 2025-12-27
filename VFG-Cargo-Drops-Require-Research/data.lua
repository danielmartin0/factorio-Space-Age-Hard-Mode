local util = require("util")

if settings.startup["VFG-Cargo-Drops-Require-Research-Vulcanus"].value then
	local vulcanus_cargo_tech =
		PlanetsLib.cargo_drops_technology_base("vulcanus", "__space-age__/graphics/technology/vulcanus.png", 256)
	vulcanus_cargo_tech.prerequisites = { "metallurgic-science-pack" }
	vulcanus_cargo_tech.unit = {
		count = 1000,
		time = 60,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "metallurgic-science-pack", 1 },
		},
	}
	if settings.startup["VFG-Cargo-Drops-Require-Research-Vulcanus-Space-Science"].value then
		table.insert(vulcanus_cargo_tech.unit.ingredients, { "space-science-pack", 1 })
	end

	data:extend({ vulcanus_cargo_tech })
end

if settings.startup["VFG-Cargo-Drops-Require-Research-Fulgora"].value then
	local fulgora_cargo_tech =
		PlanetsLib.cargo_drops_technology_base("fulgora", "__space-age__/graphics/technology/fulgora.png", 256)
	fulgora_cargo_tech.prerequisites = { "electromagnetic-science-pack" }
	fulgora_cargo_tech.unit = {
		count = 1000,
		time = 60,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "electromagnetic-science-pack", 1 },
		},
	}
	if settings.startup["VFG-Cargo-Drops-Require-Research-Fulgora-Space-Science"].value then
		table.insert(fulgora_cargo_tech.unit.ingredients, { "space-science-pack", 1 })
	end

	data:extend({ fulgora_cargo_tech })
end

if settings.startup["VFG-Cargo-Drops-Require-Research-Gleba"].value then
	local gleba_cargo_tech =
		PlanetsLib.cargo_drops_technology_base("gleba", "__space-age__/graphics/technology/gleba.png", 256)
	gleba_cargo_tech.prerequisites = { "agricultural-science-pack" }
	gleba_cargo_tech.unit = {
		count = 1000,
		time = 60,
		ingredients = {
			{ "automation-science-pack", 1 },
			{ "logistic-science-pack", 1 },
			{ "chemical-science-pack", 1 },
			{ "agricultural-science-pack", 1 },
		},
	}
	if settings.startup["VFG-Cargo-Drops-Require-Research-Gleba-Space-Science"].value then
		table.insert(gleba_cargo_tech.unit.ingredients, { "space-science-pack", 1 })
	end

	data:extend({ gleba_cargo_tech })
end
