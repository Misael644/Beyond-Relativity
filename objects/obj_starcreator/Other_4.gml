if room == rm_game {
    if StarCreate == true{
        if instance_number(obj_star) < 100 {
            repeat(obj_game.BackStar){
                instance_create_layer(irandom(room_width),irandom(room_height),"Instances",obj_star);
            }
        }
    }
}

