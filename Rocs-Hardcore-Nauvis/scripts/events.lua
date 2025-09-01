local Public = {}

function Public.init_tech(force)
	local no_landmines = settings.global["hard-nauvis-landmines-disabled"].value

	if no_landmines then
		force.technologies["land-mine"].enabled = false
		if force.technologies["land-mine"].researched then
			force.technologies["land-mine"].researched = false
		end
	else
		force.technologies["land-mine"].enabled = true
	end
end

script.on_event(defines.events.on_player_joined_game, function(event)
	local player = game.players[event.player_index]
	Common.init_tech(player.force)
end)

script.on_event(defines.events.on_force_created, function(event)
	Common.init_tech(event.force)
end)

script.on_configuration_changed(function()
	for _, force in pairs(game.forces) do
		Common.init_tech(force)
	end
end)

return Public
