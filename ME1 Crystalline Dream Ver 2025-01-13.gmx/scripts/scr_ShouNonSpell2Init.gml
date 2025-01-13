#define scr_ShouNonSpell2Init
//General Spell Settings
global.SpellCaptured = false //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0 //the Spellcard Bonus Avalible
global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 350
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
Charge.Hue = 65

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
//Difficulty adjustments

if global.Diff = "Easy"
{
    PackageNum = 12
}

if global.Diff = "Normal"
{
    PackageNum = 18
}

if global.Diff = "Hard"
{
    PackageNum = 12
}

if global.Diff = "Flightless"
{
    PackageNum = 18
}

//Unchangeable Vars
Phase = 0
SubPhase = 0

MoveTimer = 0

FireCounter = 0
FireDir = 0

#define scr_ShouNonSpell2
if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
    
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        //BulletKill
        ClearBullets = true
        with (obj_ParDanmaku){Deadly = false}
        
        if instance_exists(obj_ParEnemy)
        {
            with (obj_ParEnemy){instance_destroy()}
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
                global.SpellTimerActive = false
                Phase = 1
            }
            
            if SetUpTimer = 60
            {
                Phase = 1
            }
            
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====  obj_TiaDanmaku1
            
            //================================
         }
          
    }
    //Attack=(When Moving)=============
    //Attack 1
    if Phase = 1 
    {
        if FireCounter = 0
        {
            Play_Sound_Fancy(snd_SFX_BulletFired1,global.VolSFX*1.5)
            
            basic_bullet_burst(obj_ShouPackage1, PackageNum, FireDir, 10, x, y, 2, 0, 360)
            
            if global.Diff = "Hard" or global.Diff = "Flightless"
            {
                basic_bullet_burst(obj_ShouPackage1, PackageNum, FireDir+(360/PackageNum)/2, 10, x, y, 3.5, 0, 360)
            }
        }
        
        FireCounter += 1
        
        if FireCounter = 60 - 50
        {
            SMCharge = instance_create(x, y, obj_SmallCharge)
            SMCharge.Hue = 65
            SMCharge.Host = id
        }
        
        if FireCounter = 120 - 50
        {
            Phase = 2 
            FireCounter = 0
        }
    }
    
    if Phase = 2
    {
        if FireCounter = 0
        {
            if SubPhase = 0 and instance_number(obj_ShouGlaiveDanmaku) <= 2
            {
                Glaive = instance_create(x, y, obj_ShouGlaiveDanmaku)
                Glaive.direction = 180+random_range(20,30)
                Glaive.speed = 10
                Glaive.Rotate = 0
            }
            else
            {
                Glaive = instance_create(x, y, obj_ShouGlaiveDanmaku)
                Glaive.direction = random_range(-30,-20)
                Glaive.speed = 10
                Glaive.Rotate = 1
            }
        }
        
        FireCounter += 1
        
        if FireCounter = 60
        {
            SMCharge = instance_create(x, y, obj_SmallCharge)
            SMCharge.Hue = 65
            SMCharge.Host = id
            Rand_Movement_Improved(30, 100, 250, 300, 3)
        }
        
        if FireCounter = 250
        {
            Phase = 1 
            SubPhase =! SubPhase
            FireCounter = 0
        }
    }
    //=================================         
}