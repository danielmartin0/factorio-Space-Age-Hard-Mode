--== Modules ==--
local module_tiers = { "efficiency-module", "efficiency-module-2", "efficiency-module-3" }
for _, module_name in pairs(module_tiers) do
	if data.raw["module"][module_name] and data.raw["module"][module_name].effect.consumption then
		data.raw["module"][module_name].effect.consumption = data.raw["module"][module_name].effect.consumption
			* settings.startup["rocs-hardcore-efficiency-module-effectiveness-multiplier"].value
	end
end
