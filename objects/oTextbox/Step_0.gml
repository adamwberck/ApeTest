/// @description Insert description here
// You can write your code in this editor
for(var i=0;i<9;i++){
	if(keyboard_check_pressed(ord(string(i)))){
		text+=string(i);
	}
}

if(keyboard_check_pressed(vk_backspace)){
	var len = string_length(text);
	if(len>0){
		text = string_delete(text,len,1);
	}
}
