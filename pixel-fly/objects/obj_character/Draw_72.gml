
var draw_x = (x);
var draw_y = (y);
surface_set_target(global.shadow_surface);
draw_sprite_ext(spr_shadow,0,draw_x,draw_y-0.5,2,2,0,c_white,1);
surface_reset_target();