--== Modules ==--
for _, module in pairs(data.raw["module"]) do
	if module.category and module.category == "efficiency" and module.effect.consumption then
		module.effect.consumption = module.effect.consumption
			* settings.startup["hard-nauvis-efficiency-module-effectiveness-multiplier"].value
	end
end

--== Shotguns ==--
local function get_shotgun_damage(projectile_name)
	local projectile = data.raw["projectile"][projectile_name]
	if not projectile then
		return
	end
	if not projectile.action then
		return
	end
	if not projectile.action.action_delivery then
		return
	end
	if not projectile.action.action_delivery.target_effects then
		return
	end
	if not projectile.action.action_delivery.target_effects.damage then
		return
	end

	local damage = projectile.action.action_delivery.target_effects.damage.amount
	if not damage then
		return
	end

	return damage * (1 + settings.startup["hard-nauvis-bonus-shotgun-damage-percent"].value / 100)
end

local new_damage = get_shotgun_damage("shotgun-pellet")
if new_damage then
	data.raw["projectile"]["shotgun-pellet"].action.action_delivery.target_effects.damage.amount = new_damage
end

new_damage = get_shotgun_damage("piercing-shotgun-pellet")
if new_damage then
	data.raw["projectile"]["piercing-shotgun-pellet"].action.action_delivery.target_effects.damage.amount = new_damage
end

--== Locomotives ==--
if data.raw["locomotive"]["locomotive"] and data.raw["locomotive"]["locomotive"].energy_source.effectivity then
	data.raw["locomotive"]["locomotive"].energy_source.effectivity = data.raw["locomotive"]["locomotive"].energy_source.effectivity
		/ settings.startup["hard-nauvis-locomotive-fuel-spend-multiplier"].value
end
