// Attach the object to the player, one frame behind
x = floor(obj_player.xprevious);
y = floor(obj_player.yprevious+10);


// Point the sprite toward the mouse cursor
image_angle = point_direction(x, y, mouse_x, mouse_y);


// Subtract one from the recoil_offset, down to zero
recoil_offset = max(0, recoil_offset - 1);


// Shoot bullets
if mouse_check_button(fire_button) and !ready_to_fire--{
	recoil_offset = recoil_distance;
	ready_to_fire = rate_of_fire;
	with instance_create_layer(x, y, "Bullets", obj_bullet){
		image_angle = other.image_angle + random_range(-3, 3);
		direction = image_angle;
	}
	screen_shake(2, 5);
}


// Offset the sprite based on the recoil_offset
x -= lengthdir_x(recoil_offset, image_angle);
y -= lengthdir_y(recoil_offset, image_angle);


// Flip the sprite based on its rotation
if image_angle > 90 and image_angle < 270{
	image_yscale = -1;
}else{
	image_yscale = 1;
}
