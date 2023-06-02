local M = {}

M.map = function(arr, func)
	for _, v in ipairs(arr) do
		func(v)
	end
end

return M
