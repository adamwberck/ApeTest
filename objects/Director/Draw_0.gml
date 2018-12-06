/// @description Insert description here
// You can write your code in this editor
var hasButtons = instance_exists(Button);
if(draw_red){
	draw_sprite(sRed,0,(room_width/8)*7,room_height/2);
	if(hasButtons){
		Button.revealed=true;
	}
}
if(draw_green){
	draw_sprite(sGreen,0,(room_width/8)*7,room_height/2);
	if(hasButtons){
		Button.revealed=true;
	}
}

if(gameEnd){
	//SCORE BOARD
	var h = (room_height-50)/5;
	draw_set_font(Label);
	draw_set_halign(fa_left);
	for(var i=0;i<5;i++){
		var f = scoreTime[i,0];
		var t = scoreTime[i,1];
		var s = scoreTime[i,2];
		var c = s == BUTTONS ? c_green : c_red;
		draw_set_color(c);
		draw_text(50,h*i+50,string(i+1)+": "+string_format(f,5,2)
			+" "+string_format(t,5,2)+"     "+string(s)+"/"+string(BUTTONS));
	}
}