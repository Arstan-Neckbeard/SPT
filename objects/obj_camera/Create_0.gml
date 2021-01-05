// View to control
cam = view_camera[0];


// Object to follow
if instance_exists(obj_player){
	target = obj_player;
}else{
	target = self;
}


//General variables
cam_speed = 25;
view_x_half = camera_get_view_width(cam) / 2;
view_y_half = camera_get_view_height(cam) / 2;
x_dest = target.x;
y_dest = target.y;
_x = x;
_y = y;


shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;