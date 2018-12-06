/// @description Insert description here
// You can write your code in this editor

var lX = bbox_left;

if(selected){
	var len = string_length(text);
	draw_line_color(lX+len*32,bbox_top,lX+len*32,bbox_bottom,c_white,c_white);
}

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_color(lX,bbox_bottom,text,c_white,c_white,c_white,c_white,1);


draw_self();