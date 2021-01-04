// Destroy instance in the event of a wall collision
if place_meeting(x + hspeed, y + vspeed, obj_block){
	instance_destroy();
}


// Enemy collision detection and calculations
var enemy = collision_rectangle(bbox_left + hspeed, bbox_top + vspeed, bbox_right + hspeed, bbox_bottom + vspeed, obj_enemy, true, true);
if enemy{
	with enemy{
		hp--;
		flash_length = 3;
		hit_direction = sign(other.xprevious - x);
	}
	instance_destroy();
}


// Turn off animation once it switches to the bullet sprite
if image_index = 1{
	image_speed = 0;
}


// Destroy instance if it goes out of the room
if x < 0 - sprite_width or x > sprite_width + room_width or y < 0 - sprite_height or y > sprite_height + room_height{
	instance_destroy();
}
