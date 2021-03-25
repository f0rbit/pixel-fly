if (distance_to_object(obj_character) < 600) {
	surface_set_target(global.shadow_surface);
	draw_sprite_ext(spr_cloud,index,x,y,scale,scale,0,c_white,alpha);
	surface_reset_target();
}