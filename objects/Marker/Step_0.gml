/// @description Insert description here
// You can write your code in this editor
if(click){;
	if(mouse_x>slider.bbox_left && mouse_x<slider.bbox_right){
		slider.value = round( ((mouse_x-slider.bbox_left)/slider.SEPERATION)+slider.minValue );
		x = (slider.value-slider.minValue)*slider.SEPERATION+slider.bbox_left;
	}
}