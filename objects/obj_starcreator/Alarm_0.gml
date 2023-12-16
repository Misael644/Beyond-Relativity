//Spawnar estrelas em algum lugar aleatório da sala
if room == rm_start {
    if (StarCreate = true){
        repeat(obj_game.StarRepeat){
            instance_create_layer(irandom(room_width),irandom(room_height),"Instances",obj_star);
        }
		alarm[0] = obj_game.StarInterval;
    }
}