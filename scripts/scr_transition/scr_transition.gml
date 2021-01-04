// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function slide_transition(mode, target_room){
	with obj_transition{
		self.mode = mode
		
		if argument_count > 1{
			self.target = target_room
		}
	}
}