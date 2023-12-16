/// @description Ponteiro de segundos do relógio
if seconds != 59 {
	seconds += 1;
} else {
	seconds = 0;	
	if minutes != 59 {
		minutes += 1;
	} else {
		minutes = 0;	
		if hours != 23 {
			hours += 1;
		} else {
			hours = 0;	
		};
	};
};

alarm[0] = room_speed;

if PlayTick > 0 {PlayTick -= 1};

if PlayTick == 0 {
	audio_play_sound(snd_clock,1,false);
	PlayTick = 2;
};