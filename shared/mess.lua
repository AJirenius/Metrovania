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
M.msg_die = hash("die")
M.msg_protect = hash("protect") -- makes object unvulnerable for { time = }
M.msg_protect_ended = hash("protect_ended") -- makes object unvulnerable for { time = }
M.msg_take_damage = hash("take_damage")

M.msg_attack = hash("attack")
M.msg_walk = hash("walk")
M.msg_cancel_walk = hash("cancel_walk")
M.msg_hit = hash("hit")

M.msg_status_added = hash("status_added")
M.msg_status_removed = hash("status_removed")

M.msg_enable = hash("enable")
M.msg_disable = hash("disable")

M.anim_run_right = hash("walk_right")
M.anim_run_left = hash("walk_left")
M.anim_wall_glide = hash("wall_glide")
M.anim_idle = hash("idle")
M.anim_jump = hash("jump")
M.anim_fall = hash("fall")
M.anim_die = hash("die")
M.anim_dash = hash("dash")
M.anim_attack = hash("front_attack")


return M