local M = {}
local default_component = "#spinemodel"

function M.play_animation(self, anim, loop, component)
	if loop == true then 
		loop = go.PLAYBACK_LOOP_FORWARD 
	else
		loop = go.PLAYBACK_ONCE_FORWARD
    end
    if self.current_anim ~= anim then
    	spine.play(default_component, anim, loop, 0.4)
        self.current_anim = anim
    end
end

return M

