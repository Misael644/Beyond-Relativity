if state == "creating"{
	if instance_exists(obj_ship){
		speed = 0;
		if instance_exists(obj_ship.RayTarget) {target = obj_ship.RayTarget;
		} else {target = noone};
		ShipAng = obj_ship.image_angle;
	} else {
		instance_destroy();	
	};
} else {
	if obj_game.GamePause == true {
		speed = 0;
	} else {
		if obj_game.TimeStop == true {
			speed = 0;
		} else {
			speed = 6;
		};
	};
	
	if instance_exists(target) {
		direction = point_direction(x,y,target.x,target.y);
	} else {
		direction = ShipAng;
	};
};