if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
            
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        MoveRate = 0
        xcord = 512
        ycord = 250
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
        
        if instance_exists(obj_MiddySpellspawner1)
        {
            with (obj_MiddySpellspawner1){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarningSpawner)
        {
            with (obj_MiddyWarningSpawner){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarning)
        {
            with (obj_MiddyWarning){SuperKill = true}
        }
        
        if instance_exists(obj_MiddyCharm)
        {
            with (obj_MiddyCharm){Killed = true}
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
    if PauseTimer = 60
    {
        repeat(3)
        {
            Blindzone = instance_create(1024/2 + lengthdir_x(BlindRad-50, BlindDir) ,768/2 + lengthdir_y(BlindRad-50, BlindDir), obj_GinkeiBlindzone)
            Blindzone.SpinLength = BlindRad-50
            Blindzone.SpinAngle = BlindDir
            Blindzone.SpinSpeed = 0.5
            Blindzone.maxRad = 100
            
            BlindDir += 360/3
        }
        BlindDir = 0
        
        repeat(3)
        {
            Blindzone = instance_create(1024/2 + lengthdir_x(BlindRad+200, BlindDir) ,768/2 + lengthdir_y(BlindRad+200, BlindDir), obj_GinkeiBlindzone)
            Blindzone.SpinLength = BlindRad+200
            Blindzone.SpinAngle = BlindDir
            Blindzone.SpinSpeed = -0.5
            Blindzone.maxRad = 200
            
            BlindDir += 360/3
        }
    }
    if PauseTimer < 120
    {
        PauseTimer += 1
    }
    else
    {
        global.SpellcardBulletRes = 1
        
        Fire += 1
        Fire = Fire % 60
        if Fire = 1
        {
            basic_bullet_burst(obj_Ginkies, 20, random(360), 500, x, y, -1, 0, 360)
        }
    }
}

