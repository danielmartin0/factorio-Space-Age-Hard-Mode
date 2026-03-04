data:extend({
    -- Lab
    { 
        type = "bool-setting",
        name = "planetary-logistics-lab-only-nauvis",
        setting_type = "startup",
        default_value = false,
        order = "entity[lab]",
    },
    -- Science Packs
    {
        type = "bool-setting",
        name = "planetary-logistics-automation-only-nauvis",
        setting_type = "startup",
        default_value = false,
        order = "item[automation-science-pack]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-logistic-only-nauvis",
        setting_type = "startup",
        default_value = false,
        order = "item[logistic-science-pack]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-military-only-nauvis",
        setting_type = "startup",
        default_value = false,
        order = "item[military-science-pack]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-chemical-only-nauvis",
        setting_type = "startup",
        default_value = false,
        order = "item[chemical-science-pack]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-production-only-nauvis",
        setting_type = "startup",
        default_value = true,
        order = "item[production-science-pack]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-utility-only-nauvis",
        setting_type = "startup",
        default_value = true,
        order = "item[utility-science-pack]",
    },
    -- Module
    {
        type = "bool-setting",
        name = "planetary-logistics-module-2-only-platform",
        setting_type = "startup",
        default_value = true,
        order = "module[tier-2]",
    },
    {
        type = "bool-setting",
        name = "planetary-logistics-module-3-specific-planet",
        setting_type = "startup",
        default_value = true,
        order = "module[tier-3]",
    },
})