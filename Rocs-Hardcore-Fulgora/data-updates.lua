local lib = require("lib")
local merge = lib.merge

local function replace_electromagnetic_science_pack_with_low_charge(technology)
	if technology and technology.unit and technology.unit.ingredients then
		local old_unit_ingredients = technology.unit.ingredients
		local new_unit_ingredients = {}
		for _, ingredient in ipairs(old_unit_ingredients) do
			if ingredient[1] == "electromagnetic-science-pack" then
				table.insert(new_unit_ingredients, { "low-charge-electromagnetic-science-pack", ingredient[2] })
			else
				table.insert(new_unit_ingredients, ingredient)
			end
		end
		technology.unit.ingredients = new_unit_ingredients
	end
end

local low_charge_pack = data.raw.item["low-charge-electromagnetic-science-pack"]
if low_charge_pack and data.raw.tool["electromagnetic-science-pack"] then
	data:extend({
		merge(low_charge_pack, {
			type = "tool",
			durability = data.raw.tool["electromagnetic-science-pack"].durability,
		}),
	})
	data.raw.item["low-charge-electromagnetic-science-pack"] = nil

	for _, lab in pairs(data.raw.lab) do
		local inputs = lab.inputs
		if inputs then
			for _, input in ipairs(inputs) do
				if input == "electromagnetic-science-pack" then
					table.insert(inputs, "low-charge-electromagnetic-science-pack")
					break
				end
			end
		end
	end

	replace_electromagnetic_science_pack_with_low_charge(data.raw.technology["lightning-rod"])

	if not settings.startup["rocs-hardcore-fulgora-cargo-drop-research-needs-space-science"].value then
		replace_electromagnetic_science_pack_with_low_charge(data.raw.technology["planetslib-fulgora-cargo-drops"])
	end
end

PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("fulgora", "construction-robot")

if settings.startup["rocs-hardcore-fulgora-lightning-rods-need-research"].value then
	local effects = data.raw.technology["planet-discovery-fulgora"].effects
	for i = #effects, 1, -1 do
		if effects[i].type == "unlock-recipe" and effects[i].recipe == "lightning-rod" then
			table.remove(effects, i)
		end
	end

	table.insert(data.raw.technology["lightning-collector"].prerequisites, "lightning-rod")

	table.insert(data.raw["simple-entity"]["fulgoran-ruin-stonehenge"].minable.results, {
		type = "item",
		name = "solar-panel",
		amount = 1,
	})

	table.insert(data.raw["simple-entity"]["fulgoran-ruin-big"].minable.results, {
		type = "item",
		name = "solar-panel",
		amount = 1,
	})

	table.insert(data.raw["simple-entity"]["fulgoran-ruin-huge"].minable.results, {
		type = "item",
		name = "solar-panel",
		amount = 3,
	})

	table.insert(data.raw["simple-entity"]["fulgoran-ruin-colossal"].minable.results, {
		type = "item",
		name = "solar-panel",
		amount = 8,
	})

	table.insert(data.raw["simple-entity"]["fulgoran-ruin-vault"].minable.results, {
		type = "item",
		name = "solar-panel",
		amount = 15,
	})

	-- Buff ice production, as we'll need it for power:
	local recipe = data.raw.recipe["scrap-recycling"]
	if recipe and recipe.results then
		for _, result in pairs(recipe.results) do
			if result.name == "ice" and result.probability then
				result.probability = result.probability * 1.4
			end
		end
	end
end

if settings.startup["rocs-hardcore-fulgora-make-ruin-attractors-generate-power"].value then
	data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].energy_source = {
		type = "electric",
		buffer_capacity = "20MJ",
		usage_priority = "primary-output",
		output_flow_limit = "100MJ",
		drain = "100kJ",
	}
	data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].efficiency = 0.01
end

if settings.startup["rocs-hardcore-fulgora-increase-oil-walking-speed"].value then
	-- Picking up bodies happens more often due to the lightning:
	data.raw.tile["oil-ocean-shallow"].walking_speed_modifier = 1
	data.raw.tile["oil-ocean-deep"].walking_speed_modifier = 0.8
end

if settings.startup["rocs-hardcore-fulgora-make-ruins-placeable"].value then
	-- Make Fulgoran ruin attractors placeable:
	data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].minable =
		{ mining_time = 0.1, result = "fulgoran-ruin-attractor" }
	data.raw["lightning-attractor"]["fulgoran-ruin-attractor"].subgroup = nil
end
