#define scr_getinputs

// Get player input
key_left = -keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

key_restart = keyboard_check(ord('Q'));
