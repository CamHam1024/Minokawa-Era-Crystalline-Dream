//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured? SubBulNumber

global.Spellcardname = "Anomily: Tunnelvison" //spellcard name


if global.Diff = "Easy"{ global.SpellBonus = 1000000*Stage1Val+1000000*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus = 1000000*Stage1Val+1000000*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = 1000000*Stage1Val+1000000*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = 1000000*Stage1Val+1000000*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 90 //how many seconds the spellcard starts with
global.SpellTimeStart = global.SpellcardTimeSec
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 1000
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
Charge.Hue = 150

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.Banner = spr_AojiBanner
Cutin.Cutin = spr_MidnightBossCutin
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
ycord = 768/2
Speed = 8
PauseTimer = 0

//Custom Attack Variables
Phase = 0 //current Phase
RingFire = 0 //This controls the speed of the firerate of Middy's riungs
RingNumber = 1 //Number of rings before reset
Type = 0 //this controls the direction of the ring
SecAttack = false //Controls secodnary attack time
SubBulletDir = 0
SecondaryFire = 0
WAIT = 0

BlindRad = 200
BlindDir = 0

Fire = 0

if global.Diff = "Easy"
{ 
    SubBulNumber = 1 
    RNDInc = 3
    
    noOfChains = 2
    DisburseRatio = 400
    SW = 5
}

if global.Diff = "Normal"
{ 
    SubBulNumber = 3 
    RNDInc = 3
    
    noOfChains = 2
    DisburseRatio = 400
    SW = 5

}

if global.Diff = "Hard"
{ 
    SubBulNumber = 5 
    RNDInc = 3
    
    noOfChains = 2
    DisburseRatio = 400
    SW = 5

    
}

if global.Diff = "Flightless"
{ 
    SubBulNumber = 5 
    RNDInc = 3
    
    noOfChains = 3
    DisburseRatio = 400
    SW = 5

}
