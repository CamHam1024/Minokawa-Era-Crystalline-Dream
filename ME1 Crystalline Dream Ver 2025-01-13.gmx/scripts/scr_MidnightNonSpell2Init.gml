//General Spell Settings
global.SpellCaptured = false //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0//the Spellcard Bonus Avalible 
global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellTimeStart = global.SpellcardTimeSec
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

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

//Drops
SmallMana = 20
LargeMana = 0
SmallLife = 10
LargeLife = 0

//Spell Settings and variables
//movement
MoveRate = 0
xcord = 512
ycord = 250
Speed = 8

//Custom Attack Variables
PauseTimer = 0 //stop and star spellcards with this timer variable
Phase = -1
PhaseTimer = 0

PrimFire = 0
SecFire = 0 
SecShotDir = 0
BurstNumber = 3
Length = 100
Type = 0
Type1 = 0
ChainY = 0

MovementPause = 121

Dir = 0 

NoofSecShots = 10
WT = 0

Type = 0

if global.Diff = "Easy"
{
    FireRate = 4
    SecShotNumb = 10
}

if global.Diff = "Normal"
{
    FireRate = 4
    SecShotNumb = 10
}

if global.Diff = "Hard"
{
    FireRate = 4
    SecShotNumb = 10
}

if global.Diff = "Flightless"
{
    FireRate = 4
    SecShotNumb = 10
}


