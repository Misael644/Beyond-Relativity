speed = 3;

emitter = audio_emitter_create();
audio_listener_orientation(0, 1, 0, 0, 0, 1);
audio_listener_position(room_width/2, room_height/2, 0);

audio_play_sound_on(emitter, snd_bomb_launch, false, 1);

alarm[0] = 120;