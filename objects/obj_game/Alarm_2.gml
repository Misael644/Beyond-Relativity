///@description Tempo de jogo
if room == rm_game {
	Sec += 1;
	
	if Sec == 60 {
		Min += 1;
		Sec = 0;
	};
	
	alarm[2] = 60;
};