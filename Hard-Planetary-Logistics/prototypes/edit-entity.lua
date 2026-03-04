local lib = require("lib")


if mods["space-age"] then
    if settings.startup["planetary-logistics-lab-only-nauvis"].value then
        local lab = data.raw["lab"]["lab"]
        lib.add(lab, "surface_conditions", {
                property = "pressure",
                min = 1000,
                max = 1000,
            }   
        )
    end
end