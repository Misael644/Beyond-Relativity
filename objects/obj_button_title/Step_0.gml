if obj_game.enter {
	if button == obj_game.OptSelect {
		switch(button){
		    case 0:
		        room_goto(rm_game);
		        break;
        
		    case 1:
		        room_goto(rm_config);
		        break;
        
		    case 2:
		        game_end();
		        break;
		
			case 3:
				//Configs padrão
				obj_game.BoomRepeat = 50;
				obj_game.TrailAlpha = 0.005;
				obj_game.BulletAlpha = 0.05;
				obj_game.BackStar = 100;
				obj_game.StarRepeat = 1;
				obj_game.StarInterval = 1;
				break;
				
			case 4:
				var DataSave = ds_map_create();
				for (var i = 0; i < 8; i++){
					obj_game.HScore[i] = 800-100*i;
					obj_game.HScoreNames = ["MISAEL","TUSK","WIIR","LU","XTREME","POPEYE","ARTH","MATHIAS"];
					
					DataSave[? "HScore"+string(i)] = obj_game.HScore[i];
					DataSave[? "Names"+string(i)] = obj_game.HScoreNames[i];
				};

				ds_map_secure_save(DataSave,"sv_score");
				ds_map_destroy(DataSave);
			
				room_goto(rm_start);
				break;
		};
	};
};