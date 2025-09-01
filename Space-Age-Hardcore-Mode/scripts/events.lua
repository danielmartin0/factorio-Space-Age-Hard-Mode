local Gui = require("scripts.gui.gui")

local Public = {}

-- local notify_color = { r = 255, g = 231, b = 46 }

script.on_event(defines.events.on_player_joined_game, function(event)
	local player = game.get_player(event.player_index)

	Gui.update_top_bar(player)

	if
		game.tick < 1
		and settings.get_player_settings(event.player_index)["rocs-hardcore-a-enable-info-gui"].value
		and game.is_multiplayer()
	then
		Gui.info.toggle_window(player)
	end
end)

script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
	if event.player_index and game.players[event.player_index] then
		Gui.update_top_bar(game.players[event.player_index])
	end
end)

script.on_configuration_changed(function()
	for _, player in pairs(game.connected_players) do
		Gui.update_top_bar(player)
	end
end)

-- script.on_event(defines.events.on_player_respawned, function(event)
-- 	local no_starting_items = settings.global["rocs-hardcore-no-starting-items"].value

-- 	if no_starting_items then
-- 		local player = game.players[event.player_index]

-- 		player.clear_items_inside()
-- 	end
-- end)

return Public
