/// @description Insert description here
// You can write your code in this editor

minValue = 3;
value = global.WIDTH;
maxValue = 9;
type="W Size";


RANGE = maxValue-minValue;
WIDTH = bbox_right-bbox_left;
SEPERATION = WIDTH/RANGE;

marker = instance_create_layer((value-minValue)*SEPERATION+bbox_left,y,
	"Instances",Marker);
marker.slider=self;