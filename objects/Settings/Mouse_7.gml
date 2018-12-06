/// @description Insert description here
// You can write your code in this editor
var rName = room_get_name(room);
Director.gameEnd=false;
if(rName=="rmSettings"){
	global.HEIGHT = HeightSlider.value;
	global.WIDTH = WidthSlider.value;
	global.BUTTONS = ButtonSlider.value;
	global.IN_ORDER = CheckBoxInOrder.checked;
	global.SHOW = CheckBoxAlwaysShowBoxes.checked;
	global.ONLY_NUM = CheckBoxOnlyNumbers.checked;
	global.NO_GRID = CheckBoxNoGrid.checked;
	
	global.TIME = TimeSlider.value*30;
	if(global.TIME==330){
		global.TIME=-1;
	}
	room_goto(0);
}
else{
	for(var i=0;i<=room_last;i++){
		var rName = room_get_name(i);
		if(rName=="rmSettings"){
			var ind = i;
			break;
		}
	}
	room_goto(ind);
}