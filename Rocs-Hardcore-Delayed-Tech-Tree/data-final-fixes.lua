local EXCLUDED_TECH_NAMES = {
	["health"] = true,
}

if settings.startup["rocs-hardcore-z-infinite-tech-needs-cryogenic"].value then
	local techs_to_process = {}
	for name, tech in pairs(data.raw.technology) do
		local allow = true

		if EXCLUDED_TECH_NAMES[name] then
			allow = false
		end

		-- If the tech already requires cryoscience, don't split it:
		if allow and tech.unit and tech.unit.ingredients then
			for _, ingredient in pairs(tech.unit.ingredients or {}) do
				if ingredient[1] == "cryogenic-science-pack" then
					allow = false
					break
				end
			end
		end

		-- If there's no lab that could process this tech, don't split it:
		if allow and tech.unit and tech.unit.ingredients then
			local required_inputs = {}
			for _, ingredient in pairs(tech.unit.ingredients) do
				required_inputs[ingredient[1]] = true
			end
			required_inputs["cryogenic-science-pack"] = true

			local lab_found = false
			for _, lab in pairs(data.raw.lab) do
				local can_handle_all = true
				for input_name in pairs(required_inputs) do
					local lab_can_handle = false
					for _, lab_input in ipairs(lab.inputs or {}) do
						if lab_input == input_name then
							lab_can_handle = true
							break
						end
					end
					if not lab_can_handle then
						can_handle_all = false
						break
					end
				end
				if can_handle_all then
					lab_found = true
					break
				end
			end

			if not lab_found then
				allow = false
			end
		end

		if tech.max_level == "infinite" and allow then
			table.insert(techs_to_process, name)
		end
	end

	for _, tech_name in ipairs(techs_to_process) do
		local tech = data.raw.technology[tech_name]
		local second_tech = util.table.deepcopy(tech)
		local third_tech = util.table.deepcopy(tech)

		if tech.name:match("%d+$") then
			local base_name = tech.name:gsub("%d+$", "")
			local current_num = tonumber(tech.name:match("%d+$"))

			second_tech.name = base_name .. (current_num + 1)
			second_tech.max_level = nil
			second_tech.max_level = nil
			second_tech.prerequisites = { tech.name }

			third_tech.name = base_name .. (current_num + 2)
			third_tech.prerequisites = { second_tech.name, "infinite-research" }
		else
			-- local tech_revised = util.table.deepcopy(tech)
			-- tech_revised.name = tech.name .. "-1"

			second_tech.name = tech.name .. "-2"
			second_tech.max_level = nil
			second_tech.max_level = nil
			second_tech.prerequisites = { tech.name }

			third_tech.name = tech.name .. "-3"
			third_tech.prerequisites = { second_tech.name, "infinite-research" }

			-- data.raw.technology[tech_name] = nil
			-- data:extend({ tech_revised })
			-- tech = data.raw.technology[tech_revised.name]
		end

		tech.upgrade = nil
		tech.max_level = nil

		table.insert(third_tech.unit.ingredients, { "cryogenic-science-pack", 1 })

		data:extend({ second_tech, third_tech })
	end
end
