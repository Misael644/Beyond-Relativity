if mode == "config" {
	switch(button){
		case 0:
			get_string_async("Valor",string(obj_game.BoomRepeat));
			break;
		case 1:
			get_string_async("Valor",string(obj_game.TrailAlpha));
			break;
		case 2:
			get_string_async("Valor",string(obj_game.BulletAlpha));
			break;
		case 3:
			get_string_async("Valor",string(obj_game.BackStar));
			break;
		case 4:
			get_string_async("Valor",string(obj_game.StarRepeat));
			break;
		case 5: //5 deveria ser 4b
			get_string_async("Valor",string(obj_game.StarInterval));
			break;
	};
};

if room == rm_game {
	switch(button){
		case "Cont":
			obj_game.GamePause = false;
			audio_resume_all();
			if instance_exists(obj_ship){obj_ship.speed = obj_ship.LastSpeed};
			break;
		case "Back":
			obj_game.ExitConfirm = true;
			instance_create_layer(room_width/2,room_height/2,"Instances",obj_window);
			break;
	};
};