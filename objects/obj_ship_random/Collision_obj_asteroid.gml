instance_create_layer(room_width/2,room_height/2,"Instances",obj_ship_random);

//audio_emitter_position(emitter, x, y, 0);
//audio_play_sound_on(emitter, snd_explosion, false, 100);

instance_destroy();

repeat(obj_game.BoomRepeat){
    instance_create_layer(x,y,"Instances",obj_debris);
};

