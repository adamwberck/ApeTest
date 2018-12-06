/// @description Insert description here
// You can write your code in this editor
HEIGHT = global.HEIGHT;
WIDTH = global.WIDTH;
BUTTONS = global.BUTTONS;
IN_ORDER = global.IN_ORDER;
SHOW = global.SHOW;
ONLY = global.ONLY_NUM;
NO_GRID = global.NO_GRID;
if(level>=5 and start){
	start=false;
	gameEnd=true;
	level=0;
	draw_green=false;
	draw_red=false;
	failed = false;
	instance_destroy(Button);
}

if(start){
	//CREATE LEVEL

	gameEnd=false;
	hidden=false;
	time=0;
	draw_green=false;
	draw_red=false;
	failed = false;	
	instance_destroy(Button);
	nextNum=0;
	//ds_list_destroy(nums);
	nums = ds_list_create();
	
	//Add Numbers
	if(IN_ORDER){
		for(var i=1;i<=BUTTONS;i++){
			ds_list_add(nums,i);
		}
	}
	else{
		for(var i=1;i<=9;i++){
			ds_list_add(nums,i);
		}
		
		ds_list_shuffle(nums);
		
		while(ds_list_size(nums)>BUTTONS){
			ds_list_delete(nums,0);
		}
	}
	
	
	
	while(ds_list_size(nums)<WIDTH*HEIGHT){
		ds_list_add(nums,0);
	}
	
	ds_list_shuffle(nums);
	
	level_array[0,0]=0;
	var button=0;
	var numIndex=0;
	for(var w=0;w<WIDTH;w++){
		for(var h=0;h<HEIGHT;h++){
				level_array[w,h] = ds_list_find_value(nums,button++);
		}
	}
	
	//Trim Zeros
	ds_list_sort(nums,true);
	while(ds_list_find_value(nums,0)==0){
		ds_list_delete(nums,0);
	}
	
	//Create Board
	var layoutWidth  = WIDTH*(BUTT_WIDTH+MARGIN);
	var layoutHeight = HEIGHT*(BUTT_WIDTH+MARGIN);
	var offsetWidth  = (room_width -layoutWidth+BUTT_WIDTH)/2;
	var offsetHeight = (ROOMH-layoutHeight)/2;
	if(NO_GRID){
		for(var i=0;i<BUTTONS;i++){
			var a = random_range(offsetWidth,room_width-offsetWidth-30);
			var b = random_range(offsetHeight,ROOMH-offsetHeight-60);
			var near = instance_nearest(a,b,Button);
			var button = instance_create_layer(a,b,"Instances",Button);
			var check = true;
			if(instance_exists(near)){
				with(near){
					if(point_distance(x,y,a,b)<Director.BUTT_WIDTH+Director.MARGIN+10){
						instance_destroy(button);
						i--;
						check = false;
					}
				}
			}
			if(check){
				button.number = ds_list_find_value(other.nums,i);
			}
		}
	}
	else{
		for(var w=0;w<WIDTH;w++){
			for(var h=0;h<HEIGHT;h++){
				var num = level_array[w,h];
				if(num!=0 or !ONLY){
					var but = instance_create_layer(w*(BUTT_WIDTH+MARGIN)+offsetWidth,
						h*(BUTT_WIDTH+MARGIN)+offsetHeight, "Instances", Button);
					but.number = num;
				}
			}
		}
	}
	lowest = ds_list_find_value(nums,0);
	highest = ds_list_find_value(nums,BUTTONS-1);
	start=false;
	Button.revealed = true;
	Button.show = global.SHOW;
}

if(time>=global.TIME && global.TIME>0 && instance_exists(Button)&&!hidden){
	Button.revealed=false;
	Button.show=true;
	hidden=true;
	hide=true;
}

if(hide){
	scoreTime[level,0]=time/60;
	hide=false;
}

if(failed){
	alarm[0]=1.5*60;
	draw_red=true;
	failed=false;
	scoreTime[level,1]=time/60;
	scoreTime[level,2]=nextNum;
	audio_play_sound(sBuzz,1,false);
}
else if(nextNum>=BUTTONS){
	alarm[0]=1.5*60;
	scoreTime[level,1]=time/60;
	scoreTime[level,2]=nextNum;
	nextNum=0;
	draw_green=true;
	audio_play_sound(sDing,1,false);
}
else if(!start){
	time++;
}