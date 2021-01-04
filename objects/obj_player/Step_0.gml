// General movement calculations
if has_control{
	var move = keyboard_check(key_right) - keyboard_check(key_left);
	hspd = move * movespd;
	vspd += grav;


	// Check for jumping
	if keyboard_check_pressed(key_jump) and place_meeting(x, y + 1, obj_block){
		vspd = -jumpspd;
	}
}else{
	hspd = 0;
	vspd = 0;
}


// Horizontal collision detection
if place_meeting(_x + hspd, _y, obj_block){
	while not place_meeting(_x + sign(hspd), _y, obj_block){
		_x += sign(hspd);
	}
	hspd = 0;
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
if not place_meeting(x, y + 1, obj_block){	// If there is not a block below the instance,
	sprite_index = spr_player_air;			// set its sprite to the 'jump' sprite
	image_speed = 0;						// and disable its sprite animation.
	if sign(vspd){							// If the instance is travelling upward,
		image_index = 1;					// set its frame to the 'upward' image,
	}else{									// otherwise,
		image_index = 0;					// set its frame to the 'downward' image.
	}
}else{										// If there is a block below the instance,
	image_speed = 1;						// enable sprite animation.
	if hspd == 0{							// If the instance is not moving horizontally,
		sprite_index = spr_player;			// set its sprite to the 'idle' sprite,
	}else{									// otherwise,
		sprite_index = spr_player_walk;		// set its sprite to the 'walking' sprite.
	}
}

if hspd != 0{								// If the instance is moving horizontally,
	image_xscale = sign(hspd);				// flip its sprite to match its direction.
}
