randomize();
//var SaveFile = file_text_open_write("asdf");
//file_text_close(SaveFile);

//Load highscore
if file_exists("sv_score"){
	var DataLoad = ds_map_secure_load("sv_score");
	
	for(var i = 0; i < 8; i++){
		HScore[i] = DataLoad[? "HScore"+string(i)];
		HScoreNames[i] = DataLoad[? "Names"+string(i)];
	};
} else {
	for (var i = 0; i < 8; i++){
		HScore[i] = 800-100*i;
		HScoreNames = ["MISAEL","TUSK","WIIR","LU","XTREME","POPEYE","ARTH","MATHIAS"];
	};
};

//NÃO MANO VOCÊ NÃO É PERSISTENTE! APRENDA A SER TEMPORÁRIO SEU LIXO!
object_set_persistent(obj_star,false)

//Le debug
DebugMode = false;

score = 0;
lives = 3;
hp = 100;
bombs = 0;

depth = -1000;

draw_set_colour(c_white);
draw_set_font(fnt_text);

img_rot = 0;
MovBack = "";
PointerY = room_height/2+60;

drag = noone;

///Carregar configs
if file_exists("sv_config"){
    var LoadFile = file_text_open_read("sv_config");
	BoomRepeat = file_text_read_real(LoadFile);
	file_text_readln(LoadFile);
	TrailAlpha = file_text_read_real(LoadFile);
	file_text_readln(LoadFile);
	BulletAlpha = file_text_read_real(LoadFile);
	file_text_readln(LoadFile);
	BackStar = file_text_read_real(LoadFile);
	file_text_readln(LoadFile);
	StarRepeat = file_text_read_real(LoadFile);
	file_text_readln(LoadFile);
	StarInterval = file_text_read_real(LoadFile);
    file_text_close(LoadFile);
} else {
	//Configs padrão
	if os_browser == browser_not_a_browser {
		BoomRepeat = 50;
		TrailAlpha = 0.005;
		BulletAlpha = 0.05;
		BackStar = 100;
		StarRepeat = 1;
		StarInterval = 1;
	} else {
		BoomRepeat = 1;
		TrailAlpha = 1;
		BulletAlpha = 1;
		BackStar = 10;
		StarRepeat = 1;
		StarInterval = 60;
	};
};

GamePause = false;
ExitConfirm = false;

Sec = 0;
Min = 0;

TimeStop = false;
secon = current_second;

OptSelect = 0;

SpawnMode = false;
SpawnObj = obj_pup_box;

ScanSwitch = 0;

// Bagulhos de debugging de blend mode
BmList[0] = bm_zero
BmList[1] = bm_max
BmList[2] = bm_subtract
BmList[3] = bm_inv_src_colour
BmList[4] = bm_src_alpha
BmList[5] = bm_inv_src_alpha
BmList[6] = bm_dest_alpha
BmList[7] = bm_dest_colour
BmList[8] = bm_inv_dest_alpha
BmList[9] = bm_inv_dest_colour
BmList[10] = bm_src_alpha_sat

bmode = 0;
bmode2 = 0;

SelectAstAlpha = 0;
AstAlphaState = "in";
// Fim dos bagulhos

HScoreIndex = 0;
HScoreStep = 0;
BlinkUnderl = "";
BlinkUlWait = 0;
HScoreScrWait = 0;

ShowHScores = false;
ShowHScoresAlpha = 1;
ShowHScoresAlphaMode = "in";
ShowHScoresWait = 0;

cheated = false;

NewT_YShift = 0;
NewT_YShiftGoal = 10;
NewT_Scale = 1;
NewT_ScaleGoal = 1.1;
NewT_ScaleRate = 0;