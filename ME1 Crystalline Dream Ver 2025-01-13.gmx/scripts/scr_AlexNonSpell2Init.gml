//General Spell Settings
global.SpellCaptured = false //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0 //the Spellcard Bonus Avalible
global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 250
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
global.SpellTimerActive = false
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true
Nonspellfailed = false

//Drops
SmallMana = 0
LargeMana = 0
SmallLife = 0
LargeLife = 0

//Spell Settings and variables
//movement
MoveRate = 0
xcord = 512
ycord = 250
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0
MoveRate = 0
Movetime = 0

//Custom Attack Variables
Phase = -1
PhaseResetTimer = 0
PauseInt = 120

ShotDir = 0 
FireFreq = 0 
randomizer = random(360)
if global.Diff = "Easy"
{
    BulletAmount = 7
}

if global.Diff = "Normal"
{
    BulletAmount = 7
}

if global.Diff = "Hard"
{
    BulletAmount = 7
}

if global.Diff = "Flightless"
{
    BulletAmount = 8
}
