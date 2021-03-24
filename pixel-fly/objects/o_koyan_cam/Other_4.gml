/// @desc FULL-ROOM-VIEW

// If there is a (Special-Room) picked that (Room's) "WIDTH" and "HEIGHT" changes Camera's (View) Value's With Its Own
if (_full_view_a_room != noone) {
	for (var i = 0; i < array_length(k_FULL_VIEW_def); i++) {
		if (room_exists(k_FULL_VIEW_def[i]) && k_FULL_VIEW_def[i] == room) {
			global._v_multply = (room_width / _v_W);		// (Can Change) || Forcefully make the (View_Multply) Value is (Compatible) with the (Rooms)
			_v_W_Edit		  = (global._v_multply * _v_W);	// (Can Change) || Camera (Width)  || This is a (Crucial) "VALUE" for The (Systems)
			_v_H_Edit		  = (global._v_multply * _v_H);	// (Can Change) || Camera (Height) || This is a (Crucial) "VALUE" for The (Systems)
			alarm[1]		  = (_game_sp / _delay);				// (Can Change) || For (Standard-Rooms) Setup an Alarm that will convert these to (Normal) setting's
		}
	}
}