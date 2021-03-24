/// @desc (Setting's)

// Add Camera (Mode's) ---------------(Important)---------------//
#region (Special) Cam Mod's
	_c_X = camera_get_view_x(k_cam);							// "CAMERA" (Updated-X) "LEFT"
	_c_Y = camera_get_view_y(k_cam);							// "CAMERA" (Updated-Y) "TOP"

	// Camera (Mod) Changing System
	switch (global._cam_mode) {

		// (Target) durumuna göre Kameranın "POZITION" ve "SPEED" Takibini (Günceller)
		case "FOLLOW_TARGET":
			if (_target != noone && instance_exists(_target)) {
				xto  = (_target.x); yto = (_target.y);			// Eğer (Target) var ise Follow "TARGET_X" and Follow "TARGET_Y"

				_c_X = xto - _v_W_Half;							// Follow "X_SPEED"
				_c_Y = yto - _v_H_Half;							// Follow "Y_SPEED"
				
				_target_only = true;							// (Target_Only)
			} else {break;}
		break;

		// Kamera (Mouse) un "POZITION" Takibini (Günceller)
		case "FOLLOW_MOUSE":
			xto = (mouse_x); yto = (mouse_y);					// Follow "MOUSE_X" and "MOUSE_Y"

			_c_X = xto - _v_W_Half;								// Follow "X_SPEED"
			_c_Y = yto - _v_H_Half;								// Follow "Y_SPEED"

			_target_only = false;								// "NOT" (Target_Only)
		break;

		// Kamera (Mouse) un "POZITION" ve "SPEED" Takibini (Target) inkiler ile Orantılı bir şekild (Günceller)
		case "FOLLOW_MOUSE_PEEK":
			if (_target != noone && instance_exists(_target)) {
				var _sp = 0.2;									// (Değişebilir) || Bigger (Faster)-Smaller (Slower)
				xto  = (mouse_x); yto = (mouse_y);				// Follow "MOUSE_X" and "MOUSE_Y"

				_c_X = lerp(_target.x, xto, _sp) - _v_W_Half;	// Follow "X_SPEED" With (Lerp)
				_c_Y = lerp(_target.y, yto, _sp) - _v_H_Half;	// Follow "Y_SPEED" With (Lerp)
				
				_target_only = true;							// (Target_Only)
			} else {break;}
		break;

		// Kamera (Mouse) un "POZITION" ve "SPEED" Takibini (Target) inkiler ile Orantılı bir şekild (Günceller)
		case "FOLLOW_MOUSE_DRAG":
			var _mousex = display_mouse_get_x();
			var _mousey = display_mouse_get_y();

			if (mouse_check_button(mb_left)) {					// (Değişebilir)
				var _sp = 0.5;									// (Değişebilir) || Bigger (Faster)-Smaller (Slower)
				_c_X   += (_mouse_X_pre - _mousex) * _sp;
				_c_Y   += (_mouse_Y_pre - _mousey) * _sp;
			}
			
			_mouse_X_pre = _mousex;
			_mouse_Y_pre = _mousey;
			
			_target_only = false;								// "NOT" (Target_Only)
		break;

		// Move "VIEW" to the Mouse's (Pozition) When you collide with the Border of the "ROOM_VIEW"
		case "FOLLOW_MOUSE_BORDER":
			if (!point_in_rectangle(mouse_x, mouse_y, _c_X + (_v_W_Edit*0.1), _c_Y + (_v_H_Edit*0.1), _c_X + (_v_W_Edit*0.9), _c_Y + (_v_H_Edit*0.9))) {
				var _sp = 0.02;									// (Değişebilir) || Bigger (Faster)-Smaller (Slower)
				xto     = (mouse_x); yto = (mouse_y);			// Follow "MOUSE_X" and "MOUSE_Y"

				_c_X = lerp(_c_X, (xto - _v_W_Half), _sp);		// Follow "X_SPEED" With (Lerp)
				_c_Y = lerp(_c_Y, (yto - _v_H_Half), _sp);;		// Follow "Y_SPEED" With (Lerp)
				
				_target_only = false;							// "NOT" (Target_Only)
			} else {break;}
		break;

		// Go to (Clicked) "MOUSE_X" and "MOUSE_Y" Pozition's
		case "MOVE_TO_CLICK":
			if (mouse_check_button_pressed(mb_left)) {
				xto = (mouse_x); yto = (mouse_y);				// Follow (Clicked) "MOUSE_X" and "MOUSE_Y" Pozition 
				x   = xto;										// Camera (Sprite) Follow "X_TO"
				y   = yto;										// Camera (Sprite) Follow "Y_TO"

				_c_X = (x - _v_W_Half);							// Follow (Object's) "X"
				_c_Y = (y - _v_H_Half);							// Follow (Object's) "Y"
				
				_target_only = false;							// "NOT" (Target_Only)
			} else {break;}
		break;

		// Go to The (Target) "X" and "Y" Pozition's with (Lerp) Function and Change The Camera (Mode)
		case "MOVE_TO_TARGET":
			if (_target != noone && instance_exists(_target)) {
				var _sp = 0.02;									// (Değişebilir) || Bigger (Faster)-Smaller (Slower)
				xto     = (_target.x); yto = (_target.y);		// Eğer (Target) var ise Follow "X" and Follow "Y"

				_c_X = lerp(_c_X, (xto - _v_W_Half), _sp);		// Follow "X_SPEED" With (Lerp)
				_c_Y = lerp(_c_Y, (yto - _v_H_Half), _sp);		// Follow "Y_SPEED" With (Lerp)

				// Changed the (Mode) Automatically because we are so close to the "TARGET" Object because of (Lerp)
				if (point_distance(x, y, (xto - _v_W_Half), (yto - _v_H_Half)) < 1)	{global._cam_mode = _c_mode;} // (Değişebilir)

				_target_only = true;							// (Target_Only)
			} else {break;}
		break;
	}
#endregion

// (Region RE-Activate System) -----------(Important)-----------//
// If (Optimize) "ON" then object's that go (Inside) of "VIEW" region get's "ACTIVATED"
if (_optimize) {
	instance_activate_region(_c_X, _c_Y, _v_W_Edit, _v_H_Edit, true);

	instance_activate_object(o_koyan_cam);						// (Don't Touch-Guarantee)
	instance_activate_object(_target);							// (Don't Touch-Guarantee)

	instance_activate_layer("Instances");						// (Can Change) || (Can Add More) || Special (Layer's) you dont want to close while in "OPTIMIZE" Mode like "PERSISTENT" object's (Layer)
	//instance_activate_layer("Instances_2");					// (like this)
	//instance_activate_layer("Instances_3");					// (like this)
}

// If (Debug_UI) "ON" press (T) to (On-Off) this setting
if (k_DEBUG_UI_def) {
	if (keyboard_check_pressed(ord("T"))) {						// (Can Change)
		if (global._cam_debug_ui) {global._cam_debug_ui = false;}
		else					  {global._cam_debug_ui =  true;}
	}
} else {global._cam_debug_ui = false;}

// (Boundless) Clamp (Variable's) and (Setting's) ----------------------------------------------//
if (!_boundless) {
	// (Keep) The Camera "CENTER" Inside the Room With Using "BUFF"
	_c_X = clamp(_c_X, 0, (room_width  - _v_W_Edit));											// (Can Change) || "X" (Buff)
	_c_Y = clamp(_c_Y, 0, (room_height - _v_H_Edit));											// (Can Change) || "Y" (Buff)

	// Test Edilmiş (View) ve (Resolution) Oranlarına (Kilitle)
	_max_res			= floor(abs((_display_W / _ideal_W) * (_display_H / _ideal_H)));		// (Don't Touch) || (Resolution) Restriction
	global._v_multply   = clamp(global._v_multply,   0.5, 8);									// (Don't Touch) || "VIEW" (Multply)
	global._res_multply = clamp(global._res_multply, 1, _max_res);								// (Can Change)  || "RESOLUTION" Cannot go beyond his best condition for the (Monitor)
}

// (Check) If (Globals) "CHANGED" If (True Setup an Stabilizing (Alarm) ---(VERY_Important)----//
if (global._v_multply == _v_multply && global._res_multply == _r_multply && global._gui_divider == _gui_divide && global._fullscreen == _f_screen) 
	{alarm[0] = (_game_sp / _delay);}

// Camera (Debug_UI) Panel (On-Off)
visible = global._cam_debug_ui == true ? true : false;

// Set the (Local) Function to (Global) Variable so we can use this (Outside)
global._screen_shake	= s_shake;
global._cam_mode_change = s_change;

// (Screen_Shake) Setting's
_c_X		 += random_range(-_shake_Remain, _shake_Remain);
_c_Y		 += random_range(-_shake_Remain, _shake_Remain);
_shake_Remain = max(0, _shake_Remain - ((1 / _shake_Length) * _shake_Magnitude));

// Camera's "POZITION" Setting's (Update) -----(Very_Important)-----// This (Should) be the "LAST" Setup's and in a (Loop)
camera_set_view_pos(k_cam, _c_X, _c_Y);								// "CAMERA" (View) "POZITION"