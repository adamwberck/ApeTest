/// @description Insert description here
// You can write your code in this editor
global.HEIGHT = 3;
global.WIDTH = 3;
global.BUTTONS = 9;
global.IN_ORDER = true;
global.SHOW = true;
global.TIME = 30;
global.ONLY_NUM = true;
randomize();
time = 0;
hidden=false;

//scoreTime[level,time/sucess];
scoreTime[4,1]=0;

highest=1;
draw_green=false;
draw_red=false;
start = false;

hide=true;
failed = false;

gameEnd = false;

settings = false;
level = 0;
nextNum = 0;


var b = instance_create_layer(x,y,"Instances",Button);
BUTT_WIDTH = b.bbox_right-b.bbox_left;
instance_destroy(b);
MARGIN = 7;