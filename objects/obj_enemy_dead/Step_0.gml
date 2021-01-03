// If the object has not hit the ground
if not at_rest{
	
	
	// General movement calculations
	vspd = vspd + grav;


	// Horizontal collision detection
	if place_meeting(_x + hspd, _y, obj_block){
		while not place_meeting(_x + sign(hspd), _y, obj_block){
			_x += sign(hspd);
		}
		hspd = 0;
	}


	// Vertical collision detection
	if place_meeting(_x, _y + vspd, obj_block){
		if vspd > 0{
			at_rest++;
			image_index = 1;
		}
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
}
