local NAME_TO_ICON_SHIFT = {
	["lighted-small-electric-pole"] = { -0.4, 0 },
	["lighted-medium-electric-pole"] = { -0.2, -0.4 },
	["lighted-big-electric-pole"] = { 0, 0 },
	["lighted-substation"] = { 0.2, 0 },
}

-- Add icons on the entity pictures, since this 2.0 port apparently no longer does that:
for _, entity in pairs(data.raw["electric-pole"]) do
	if string.sub(entity.name, 1, 8) == "lighted-" then
		local pictures = entity.pictures
		if pictures and pictures.layers then
			local new_layers = util.table.deepcopy(pictures.layers)

			local entity_collision_box = entity.collision_box
			local shift = {
				entity_collision_box[1][1] + 0.5,
				entity_collision_box[1][2] + 0.5 - (entity.drawing_box_vertical_extension or 0),
			}

			if NAME_TO_ICON_SHIFT[entity.name] then
				shift[1] = shift[1] + NAME_TO_ICON_SHIFT[entity.name][1]
				shift[2] = shift[2] + NAME_TO_ICON_SHIFT[entity.name][2]
			end

			new_layers[#new_layers + 1] = {
				filename = "__Rocs-Hardcore-Nauvis__/graphics/entity-lighted-icons.png",
				priority = "extra-high",
				width = 32,
				height = 32,
				shift = shift,
				direction_count = 4,
				scale = 1.1,
				draw_as_glow = true,
			}

			pictures.layers = new_layers
		end
	end
end
