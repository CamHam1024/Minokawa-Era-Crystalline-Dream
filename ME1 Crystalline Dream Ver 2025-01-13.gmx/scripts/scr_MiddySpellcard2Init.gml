//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured? SubBulNumber

if global.Diff = "Easy" or global.Diff = "Normal"
{
    global.Spellcardname = "Defencive Barrier: Wall Warding" //spellcard name
    AttackPattern = scr_MiddySpellcard2Easy
    
    //movement
    MoveRate = 0
    xcord = 512
    ycord = 150
    Speed = 8
    PauseTimer = 0
}
else
{
    global.Spellcardname = "Self Defence Sheild: Circle Warding" //spellcard name
    AttackPattern = scr_MiddySpellcard2Hard
    
    //movement
    MoveRate = 0
    xcord = 512
    ycord = 250
    Speed = 8
    PauseTimer = 0
}

if global.Diff = "Easy"{ global.SpellBonus = BaseScoreVal*Stage1Val*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = BaseScoreVal*Stage1Val*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage1Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage1Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 45 //how many seconds the spellcard starts with
global.SpellTimeStart = global.SpellcardTimeSec
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

KillTimer = 0

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 150

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_AojiBanner
Cutin.Cutin = spr_MiddyFull
SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id

//Drops
SmallMana = 10
LargeMana = 0
SmallLife = 0
LargeLife = 0

//Spell Settings and variables

//Custom Attack Variables
Phase = 0 //current Phase
PhaseTimer = 0
Firerate = 0 //This controls the speed of the firerate of Middy's riungs
SecAttack = false //Controls secodnary attack time
BurstAngle = 0
ExtraPhaseTick = 0
BullxSpin = 0 
SecondaryShot = 0
SecShot = false
SecTimer = 0 
SecSpin = 0

if global.Diff = "Easy"
{ 
    FR = 15
}

if global.Diff = "Normal"
{ 
    FR = 13
}

if global.Diff = "Hard"
{ 
    FR = 8
}

if global.Diff = "Flightless"
{ 
    FR = 5
}
