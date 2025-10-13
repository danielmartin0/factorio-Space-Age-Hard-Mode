for _, setting in pairs(data.raw["bool-setting"]) do
	if string.find(setting.name, "muluna") and setting.rocs_hard_mode then
		setting.forced_value = true
		setting.hidden = true
	end
end
