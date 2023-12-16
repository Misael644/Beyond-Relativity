var Item = irandom_range(1,200);
/*if ClickCount/2 == floor(ClickCount/2) {
	var Item = 195;
} else {
	var Item = 205;
};*/
show_debug_message("será que "+string(ClickCount/2)+" é a mesma coisa que "+string(floor(ClickCount/2))+"?")

if Item > 0 && Item <= 80 {
	var Pup = choose("laser","hp");
	switch(Pup){
		case "laser":
			if Lasers == 1 {
				Lasers = 2
				ItemText = "Lasers Lv. 2";
				audio_play_sound_on(emitter,snd_item_laser,false,1);
			} else {
				obj_game.hp += 20;
				ItemText = "HP + 20";
				audio_play_sound_on(emitter,snd_item_hp,false,1);
			};
			break;
		
		case "hp":
			obj_game.hp += 20;
			ItemText = "HP + 20";
			audio_play_sound_on(emitter,snd_item_hp,false,1);
			break;
	};
} else if Item > 80 && Item <= 120 {
	Pup = choose("laser","hp");
	switch(Pup){
		case "laser":
			if Lasers == 2 {
				Lasers = 3;
				ItemText = "Lasers Lv. 3";
				audio_play_sound_on(emitter,snd_item_laser,false,1);
			} else {
				obj_game.hp += 40;
				ItemText = "HP + 40";
				audio_play_sound_on(emitter,snd_item_hp,false,1);
			};
			break;
		case "hp":
			obj_game.hp += 40;
			ItemText = "HP + 40";
			audio_play_sound_on(emitter,snd_item_hp,false,1);
			break;
	};
} else if Item > 120 && Item <= 140 {
	Pup = choose("passthru","speed+","speed-");
	switch(Pup){
		case "passthru":
			NoCollide = true;
			alarm[0] = room_speed*3;
			alarm[1] = 1;
			ItemText = "Invisible";
			audio_play_sound_on(emitter,snd_item_hp,false,1);
			break;
			
		case "speed+":
			spd *= 2;
			ItemText = "More speed";
			audio_play_sound_on(emitter,snd_item_hp,false,1);
			break;
			
		case "speed-":
			spd /= 2;
			ItemText = "Less speed";
			audio_play_sound_on(emitter,snd_item_hp,false,1);
			break;
	};
} else if Item > 140 && Item <= 190 {
	obj_game.bombs += 1;	
	ItemText = "+ Bomb"
	audio_play_sound_on(emitter,snd_item_bomb,false,1);
} else if Item > 190 && Item <= 200 {
	ItemText = "ZA WARUDO!!!";
	PowerUp = "timestop";
	timeline_index = tml_timestop;
	timeline_speed = 1;
	timeline_running = true;
} else if Item > 200 && Item <= 210 {
	ItemText = "BITES ZA DUSTO";
	PowerUp = "backtime";
	timeline_index = tml_timestop;
	timeline_speed = 1;
	timeline_running = true;
};

with(other){instance_destroy()};
instance_create_layer(x,y,"Instances",obj_pup_text);