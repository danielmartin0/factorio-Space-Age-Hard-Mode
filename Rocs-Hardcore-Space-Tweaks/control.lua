local Public = {}

local warning_color = { r = 255, g = 60, b = 60 }

script.on_event(defines.events.on_built_entity, function(event)
	local entity = event.entity

	if not (entity and entity.valid) then
		return
	end

	if entity.name and entity.name ~= "entity-ghost" then
		return
	end

	if entity.surface and entity.surface.valid and not entity.surface.platform then
		return
	end

	if entity.ghost_type == "underground-belt" and settings.startup["no-underground-belts-on-platforms"].value then
		Public.remove_belt_unless_researched(entity, game.players[event.player_index])
	elseif entity.ghost_type == "pipe-to-ground" and settings.startup["no-underground-pipes-on-platforms"].value then
		Public.remove_pipe_unless_researched(entity, game.players[event.player_index])
	end
end)

script.on_event(defines.events.on_space_platform_built_entity, function(event)
	local entity = event.entity

	if not (entity and entity.valid) then
		return
	end

	if entity.type == "underground-belt" and settings.startup["no-underground-belts-on-platforms"].value then
		Public.remove_belt_unless_researched(entity)
	elseif entity.type == "pipe-to-ground" and settings.startup["no-underground-pipes-on-platforms"].value then
		Public.remove_pipe_unless_researched(entity)
	end
end)

function Public.remove_belt_unless_researched(entity, player)
	if not (entity.force and entity.force.valid) then
		return
	end

	local tech = entity.force.technologies["underground-belts-on-space-platforms"]

	if (not tech) or (tech and tech.valid and tech.researched) then
		return
	end

	entity.destroy()

	if player and player.valid then
		player.print({
			"no-undergrounds-on-platforms.warning-belts",
		}, { color = warning_color })
	end
end

function Public.remove_pipe_unless_researched(entity, player)
	if not (entity.force and entity.force.valid) then
		return
	end

	local tech = entity.force.technologies["underground-pipes-on-space-platforms"]

	if (not tech) or (tech and tech.valid and tech.researched) then
		return
	end

	entity.destroy()

	if player and player.valid then
		player.print({
			"no-undergrounds-on-platforms.warning-pipes",
		}, { color = warning_color })
	end
end

script.on_event(defines.events.on_player_cheat_mode_enabled, function(event)
	local force = game.players[event.player_index].force
	local tech = force.technologies["underground-pipes-on-space-platforms"]

	if tech then
		tech.researched = true
	end
end)

script.on_event(defines.events.on_research_finished, function(event)
	Public.update_underground_pipes_tech(event.research.force)
end)

script.on_init(function()
	for _, force in pairs(game.forces) do
		Public.update_underground_pipes_tech(force, false)
	end
end)

script.on_configuration_changed(function()
	for _, force in pairs(game.forces) do
		Public.update_underground_pipes_tech(force)
	end
end)

function Public.update_underground_pipes_tech(force, display_notification)
	if display_notification == nil then
		display_notification = true
	end

	local technologies = force.technologies

	if not technologies["underground-pipes-on-space-platforms"] then
		return
	end

	if technologies["underground-pipes-on-space-platforms"].researched == true then
		return
	end

	local count = 0
	local needed = 1
	for _, pack in pairs({
		"metallurgic-science-pack",
		"electromagnetic-science-pack",
		"agricultural-science-pack",
	}) do
		if technologies[pack] and technologies[pack].valid and technologies[pack].researched == true then
			count = count + 1
		end
		if count == needed then
			break
		end
	end

	if count >= needed then
		if display_notification then
			force.print(
				{ "technology-researched", "[technology=underground-pipes-on-space-platforms]" },
				{ sound_path = "utility/research_completed" }
			)
		end

		technologies["underground-pipes-on-space-platforms"].enabled = true
		technologies["underground-pipes-on-space-platforms"].researched = true

		if technologies["underground-pipes-on-space-platforms"].researched == false then
			technologies["underground-pipes-on-space-platforms"].saved_progress = 0
		end
	else
		technologies["underground-pipes-on-space-platforms"].enabled = false
		technologies["underground-pipes-on-space-platforms"].visible_when_disabled = true

		-- local progress = technologies["underground-pipes-on-space-platforms"].saved_progress
		-- if display_notification and progress < count / needed then
		-- 	force.print({
		-- 		"console.interstellar-science-pack-progress",
		-- 		tostring(count),
		-- 		tostring(needed),
		-- 		"[technology=underground-pipes-on-space-platforms]",
		-- 	})
		-- end
		-- technologies["underground-pipes-on-space-platforms"].saved_progress = count / needed
	end
end

return Public
