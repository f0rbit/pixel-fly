var spr_index = spr_character_left;
var scale = 2;
switch (dir) {
	case 0:
		spr_index = spr_character_back;
		break;
	case 1:
		spr_index = spr_character_left;
		break;
	case 2:
		spr_index = spr_character_front;
		break;
	case 3:
		spr_index = spr_character_right;
		break;
}
draw_sprite_ext(spr_shadow,0,x,y-0.5,2,2,0,c_white,0.2);
draw_sprite_ext(spr_index,image_index,x,y,scale,scale,0, c_white,1);
