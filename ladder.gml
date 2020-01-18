#define scr_player_ladder
scr_getinputs();
sprite_index = spr_player_climb;

//Ladder Movement
hsp = 0;
vsp = 4 * (key_down - key_up);
x = (instance_nearest(x,y,obj_ladder).x);

//Vertical Collision
if(place_meeting(x,y+vsp,obj_solid)){
    while(!place_meeting(x,y+sign(vsp),obj_solid)){
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

if(key_jump || (!place_meeting(x,y,obj_ladder))){
    hsp = 0;
    vsp = 0;
    state = states.normal;
}

