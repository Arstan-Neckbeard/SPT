menu_x += (menu_x_target - menu_x) / menu_spd;

if menu_control{
	if keyboard_check_pressed(vk_up) menu_cursor++;
	else if keyboard_check_pressed(vk_down) menu_cursor--;
	
	if menu_cursor > menu_items-1 menu_cursor = 0;
	if menu_cursor < 0 menu_cursor = menu_items-1;
	
	if keyboard_check_pressed(vk_enter){
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		screen_shake(4, 30);
		menu_control = false;
	}
}

if menu_x > gui_width + 150 and menu_committed != -1{
	switch menu_committed{
		
		case 2: default: 
			slide_transition(TRANS_MODE.GOTO, rm_room_1);
			break;
			
		case 1:
			break;
			
		case 0:
			game_end();
			break;
			
	}
}