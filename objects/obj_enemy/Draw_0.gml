// Turn on the flash shader if the flash_length variable has been set
if flash_length{
	shader_set(sh_flash);
}


// Execute the standard draw action
draw_self();


// Reset the shader
shader_reset();
