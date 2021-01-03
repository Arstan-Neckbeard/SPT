// Update camera destination
if instance_exists(target){
	x_dest = target.x;
	y_dest = target.y;
}


// Update camera position
_x += floor((x_dest - _x) / cam_speed);
_y += floor((y_dest - _y) / cam_speed);


// Keep camera within room boundaries
_x = clamp(_x, view_x_half, room_width - view_x_half);
_y = clamp(_y, view_y_half, room_height - view_y_half);


// Update camera view
camera_set_view_pos(cam, _x - view_x_half, _y - view_y_half);
