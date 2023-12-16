if room == rm_start {
    image_alpha = 0;
    speed = random_range(0.1,3);
} else if room == rm_game {
    image_alpha = 1;
    speed = 0;
};

depth = 1000;