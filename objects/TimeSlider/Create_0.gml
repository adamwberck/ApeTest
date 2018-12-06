/// @description Insert description here
// You can write your code in this editor
minValue = 1;
value = global.TIME==-1 ? 11 : global.TIME/30;
maxValue = 11;
type="Hide Time";
dvalue="0";

RANGE = maxValue-minValue;
WIDTH = bbox_right-bbox_left;
SEPERATION = WIDTH/RANGE;

marker = instance_create_layer((value-minValue)*SEPERATION+bbox_left,y,
	"Instances",Marker);
marker.slider=self;