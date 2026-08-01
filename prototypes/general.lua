local util = require('lib')
-- These are listed in the order I implemented them
if settings.startup['xy-rebalance-pistol'] then
    data.raw['gun']['pistol'].attack_parameters.cooldown = 15

    data.raw['ammo']['firearm-magazine'].magazine_size = 16
    data.raw['ammo']['piercing-rounds-magazine'].magazine_size = 16
end

if settings.startup['xy-rebalance-rifle'] then
    data.raw['ammo']['kr-rifle-magazine'].magazine_size = 20
    data.raw['ammo']['kr-armor-piercing-rifle-magazine'].magazine_size = 20
    data.raw['ammo']['kr-uranium-rifle-magazine'].magazine_size = 20
    data.raw['ammo']['kr-imersite-rifle-magazine'].magazine_size = 20

    util.updateDamage('kr-uranium-rifle-magazine-projectile', 'projectile', 'kr-radioactive', 8)
    util.updateDamage('kr-imersite-rifle-magazine-projectile', 'projectile', 'laser', 8)

    util.addDamage('kr-imersite-rifle-magazine-projectile', 'projectile', 'kr-radioactive', 8)

    util.replaceIngredient('kr-uranium-rifle-magazine', 'uranium-238', 1)
    util.replaceIngredient('kr-imersite-rifle-magazine', 'kr-imersite-crystal', 1)

    data.raw.gun['vehicle-machine-gun'].attack_parameters.cooldown = 6
    data.raw.gun['vehicle-machine-gun'].attack_parameters.damage_modifier = nil
    data.raw.gun['tank-machine-gun'].attack_parameters.cooldown = 6
    data.raw.gun['tank-machine-gun'].attack_parameters.damage_modifier = nil
end

if settings.startup['xy-rebalance-combatbot'] then
    util.replaceIngredient('distractor-capsule', 'defender-capsule', 3)
    util.replaceIngredient('destroyer-capsule', 'distractor-capsule', 3)
end

if settings.startup['xy-rebalance-flamethrower-turret-1'] then
    local ftt = data.raw['fluid-turret']['flamethrower-turret']
    ftt.attack_parameters.fluids = {
        {type = "light-oil"}
    }
    ftt.attack_parameters.fluid_consumption = 0.4
    if mods['space-exploration'] then
        table.insert(ftt.attack_parameters.fluids, {type = 'se-pyroflux', damage_modifier = 1.4})
    end

    util.updateDamage('flamethrower-fire-stream', 'stream', 'fire', 2)
end

if settings.startup['xy-rebalance-grenade'] then
    util.updateDamage('grenade', 'projectile_area', 'explosion', 75)

    util.replaceIngredient('grenade', 'iron-plate', 4)
    util.replaceIngredient('grenade', 'coal', 8)
end

if settings.startup['xy-rebalance-antimat'] then
    local dmg1 = 80
    data.raw.projectile['kr-anti-materiel-rifle-magazine-projectile'].piercing_damage = 550
    data.raw.projectile['kr-anti-materiel-rifle-magazine-projectile'].action = {
        type = 'direct',
        action_delivery = {
            type = 'instant',
            target_effects = {
                { type = 'create-entity', entity_name = 'explosion-hit' },
                { type = 'damage', damage = { amount = dmg1, type = 'physical'}}
            }
        },
    }

    local dmg2 = 140
    data.raw.projectile['kr-armor-piercing-anti-materiel-rifle-magazine-projectile'].piercing_damage = 1250
    data.raw.projectile['kr-armor-piercing-anti-materiel-rifle-magazine-projectile'].action = {
        type = 'direct',
        action_delivery = {
            type = 'instant',
            target_effects = {
                { type = 'create-entity', entity_name = 'explosion-hit' },
                { type = 'damage', damage = { amount = dmg2, type = 'physical'}}
            }
        },
    }

    data.raw.projectile['kr-uranium-anti-materiel-rifle-magazine-projectile'].piercing_damage = 4000
    data.raw.projectile['kr-uranium-anti-materiel-rifle-magazine-projectile'].action = {
        type = 'direct',
        action_delivery = {
            type = 'instant',
            target_effects = {
                { type = 'create-entity', entity_name = 'explosion-hit' },
                { type = 'damage', damage = { amount = dmg2, type = 'physical'}},
                 { type = 'damage', damage = { amount = 80, type = 'kr-radioactive'}}
            }
        },
    }

    data.raw.projectile['kr-imersite-anti-materiel-rifle-magazine-projectile'].piercing_damage = 12500
    data.raw.projectile['kr-imersite-anti-materiel-rifle-magazine-projectile'].action = {
        type = 'direct',
        action_delivery = {
            type = 'instant',
            target_effects = {
                { type = 'create-entity', entity_name = 'explosion-hit' },
                { type = 'damage', damage = { amount = dmg2, type = 'physical'}},
                { type = 'damage', damage = { amount = 80, type = 'kr-radioactive'}},
                { type = 'damage', damage = { amount = 80, type = 'laser'}}
            }
        },
    }
end

if settings.startup['xy-rebalance-tank'] then
   data.raw.gun['kr-advanced-tank-machine-gun'].attack_parameters.damage_modifier = nil
   data.raw.gun['kr-advanced-tank-laser-cannon'].attack_parameters.damage_modifier = nil
   data.raw.gun['kr-advanced-tank-laser-cannon'].attack_parameters.cooldown = 40
end

if settings.startup['xy-rebalance-poison-capsule'] then
    data.raw.capsule['poison-capsule'].capsule_action.attack_parameters.range = 28
    data.raw['smoke-with-trigger']['poison-cloud'].action.action_delivery.target_effects.action.action_delivery.target_effects.damage.amount = 11 -- why
end

if settings.startup['xy-rebalance-impulse'] then
    util.updateDamage('kr-impulse-rifle-ammo', 'ammo', 'laser', 450)
end

--[[if settings.startup['xy-rebalance-shotgun'] then
    data.raw.gun['shotgun'].attack_parameters.damage_modifier = nil
    data.raw.gun['combat-shotgun'].attack_parameters.damage_modifier = nil
    util.updateDamage('shotgun-pellet', 'projectile', 'physical', 9)
    --util.updateDamage('piercing-shotgun-pellet', 'projectile', 'physical', 16)--doesnt work for some reason???
    data.raw.projectile['piercing-shotgun-pellet'].action.action_delivery.target_effects[2].damage.amount = 16 -- this is so bad
end]]

if settings.startup['xy-rebalance-nuke'] then
    util.replaceIngredient('atomic-bomb', 'uranium-235', 30)
    util.replaceIngredient('kr-nuclear-artillery-shell', 'uranium-235', 20)
end

if settings.startup['xy-rebalance-spidertron'] then
    data.raw['spider-vehicle']['spidertron'].max_health = 3500
    for i = 1,4 do
        data.raw.gun['spidertron-rocket-launcher-'..i].attack_parameters.cooldown = 75
    end
    for _,resistance in pairs(data.raw['spider-vehicle']['spidertron'].resistances) do
        if resistance.type == 'explosion' then
            resistance.percent = 80
        end
    end
end