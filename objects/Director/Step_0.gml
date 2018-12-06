/// @description Insert description here
// You can write your code in this editor
HEIGHT = global.HEIGHT;
WIDTH = global.WIDTH;
BUTTONS = global.BUTTONS;
IN_ORDER = global.IN_ORDER;
SHOW = global.SHOW;
ONLY = global.ONLY_NUM;
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
	nums = ds_list_create();


	
	
	if(IN_ORDER){
		for(var i=1;i<=BUTTONS;i++){
			ds_list_add(nums,i);
		}
		ds_list_shuffle(nums);
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
	
	
	var loc = ds_list_create();
	for(var i=0;i<WIDTH*HEIGHT;i++){
		ds_list_add(loc,i);
	}
	ds_list_shuffle(loc);
	while(ds_list_size(loc)>BUTTONS){
		ds_list_delete(loc,0);
	}
	ds_list_sort(loc,true);
	
	level_array[0,0]=0;
	var button=0;
	var numIndex=0;
	for(var w=0;w<WIDTH;w++){
		for(var h=0;h<HEIGHT;h++){
			if(ds_list_find_value(loc,0)==button){
				ds_list_delete(loc,0);
				level_array[w,h] = ds_list_find_value(nums,numIndex++);
			}
			else{
				level_array[w,h] = 0;
			}
			button++;
		}
	}
	var layoutWidth  = WIDTH*(BUTT_WIDTH+MARGIN);
	var layoutHeight = HEIGHT*(BUTT_WIDTH+MARGIN);
	var offsetWidth  = (room_width -layoutWidth+BUTT_WIDTH)/2;
	var offsetHeight = (room_height-layoutHeight)/2;
	for(var w=0;w<WIDTH;w++){
		for(var h=0;h<HEIGHT;h++){
			
			var num = level_array[w,h];
			if(num!=0 or !ONLY){
				var but = instance_create_layer(w*(BUTT_WIDTH+MARGIN)+offsetWidth,
					h*(BUTT_WIDTH+MARGIN)+offsetHeight,"Instances",Button);
				but.number = num;
			}
		}
	}
	ds_list_sort(nums,true);
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
}
else if(nextNum>=BUTTONS){
	alarm[0]=1.5*60;
	scoreTime[level,1]=time/60;
	scoreTime[level,2]=nextNum;
	nextNum=0;
	draw_green=true;
}
else if(!start){
	time++;
}