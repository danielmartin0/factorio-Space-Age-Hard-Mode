local util = require("util")
local lib = require("lib")
local merge = lib.merge

if mods["VFG-Cargo-Drops-Require-Research"] then
	if data.raw.technology["lightning-collector"] then
		data:extend({
			merge(data.raw.technology["lightning-collector"], {
				name = "lightning-rod",
				prerequisites = { "electromagnetic-science-pack" },
				icon = "__Rocs-Hardcore-Fulgora__/graphics/technology/lightning-rod.png",
				icon_size = 352,
				effects = {
					{
						type = "unlock-recipe",
						recipe = "lightning-rod",
					},
				},
				unit = {
					count = 100,
					ingredients = {
						{ "automation-science-pack", 1 },
						{ "logistic-science-pack", 1 },
						{ "chemical-science-pack", 1 },
						{ "electromagnetic-science-pack", 1 },
					},
					time = 60,
				},
			}),
		})
	end

	local fulgoran_ruin_attractor = util.table.deepcopy(data.raw.item["lightning-rod"])
	fulgoran_ruin_attractor.name = "fulgoran-ruin-attractor"

	fulgoran_ruin_attractor.icon = "__space-age__/graphics/icons/fulgoran-ruin-attractor.png"
	fulgoran_ruin_attractor.icon_size = 64
	fulgoran_ruin_attractor.order = "0[fulgoran-ruin-attractor]"
	fulgoran_ruin_attractor.place_result = "fulgoran-ruin-attractor"

	data:extend({ fulgoran_ruin_attractor })

	data:extend({
		{
			type = "technology",
			name = "fulgoran-ruin-attractor-mining",
			localised_name = { "", { "entity-name.fulgoran-ruin-attractor" }, " ", { "rocs-hardcore-fulgora.mining" } },
			icon = "__Rocs-Hardcore-Fulgora__/graphics/technology/fulgoran-ruin-attractor-mining.png",
			icon_size = 256,
			prerequisites = { "planet-discovery-fulgora" },
			effects = {
				{
					type = "nothing",
					effect_description = { "effect-description.fulgoran-ruin-attractor-mining" },
				},
			},
			unit = {
				count = 10,
				ingredients = {
					{ "automation-science-pack", 1 },
				},
				time = 60,
			},
		},
	})

	if data.raw.technology["lightning-rod"] then
		data.raw.technology["lightning-rod"].prerequisites = { "fulgoran-ruin-attractor-mining" }
	end
end
