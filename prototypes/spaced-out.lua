if not mods['Krastorio2-spaced-out'] then return end

if settings.startup['xy-rebalance-teslagun'] then
    -- some of this is already done by xy k2 enhancements... its probably fine?
    data.raw['gun']['teslagun'].attack_parameters.range = 32
    data.raw['gun']['teslagun'].attack_parameters.cooldown = 16
    data.raw['ammo']['tesla-ammo'].magazine_size = 12
    --data.raw.beam['chain-tesla-gun-beam-start'].action.action_delivery.target_effects[1].damage.amount = 60
    --data.raw.beam['chain-tesla-gun-beam-bounce'].action.action_delivery.target_effects[1].damage.amount = 60
end