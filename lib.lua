local Public = {}

-- Finds the table index of a given value, or alternatively a value evaluating to true for a given function.
-- Example: find({4, 5, 6}, function(v) return v > 5 end) -> 3
function Public.find(tbl, f, ...)
	if type(f) == "function" then
		for k, v in pairs(tbl) do
			if f(v, k, ...) then
				return k
			end
		end
	else
		for k, v in pairs(tbl) do
			if v == f then
				return k
			end
		end
	end
	return nil
end

function Public.updateDamage(ammo, prototype, type, newValue) -- Ammo: name of the ammo; type: the damage type to affect, newvalue: the new value of that damage
	local targeteffects = {} -- this is really bad
	if prototype == 'projectile' then
		targeteffects = data.raw[prototype][ammo].action.action_delivery.target_effects
	elseif prototype == 'projectile_area' then
		targeteffects = data.raw['projectile'][ammo].action[2].action_delivery.target_effects -- bad
	elseif prototype == 'stream' then
		targeteffects = data.raw[prototype][ammo].action[1].action_delivery.target_effects -- bad
	elseif prototype == 'ammo' then
		targeteffects = data.raw[prototype][ammo].ammo_type.action.action_delivery.target_effects
	end


	for _,v in pairs(targeteffects) do
		if v.type == 'damage' then
			if v.damage['type'] == type then
				v.damage['amount'] = newValue
			end
		end
	end
end

function Public.addDamage(ammo, prototype, type, value) -- Ammo: name of the ammo; type: the damage type to affect, newvalue: the new value of that damage
	local targeteffects = data.raw[prototype][ammo].action.action_delivery.target_effects


	table.insert(targeteffects, {
		type = 'damage',
		damage = { type = type, amount = value }
	})
end

function Public.replaceIngredient(recipe, ingredient, amount, newIngredient)
	local r = data.raw.recipe[recipe]
	if r then
		for _,v in pairs(r.ingredients) do
            if v.name == ingredient then
                if newIngredient then v.name = newIngredient end
				if amount then v.amount = amount end
            end
        end
	end
end

return Public
