gpu_set_blendmode_ext(bm_zero,bm_subtract);
draw_ellipse_color(display_get_gui_width()+200,display_get_gui_height()+200,-200,-200,c_white,c_black,false);
gpu_set_blendmode(bm_normal);