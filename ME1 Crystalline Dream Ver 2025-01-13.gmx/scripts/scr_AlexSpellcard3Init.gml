//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
global.Spellcardname = "Broken Artifact: Lamp of Growth" //spellcard name

if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage1Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage1Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 60 //how many seconds the spellcard starts with
global.SpellTimeStart = global.SpellcardTimeSec
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 700
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
ycord = 300
StartX = 512
StartY = 300
Speed = 8

//Custom Attack Variables
Phase = 0
MovementInc = 90
PhaseTimer0 = 0
PhaseTimer1 = 0
PhaseTimer2 = 0
PhaseTimer3 = 0
SpeedIncrease = 0

SecAttackTimer = 0
SecAttack = 0
SecDir = 0
