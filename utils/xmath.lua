local M = {}

-- Returns distance between 2 points (using only first 2 in vector)
function M.distance(from,to)
	return math.abs(math.sqrt((from.x-to.x) * (from.x-to.x) + (from.y-to.y) * (from.y-to.y)))
end

return M

