#define scr_MiddySpellcard2
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
        
        if instance_exists(obj_MiddyWarningSpawner2)
        {
            with (obj_MiddyWarningSpawner2){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarningSpawner2Hard)
        {
            with (obj_MiddyWarningSpawner2Hard){instance_destroy()}
        }
        
        if instance_exists(obj_MiddyWarning2)
        {
            with (obj_MiddyWarning2){Killed = true}
        }
        
        if instance_exists(obj_MiddyWarning2Hard)
        {
            with (obj_MiddyWarning2Hard){Killed = true}
        }
        
        if instance_exists(obj_MiddyCharm2)
        {
            with (obj_MiddyCharm2){Killed = true}
        }
        
        if instance_exists(obj_MiddyCharm2Hard)
        {
            with (obj_MiddyCharm2Hard){Killed = true}
        }
        
        //Reset Values
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        
        //Next Spell
        if KillTimer < 30
        {
            KillTimer += 1
        }
        else
        {
            global.SpellcardType = "NonSpell"
        }
            
            Explosion = instance_create(x, y, obj_BossDefeatedExplosion)
            Explosion.ScreenShake = true
            Explosion.DeathDialog = PostDialog
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
    //Non One Time Check=================
    if ClearDirection >= 1000
    {
        //instance_destroy()
    } 
    //===================================
}
    
//If Times up
if global.SpellcardTimeSec = 0 and global.SpellcardTimeMiliSec = 0
    {
        global.SpellTimerActive = false
        global.SpellcardHealth = 0
    }
    
//Attack 
script_execute(AttackPattern)

#define scr_MiddySpellcard2Easy
if SpellcardDead = false
{
    if PauseTimer < 120
    {
        PauseTimer += 1
        
        if PauseTimer = 60
        {
            Chain = instance_create(192, 250, obj_MiddyWarningSpawner2)
            Chain.direction = 0 - 10
            
            Chain = instance_create(1024-192, 250, obj_MiddyWarningSpawner2)
            Chain.direction = 180 + 10
        }
        
        if PauseTimer = 120
        {
            Charge = instance_create(x, y, obj_BossBigCharge)
            Charge.host = id
            Charge.Hue = 150
        }
    }
    else
    {
        global.SpellcardBulletRes = 1
        global.SpellcardBombRes = 1
        global.SpellTimerActive = true
        
        BullxSpin += 3
        BullxSpin = BullxSpin % 360
        
        bullx = 512 + lengthdir_x(400, BullxSpin)
        
        Firerate += 1
        Firerate = Firerate % FR
        if Firerate = 1
        {
            Bullet = instance_create(bullx + random_range(-10, 10), 768, obj_MiddySpell2Danmaku2)
            Bullet.direction = random_range(85,95)
        }
        
        if Phase = 0
        {
            if PhaseTimer < 60
            {
                PhaseTimer += 1 
            }
            else
            {
                PhaseTimer = 0
                Phase = 1
            }
        }   
        
        if Phase = 1
        {
            if PhaseTimer < 120
            {
                if PhaseTimer = 1
                {
                    Rand_Movement_Improved(30, 100, 150, 150, 8)
                }
                
                PhaseTimer += 1 
            }
            else
            {
                PhaseTimer = 0
                Phase = 2
            }
        }
        
        if Phase = 2
        {
            Snum = 10
            
            if BurstAngle = 0
            {
                basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 0, 32, x, y, 3, 1, 360)
                basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 18, 32, x, y, 2.5, 1, 360)
                if global.Diff = "Normal"
                {
                    basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 0, 32, x, y, 2, 1, 360)
                    //basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 36, 32, x, y, 1.5, 1, 360)
                }
            }
            
            if BurstAngle = 1
            {
                basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 0, 32, x, y, 3, 1, 360)
                basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, -18, 32, x, y, 2.5, 1, 360)
                if global.Diff = "Normal"
                {
                    basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, 0, 32, x, y, 2, 1, 360)
                    //basic_bullet_burst(obj_MiddySpell2Danmaku1, Snum, -36, 32, x, y, 1.5, 1, 360)
                }
            }
            
            BurstAngle =! BurstAngle
            ExtraPhaseTick += 1
            if ExtraPhaseTick < 3
            {
                Phase = 0 
            }
            else
            {
                Phase = 3
            }
        }
        
        if Phase = 3
        {
            PhaseTimer += 1
            if PhaseTimer = 1
            {
                with(obj_MiddyCharm2)
                {
                    Redshift = true
                    Killed = true
                }
            }
            
            if PhaseTimer = 60
            {
                Charge = instance_create(x, y, obj_BossBigCharge)
                Charge.host = id
                Charge.Hue = 150
            }
            
            if PhaseTimer = 120
            {
                ChainHeight = random_range(-20,20)
                ChainDirection = random_range(5,20)
                Chain = instance_create(192, 250+ChainHeight, obj_MiddyWarningSpawner2)
                Chain.direction = 0 - ChainDirection
            
                Chain = instance_create(1024-192, 250+ChainHeight, obj_MiddyWarningSpawner2)
                Chain.direction = 180 + ChainDirection
                
                PhaseTimer = 0 
                ExtraPhaseTick = 0
                Phase = 0 
            }
        }
    }
}

#define scr_MiddySpellcard2Hard
if SpellcardDead = false
{
    if PauseTimer < 120
    {
        PauseTimer += 1
        
        if PauseTimer = 60
        {
            Chain = instance_create(x, y, obj_MiddyWarningSpawner2Hard)
            Chain.ChainNo = 20
            Chain.MLAdjust = 125
            Chain.DirInherit = 0
            
            Chain = instance_create(x, y, obj_MiddyWarningSpawner2Hard)
            Chain.ChainNo = 20
            Chain.MLAdjust = 175
            Chain.DirInherit = 1
        }
        
        if PauseTimer = 120 
        {
            Charge = instance_create(x, y, obj_BossBigCharge)
            Charge.host = id
            Charge.Hue = 150
        }
    }
    else
    {
        global.SpellcardBulletRes = 1
        global.SpellcardBombRes = 1
        global.SpellTimerActive = true
        
        BullxSpin += 3
        BullxSpin = BullxSpin % 360
        
        Firerate += 1
        Firerate = Firerate % FR
        if Firerate = 1
        {
            //BullxSpin = random(360) FireSecondry
            bullx = 512 + lengthdir_x(600, BullxSpin)
            bully = ycord + lengthdir_y(650, BullxSpin)
            Bullet = instance_create(bullx + random_range(-10, 10), bully + random_range(-10, 10), obj_MiddySpell2Danmaku2Hard)
            Bullet.direction = BullxSpin - 180
        }
        
        if SecShot = true
        {
            SecondaryShot += 1 
            SecondaryShot = SecondaryShot % 80

            if SecondaryShot = 1
            {
                //if instance_exists(obj_MiddyCharm2Hard)
                //{
                //    with obj_MiddyCharm2Hard
                //    {
                //        FireSecondry = true
                //    }
                //}
                SecSpin += 1
                SecSpin = SecSpin % 360
                ShotNumb = 15
                basic_bullet_burst(obj_MiddySpell2Danmaku1Hard, ShotNumb, SecSpin+direction, 32, x, y, 2, 1, 360)
                basic_bullet_burst(obj_MiddySpell2Danmaku1Hard, ShotNumb, SecSpin+direction+(360/ShotNumb)/2, 32, x, y, 2.5, 1, 360)
                basic_bullet_burst(obj_MiddySpell2Danmaku1Hard, ShotNumb, SecSpin+direction, 32, x, y, 3, 1, 360)
                if global.Diff = "Flightless"
                {
                    basic_bullet_burst(obj_MiddySpell2Danmaku1Hard, ShotNumb, SecSpin+direction+(360/ShotNumb)/2, 32, x, y, 3.5, 1, 360)
                }
            }    
        }
        else
        {
            SecTimer += 1
            if SecTimer = 240
            {
                Charge = instance_create(x, y, obj_BossBigCharge)
                Charge.host = id
                Charge.Hue = 150
            }
            if SecTimer = 240+60
            {
                SecShot = true
            }
        }
        
    }
}