if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
            
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        MoveRate = 0
        xcord = 512
        ycord = 768/2
        Speed = 8
        
        //SpellRing Disburse
        with(obj_SpellcardSpawner)
        {
            instance_destroy()
        }
        
        //BulletKill
        ClearBullets = true
        if instance_exists(obj_ParDanmaku)
        {
            with (obj_ParDanmaku){Deadly = false}
        }
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.SpellcardType = "NonSpell"
        global.RemainingSpellcards -= 1
        alarm[0] = 60
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
}
    
//If Times up
if global.SpellcardTimeSec = 0 and global.SpellcardTimeMiliSec = 0
    {
        global.SpellTimerActive = false
        global.SpellcardHealth = 0
    }
    
//Attack 
if SpellcardDead = false
{
    
}

