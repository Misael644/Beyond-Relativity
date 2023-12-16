var inst = instance_create_layer(0,room_height,"Instances",obj_bullet);
    
    inst.direction = 45;
    inst.image_angle = 45;
    audio_play_sound(snd_shot, 1, false);

