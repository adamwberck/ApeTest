/// @description Insert description here
// You can write your code in this editor
with(Director){
	if(!failed && !draw_red && !draw_green){
		if(other.number==0){
			failed=true;
		}
		else if(other.number==ds_list_find_value(nums,nextNum)){
			nextNum++;
			if(other.number==lowest){
				Button.revealed=false;
				Button.show=true;
				if(!hidden){
					hide=true;
				}
			}
			other.revealed=true;
		}
		else{
			failed=true;
		}
	}
}