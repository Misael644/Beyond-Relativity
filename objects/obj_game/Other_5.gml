switch(room){
	case rm_start:
		//Setar estrelas como persistentes
		object_set_persistent(obj_star,true);
		with(obj_star){instance_destroy()};
		break;
		
	case rm_game:
		audio_resume_all();
		break;
	
	case rm_win:
	case rm_gameover:
		score = 0;
		lives = 3;
		hp = 100;
		bombs = 0;
		MovBack = "";
		break;
	
	case rm_config:
		if file_exists("sv_config") {file_delete("sv_config")};
        var SaveFile = file_text_open_write("sv_config");
        file_text_write_real(SaveFile,BoomRepeat);
		file_text_writeln(SaveFile);
		file_text_write_real(SaveFile,TrailAlpha);
		file_text_writeln(SaveFile);
		file_text_write_real(SaveFile,BulletAlpha);
		file_text_writeln(SaveFile);
		file_text_write_real(SaveFile,BackStar);
		file_text_writeln(SaveFile);
		file_text_write_real(SaveFile,StarRepeat);
		file_text_writeln(SaveFile);
		file_text_write_real(SaveFile,StarInterval);
        file_text_close(SaveFile);
		break;
};