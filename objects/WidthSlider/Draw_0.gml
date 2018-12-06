/// @description Insert description here
// You can write your code in this editor
draw_set_font(Number);
draw_set_color(c_white);
draw_set_halign(fa_right)
draw_set_valign(fa_middle)
draw_text(room_width-10,y,value);
draw_set_halign(fa_left)
draw_set_font(Label);
draw_text(10,y,type);
draw_self();