//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?

if global.Diff = "Easy"
{ 
   global.SpellBonus = BaseScoreVal*Stage1Val*EasyVal 
   global.Spellcardname = "Botany: Flower Garden"
}

if global.Diff = "Normal"
{ 
   global.SpellBonus = BaseScoreVal*Stage1Val*NormalVal 
   global.Spellcardname = "Botany: Flower Garden"
}

if global.Diff = "Hard"
{ 
   global.SpellBonus = BaseScoreVal*Stage1Val*HardVal
   global.Spellcardname = "Botany: Glacial Blossom"
}

if global.Diff = "Flightless"
{ 
   global.SpellBonus = BaseScoreVal*Stage1Val*FlightlessVal
   global.Spellcardname = "Botany: Glacial Blossom"
}

global.SpellcardTimeSec = 60 //how many seconds the spellcard starts with
global.SpellTimeStart = global.SpellcardTimeSec
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 450
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
global.SpellTimerActive = false
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 200

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_AlexandraBanner
Cutin.Cutin = spr_AlexFull

SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id


KillTimer = 0
//Drops
SmallMana = 10
LargeMana = 0
SmallLife = 0
LargeLife = 0

//Spell Settings and variables
//movement
MoveRate = 0
xcord = 512
ycord = 250
Speed = 8

//Custom Attack Variables
Phase = 0
PhaseTimer = 0
Timer = 0
Timer2 = 0
Dir = 0
Fire = 0
Rad = 0

Burst = 0
BurstNumb = 2
ResetTimer = 0
MovementChange = 0
PhaseTimerSwitch = true

if global.Diff = "Easy"
{
    BNLimit = 10
}

if global.Diff = "Normal"
{
    BNLimit = 15
}

if global.Diff = "Hard"
{
    BNLimit = 20
}

if global.Diff = "Flightless"
{
    BNLimit = 20
}
