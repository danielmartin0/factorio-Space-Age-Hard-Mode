if settings.startup["probabilistic-farming-jellynut-processing"].value and data.raw.recipe["jellynut-processing"] then
	data.raw.recipe["jellynut-processing"].results = {
		{ type = "item", name = "jellynut-seed", amount = 1, probability = 0.02 },
		{ type = "item", name = "jelly", amount_min = 1, amount_max = 7 }, -- from 4
	}
end

if settings.startup["probabilistic-farming-yumako-processing"].value and data.raw.recipe["yumako-processing"] then
	data.raw.recipe["yumako-processing"].results = {
		{ type = "item", name = "yumako-seed", amount = 1, probability = 0.02 },
		{ type = "item", name = "yumako-mash", amount_min = 1, amount_max = 3 }, -- from 2
	}
end

if settings.startup["probabilistic-farming-bioflux"].value and data.raw.recipe["bioflux"] then
	data.raw.recipe["bioflux"].results = { { type = "item", name = "bioflux", amount_min = 2, amount_max = 6 } } -- from 4
	-- data.raw.recipe["bioflux"].show_amount_in_title = false
end
