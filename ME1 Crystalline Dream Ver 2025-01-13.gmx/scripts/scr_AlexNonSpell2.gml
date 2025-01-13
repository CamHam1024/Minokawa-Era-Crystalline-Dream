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
        alarm[0] = 60
        
        if Nonspellfailed = false
        {
            //Items droped
            scr_BossDrops()
        }
        
        //Spellcard get?
        //instance_create(0, 0, obj_SpellcardGet)
        
        //Onetime switch
        SpellcardDead = true
    }
}
    
//If Times up
if global.SpellcardTimeSec = 0 and global.SpellcardTimeMiliSec = 0
    {
        Nonspellfailed = true
        global.SpellTimerActive = false
        global.SpellcardHealth = 0
    }

//Variables for Init
//
//Attack
if SpellcardDead = false
{
    if point_distance(x, y, xcord, ycord) < 1
    {
        //Spellcarding=====================
         if SetUpTimer < 120
         {
            if SetUpTimer = 40
            {
                //instance_create(x, y, obj_MiniBossCharge)
                //Explo = instance_create(x, y, obj_BossBurst)
                //Explo.RandomColours = false
                //Explo.Explo.Hue = 150
                
                Phase = 0
            }
            SetUpTimer += 1
         }
         //================================
         else
         //Attack=(When Standing Still)====
         {
            global.SpellcardBulletRes = 1
            global.SpellcardBombRes = 1
            global.SpellTimerActive = true
         }
         //================================ 
    }
    //Attack=(When Moving)=============
    if Phase = 0
    {
        FireFreq += 1
        FireFreq = FireFreq % 5
        if FireFreq = 1
        {
            Bullet = instance_create(x, y, obj_AlexHeart2NEW)
            Bullet.direction = randomizer + ShotDir
            Bullet.speed = 4
            Bullet.PointDir = random(360)
            Bullet.Type = 0
                    
            ShotDir += 360/BulletAmount
            if ShotDir >= 360
            {
                //Rand_Movement(0, 20, 400, 50, 300, 10)
                Phase = 0.3
            }
        }
    }
    
    if Phase = 0.3
    {
        PhaseResetTimer += 1
        if PhaseResetTimer >= PauseInt/2
        {
            Rand_Movement_Improved(20, 20, 50, 300, 10)
            PhaseResetTimer = 0
            Phase = 0.5
        }
    }
    
    if Phase = 0.5
    {
        if point_distance(x, y, xcord, ycord) < 1
        {   
            PhaseResetTimer += 1
            if PhaseResetTimer >= PauseInt/2
            {
                FireFreq = 0
                PhaseResetTimer = 0
                Movetime = 0
                Phase = 1
            }
        }
    }
    
    if Phase = 1
    {   
        FireFreq += 1
        FireFreq = FireFreq % 5
        if FireFreq = 1
        {
            Bullet = instance_create(x, y, obj_AlexHeart2NEW)
            Bullet.direction = randomizer + ShotDir
            Bullet.speed = 4
            Bullet.PointDir = random(360)
            Bullet.Type = 1
                    
            ShotDir -= 360/BulletAmount
            if ShotDir <= 0
            {
                //Rand_Movement(0, 20, 400, 50, 300, 10)
                Phase = 1.3
            }
        }
    }
    
    if Phase = 1.3
    {
        PhaseResetTimer += 1
        if PhaseResetTimer >= PauseInt/2
        {
            Rand_Movement_Improved(20, 20, 50, 300, 10)
            PhaseResetTimer = 0
            Phase = 1.5
        }
    }
    
    if Phase = 1.5
    {
        if point_distance(x, y, xcord, ycord) < 1
        {   
            PhaseResetTimer += 1
            if PhaseResetTimer >= PauseInt/2
            {
                FireFreq = 0
                PhaseResetTimer = 0
                Movetime = 0
                randomizer = random(360)
                Phase = 0
            }
        }
    }
    //=================================
}


