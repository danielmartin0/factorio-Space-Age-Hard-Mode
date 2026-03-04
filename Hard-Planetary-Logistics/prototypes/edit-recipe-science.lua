local lib = require("lib")


if mods["space-age"] then
    local production_science_pack = data.raw["recipe"]["production-science-pack"]
    local utility_science_pack = data.raw["recipe"]["utility-science-pack"]

    lib.add(production_science_pack, "surface_conditions", {
            property = "pressure",
            min = 1000,
            max = 1000,
        }
    )

    lib.add(utility_science_pack, "surface_conditions", {
            property = "pressure",
            min = 1000,
            max = 1000,
        }
    )
end