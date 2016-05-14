--- State machine for generic enemy

local mess = require "shared.mess"
local M = {}

M.FALL = 1
M.WALK = 2
M.ATTACK = 3
M.HIT = 4 

M.STATUS_AWARE = hash("aware")
M.STATUS_CAN_ATTACK = hash("can_attack")
M.STATUS_PROTECT = hash("protected")

M.state_names = { "Fall", "Walk", "Attack", "Hit" }

local enemies = {}

function M.add_enemy(url)
	enemies[url] = { url = url, status = {} }
	M.set_state(url, M.FALL)
end



function M.current_state(url)
	return M.state_names[enemies[url].current_state]
end

function M.get_state(url)
	return enemies[url].current_state
end

function M.set_state(url, state, forced)
	local e = enemies[url]
	if e.current_state == state and forced ~= true then return end
	e.current_state = state
--	print("Change state:",M.state_names[state])--M.current_state)
	if state == M.WALK then
		msg.post(e.url,mess.msg_walk)
	elseif state == M.ATTACK then
		msg.post(e.url,mess.msg_cancel_walk) -- should this be in attack script instead?
		msg.post(e.url,mess.msg_attack)
	elseif state == M.HIT then
		msg.post(e.url,mess.msg_cancel_walk) -- should this be in attack script instead?
		msg.post(e.url,mess.msg_hit)
	end
end
function M.has_state(self, state)
	return enemies[self].current_state == state
end

function M.set_status(url, status)
	local e = enemies[url]
	if e.status[status] then return end
--	print(status,"added")
	e.status[status] = true
	msg.post(url,mess.msg_status_added,{status = status})
	return
end

function M.remove_status(url, status)
	local e = enemies[url]
	if e.status[status] then
--		print(status,"removed")
		e.status[status] = nil 
		msg.post(url,mess.msg_status_removed,{status == status})
	end
end

function M.has_status(url, status)
	return enemies[url].status[status] or false
end



return M