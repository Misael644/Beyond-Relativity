switch(button){
	case "back":
		sprite_index = spr_button_back;
		break;
		
	case "yes":
		sprite_index = spr_button_yes;
		if obj_game.ExitConfirm = false {instance_destroy()};
		break;
		
	case "no":
		sprite_index = spr_button_no;
		if obj_game.ExitConfirm = false {instance_destroy()};
		break;
		
	case "pause":
		sprite_index = spr_button_pause;
		if os_type != os_android {instance_destroy()};
		break;
};