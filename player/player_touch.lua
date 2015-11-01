local M = {}
M.touch = {}

function M.reset()
	M.touch = {}
end

function M.add(hash)
	M.touch[hash] = true
end

function M.has(hash)
	return M.touch[hash] or false
end

function M.all_tostring()
	local str = ""
	for k,v in pairs(M.touch) do
		str = str .. k .. " , "
	end
	return str
end

return M
