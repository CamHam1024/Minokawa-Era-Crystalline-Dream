#define scr_ShouSpell1Init
//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?

if global.Diff = "Easy" or global.Diff = "Normal"
{ 
   global.Spellcardname = "Motus Aspect: Battlefield Delivery" //spellcard name
}
else
{
    global.Spellcardname = "Paradox: Impossible Coordernation" //spellcard name
}

if global.Diff = "Easy"{ global.SpellBonus = BaseScoreVal*Stage2Val*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = BaseScoreVal*Stage2Val*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage2Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage2Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 50 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
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

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 64

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

XcordMove = 0

xcord = 512 + lengthdir_x(400, 0)
ycord = 300
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
WA = instance_create(x, y, obj_WarningArea)
WA.X1 = (190) //Starting Point
WA.Y1 = (768-14)-100//Starting Point's Y
WA.X2 = (1024-190) //Parallell point
WA.Y2 = (768-14) //Parallell point's Y
WA.WarningLength = 140

WA = instance_create(x, y, obj_WarningArea)
WA.X1 = 190 //Starting Point
WA.Y1 = 14//Starting Point's Y
WA.X2 = 1024-190 //Parallell point
WA.Y2 = 14+100 //Parallell point's Y
WA.WarningLength = 140

Phase = 0
PhaseTimer = 0

FireSecondary = false

if global.Diff = "Easy"
{
    SLetterNum = 6
}

if global.Diff = "Normal"
{
    SLetterNum = 8
}

if global.Diff = "Hard"
{
    SLetterNum = 10
}

if global.Diff = "Flightless"
{
    SLetterNum = 12
}



#define scr_ShouSpell1
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
        
        if instance_exists(obj_ShouSpell1Spawner)
        {
            with (obj_ShouSpell1Spawner){instance_destroy()}
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

        xcord = 512
        ycord = 250
        Speed = 8
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
        XcordMove += 0.5
        XcordMove = XcordMove % 360
        
        xcord = 512 + lengthdir_x(400, XcordMove)
        ycord = 300
        Speed = 8
        
        if x < 300 or x > 724
        {
            if FireSecondary = true
            {
                if object_exists(obj_ParPlayer)
                {
                    PtP = point_direction(x, y, obj_ParPlayer.x, obj_ParPlayer.y)//Point to Player
                }
                
                basic_bullet_burst(obj_ShouSmallglaive, SLetterNum, PtP, 10, x, y, 0.5, 0, 360)
                FireSecondary = false
            }
        }
        else
        {
            FireSecondary = true
        }
        
        if Phase = 0
        {
            if PhaseTimer = 0
            {
                instance_create(x, 768, obj_ShouSpell1Spawner)
                
                if global.Diff = "Hard" or global.Diff = "Flightless"
                {
                    PhaseTimer ++
                }
            }
            
            if global.Diff = "Easy" or global.Diff = "Normal"
            {
                PhaseTimer += 1
                if PhaseTimer = 60*3
                {
                    PhaseTimer = 0
                    Phase = 1
                } 
            }
            
            
        }   
        
        if global.Diff = "Easy" or global.Diff = "Normal"
        {
            if Phase = 1
            {
                if PhaseTimer = 0
                {
                    instance_create(x, 0, obj_ShouSpell1Spawner)
                }
                
                PhaseTimer += 1
                if PhaseTimer = 60*3
                {
                    PhaseTimer = 0
                    Phase = 0
                } 
            }   
        }
        //=================================
        
    }
}