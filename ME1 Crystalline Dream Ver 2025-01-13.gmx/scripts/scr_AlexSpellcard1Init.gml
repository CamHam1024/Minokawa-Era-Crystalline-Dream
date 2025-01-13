//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?
if global.Diff = "Easy" or global.Diff = "Normal"
{
    global.Spellcardname = "Stellar Brew: Nova in a Bottle" //spellcard name
}else{
    global.Spellcardname = "Stellar Brew: Supernova in a Bottle" //spellcard name
}
if global.Diff = "Easy"{ global.SpellBonus = BaseScoreVal*Stage1Val*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = BaseScoreVal*Stage1Val*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage1Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage1Val*FlightlessVal }//the Spellcard Bonus Avalible 

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

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 200

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_AlexandraBanner
Cutin.Cutin = spr_AlexFull

SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
SpellCircle.Host = id

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
Phase = 0.5
PhaseTimer = 0
Fire = 0

direction2 = direction

SecondaryAttack = false 
SecFire = 0

if global.Diff = "Easy"
{
    shotfreq = 120
    FireNumb2 = 20
}

if global.Diff = "Normal"
{
    shotfreq = 120
    FireNumb2 = 30
}

if global.Diff = "Hard"
{
    shotfreq = 100
    FireNumb2 = 30
}

if global.Diff = "Flightless"
{
    shotfreq = 60
    FireNumb2 = 30
}
