#define scr_LilliSpell1Init
//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
global.Spellcardname = "Ivar Arrow: Prowling Shot" //spellcard name
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage1Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage1Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 20 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 200
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
global.SpellTimerActive = false
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true
Nonspellfailed = false

//Drops
SmallMana = 10
LargeMana = 0
SmallLife = 3
LargeLife = 0

//Spell Settings and variables
DeathTimer = 0

//Spell Settings and variables
//movement
MoveRate = 0
xcord = 512
ycord = 100
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_BlankCutin
Cutin.Cutin = spr_BlankCutin

SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id

//Custom Attack Variables
Fire = 0
Phase = 0
PhaseTimer = 0

shotdir  = 0
radius = 100

Bulletsshot = 0
if global.Diff = "Hard"{Shotnumber = 8}
if global.Diff = "Flightless"{Shotnumber = 10}
bullspeed = 3
RotationDir = true

ShroundTimer = 0
alternation = true

SecFire = 0
FireSecRate = 15

PointDirection = 0
DirSwitch = false
Deviation = 300

basic_bullet_burst(obj_Shround2, 10, 0, 0, x, y, 1, 0, 360)
basic_bullet_burst(obj_Shround2, 10, 10, 0, x, y, 2, 0, 360)
basic_bullet_burst(obj_Shround2, 10, 20, 0, x, y, 3, 0, 360)
basic_bullet_burst(obj_Shround2, 10, 30, 0, x, y, 4, 0, 360)


#define scr_LilliSpell1
if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
    
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
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
        
        if instance_exists(obj_AttackHaze1)
        {
            with (obj_AttackHaze1){Dead = true}
        }
        
        if instance_exists(obj_Shroud)
        {
            with (obj_Shroud){Dead = true}
        }
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        global.SpellcardType = "NonSpell"
        obj_ParStagehandler.TimerTicking = true
        
        //alarm[0] = 60
        
        //Items droped
        scr_BossDrops()
        
        //Spellcard get?
    
        //Onetime switch
        SpellcardDead = true
        
        if global.SpellcardTimeSec > 0 and global.SpellcardTimeMiliSec > 0
        {
            Explosion = instance_create(x, y, obj_BossExplosionNOSHAKE)
            Explosion.ScreenShake = false
        }
    }
        
        if DeathTimer = 60
        {
            xcord = 700
            ycord = -100
            Speed = 5
        
            if x = xcord and y = ycord
            {
                instance_destroy()
            }
        }
        else
        {
            DeathTimer += 1
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
    if x = xcord and y = ycord
    {
         if SetUpTimer < 60
         {
            if SetUpTimer = 0
            {
            }
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====
            global.SpellcardBulletRes = 1
            global.SpellcardBombRes = 1
            global.SpellTimerActive = true
            if Phase = 0
            {
                Fire += 1
                Fire = Fire % 15
                if Fire = 1
                {
                    if alternation = true
                    {
                        Bullet = instance_create(512+Deviation, 100, obj_AttackHaze1)
                    }
                    else
                    {
                        Bullet = instance_create(512-Deviation, 100, obj_AttackHaze1)
                    }
                    /*if Deviation < 300
                    {
                        Deviation += 300/10 
                    }
                    else
                    {
                        Deviation = 0
                    }*/
                    alternation = !alternation
                }
                
                SecFire += 1
                SecFire = SecFire % FireSecRate
                if SecFire = 1
                {
                    Spawner = instance_create(x, y, obj_BulletSpawner)
                    Spawner.Dir = -PointDirection
                    
                    if DirSwitch = false
                    {
                        if PointDirection < 180
                        {
                            PointDirection += 180/Shotnumber
                        }
                        else
                        {
                            
                            DirSwitch = true
                            Shotnumber += 1
                            Rand_Movement_Improved(30, 100, 100, 300, 5)
                            Phase = 1 
                        }
                    }
                    else
                    {
                        if PointDirection > 0
                        {
                            PointDirection -= 180/Shotnumber
                        }
                        else
                        {
                            DirSwitch = false
                            Shotnumber -= 1
                            Rand_Movement_Improved(30, 300, 100, 150, 5)
                            Phase = 1 
                        }
                    }
                }
            }
            //================================
         }
          
    }
    if SetUpTimer >= 60
    {
        //Attack=(When Moving)=============
        ShroundTimer += 1
        ShroundTimer = ShroundTimer % 7
        if ShroundTimer = 1
        {
            instance_create(random_range(190,1024-190), random_range(-10,400), obj_Shroud)
            instance_create(random_range(190,1024-190), random_range(-10,10), obj_Shroud)
        }
    
        if Phase = 1
        {
            if PhaseTimer < 30
            {
                PhaseTimer += 1
            }
            else
            {
                xcord = x
                ycord = y
                Phase = 0
                PhaseTimer = 0
            }
        }
    }
    //=================================
}