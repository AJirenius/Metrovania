local M = {}

local player_touch = require "player.player_touch"
local mess = require "shared.mess"


M.FALLING = 1
M.STANDING = 2
M.CLIMBING = 3
M.ROOF_HANGING = 4
M.DEAD = 5

M.STATUS_PROTECT = hash("protected")

M.names = {"Falling","Standing","Climbing","Roof hanging","Dead"}

local state = 1
local statuses = {}

function M.state_to_string()
	return M.names[state]
end
function M.statuses_to_string()
	local str = ""
	for k,v in pairs(statuses) do
		str = str .. v .. "  "
	end
	return str
end

function M.set_state(new_state, forced)
	if new_state == nil then print("ERROR: STATE DOESNT EXIST") return end
	if new_state > state or forced == true then 
		state = new_state 
	end
end

function M.get_state()
	return state
end

function M.set_status(status)
	if statuses[status] then return end
	statuses[status] = true
	msg.post(".",mess.msg_status_added,{status = status})	
end

function M.remove_status(status)
	if statuses[status] then
		statuses[status] = nil 
		msg.post(".",mess.msg_status_removed,{status == status})
	end
end

function M.has_status(status)
	return statuses[status] or false
end

function M.reset(self,can_climb)
	if state == M.DEAD or (state == M.CLIMBING and ( player_touch.has(hash("climbable")) or player_touch.has(hash("climbable_top")))) then return end
	state = M.FALLING
end

return M