local util = require("util")

local Public = {}

function Public.merge(old, new)
	old = util.table.deepcopy(old)

	for k, v in pairs(new) do
		if v == "nil" then
			old[k] = nil
		else
			old[k] = v
		end
	end

	return old
end

function Public.find(tbl, f, ...)
	if type(f) == "function" then
		for k, v in pairs(tbl) do
			if f(v, k, ...) then
				return v, k
			end
		end
	else
		for k, v in pairs(tbl) do
			if v == f then
				return v, k
			end
		end
	end
	return nil
end

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

function Public.clamp(x, min, max)
	x = x == 0 and 0 or x
	min, max = min or 0, max or 1
	return x < min and min or (x > max and max or x)
end

return Public
