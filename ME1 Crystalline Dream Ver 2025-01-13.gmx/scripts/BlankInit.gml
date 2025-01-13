//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
global.Spellcardname = "Hazy card: Short Term Amnesia" //spellcard name

if global.Diff = "Easy"{ global.SpellBonus = 1000000*Stage1Val+1000000*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = 1000000*Stage1Val+1000000*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = 1000000*Stage1Val+1000000*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = 1000000*Stage1Val+1000000*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
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

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_AojiBanner
Cutin.Cutin = spr_MidnightBossCutin
SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id

//Drops
SmallMana = 20
LargeMana = 0
SmallLife = 10
LargeLife = 0

//Spell Settings and variables
//movement
MoveRate = 0
xcord = -20
ycord = 50
Speed = 8

//Custom Attack Variables
PauseTimer = 0
Index = 0
DIRECTION = 0
Timer = 0
radius = 500
