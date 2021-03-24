/// @desc (Stabilizing)

// (Before) Value's are (Now) Equal to there Changed (Globals)
_f_screen	= global._fullscreen;
_r_multply  = global._res_multply;
_gui_divide = global._gui_divider;

// "DELAYED" (Gui) Check for Change's
global._gui_W = round(_v_W_Edit / _gui_divide);
global._gui_H = round(_v_H_Edit / _gui_divide);
display_set_gui_size(global._gui_W, global._gui_H);

// "DELAYED" (Window's) Settings and (Alarm) Setup
if (_f_screen) {window_set_fullscreen(true);}
else {
	window_set_fullscreen(false);
	window_set_size((_ideal_W * _r_multply), (_ideal_H * _r_multply));
	alarm[3] = (_game_sp / _delay);
}

// Unless "BOUNDLESS" Mode is (Active) "NEVER" let the "RESOLUTION" Become Bigger Then The "DISPLAY" of the Monitor Screen
if (!_boundless && ((_ideal_W * _r_multply) > _display_W || (_ideal_H * _r_multply) > _display_H)) {
	_ideal_W = _display_W;								// Set "RESOLUTION" to "MAX" (Display_Width)
	_ideal_H = _display_H;								// Set "RESOLUTION" to "MAX" (Display_Height)

	// (Surface) and (Window) "START" Setup's
	surface_resize(application_surface, _ideal_W, _ideal_H);
} else {
	// Calculate New (Ideal Width)
	_ideal_W = round(_ideal_H * aspect_ratio);
	_ideal_H = round(_ideal_W / aspect_ratio);

	_ideal_W = round(_ideal_W);
	_ideal_H = round(_ideal_H);

	// Check to make sure our ideal width and height isn't an odd number, as that's usually not good.
	if (_ideal_W & 1) {_ideal_W++;}
	if (_ideal_H & 1) {_ideal_H++;}

	// (Surface) and (Window) "START" Setup's
	surface_resize(application_surface, (_ideal_W * _r_multply), (_ideal_H * _r_multply));
}

// "DELAYED" Camera Setting's
camera_set_view_size(k_cam, _v_W_Edit, _v_H_Edit);		// "CAMERA" (View) "SIZE"
camera_set_view_speed(k_cam, _c_X, _c_Y);				// "CAMERA" (View) "SPEED"

// For Changed (Variable's) Print a (Debug_Output) About It || (Değişebilir)
show_debug_message("\n|-----------------------(UPTADED)-------------------------|");
show_debug_message("-Updated_RES_Multply = (" + string(global._res_multply)	+ ")");
show_debug_message("-Updated_FULL_Screen = (" + string(global._fullscreen)	+ ")");
show_debug_message("-Updated_VW_Multply  = (" + string(global._v_multply)	+ ")");
show_debug_message("-Updated_CAM_Mode    = (" + string(global._cam_mode)	+ ")");
show_debug_message("-Updated_GUI_Width   = (" + string(global._gui_W)		+ ")");
show_debug_message("-Updated_GUI_Height  = (" + string(global._gui_H)		+ ")");
show_debug_message("|---------------------------------------------------------|");