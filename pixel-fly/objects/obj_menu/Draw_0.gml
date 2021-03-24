#region draw options
for (var opt = 0; opt < array_length(options); opt++) {
	var _x = x
	var _y = y+(opt*36);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_menu);
	draw_text(_x,_y,string(options[opt]));
	if (selected == opt) {
		draw_sprite_ext(spr_select_arrow,0,_x-4,_y-2,1.5,1.5,0,c_white,1);
	}
}
#endregion