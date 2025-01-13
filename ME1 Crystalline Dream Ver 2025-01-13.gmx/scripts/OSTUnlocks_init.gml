SN1 = 0
EZScore = 100000000
repeat(11)
{
    //Name
    ds_grid_set(global.Scoreboard[0], 0, SN1, "- - - -") //Easy
    ds_grid_set(global.Scoreboard[1], 0, SN1, "- - - -") //Normal
    ds_grid_set(global.Scoreboard[2], 0, SN1, "- - - -") //Hard
    ds_grid_set(global.Scoreboard[3], 0, SN1, "- - - -") //Flightless
    //Score
    ds_grid_set(global.Scoreboard[0], 1, SN1, 0)
    ds_grid_set(global.Scoreboard[1], 1, SN1, 0)
    ds_grid_set(global.Scoreboard[2], 1, SN1, 0)
    ds_grid_set(global.Scoreboard[3], 1, SN1, 0)
    //Character
    ds_grid_set(global.Scoreboard[0], 2, SN1, "- - -")
    ds_grid_set(global.Scoreboard[1], 2, SN1, "- - -")
    ds_grid_set(global.Scoreboard[2], 2, SN1, "- - -")
    ds_grid_set(global.Scoreboard[3], 2, SN1, "- - -")
    //Stage
    ds_grid_set(global.Scoreboard[0], 3, SN1, "- - -")
    ds_grid_set(global.Scoreboard[1], 3, SN1, "- - -")
    ds_grid_set(global.Scoreboard[2], 3, SN1, "- - -")
    ds_grid_set(global.Scoreboard[3], 3, SN1, "- - -")
    
    EZScore -= 100000000/11
    SN1 ++
}


//OST Unlock
ds_grid_set(global.OstUnlocked, 0, 0, "Main Menu")
ds_grid_set(global.OstUnlocked, 0, 1, "Stage 1")
ds_grid_set(global.OstUnlocked, 0, 2, "Alex")
ds_grid_set(global.OstUnlocked, 0, 3, "Middy")
ds_grid_set(global.OstUnlocked, 0, 4, "Stage 2")
ds_grid_set(global.OstUnlocked, 0, 5, "Shou")
ds_grid_set(global.OstUnlocked, 0, 6, "Stage 3")
ds_grid_set(global.OstUnlocked, 0, 7, "Beacon")

//Fullgame
ds_grid_set(global.OstUnlocked, 0, 8, "Stage 4")
ds_grid_set(global.OstUnlocked, 0, 9, "Seilina")
ds_grid_set(global.OstUnlocked, 0, 10, "Stage 5A")
ds_grid_set(global.OstUnlocked, 0, 11, "Lynsey")
ds_grid_set(global.OstUnlocked, 0, 12, "Stage 5B")
ds_grid_set(global.OstUnlocked, 0, 13, "Maya")
ds_grid_set(global.OstUnlocked, 0, 14, "Stage 6A")
ds_grid_set(global.OstUnlocked, 0, 15, "Tourmaline")
ds_grid_set(global.OstUnlocked, 0, 16, "Stage 6B")
ds_grid_set(global.OstUnlocked, 0, 17, "Jadite")
ds_grid_set(global.OstUnlocked, 0, 18, "Extra Stage")
ds_grid_set(global.OstUnlocked, 0, 19, "Lilli")
ds_grid_set(global.OstUnlocked, 0, 20, "Ending Theme")
ds_grid_set(global.OstUnlocked, 0, 21, "Credits Theme")
ds_grid_set(global.OstUnlocked, 0, 22, "Game Over")

ds_grid_set(global.OstUnlocked, 1, 0, "???? ????")
ds_grid_set(global.OstUnlocked, 1, 1, "????? ?")
ds_grid_set(global.OstUnlocked, 1, 2, "?????")
ds_grid_set(global.OstUnlocked, 1, 3, "????")
ds_grid_set(global.OstUnlocked, 1, 4, "????? ?")
ds_grid_set(global.OstUnlocked, 1, 5, "????")
ds_grid_set(global.OstUnlocked, 1, 6, "????? ?")
ds_grid_set(global.OstUnlocked, 1, 7, "??????")

//FullGame
ds_grid_set(global.OstUnlocked, 1, 8, "????? ?")
ds_grid_set(global.OstUnlocked, 1, 9, "??????")
ds_grid_set(global.OstUnlocked, 1, 10, "?????  ??")
ds_grid_set(global.OstUnlocked, 1, 11, "??????")
ds_grid_set(global.OstUnlocked, 1, 12, "????? ??")
ds_grid_set(global.OstUnlocked, 1, 13, "????")
ds_grid_set(global.OstUnlocked, 1, 14, "????? ??")
ds_grid_set(global.OstUnlocked, 1, 15, "??????????")
ds_grid_set(global.OstUnlocked, 1, 16, "????? ??")
ds_grid_set(global.OstUnlocked, 1, 17, "??????")
ds_grid_set(global.OstUnlocked, 1, 18, "????? ?????")
ds_grid_set(global.OstUnlocked, 1, 19, "?????")
ds_grid_set(global.OstUnlocked, 1, 20, "?????? ?????")
ds_grid_set(global.OstUnlocked, 1, 21, "??????? ?????")
ds_grid_set(global.OstUnlocked, 1, 22, "???? ????")

ds_grid_set(global.OstUnlocked, 2, 0, false)
ds_grid_set(global.OstUnlocked, 2, 1, false)
ds_grid_set(global.OstUnlocked, 2, 2, false)
ds_grid_set(global.OstUnlocked, 2, 3, false)
ds_grid_set(global.OstUnlocked, 2, 4, false)
ds_grid_set(global.OstUnlocked, 2, 5, false)
ds_grid_set(global.OstUnlocked, 2, 6, false)
ds_grid_set(global.OstUnlocked, 2, 7, false)

//Fullgame
ds_grid_set(global.OstUnlocked, 2, 8, false)
ds_grid_set(global.OstUnlocked, 2, 9, false)
ds_grid_set(global.OstUnlocked, 2, 10, false)
ds_grid_set(global.OstUnlocked, 2, 11, false)
ds_grid_set(global.OstUnlocked, 2, 12, false)
ds_grid_set(global.OstUnlocked, 2, 13, false)
ds_grid_set(global.OstUnlocked, 2, 14, false)
ds_grid_set(global.OstUnlocked, 2, 15, false)
ds_grid_set(global.OstUnlocked, 2, 16, false)
ds_grid_set(global.OstUnlocked, 2, 17, false)
ds_grid_set(global.OstUnlocked, 2, 18, false)
ds_grid_set(global.OstUnlocked, 2, 19, false)
ds_grid_set(global.OstUnlocked, 2, 20, false)
ds_grid_set(global.OstUnlocked, 2, 21, false)
ds_grid_set(global.OstUnlocked, 2, 22, false)
