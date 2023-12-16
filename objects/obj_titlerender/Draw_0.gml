//if room == porra {
	surface_set_target(TitleRender);
		draw_sprite_ext(spr_new_title, 0, room_width/2, room_height/2-NewT_YShift, NewT_Scale, NewT_Scale, 0, #BC0000, 1);
		
		if NewT_YShift < NewT_YShiftGoal {
			NewT_YShift += 1;	
		};
		
		if NewT_Scale < 1.5 {
			NewT_Scale += 0.5/NewT_YShiftGoal;	
		};
		
		if keyboard_check_pressed(189){
			NewT_YShiftGoal -= 1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			draw_clear(c_black);
		};
		
		if keyboard_check_pressed(187){
			NewT_YShiftGoal += 1;
			NewT_YShift = 0;
			NewT_Scale = 1;
			draw_clear(c_black);
		};
		
		draw_sprite_ext(spr_new_title, 0, room_width/2, room_height/2, 1, 1, 0, #605F61, 1);
	surface_reset_target();
//};