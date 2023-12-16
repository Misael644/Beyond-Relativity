if obj_game.organize == true {
	if place != noone && halt == false {
		direction = point_direction(x,y,place.x,place.y);
		speed = 1;
	};
};

if place_meeting(x,y,place) && LastDir != direction {
	//speed = 0;
};

depth = -y;