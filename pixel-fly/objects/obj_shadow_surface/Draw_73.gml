draw_set_colour(c_white);
draw_set_alpha(0.1);
draw_surface(global.shadow_surface,0,0);
draw_set_alpha(1);

    surface_set_target(global.shadow_surface);
    draw_clear_alpha(c_white, 0);
    surface_reset_target();