var WhichAst = instance_place(x,y,obj_asteroid);

if instance_exists(obj_bcg_solar_1){
    if instance_exists(obj_ship){
        if instance_place(x,y,obj_ship){
            obj_ship.image_blend = c_black;
            obj_bcg_solar_1.image_alpha = 0;
        } else if instance_place(x,y,obj_asteroid){
            if WhichAst.sprite_index != spr_asteroid_small{
                WhichAst.image_blend = c_black;
                obj_bcg_solar_1.image_alpha = 0};
        } else {
            obj_ship.image_blend = -1;
            if instance_exists(obj_asteroid){obj_asteroid.image_blend = -1};
            obj_bcg_solar_1.image_alpha = 1;
        }
    }
}

