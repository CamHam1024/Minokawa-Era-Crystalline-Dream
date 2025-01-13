#define scr_LilliNonSpell2Init
//General Spell Settings
global.SpellCaptured = false //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0 //the Spellcard Bonus Avalible
global.SpellcardTimeSec = 15 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
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

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 200

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
ycord = 150
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

//Custom Attack Variables
Fire = 0
Phase = 0
PhaseTimer = 0

if global.Diff = "Easy"
{
    Shotnumber = 5
    bullspeed = 3
    RotSpeed = 5
}
    
if global.Diff = "Normal"
{
    Shotnumber = 7
    bullspeed = 3
    RotSpeed = 5
}

RotationDir = true

#define scr_LilliNonSpell2
if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
    
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        //BulletKill
        ClearBullets = true
        with (obj_ParDanmaku){Deadly = false}
        with (obj_LilliArrowTarget){instance_destroy()}
        with (obj_LilliNonSpellBulletSpawner){instance_destroy()}
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        
        obj_ParStagehandler.TimerTicking = true
            
        global.SpellHUDdisplay = false
        if Nonspellfailed = false
        {
            //Items droped
            scr_BossDrops()
        }
            
        if global.SpellcardTimeSec > 0 and global.SpellcardTimeMiliSec > 0
        {
            Explosion = instance_create(x, y, obj_BossExplosionNOSHAKE)
            Explosion.ScreenShake = false
        }
    }
        //Spellcard get?
        //instance_create(0, 0, obj_SpellcardGet)
        
        //Onetime switch
        SpellcardDead = true
        
    if global.Diff = "Easy" or global.Diff = "Normal"
    {
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
                SSD = point_direction(x, y, 1024/2, 20)
                basic_bullet_burst(obj_LilliNonDanmaku2, 1, SSD, 0, x, y, 10, 0, 0)
            }
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====
            global.SpellcardBulletRes = 1
            global.SpellcardBombRes = 1
            global.SpellTimerActive = false
            
            if PhaseTimer = 0
            {
                Fire += 1
                Fire = Fire % 10
                
                if Fire = 1
                {
                    if Phase = 0
                    {
                        instance_create(300+random(50), 300+random(50),obj_LilliArrowTarget)
                    }
                
                    if Phase = 1
                    {
                        instance_create(512+random(50), 300+random(50),obj_LilliArrowTarget)
                    }
                
                    if Phase = 2
                    {
                        instance_create(1024-300+random(50), 300+random(50),obj_LilliArrowTarget)
                    }
                
                    if Phase = 3
                    {
                        if global.Diff = "Normal"
                        {
                            instance_create(512-106+random(50), 350+random(50),obj_LilliArrowTarget)
                        }
                        else
                        {
                            Phase = 5
                        }
                    }
                
                    if Phase = 4
                    {
                        instance_create(512+106+random(50), 350+random(50),obj_LilliArrowTarget)
                    }
                
                    if Phase = 5
                    {
                        PhaseTimer = 120
                        Phase = -1
                    }
                    
                    Phase += 1
                }
            }
            else
            {
                PhaseTimer -= 1
            }
            //================================
         }
          
    }
    //Attack=(When Moving)=============
    
    //=================================
}