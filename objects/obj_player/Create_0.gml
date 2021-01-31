// General variables
key_left = ord("A");
key_right = ord("D");
key_jump = vk_space;

_x = x;
_y = y;
hspd = 0;
vspd = 0;
grav = 0.3;
movespd = 4;
jumpspd = 8;
has_control = true;
instance_create_layer(0, 0, "Guns", obj_gun);
