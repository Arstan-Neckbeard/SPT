// Die if HP is at zero
if not hp{
	instance_destroy();
	with instance_create_layer(x, y, "Enemies", obj_enemy_dead){
		if other.hit_direction{
			hspd = -hspd;
			image_xscale = -image_xscale;
		}
	}
}


// General movement calculations
vspd = vspd + grav;


// Horizontal collision detection
if place_meeting(_x + hspd, _y, obj_block){
	while not place_meeting(_x + sign(hspd), _y, obj_block){
		_x += sign(hspd);
	}
	hspd = -hspd;
}


// Vertical collision detection
if place_meeting(_x, _y + vspd, obj_block){
	while not place_meeting(_x, _y + sign(vspd), obj_block){
		_y += sign(vspd);
	}
	vspd = 0;
}


// Apply the calculated movements to temporary variables
_x += hspd;
_y += vspd;


// Round down to prevent subpixel rendering
x = floor(_x);
y = floor(_y);


// Animation
if not place_meeting(x, y + 1, obj_block){
	sprite_index = spr_enemy_air;
	image_speed = 0;
	if sign(vspd){
		image_index = 1;
	}else{
		image_index = 0;
	}
}else{
	image_speed = 1;
	if hspd == 0{
		sprite_index = spr_enemy;
	}else{
		sprite_index = spr_enemy_walk;
	}
}

if hspd != 0{
	image_xscale = sign(hspd);
}

if flash_length{
	flash_length--;
}
