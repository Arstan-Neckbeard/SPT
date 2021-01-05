function screen_shake(magnitude, frames){
	if instance_exists(obj_camera){
		with obj_camera{
			if magnitude > shake_remain{
				shake_magnitude = magnitude;
				shake_remain = magnitude;
				shake_length = frames;
			}
		}
	}
}