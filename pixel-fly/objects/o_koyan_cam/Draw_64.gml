/// @desc (Debug_UI)
display_set_gui_size(1024,576);
// If (Debug) "ACTIVE" and (Optimize) mode is "DE-ACTIVE" then draw (UI)
if (global._cam_debug_ui && !_optimize) {

	// Print "FPS"
	k_fps_specs();

	// Print "STANDARD" (Cam_Debug_UI) 
	draw_set_color(c_white);
	draw_text(12, 48,
		k_cam_display_specs(k_display._app_surface)			+ "\n"		+
		k_cam_display_specs(k_display._screen)				+ "\n"		+
		k_cam_display_specs(k_display._window)				+ "\n"		+
		k_cam_display_specs(k_display._view) 				+ "\n"		+
		k_cam_display_specs(k_display._gui)					+ "\n\n"	+

		"Room_W: "		+ string(room_width)				+ "\n"		+
		"Room_H: "		+ string(room_height)				+ "\n"		+
		"Room: "		+ string(room_get_name(room))		+ "\n\n"	+

		"Cam_X: "		+ string(_c_X)						+ "\n"		+
		"Cam_Y: "		+ string(_c_Y)						+ "\n\n"	+
		
		"Target:   "	+ object_get_name(_target)			+ "\n"		+
		"Target_X: "	+ string(xto)						+ "\n"		+
		"Target_Y: "    + string(yto)						+ "\n\n"	+

		"Gui_Divider: "	+ string(global._gui_divider)		+ "\n"		+
		"Vw_Multply: "  + string(global._v_multply)			+ "\n"		+
		"Res_Multply: " + string(global._res_multply)		+ "\n"		+
		"Cam_Mode: "	+ string(global._cam_mode)			+ "\n"
	);
}
else if (global._cam_debug_ui && _optimize) {k_fps_specs();}	// Print "FPS"

//  |---------------|
// <| Made by Koyan |>
//  |---------------|