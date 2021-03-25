var x_axis = keyboard_check(ord("D"))-keyboard_check(ord("A"));
var y_axis = keyboard_check(ord("S"))-keyboard_check(ord("W"));

var _dir = point_direction(0,0,x_axis,y_axis);
if (x_axis == 0 && y_axis == 0) {
	// skip	
	image_speed = 0;
	image_index = (image_index > 1) ? 2 : 0;
} else {
	move(_dir,move_speed);	
	image_speed = 1.5;
}

x = round(x);
y = round(y);




function move(_dir,_spd) {
	show_debug_message(string(_dir));
	if (_dir < 90) {
		dir = 3;
	} else if (_dir <= 90) {
		dir = 0;	
	} else if (_dir < 270) {
		dir = 1;	
	} else if (_dir <= 270) {
		dir = 2;	
	} else {
		dir = 3;
	}
	
	x += lengthdir_x(_spd,_dir);
	y += lengthdir_y(_spd,_dir);
}

