if GamePause == true {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	var c = c_lime;
	draw_text_transformed_colour(room_width/2,room_height/2, "GAME PAUSED",3, 3, 0, c,c,c,c, 1);
	draw_set_halign(fa_left);
	var c = c_aqua;
	draw_text_colour(room_width/4-40, PointerY, ">",c,c,c,c,1);
	draw_text(room_width/4, room_height/2+60,"Continue");
	draw_text(room_width/4, room_height/2+100,"Return to main menu");
};

if TimeStop == true {
	if !instance_exists(obj_ship){
		view_enabled = false;
		TimeStop = false;
		audio_resume_sound(msc_song);
		instance_destroy(obj_invertfx);
		instance_destroy(obj_clock);
	};
};

if SpawnMode == true {
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	draw_text(mouse_x,mouse_y,object_get_name(SpawnObj));
};

if instance_exists(obj_ship) && obj_ship.parasite == true {
	var cr = c_red;
	var cb = c_black;
	gpu_set_blendmode_ext(bm_dest_colour,bm_zero);
	draw_rectangle_color(0,0,room_width,room_height,cr,cr,cr,cr,false);	
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(0.5);
	for(var i = 0; i < room_height; i++){
		if i/2 == floor(i/2) {draw_line_color(0,i+ScanSwitch,room_width,i+ScanSwitch,cb,cb)};
	};
	draw_set_alpha(1);
		
	draw_sprite(spr_aim,1,obj_ship.ParasiteX,obj_ship.ParasiteY);
	
	if instance_position(obj_ship.ParasiteX,obj_ship.ParasiteY,obj_asteroid) != noone {
		var WhichAst = instance_position(obj_ship.ParasiteX,obj_ship.ParasiteY,obj_asteroid);
		
		if AstAlphaState == "in" {
			if SelectAstAlpha < 1 {
				SelectAstAlpha += 1/60;
			} else {
				AstAlphaState = "out";	
			};
		} else if AstAlphaState == "out"  {
			if SelectAstAlpha > 0 {
				SelectAstAlpha -= 1/60;
			} else {
				AstAlphaState = "in";	
			};	
		};
		
		with(WhichAst){
			draw_set_alpha(obj_game.SelectAstAlpha);
				gpu_set_fog(true,c_lime,0,0);
				draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,obj_game.SelectAstAlpha);
				gpu_set_fog(false,c_black,0,0);
			draw_set_alpha(1);
		};
	} else {
		AstAlphaState = "in";
		SelectAstAlpha = 0;
	};
};

if room == rm_titlerender {
	surface_set_target(TitleRender);
		
		draw_sprite_ext(spr_new_title, 0, room_width/2, room_height/2-NewT_YShiftGoal, NewT_ScaleGoal, NewT_ScaleGoal, 0, c_lime, 1);
		
		//if NewT_ScaleGoal-NewT_Scale >= 0.01 {
			draw_sprite_ext(spr_new_title, 0, room_width/2, room_height/2-NewT_YShift, NewT_Scale, NewT_Scale, 0, #BC0000, 1);
		//};
		
		if NewT_YShift < NewT_YShiftGoal {
			NewT_YShift += 1;
		};
		
		/*if NewT_ScaleRate == 0 {
			NewT_ScaleRate = (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
		};*/
		
		if NewT_Scale < NewT_ScaleGoal {
			NewT_Scale += (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
		};
		
		//show_debug_message("("+string(NewT_ScaleGoal)+"-"+string(NewT_Scale)+")/("+string(NewT_YShiftGoal)+"-"+string(NewT_YShift)+") = "+string((NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift)));
		show_debug_message(string(NewT_ScaleGoal)+" - "+string(NewT_Scale)+" = "+string(NewT_ScaleGoal-NewT_Scale));
		
		if keyboard_check_pressed(189){
			NewT_YShiftGoal -= 1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			NewT_ScaleRate = (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
			draw_clear(c_black);
		};
		
		if keyboard_check_pressed(187){
			NewT_YShiftGoal += 1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			NewT_ScaleRate = (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
			draw_clear(c_black);
		};
		
		if keyboard_check_pressed(219){
			NewT_ScaleGoal -= 0.1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			NewT_ScaleRate = (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
			draw_clear(c_black);
		};
		
		if keyboard_check_pressed(221){
			NewT_ScaleGoal += 0.1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			NewT_ScaleRate = (NewT_ScaleGoal-NewT_Scale)/(NewT_YShiftGoal-NewT_YShift);
			draw_clear(c_black);
		};
		
		draw_sprite_ext(spr_new_title, 0, room_width/2, room_height/2, 1, 1, 0, #605F61, 1);
	surface_reset_target();
	
	draw_surface(TitleRender,0,0);
};

/*if room == rm_game {
	draw_set_alpha(0.75);
	draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	
	with(all){
		if sprite_index != -1 {
			if instance_exists(obj_ship){
				var z = (abs(y-obj_ship.y)/obj_ship.y);
				var yTrans = (y-obj_ship.y/2)/z+obj_ship.y/2;
				var scale = yTrans/(obj_ship.y/2);
				
				if z < 1 {
					draw_sprite_ext(sprite_index,image_index,(x-obj_ship.x)/z+obj_ship.x,yTrans,scale,scale,image_angle,image_blend,image_alpha);
					//draw_text((x-obj_ship.x)/z+obj_ship.x,yTrans,z);
				};
			};
		};
	};
};*/