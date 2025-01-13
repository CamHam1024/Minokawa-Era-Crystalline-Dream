#define scr_Memeinit
//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0 //the Spellcard Bonus Avalible
global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
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

SpellcardDead = false

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
ycord = 250
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

//Custom Attack Variables
Phase = 0
SubPhase = 0

MemeTimer = 0
MemeCount = 0
MemeFire = 0
MemeRot = 0

#define scr_Meme
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
        if MemeCount < 5
        {
            MemeFire ++
            MemeFire = MemeFire % 10
            if MemeFire = 1
            {
                //basic_bullet_burst(obj_LargeShouMemeMail, 20, playerpoint, 10, x, y,  3, 0, 360)
                basic_bullet_burst(obj_LargeShouMemeMail, 20, MemeRot, 10, x, y,  4, 0, 360)
                Play_Sound_Fancy(SND_Mail,global.VolSFX)
                
                MemeRot += (360/20)/2
                MemeCount ++ 
            }
        }
        else
        {
            if MemeTimer < 60
            {
                MemeTimer ++
            }
            else
            {
                Phase = 2
                
                xcord = 512
                ycord = 150
                Speed = 8
            }
        }
    }
    
    if Phase = 2
    {
        instance_create(512, 150, obj_BigEnvelope)
        Phase = 2.1
    }
    //=================================
}