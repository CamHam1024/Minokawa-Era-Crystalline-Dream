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
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        global.SpellcardType = "NonSpell"
        alarm[0] = 60
        
        //Items droped
        scr_BossDrops()
        
        //Spellcard get?
    
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
    if point_distance(x, y, xcord, ycord) < 1
    {
        //Spellcarding=====================
         if SetUpTimer < 100
         {
            if SetUpTimer = 0
            {
                //instance_create(x, y, obj_MiniBossCharge)
                //instance_create(x, y, obj_BossCharge)
            }
            SetUpTimer += 1
         }
         //================================
         else
         {
             //Attack=(When Standing Still)====
             if Phase = 0.5
             {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1.5
                global.SpellTimerActive = true
                
                InitDirection = point_direction(x, y, obj_ParPlayer.x, obj_ParPlayer.y)
                Directionincriment = 180
                Phase = 0 
             }
             
             if Phase = 0
             {
                Fire += 1
                Fire = Fire % 5
                if Fire = 1
                {
                    Bullet = instance_create(x, y, obj_AlexandraBomb)
                    Bullet.direction = InitDirection + Directionincriment
                    //Bullet.speed = 3
                    
                    Bullet = instance_create(x, y, obj_AlexandraBomb)
                    Bullet.direction = InitDirection - Directionincriment
                    //Bullet.speed = 3
                    
                    Directionincriment -= 180/6
                }
                if Directionincriment <= 0
                {
                    Bullet = instance_create(x, y, obj_AlexandraBomb)
                    Bullet.direction = InitDirection
                    Bullet.speed = 3
                    
                    Phase = 1
                }
             }
             
             if Phase = 1
             {
                PhaseTimer += 1
                if PhaseTimer = 90
                {
                    SecondaryAttack = true
                    Rand_Movement_Improved(20, 20, 50, 300, 10)
                    PhaseTimer = 0
                    Phase = 2
                }
             }
             
             if Phase = 2
             {
                PhaseTimer += 1
                if PhaseTimer = 90
                {
                    PhaseTimer = 0
                    Phase = 2.1
                }
             }
             
             if Phase = 2.1
             {
                if PhaseTimer = 0
                {
                    Charge = instance_create(x, y, obj_BossBigCharge)
                    Charge.host = id
                    Charge.Hue = 200
                }
                if PhaseTimer = 80
                {
                    Phase = 0.5
                }
                else
                {
                    PhaseTimer += 1
                }
             }
             //================================
         }
          
    }
    //Attack=(When Moving)============= SecondaryAttack = false SecFire = 0
    if SecondaryAttack = true
    {
        SecFire += 1
        SecFire = SecFire % shotfreq
        if SecFire = 1
        {
            basic_bullet_burst(obj_SpellAlexStar3, FireNumb2, point_direction(x,y,obj_ParPlayer.x,obj_ParPlayer.y), -20, x, y, 10, 0, 360)
            direction2 += 10
            direction2 = direction2 % 360
        }
    }
    //=================================
}

