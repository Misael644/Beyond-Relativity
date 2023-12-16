draw_set_font(fnt_text);
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_arial);

//Debug text
draw_text(room_width, 0, "FPS: "+string(fps));
if room != rm_config {
	if DebugMode == true {
		/*if instance_exists(obj_ship){
			
		};*/
		draw_text(640, 20, "OS: "+string(os_type));
		draw_text(640, 40, "BCG: "+string(MovBack));
		draw_text(640, 60, "AstAlphaState: "+string(AstAlphaState));
		draw_text(640, 80, "SelectAstAlpha: "+string(ShowHScoresAlpha));
		if instance_exists(obj_ship){draw_text(640, 100, "WhichAst: "+string(instance_position(obj_ship.ParasiteX,obj_ship.ParasiteY,obj_asteroid)))};
		draw_text(640, 120, "keyboard_string: "+string_lower(string_copy(keyboard_string, string_length(keyboard_string)-5, 6)));
		if instance_exists(obj_invertfx){draw_text(640, 140, "radius: "+string(obj_invertfx.radius))};
	};
} else {
	draw_text(640,0, "Drag: "+string(drag));	
};

//Valores de tempo
//var F_Sec = string_replace_all(string_format(Sec,2,0)," ","0")

switch(room){
    case rm_game:
        draw_set_font(fnt_text);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
        draw_text(20, 20, "SCORE: "+string(score));
        draw_text(20, 40, "LIVES: "+string(lives));
		draw_text(20, 60, "HP: ");
		draw_healthbar(70, 60, 170, 80, hp, c_gray, c_red, c_lime, 0, true, true)
		draw_text(20, 80, "BOMBS: "+string(bombs));
		//draw_text(20, 100,"TIME: "+string(Min)+":"+string(F_Sec));
		break;

    case rm_start:
        draw_set_font(fnt_text);
        draw_set_halign(fa_center);
		draw_set_alpha(ShowHScoresAlpha);
		
		if ShowHScores == false {
	        draw_text(room_width/2, 460, "(C) 2023 Misael64");
		} else {
			draw_text(room_width/2, 40, "HIGHSCORES");
			
			for(var i = 0; i < 8; i++){
				draw_set_halign(fa_left);
				draw_text(room_width/3, room_height/3+i*40, HScoreNames[i]);
				
				draw_set_halign(fa_center);
				draw_text(room_width/3*2, room_height/3+i*40, HScore[i]);
			};
		};
		draw_set_alpha(1);
        break;
    
    case rm_win:
        draw_set_halign(fa_center);
        var c = c_lime;
        draw_text_transformed_colour(room_width/2,100, "LEVEL\nCOMPLETE",3, 3, 0, c,c,c,c, 1);
		if score <= HScore {draw_text(room_width/2, 300,"FINAL SCORE: "+string(score));
			} else if score > HScore {draw_text(room_width/2, 300,"FINAL SCORE: "+string(score)+" (NEW RECORD!!)")}
        draw_text(room_width/2, 320,"PRESS ENTER TO RESTART");
        draw_set_halign(fa_left);
        break;
    
    case rm_gameover:
        draw_set_halign(fa_center);
		draw_set_font(fnt_text);
        var c = c_red;
        draw_text_transformed_colour(room_width/2, 150, "GAME OVER", 3, 3, 0, c,c,c,c, 1);
		
		draw_text(room_width/2, 250,"FINAL SCORE: "+string(score));
		
        draw_text(room_width/2, 300,"PRESS ENTER TO RESTART");
		
		if HScoreStep > 1 {
			var cr = c_red;
			draw_text_transformed_color(room_width/2, 320, "NEW RECORD!", 2, 2, 0, cr, cr, cr, cr, 1);
			
			BlinkUlWait++;
			if BlinkUlWait == 10 {
				if BlinkUnderl == "" {
					BlinkUnderl = "_";
				} else {
					BlinkUnderl = "";
				};
				BlinkUlWait = 0;
			};
			keyboard_string = string_copy(keyboard_string,0,8);
			PlayerName = keyboard_string+BlinkUnderl
			
			draw_text(room_width/2, 350, "WRITE YOUR NAME:");
			draw_set_halign(fa_left);
			draw_text(257, 370, PlayerName);
		};
        draw_set_halign(fa_left);
        break;
		
	case rm_config:
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text_ext(20,(room_height/5)*1,"*REPETIR "+string(BoomRepeat)+" VEZ(ES) O NÚMERO DE CRIAÇÃO DE PARTÍCULAS DAS EXPLOSÕES",20,room_width-20);
		draw_text_ext(20,(room_height/5)+60,"*A TRANSPARÊNCIA DO RASTRO DA NAVE DIMINUIRÁ "+string(TrailAlpha)+" A CADA QUADRO.",20,room_width-20);
		draw_text_ext(20,(room_height/5)+120,"*A TRANSPARÊNCIA DO RASTRO DAS BALAS DIMINUIRÁ "+string(BulletAlpha)+" A CADA QUADRO.",20,room_width-20);
		draw_text_ext(20,(room_height/5)+180,"*CRIAR "+string(BackStar)+" ESTRELA(S) NO BACKGROUND AO INICIAR UMA SALA.",20,room_width-20);
		draw_text_ext(20,(room_height/5)+240,"*CRIAR "+string(StarRepeat)+" ESTRELA(S) A CADA "+string(StarInterval)+" QUADRO(S) NA TELA DE INÍCIO",20,room_width-20);
		break;
		
	case rm_titlerender:
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(0,0,"YShiftGoal: "+string(NewT_YShiftGoal));
		draw_text(0,20,"ScaleGoal: "+string(NewT_ScaleGoal));
		break;
};

/*if position_meeting(mouse_x, mouse_y, all) {
    var ObjCheck = instance_position(mouse_x, mouse_y, all).object_index;
    draw_set_colour(c_lime);
	draw_text(mouse_x, mouse_y, string(object_get_name(ObjCheck)));
};*/

/*draw_rectangle_color(0,0,room_width/3,room_height/3*2,c_red,c_red,c_red,c_red,false);
draw_rectangle_color(room_width/3,0,room_width/3*2,room_height/3*2,c_lime,c_lime,c_lime,c_lime,false);
draw_rectangle_color(room_width/3*2,0,room_width,room_height/3*2,c_blue,c_blue,c_blue,c_blue,false);
draw_rectangle_color(0,room_height/3*2,room_width/2,room_height,c_white,c_white,c_white,c_white,false);
draw_rectangle_color(room_width/2,room_height/3*2,room_width,room_height,c_black,c_black,c_black,c_black,c_black);*/