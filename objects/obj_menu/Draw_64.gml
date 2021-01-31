draw_set_font(fnt_menu);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for(var i = 0; i < menu_items; i++){
	var col
	var offset = 2;
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i * 1.5));
	
	var txt = menu[i];
	if menu_cursor == i{
		txt = string_insert("> ", txt, 0);
		col = c_white;
	}else{
		col = c_grey;
	}
	
	draw_set_color(c_black);
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy-offset, txt);
	draw_text(xx, yy+offset, txt);
	draw_set_color(col);
	
	draw_text(xx, yy, txt);
}