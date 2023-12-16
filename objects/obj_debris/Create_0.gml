direction = random(359);
image_blend = choose(c_red,c_orange,c_yellow);

switch(image_blend){
	case c_red:
		speed = random(3);
		break;
	case c_orange:
		speed = random(2);
		break;
	case c_yellow:
		speed = random(1);
		break;
};

depth = 20;