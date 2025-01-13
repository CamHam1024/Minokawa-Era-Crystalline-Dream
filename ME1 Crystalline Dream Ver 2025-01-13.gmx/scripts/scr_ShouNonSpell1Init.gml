#define scr_ShouNonSpell1Init
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
    MaxLetters = 3
    MaxRange = 30
}

if global.Diff = "Normal"
{
    MaxLetters = 5
    MaxRange = 50
}

if global.Diff = "Hard"
{
    MaxLetters = 6
    MaxRange = 50
}

if global.Diff = "Flightless"
{
    MaxLetters = 7
    MaxRange = 50
}

//Unchangeable Vars
Phase = 0
SubPhase = 0

MoveTimer = 0

FireCounter = 0

#define scr_ShouNonSpell1
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
                global.SpellTimerActive = true
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
        Fire += 1
        Fire = Fire % 120
        
        if Fire = 1
        {
            SMCharge = instance_create(x, y, obj_SmallCharge)
            SMCharge.Hue = 65
            SMCharge.Host = id
        }
        
        if Fire = 60
        {
            if SubPhase = 0
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
            
            Phase = 2
            SubPhase =! SubPhase
        }
            
    }
    
    if Phase = 2
    {
        if MoveTimer < 120
        {
            MoveTimer ++
        }
        
        if MoveTimer = 60
        {
            Rand_Movement_Improved(30, 100, 250, 300, 3)
        }
        
        if MoveTimer = 120
        {
            Fire += 1
            Fire = Fire % 30
        
            if Fire = 1
            {
                //MaxLetters = (E)3 (N)5 (H)6 (F)7
                //MaxRange = (E)30 (N)50 (H)50 (F)50
                
                repeat(MaxLetters)
                {
                    Play_Sound_Fancy(snd_SFX_BulletFired1,global.VolSFX)
                    
                    basic_bullet_burst(obj_ShouBulletSpawner1, 1, 90+random_range(-MaxRange,MaxRange), 10, x, y, random_range(2,6), 0, 0+random_range(-MaxRange,MaxRange))
                }
                
                FireCounter += 1
            }
            
            if FireCounter = 5
            {
                Phase = 3
                FireCounter = 0
                MoveTimer = 0 
            }
        }
    }
    
    if Phase = 3
    {
        if MoveTimer < 30
        {
            MoveTimer ++
            
        }
        else
        {
            Phase = 1
            FireCounter = 0
            MoveTimer = 0 
            Fire = 0
            
        }
    }
    //=================================
}