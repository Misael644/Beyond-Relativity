switch(room){
	case rm_start:
	    if !audio_is_playing(msc_start){audio_play_sound(msc_start, 2, true)};
		if audio_is_playing(msc_song){audio_stop_sound(msc_song)};
		if audio_is_playing(msc_gameover){audio_stop_sound(msc_gameover)};
		score = 0;
		lives = 2;
		hp = 100;
		bombs = 0;
		MovBack = "";
		
		ShowHScoresAlpha = 1;
		ShowHScoresAlphaMode = "in";
		ShowHScoresWait = 0;
		break;
	
	case rm_game:
		audio_stop_sound(msc_start);
		//Criar a safffaaaadaaaaaaaa
		instance_create_layer(room_width/2,room_height/2,"Instances",obj_ship);
	    if !audio_is_playing(msc_song){audio_play_sound(msc_song, 2, true)};
		//yo mano conserta esses bagui de channel aí
		//C1 = Sons; C2 = Música; C3 = ?;
    
	    repeat(6){
	        var xx = choose(
	            irandom_range(0, room_width*0.3),
	            irandom_range(room_width*0.7, room_width)
	        );
	        var yy = choose(
	            irandom_range(0, room_height*0.3),
	            irandom_range(room_height*0.7, room_height)
	        );
	        instance_create_layer(xx,yy,"Instances",obj_asteroid);
	    }
    
	    alarm[0] = 60;
    
	    //Moving Backgrounds
    
	    // 1 = solar, 2 = stars
	    // 3 = nebula, 4 = milky
	    // 5 = bhole
	    if MovBack == "" {MovBack = choose("solar","stars","nebula","milky")};
		
		var lay_id = layer_get_id("Background");
		var back_id = layer_background_get_id(lay_id);
    
	    switch(MovBack){
	        case "solar":
				layer_background_sprite(back_id, bcg_solar);
	            instance_create_layer(0, 0,"Instances", obj_bcg_solar_1);
	            instance_create_layer(0, 0,"Instances", obj_bcg_solar_2);
				obj_starcreator.StarCreate = false;
	            break;
        
	        case "stars":
				layer_background_sprite(back_id, bcg_stars);
	            instance_create_layer(20, 0,"Instances", obj_starcreator);
	            obj_starcreator.StarCreate = true;
	            break;
        
	        case "nebula":
				layer_background_sprite(back_id, bcg_nebulamagna);
	            instance_create_layer(20, 0,"Instances", obj_starcreator);
	            obj_starcreator.StarCreate = true;
	            break;
			
			case "milky":
	            instance_create_layer(20, 0,"Milky", obj_milky);
				layer_background_destroy(back_id);
				obj_starcreator.StarCreate = false;
	            break;
        
	        case "bhole":
				layer_background_sprite(back_id, bcg_1_3);
	            instance_create_layer(0, 0,"Instances", obj_bcg_bhole_1);
	            instance_create_layer(0, 0,"Instances", obj_bcg_bhole_2);
	            instance_create_layer(20, 0,"Instances", obj_starcreator);
	            obj_starcreator.StarCreate = false;
	            break;
			};
			
			if alarm[2] == -1 {
				//alarm[2] = 60;
			};
			break;
	
	case rm_intro:
	    timeline_index = tml_intro;
	    timeline_speed = 1;
	    timeline_running = true;
		break;
	
	case rm_win:
		if score > HScore {
			if file_exists("sv_score") {file_delete("sv_score")};
		    var SaveFile = file_text_open_write("sv_core");
		    file_text_write_real(SaveFile,score);
		    file_text_close(SaveFile);
		};
	
		audio_play_sound(snd_win, 1, false);
		break;
		
	case rm_gameover:
		SaveCheck = true;
		for(var i = 0; i < 8; i++){
			if SaveCheck == true {
				if score > HScore[i] && cheated == false {
					HScoreStep = 1;
					HScoreIndex = i;
					keyboard_string = "";
					show_debug_message("O score de "+string(score)+" é maior que o highscore nº "+string(i)+" de "+string(HScore[i]));
				
					for(var j = 7; j > i; j--){
						if j != 0 {
							show_debug_message("O HScore de "+string(HScore[j])+"...");
							HScore[j] = HScore[j-1];
							show_debug_message("...virou "+string(HScore[j])+"!");
							show_debug_message("A posição do "+string(HScoreNames[j])+"...");
							HScoreNames[j] = HScoreNames[j-1];
							show_debug_message("...foi trocada pela do "+string(HScoreNames[j])+"!");
						};
					};
					
					HScore[i] = score;
					
					SaveCheck = false;
				};
			} else {
				show_debug_message("ok PARO");	
			};
		};
		
		audio_stop_sound(msc_song);
		audio_play_sound(msc_gameover, 2, false);
		break;
		
	case rm_game2:
		bombs = 1000;
		break;
		
	case rm_titlerender:
		TitleRender = surface_create(1280,360);
		break;
};

OptSelect = 0;