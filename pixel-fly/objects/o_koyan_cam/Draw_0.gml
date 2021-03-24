/// @desc The Camera For "VISUAL" info
if (global._cam_debug_ui && !_optimize) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(1);

	// If there is a (Target) Show it's Pozition with a (Rectangle-Box) if (noone) Then just show the (Camera's) Pozition
	var dbuffer = 64;	// (Default)
	if (!_target_only) {draw_rectangle_color(x+dbuffer, y+dbuffer, x-dbuffer, y-dbuffer, c_white, c_white, c_white, c_white, true);} 
	else {
		if (instance_exists(_target)) {
			var xbuffer = sprite_get_width(_target);
			var ybuffer = sprite_get_height(_target);
			draw_rectangle_color(xto+xbuffer, yto+ybuffer, xto-xbuffer, yto-ybuffer, c_white, c_white, c_white, c_white, true);
		}
	}
}