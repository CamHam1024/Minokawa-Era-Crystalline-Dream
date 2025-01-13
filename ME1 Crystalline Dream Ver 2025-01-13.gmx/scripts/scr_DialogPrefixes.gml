/*
Prefix meanings:

[PT] = Player Talking
[PD] = Display Player Cutin
[/PD] = Undisplay Player Cutin

[BT] = Boss Talking
[BD] = Display Boss Cutin
[/BD] = Undisplay Boss Cutin

[End] = Destroy Dialog

*/

//Prefix Set up
//Player cutin Display
var PDpos = string_pos("[PD]", Text);
if (PDpos > 0)
{
    PCD = true
    Text = string_delete(Text, PDpos, string_length("[PD]"));
}

var NPDpos = string_pos("[/PD]", Text);
if (NPDpos > 0)
{
    PCD = false
    Text = string_delete(Text, NPDpos, string_length("[/PD]"));
}


//Player Talking
var pos = string_pos("[PT]", Text);
if (pos > 0)
{
    PlayerTalking = true //Is the Player talking
    Text = string_delete(Text, pos, string_length("[PT]"));
}
else
{
    PlayerTalking = false
    Text = string_delete(Text, pos, string_length("[PT]"));
}

//=========================================================================

//Boss cutin Display
var BDpos = string_pos("[BD]", Text);
if (BDpos > 0)
{
    BCD = true
    Text = string_delete(Text, BDpos, string_length("[BD]"));
}

var NBDpos = string_pos("[/BD]", Text);
if (NBDpos > 0)
{
    BCD = false
    Text = string_delete(Text, NBDpos, string_length("[/BD]"));
}


//Boss Talking
var Bpos = string_pos("[BT]", Text);
if (Bpos > 0)
{
    BossTalking = true //Is the Boss talking
    Text = string_delete(Text, Bpos, string_length("[BT]"));
}
else
{
    BossTalking = false
    Text = string_delete(Text, Bpos, string_length("[BT]"));
}

//End
var Endpos = string_pos("[End]", Text);
if (Endpos > 0)
{
    PCD = false
    BCD = false 
    DialogBoxShow = false
    
    if DialogBoxAlpha <= 0
    {
        if PlayerAlpha <= 0 and BossAlpha <= 0
        {
            instance_destroy()
        }
    }
    
    Text = string_delete(Text, Endpos, string_length("[End]"));
    
}

