if BeatMark == "beat" {alpha -= 1/15};
if alpha == 0 {BeatMark = "rest"};

switch(obj_game.beat){
	case 2:
		image_blend = c_orange;
		break;
		
	case 1:
		image_blend = c_red;
		break;
		
	case 0:
		image_xscale = 2; image_yscale = 2;
		image_alpha = alpha;
		break;	
};