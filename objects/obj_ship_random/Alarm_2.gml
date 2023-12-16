Shoot = choose("shoot", "not");

if Shoot == "shoot"{
    var inst = instance_create_layer(x,y,"Instances", obj_bullet);
    
    inst.direction = image_angle;
    inst.image_angle = image_angle;
    audio_play_sound(snd_shot, 1, false);
};

alarm[2] = irandom_range(5,10);;

