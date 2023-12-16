switch(button){
	case "back":
		room_goto(rm_start);
		break;
		
	case "yes":
		room_goto(rm_start);
		obj_game.ExitConfirm = false;
		obj_game.GamePause = false;
		break;
		
	case "no":
		obj_game.ExitConfirm = false;
		break;
		
	case "pause":
		if obj_game.GamePause == false {
			obj_game.GamePause = true;
			audio_pause_all();
			var ContButton = instance_create_layer(126,300,"Instances",obj_clickable_text);
			var BackButton = instance_create_layer(126,340,"Instances",obj_clickable_text);
			ContButton.button = "Cont";
			BackButton.button = "Back";
		} else {
				obj_game.GamePause = false;
				audio_resume_all();
				if instance_exists(obj_ship){obj_ship.speed = obj_ship.LastSpeed};
			//if ExitConfirm == true && keyboard_check_pressed(vk_enter){game_restart()};
		};
};