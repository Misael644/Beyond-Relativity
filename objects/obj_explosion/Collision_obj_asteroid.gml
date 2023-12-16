if room == rm_game {score += 10};
var PUpChance = irandom_range(1,10);
if PUpChance == 5 {instance_create_layer(x,y,"Instances",obj_pup_box)};
audio_emitter_position(emitter, x, y, 0);
audio_play_sound_on(emitter, snd_explosion, false, 1);

with(other){
    instance_destroy();
    
    if(sprite_index == spr_asteroid_giant){
        obj_logo.alarm[0] = room_speed/2;
        obj_logo.image_alpha = 1;
        repeat(5){
            var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
            new_asteroid.sprite_index = spr_asteroid_huge;
        }
    } else if(sprite_index == spr_asteroid_huge){
        repeat(2){
            var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
            new_asteroid.sprite_index = spr_asteroid_med;
        }
    } else if (sprite_index == spr_asteroid_med){
        repeat(2){
            var new_asteroid = instance_create_layer(x,y,"Instances",obj_asteroid);
            new_asteroid.sprite_index = spr_asteroid_small;
        }
    }
    
    repeat(obj_game.BoomRepeat){
        instance_create_layer(x,y,"Instances",obj_debris);
    }
          
};

//instance_destroy(all); //porraaaaaaaaaaaaaaaaaaaaaaaaa