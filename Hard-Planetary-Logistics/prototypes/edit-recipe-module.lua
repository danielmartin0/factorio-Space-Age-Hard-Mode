local lib = require("lib")


if mods["space-age"] then
    local quality_module_3 = data.raw["recipe"]["quality-module-3"]
    local quality_module_2 = data.raw["recipe"]["quality-module-2"]
    local speed_module_3 = data.raw["recipe"]["speed-module-3"]
    local speed_module_2 = data.raw["recipe"]["speed-module-2"]
    local productivity_module_3 = data.raw["recipe"]["productivity-module-3"]
    local productivity_module_2 = data.raw["recipe"]["productivity-module-2"]
    local efficiency_module_3 = data.raw["recipe"]["efficiency-module-3"]
    local efficiency_module_2 = data.raw["recipe"]["efficiency-module-2"]

    lib.add(quality_module_3, "surface_conditions", {
            property = "magnetic-field",
            min = 99,
        }
    )
    lib.add(quality_module_2, "surface_conditions", {
            property = "gravity",
            min = 0,
            max = 0,
        }
    )

    lib.add(speed_module_3, "surface_conditions", {
            property = "pressure",
            min = 4000,
            max = 4000,
        }
    )
    lib.add(speed_module_2, "surface_conditions", {
            property = "gravity",
            min = 0,
            max = 0,
        }
    )

    lib.add(productivity_module_3, "surface_conditions", {
            property = "pressure",
            min = 2000,
            max = 2000,
        }
    )
    lib.add(productivity_module_2, "surface_conditions", {
            property = "gravity",
            min = 0,
            max = 0,
        }
    )

    lib.add(efficiency_module_3, "surface_conditions", {
            property = "pressure",
            min = 1000,
            max = 1000,
        }
    )
    lib.add(efficiency_module_2, "surface_conditions", {
            property = "gravity",
            min = 0,
            max = 0,
        }
    )
end