local M = {}

M.forEachValue = function(arr, func)
	for _, v in pairs(arr) do
		func(v)
	end
end

M.forEachKey = function(arr, func)
	for k, _ in pairs(arr) do
		func(k)
	end
end

M.forEach = function(arr, func)
	for k, v in pairs(arr) do
		func(k, v)
	end
end

return M
