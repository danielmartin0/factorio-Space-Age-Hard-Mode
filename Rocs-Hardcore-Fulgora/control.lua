script.on_event(defines.events.on_player_mined_entity, function(event)
	local entity = event.entity
	if entity.name ~= "fulgoran-ruin-attractor" then
		return
	end

	local player = game.players[event.player_index]
	if not (player and player.valid) then
		return
	end

	local tech = player.force.technologies["fulgoran-ruin-attractor-mining"]

	if not tech or tech.researched then
		return
	end

	event.buffer.clear()

	entity.surface.create_entity({
		name = "fulgoran-ruin-attractor",
		position = entity.position,
		direction = entity.direction,
		force = "neutral",
		quality = entity.quality,
		raise_built = false,
	})
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
	local entity = event.entity
	if entity.name ~= "fulgoran-ruin-attractor" then
		return
	end

	local robot = event.robot
	if not (robot and robot.valid) then
		return
	end

	local tech = robot.force.technologies["fulgoran-ruin-attractor-mining"]

	if not tech or tech.researched then
		return
	end

	event.buffer.clear()

	entity.surface.create_entity({
		name = "fulgoran-ruin-attractor",
		position = entity.position,
		direction = entity.direction,
		force = "neutral",
		quality = entity.quality,
		raise_built = false,
	})
end)
