local M = {}

M.FALLING = 1
M.CLIMBING = 2
M.STANDING = 3
M.ROOF_HANGING = 4
M.DASHING = 5
M.DEAD = 6

M.names = {"Falling","Climbing","Standing","Roof hanging","Dashing","Dead"}

function M.tostring(self)
	return M.names[self.state]
end

function M.set_state(self, new_state, forced)
	if new_state == nil then print("ERROR: STATE DOESNT EXIST") return end
	if new_state > self.state or forced == true then 
		self.state = new_state 
	end
end

function M.reset(self,can_climb)
	self.last_state = self.state
	if self.state == M.DEAD or (self.state == M.CLIMBING and can_climb==true) then return end
	self.state = M.FALLING
end

return M