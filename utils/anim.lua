local M = {}
local default_component = "#sprite"

function M.play_animation(self, anim, component)
    if self.current_anim ~= anim then
        msg.post(component or default_component, "play_animation", {id = anim})
        self.current_anim = anim
    end
end

return M

