if obj_game.TimeStop == false {
	image_alpha -= obj_game.TrailAlpha;
};
if (image_alpha < 0){
instance_destroy()};