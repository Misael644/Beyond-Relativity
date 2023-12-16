if obj_game.GamePause == false {
	if PreStop == false {
		if(keyboard_check (vk_left)){
		   image_angle = image_angle + 5;
		}

		if(keyboard_check (vk_right)){
		   image_angle = image_angle - 5;
		}

		if(keyboard_check (vk_up)){
		    motion_add(image_angle, spd);
		}

		if obj_game.shoot {			
			switch(Lasers){
				case 1:
			
					var inst = instance_create_layer(x,y,"Instances",obj_bullet);
				
					inst.direction = image_angle;
					inst.image_angle = image_angle;
				
				    audio_play_sound_on(emitter, snd_shot, false, 1);
					break;
			
				case 2:
				case 3:
			
				    var inst1 = instance_create_layer(x + lengthdir_x(5,image_angle+90),y + lengthdir_y(5,image_angle+90),"Instances",obj_bullet);
					var inst2 = instance_create_layer(x + lengthdir_x(5,image_angle-90),y + lengthdir_y(5,image_angle-90),"Instances",obj_bullet);
    
				    inst1.direction = image_angle;
				    inst1.image_angle = image_angle;
					inst2.direction = image_angle;
				    inst2.image_angle = image_angle;
    
				    audio_play_sound_on(emitter, snd_shot, false, 1);
					break;
			};
			ray = instance_create_layer(x,y,"Instances",obj_ray);
			ray.state = "creating";
		};
		if obj_game.shoothold{
			RaySize += 1/30;
		};
	
		if obj_game.shootrel {
			if RaySize == 1 {
				ray.state = "launch";
				//ray.direction = point_direction(ray.x,ray.y,RayTarget.x,RayTarget.y);
				//RayTarget = noone;
			} else {
				instance_destroy(ray);
			};
			ray = noone;
			RaySize = 0;
		};
	
	
		if obj_game.bombrel {
			if obj_game.bombs > 0 {
				var inst = instance_create_layer(x,y,"Instances",obj_bomb);		
				inst.direction = image_angle;
				obj_game.bombs -= 1;
			};
		};
		LastSpeed = speed;
		RaySize = clamp(RaySize, 0, 1);
		
		if obj_game.bomb {
			if BombHost != noone {
				if instance_exists(BombHost) {
					instance_create_layer(BombHost.x,BombHost.y,"Instances",obj_bomb);
					BombHost = noone;
				} else {
					BombHost = noone;
				};
			};
		};
	} else {
		speed = 0;	
	};
	
	if parasite == true {
		if keyboard_check(vk_left){ParasiteX -= 1};
		if keyboard_check(vk_right){ParasiteX += 1};
		if keyboard_check(vk_up){ParasiteY -= 1};
		if keyboard_check(vk_down){ParasiteY += 1};
		
		if obj_game.bomb {
			if instance_position(ParasiteX,ParasiteY,obj_asteroid) != noone {
				var WhichAst = instance_position(ParasiteX,ParasiteY,obj_asteroid);
				
				BombHost = WhichAst;
			};
			
			parasite = false;
			PreStop = false;
			view_enabled = false;
			obj_game.TimeStop = false;
			audio_resume_sound(msc_song);
		};
	};
} else {
	speed = 0;	
};

move_wrap(true,true,sprite_width/2);

if speed > 0 {
	instance_create_layer(x,y,"Instances",obj_ship_trail);
	/*if !audio_is_playing(snd_fly){audio_play_sound_on(emitter, snd_fly, true, 99)};
	audio_sound_pitch(snd_fly,speed);*/
};

if(keyboard_check_pressed(ord("0"))){speed = 0};

audio_emitter_position(emitter, x, y, 0);

if DamageAlpha > 0 {DamageAlpha -= 1/30};

if instance_exists(ray){
	if ray.state = "creating"{
		ray.x = x + lengthdir_x(15, image_angle);
		ray.y = y + lengthdir_y(15, image_angle);
		ray.image_xscale = RaySize;
		ray.image_yscale = RaySize;
	};
};

if RaySize == 1 {
	var LineCol = collision_line(x, y, x + lengthdir_x(room_width,image_angle),y + lengthdir_y(room_width,image_angle), obj_asteroid, false, true);
	if LineCol != noone {RayTarget = LineCol};
};

if room == rm_game {
	if instance_exists(RayTarget) {
		obj_aim.x = RayTarget.x; obj_aim.y = RayTarget.y
	} else {
		obj_aim.x = -64; obj_aim.y = -64;
		RayTarget = noone;
	};
};