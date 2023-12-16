//Configuração de controles PC e mobile
if os_type == os_android {
	shoot = keyboard_check_pressed(ord("1"));
	shoothold = keyboard_check(ord("1"));
	shootrel = keyboard_check_released(ord("1"));
	bomb = keyboard_check_pressed(ord("2"));
	bombrel = keyboard_check_released(ord("2"));
	enter = keyboard_check_pressed(ord("3"));
} else {
	shoot = keyboard_check_pressed(ord("X"));
	shoothold = keyboard_check(ord("X"));
	shootrel = keyboard_check_released(ord("X"));
	bomb = keyboard_check_pressed(ord("C"));
	bombrel = keyboard_check_released(ord("C"));
	enter = keyboard_check_pressed(vk_enter);
};

switch(room) {
	case rm_start:
		if keyboard_check_pressed(vk_space){
			ShowHScores = !ShowHScores;	
		};
		
		if ShowHScores == false {
			if ShowHScoresAlphaMode == "in" {
				if ShowHScoresAlpha < 1 {
					ShowHScoresAlpha += 1/120;
				} else {
					ShowHScoresWait++;
			
					if ShowHScoresWait > 60*10 {
						ShowHScoresAlphaMode = "out";
					};
				};
			} else {			
				if ShowHScoresAlpha > 0 {
					ShowHScoresAlpha -= 1/120;
				} else {
					ShowHScores = true;
					ShowHScoresWait = 0;
					ShowHScoresAlphaMode = "in";
				};
			};
		} else {
			if ShowHScoresAlphaMode = "in" {
				if ShowHScoresAlpha < 1 {
					ShowHScoresAlpha += 1/120;
				} else {
					ShowHScoresWait++;
				
					if ShowHScoresWait > 60*10 {
						ShowHScoresAlphaMode = "out";	
					};
				};
			} else {
				if ShowHScoresAlpha > 0 {
					ShowHScoresAlpha -= 1/120;
				} else {
					ShowHScores = false;
					ShowHScoresWait = 0;
					ShowHScoresAlphaMode = "in";
				};
			};
		};
	break;
	
	case rm_game:
		hp = clamp(hp,0,100);
		if TimeStop == false {
			img_rot += 0.10;		
		};
	
	    /*if Min == 3 {
	        object_set_persistent(obj_star,false);
	        with(obj_star){instance_destroy()};
	        room_goto(rm_win);
	    };*/
    
	    if(lives <= 0){
	        object_set_persistent(obj_star,false);
	        with(obj_star){instance_destroy()};
	        room_goto(rm_gameover);
	    };
		
		//Pausar o jogo
		if GamePause == true {
			if keyboard_check_pressed(vk_up){PointerY = room_height/2+60};
			if keyboard_check_pressed(vk_down){PointerY = room_height/2+100};
			alarm[2] += 1;
		};
		if keyboard_check_pressed(vk_enter){
			if GamePause == false {
				GamePause = true;
				audio_pause_all();
				var ContButton = instance_create_layer(126,300,"Instances",obj_clickable_text);
				var BackButton = instance_create_layer(126,340,"Instances",obj_clickable_text);
				ContButton.button = "Cont";
				BackButton.button = "Back";
			} else {
				if PointerY == room_height/2+60 {
					GamePause = false;
					audio_resume_all();
					if instance_exists(obj_ship){obj_ship.speed = obj_ship.LastSpeed};
				} else if PointerY = room_height/2+100 && enter {
					ExitConfirm = true;
					instance_create_layer(room_width/2,room_height/2,"Instances",obj_window);
				};
			};
		};
	break;
	
	case rm_gameover:
	case rm_win:
	
	switch(HScoreStep) {
		case 0:
		if keyboard_check_pressed(vk_enter){
			room_goto(rm_start);
			ShowHScores = false;
		};
		break;
		
		case 1:
		if keyboard_check_pressed(vk_enter){
			HScoreStep = 2;
			audio_stop_sound(msc_gameover);
			audio_play_sound(snd_win,1,false);
			keyboard_string = "";
		};
		break;
		
		case 2:
		HScoreScrWait++;
		
		if HScoreScrWait == 60*30 {
			if keyboard_string == "" {
				keyboard_string = HScoreNames[HScoreIndex];
			};
			HScoreStep = 3;
			HScoreScrWait = 0;
		};
		
		if keyboard_check_pressed(vk_enter){
			if keyboard_string != "" {
				HScoreStep = 3;
				HScoreScrWait = 0;
			};
		};
		break;
		
		case 3:
		BlinkUlWait = 0;
		BlinkUnderl = "";
		
		HScoreScrWait++;
		if HScoreScrWait == 300 {
			HScoreNames[HScoreIndex] = keyboard_string;
			
			var DataSave = ds_map_create();

			for(var i = 0; i < 8; i++){
				DataSave[? "HScore"+string(i)] = HScore[i];
				DataSave[? "Names"+string(i)] = HScoreNames[i];
			};

			ds_map_secure_save(DataSave,"sv_score");
			ds_map_destroy(DataSave);
			
			room_goto(rm_start);
			ShowHScores = true;
			HScoreStep = 0;
		};
		break;
	};
	break;
	
	case rm_config:
		if (mouse_check_button_pressed(mb_left)){drag = instance_position(mouse_x, mouse_y, obj_clickable_text)};
		if (drag != noone){with(drag){HoldState = "grab"}};
	break;
};

if keyboard_check_pressed(vk_up){OptSelect -= 1};
if keyboard_check_pressed(vk_down){OptSelect += 1};

if DebugMode == true && keyboard_check_pressed(ord("S")){SpawnMode = !SpawnMode};

if mouse_wheel_down(){SpawnObj += 1};
if mouse_wheel_up(){SpawnObj -= 1};

if bmode != 0 {if keyboard_check_pressed(189){bmode -= 1}};
if bmode != 10 {if keyboard_check_pressed(187){bmode += 1}};

if bmode2 != 0 {if keyboard_check_pressed(219){bmode2 -= 1}};
if bmode2 != 10 {if keyboard_check_pressed(221){bmode2 += 1}};

if room != rm_gameover {
	if string_lower(string_copy(keyboard_string, string_length(keyboard_string)-5, 6)) == "misael" {
		if DebugMode == false {
			audio_play_sound(snd_item_laser,1,false);
		} else {
			audio_play_sound(snd_damage,1,false);
			SpawnMode = false;
		};
		DebugMode = !DebugMode;
		keyboard_string = "";
	};
};