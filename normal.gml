#define scr_player_normal

scr_getinputs();
sprite_index = spr_player;

//React to inputs
if(key_restart) game_restart();
move = key_left + key_right;
hsp = move * movespeed;
if(vsp < 10) vsp += grav;

if(place_meeting(x,y+1,obj_solid)){
  jumps = jumpsmax;    
}
if(!place_meeting(x,y+1,obj_solid) && (jumps == jumpsmax)) { //by Takiko
  jumps = jumpsmax - 1;
}

if(key_jump && jumps > 0){
  jumps -= 1;
  vsp = -jumpspeed;
}

//edit for springs
if((vsp < 0) && (!key_jump_held)) vsp = max(vsp,-jumpspeed/2);

if(key_jump && (place_meeting(x+1,y,obj_solid) || place_meeting(x-1,y,obj_solid))){
  vsp = -jumpspeed;
}

var hsp_final = hsp + hsp_carry;
hsp_carry = 0;

//Horizontal Collision
if(place_meeting(x+hsp_final,y,obj_solid)){
  while(!place_meeting(x+sign(hsp_final),y,obj_solid)){
      x += sign(hsp_final);
  }
  hsp_final = 0;
  hsp = 0;
}

x += hsp_final;

//Vertical Collision
if(place_meeting(x,y+vsp,obj_solid)){
  while(!place_meeting(x,y+sign(vsp),obj_solid)){
      y += sign(vsp);
  }
  vsp = 0;
}

y += vsp;

//Ladder Collision
if(place_meeting(x,y,obj_ladder) && (key_up || key_down)){
  hsp = 0;
  vsp = 0;
  state = states.ladder;
}

//Animations
if(move != 0) image_xscale = move;
if(place_meeting(x,y+1,obj_solid)){
  if(hsp != 0) sprite_index = spr_player_run;
  else sprite_index = spr_player;
} else {
  if(vsp < 0) sprite_index = spr_player_jump;
  else sprite_index = spr_player_fall;
}
