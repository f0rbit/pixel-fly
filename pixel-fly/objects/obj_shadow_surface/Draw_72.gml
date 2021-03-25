if (!surface_exists(global.shadow_surface)) {
    global.shadow_surface = surface_create(4000, 4000);
    surface_set_target(global.shadow_surface);
    draw_clear_alpha(c_white, 0);
	show_debug_message("cleared surface");
    surface_reset_target();
}