#define scr_TiaSpell1Init
//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
global.Spellcardname = "Vixen Aspect: Foxtime" //spellcard name

if global.Diff = "Easy"{ global.SpellBonus = BaseScoreVal*Stage2Val*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = BaseScoreVal*Stage2Val*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage2Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage2Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 20 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 300
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
global.SpellTimerActive = false
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true
Nonspellfailed = false

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 25

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
Cutin.Banner = spr_AojiBanner
Cutin.Cutin = BossCutin

SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id

//Custom Attack Variables
Phase = 0
secPhase = 1

PhaseTimer = 0 

Fire1 = 0

Wispcount = 0
WispPhase = 0

FM1direct = 0
Fire1Rate = 5

DirectionSwitch = false
DirBase = 0 //Start direction of the waves
Distbase = 40*1 //How far the  bullets  extend each wave
RingRad = 100 // start radius of waves

if global.Diff = "Easy"{NoOfWaves  = 1}
if global.Diff = "Normal"{NoOfWaves  = 2}
if global.Diff = "Hard"{NoOfWaves  = 3}
if global.Diff = "Flightless"{NoOfWaves  = 4}

DistanceAdd = 0


#define scr_TiaSpell1
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
        
        if instance_exists(obj_ParEnemy)
        {
            with (obj_ParEnemy){instance_destroy()}
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
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                global.SpellTimerActive = true
            }
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====
           
            //================================
         }
          
    }
    if SetUpTimer >= 60
    {
        //Attack=(When Moving)=============
        
        //Phase 1================
        if Phase = 0
        {
            advanced_bullet_burst(obj_TiaDanmaku2, x, y, 0, 0.1, 1, RingRad+(Distbase*DistanceAdd), RingRad+(Distbase*DistanceAdd), DirBase - FM1direct, 0)
              
            if DistanceAdd < NoOfWaves
            {     
                if DirectionSwitch = false
                {
                    if FM1direct < 200
                    {
                        FM1direct += 180/20
                    }
                    else
                    {
                        DistanceAdd += 1
                        DirectionSwitch = true
                        DirBase = random_range(-10,10)
                    }
                }
                else
                {
                    if FM1direct > -20
                    {
                        FM1direct -= 180/20
                    }
                    else
                    {
                        DistanceAdd += 1
                        DirectionSwitch = false
                        DirBase = random_range(-10,10)
                    }
                }
            }
            else
            {
                secPhase = 1
                Phase = 0.5
            }
        }
        
        if Phase = 0.5
        {
            PhaseTimer += 1
            if PhaseTimer = 60
            {
                FM1direct = 0
            
                //global.SpellcardBulletRes = 1
                //global.SpellcardBombRes = 1
                //global.SpellTimerActive = true
                
                Rand_Movement_Improved(30, 100, 250, 300, 3)
                
                DirectionSwitch = false
                DistanceAdd = 0
                PhaseTimer = 0 
                Phase = 0
            }
        }
        //===============
        
        //Phase 2=======================
        if secPhase = 1
        {
            Fire1 += 1
            Fire1 = Fire1 % 120 //Firrate

            if Fire1 = 1
            {
                if WispPhase = 0
                {
                    SpellWisp = instance_create(175,500,obj_TiaFamiliarsSpell1)
                    SpellWisp.MoveDirection = 20
                }
                else
                {
                    SpellWisp = instance_create(833+16,500,obj_TiaFamiliarsSpell1)
                    SpellWisp.MoveDirection = 180-20
                }
                
                if Wispcount = 3
                {
                    WispPhase =! WispPhase
                    Wispcount = 0
                }
                else
                {
                    Wispcount += 1
                }
            }
        }        
        //=================================
        
    }
}