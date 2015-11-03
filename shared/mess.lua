local M = {}

M.group_static_bg = hash("static_bg")
M.group_climbable = hash("climbable")
M.group_climbable_top = hash("climbable_top")
M.group_enemy = hash("enemy")
M.group_player = hash("player")
M.group_player_weapon = hash("player_weapon")

M.msg_contact_point_response = hash("contact_point_response")
M.msg_collision_response = hash("collision_response")
M.msg_animation_done = hash("animation_done")
M.msg_hit = hash("hit")
M.msg_take_damage = hash("take_damage")
M.msg_die = hash("die")
M.msg_protect = hash("protect") -- makes object unvulnerable for { time = }
M.msg_protect_ended = hash("protect_ended") -- makes object unvulnerable for { time = }

M.msg_enable = hash("enable")
M.msg_disable = hash("disable")

M.anim_run = hash("walk")
M.anim_wall_glide = hash("wall_glide")
M.anim_idle = hash("idle")
M.anim_jump = hash("jump")
M.anim_fall = hash("fall")
M.anim_die = hash("die")
M.anim_dash = hash("dash")


return M