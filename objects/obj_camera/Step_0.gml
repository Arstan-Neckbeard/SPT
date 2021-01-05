// Update camera destination
if instance_exists(target){
	x_dest = target.x;
	y_dest = target.y;
}


// Update camera position
_x += floor((x_dest - _x) / cam_speed);
_y += floor((y_dest - _y) / cam_speed);


// Keep camera within room boundaries
_x = clamp(_x, view_x_half + buff, room_width - view_x_half - buff);
_y = clamp(_y, view_y_half + buff, room_height - view_y_half - buff);

// Screen shake
_x += random_range(-shake_remain, shake_remain);
_y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Update camera view
camera_set_view_pos(cam, _x - view_x_half, _y - view_y_half);


if layer_exists("Mountains"){
	layer_x("Mountains", _x / 2)
}
if layer_exists("Trees"){
	layer_x("Trees", _x / 4);
}