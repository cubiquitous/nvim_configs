local M = {}

M.path_generator = function(main_path)
	return function(path_str)
		if string.find(path_str, "/") then
			return path_str
		end
		return require(main_path .. path_str)
	end
end

return M
