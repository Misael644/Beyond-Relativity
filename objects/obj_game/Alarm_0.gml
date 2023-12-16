///@description Criar asteróides
if(room != rm_game){
    exit;
}

if GamePause == false {
	if(choose(0,1) == 0){
	    //ir pra baixo pro lado
	    var xx = choose(0,room_width);
	    var yy = irandom_range(1,room_height);
	} else {
	    //ir para o topo ou pro fundo
	    var xx = irandom_range(1, room_width);
	    var yy = choose(0, room_height);
	}

	instance_create_layer(xx, yy,"Instances",obj_asteroid);
	move_wrap(true,true,sprite_width/2);
};

alarm[0] = 2*room_speed;
//alarm[0] = 4*room_speed;