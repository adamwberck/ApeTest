/// @description Insert description here
// You can write your code in this editor
if(checked){
	draw_sprite(sprite_index,1,x,y);
}
else{
	draw_sprite(sprite_index,0,x,y);
}
draw_set_font(Label)
draw_set_halign(fa_left);
draw_text(bbox_right+10,y,label);