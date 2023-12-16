if ds_map_find_value(async_load, "status"){
	if ds_map_find_value(async_load, "result") != ""{
		with(drag){
			if mode == "config" {
				switch(button){
					case 0:
						var SetBoom = ds_map_find_value(async_load, "result");
						obj_game.BoomRepeat = real(SetBoom);
						break;
					case 1:
						var SetTrail = ds_map_find_value(async_load, "result");
						obj_game.TrailAlpha = real(SetTrail);
						break;
					case 2:
						var SetBullet = ds_map_find_value(async_load, "result");
						obj_game.BulletAlpha = real(SetBullet);
						break;
					case 3:
						var SetBack = ds_map_find_value(async_load, "result");
						obj_game.BackStar = real(SetBack);
						break;
					case 4:
						var SetRepeat = ds_map_find_value(async_load, "result");
						obj_game.StarRepeat = real(SetRepeat);
						break;
					case 5: //5 deveria ser 4b
						var SetInterval = ds_map_find_value(async_load, "result");
						obj_game.StarInterval = real(SetInterval);
						break;
				};
			};	
		};
	};
};

