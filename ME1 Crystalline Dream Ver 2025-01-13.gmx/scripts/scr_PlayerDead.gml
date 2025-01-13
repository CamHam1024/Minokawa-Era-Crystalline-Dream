if global.LifeCrystals = 0
{
    global.GameOver = true
}
else
{
    if global.LastWord = false
    {
        global.PreenPointMultiply = 1
        global.LifeCrystals -= 1
    
        global.PreenChain = 0 
        global.PreenCounter = 0

        global.ScoreManaCollected = 0
    }
    
    if global.Player = "Midnight"
    {
        scr_MiddySheild()
    }
}
