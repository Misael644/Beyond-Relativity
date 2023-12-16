if mode == "drag" {
	if (mouse_check_button_pressed(mb_left)){
	    drag = instance_position(mouse_x, mouse_y, obj_clickable_text);
	};
	if (mouse_check_button_released(mb_left)){
	    drag = noone;
	};
	if (drag != noone){
	    with(drag){
	        x = mouse_x;
	        y = mouse_y;
	        HoldState = "grab";
	    }
	}
};

if keyboard_check_pressed(ord("M")){
	switch(mode){
		case "drag":
			mode = "config";
			break;
		case "config":
			mode = "drag";
			break;
	};
};

if room == rm_game {
	if obj_game.GamePause == false {instance_destroy()};
	depth = -100;
};