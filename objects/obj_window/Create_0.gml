depth = obj_game.depth - 10;

if obj_game.ExitConfirm == true {
	var YesX = (room_width/2-sprite_get_width(spr_window_saveconfirm)/2)-32;
	var NoX = room_width/2+sprite_get_width(spr_window_saveconfirm)/2-32;
	var ButtonY = (room_height/2+sprite_get_height(spr_window_saveconfirm)/2)-32;
	var ButtonYes = instance_create_layer(YesX,ButtonY,"Instances",obj_button);
	var ButtonNo = instance_create_layer(NoX,ButtonY,"Instances",obj_button);
	ButtonYes.button = "yes";
	ButtonNo.button = "no";
	ButtonYes.depth = depth-1;
	ButtonNo.depth = depth-1;	
};