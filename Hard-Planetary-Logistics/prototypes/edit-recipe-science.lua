local lib = require("lib")


if mods["space-age"] then
    if settings.startup["planetary-logistics-production-only-nauvis"].value then
        local production_science_pack = data.raw["recipe"]["production-science-pack"]
        lib.add(production_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end
    
    if settings.startup["planetary-logistics-utility-only-nauvis"].value then
        local utility_science_pack = data.raw["recipe"]["utility-science-pack"]
        lib.add(utility_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end

    if settings.startup["planetary-logistics-military-only-nauvis"].value then
        local military_science_pack = data.raw["recipe"]["military-science-pack"]
        lib.add(military_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end

    if settings.startup["planetary-logistics-chemical-only-nauvis"].value then
        local chemical_science_pack = data.raw["recipe"]["chemical-science-pack"]
        lib.add(chemical_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end

    if settings.startup["planetary-logistics-logistic-only-nauvis"].value then
        local logistic_science_pack = data.raw["recipe"]["logistic-science-pack"]
        lib.add(logistic_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end

    if settings.startup["planetary-logistics-automation-only-nauvis"].value then
        local automation_science_pack = data.raw["recipe"]["automation-science-pack"]
        lib.add(automation_science_pack, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }
        )
    end
end