#define scr_LilliNonSpell1Init
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

SpellcardDead = false

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
ycord = 250
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

//Custom Attack Variables
Fire = 0
Phase = 0
PhaseTimer = 0

shotdir  = 0
radius = 100

Bulletsshot = 0
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

if global.Diff = "Hard"
{
    Shotnumber = 9
    bullspeed = 5
    RotSpeed = 9
}
    
if global.Diff = "Flightless"
{
    Shotnumber = 9
    bullspeed = 10
    RotSpeed = 9
}

RotationDir = true

#define scr_LilliNonSpell1
if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
    
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        //BulletKill
        ClearBullets = true
        with (obj_ParDanmaku){Deadly = false}
        
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
            if Phase = 0
            {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                global.SpellTimerActive = true
                
                Fire += 1
                Fire = Fire % 3
                if Fire = 1
                {
                    basic_bullet_burst(obj_LilliDanmaku1, Shotnumber, shotdir, radius, x, y, 0, 0, 360)
                }
                
                if radius > 0
                {
                    radius -= 100/60
                    if RotationDir = true
                    {
                        shotdir += RotSpeed
                    }
                    else
                    {
                        shotdir -= RotSpeed
                    }
                }
                else
                {
                    Phase = 0.5
                }
            }
            
            if Phase = 0.5
            {
                Fire = 0
                radius = 100
                shotdir = 0
                Phase = 1
            }
            
            if Phase = 1
            {
                Fire += 1
                Fire = Fire % 3
                if Fire = 1
                {
                    basic_bullet_burst(obj_LilliFragment, 1, shotdir, 0, x, y, 5, 0, 360)

                    if RotationDir = true
                    {
                        shotdir += 8
                    }
                    else
                    {
                        shotdir -= 8
                    }
                    
                    Bulletsshot += 1
                }
                
                if Bulletsshot = 40
                {
                    Phase = 1.5
                }
            }
            
            if Phase = 1.5
            {
                Bulletsshot = 0
                shotdir = 0
                //Phase = 0
                
            }
            
            //================================
         }
          
    }
    //Attack=(When Moving)=============
    if Phase = 1.5
    {
        Rand_Movement_Improved(30, 100, 100, 300, 5)
        PhaseTimer += 1
        if PhaseTimer >= 60
        {
            RotationDir =! RotationDir
            Phase = 0
            PhaseTimer = 0
            xcord = x
            ycord = y
        } 
    }
    //=================================
}