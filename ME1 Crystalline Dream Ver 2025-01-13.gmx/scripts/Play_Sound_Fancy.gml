///Play_Sound_Fancy(SFX,Vol)

//var SFX = argument0
//var Vol = argument1

if !audio_is_playing(obj_System.soundplayed[argument0]) or audio_sound_get_track_position(obj_System.soundplayed[argument0]) > 0.01
{                       
    audio_stop_sound(obj_System.soundplayed[argument0])
    obj_System.soundplayed[argument0] = audio_play_sound(argument0, 0, 0)
    audio_sound_gain(obj_System.soundplayed[argument0], argument1, 0)
}

