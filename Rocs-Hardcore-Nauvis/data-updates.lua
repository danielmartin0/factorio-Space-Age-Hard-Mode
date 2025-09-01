--== Locomotives ==--
if data.raw["locomotive"]["locomotive"] and data.raw["locomotive"]["locomotive"].energy_source.effectivity then
	data.raw["locomotive"]["locomotive"].energy_source.effectivity = data.raw["locomotive"]["locomotive"].energy_source.effectivity
		/ settings.startup["hard-nauvis-locomotive-fuel-spend-multiplier"].value
end
