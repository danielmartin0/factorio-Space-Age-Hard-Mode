local Public = {}

-- Uses a new table to overwrites key-value pairs in the old table.
-- Example: merge({ type = "planet", name = "fulgora" }, { name = "cerys" }) -> { type = "planet", name = "cerys" }
function Public.merge(old, new)
	old = util.table.deepcopy(old)

	for k, v in pairs(new) do
		if v == "nil" then -- The special string "nil" can be used to remove keys.
			old[k] = nil
		else
			old[k] = v
		end
	end

	return old
end

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

-- Joins multiple tables together.
-- Example: join({1, 2}, {3, 4}, {5}) -> {1, 2, 3, 4, 5}
function Public.join(...)
	local result = {}
	for i = 1, select("#", ...) do
		local tbl = select(i, ...)
		if tbl then
			for _, v in ipairs(tbl) do
				table.insert(result, v)
			end
		end
	end
	return result
end

function Public.add(object, key, value)
    if not object then return end
    
    if not object[key] then
        object[key] = {}
    end
    
    table.insert(object[key], value)
    
    return object
end

return Public
