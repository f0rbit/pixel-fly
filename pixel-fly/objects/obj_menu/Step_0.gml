if (keyboard_check_released(vk_down)) {
	selected = clamp(selected+1,0,array_length(options)-1);	
} else if (keyboard_check_released(vk_up)) {
	selected = clamp(selected-1,0,array_length(options)-1);	
}
if (keyboard_check_released(vk_space) or keyboard_check_released(vk_enter)) {
	execute_action(options[selected]);	
}

function execute_action(action) {
	switch (string_lower(action)) {
		case "play": {
			room_goto(rm_explore);
			break;
		}	
		case "flydex": {
			break;	
		}
		case "guide": {
			break;	
		}
		case "quit": {
			game_end();
			break;
		}
		default: break;
	}
}