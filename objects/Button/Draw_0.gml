/// @description Insert description here
// You can write your code in this editor
if(revealed and number>0){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(Number);
	draw_set_color(c_white);
	draw_text(x,y,number);
}
else if(show){
	draw_self();
}