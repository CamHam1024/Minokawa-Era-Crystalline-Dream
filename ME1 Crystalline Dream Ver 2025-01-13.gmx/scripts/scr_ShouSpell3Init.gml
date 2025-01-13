#define scr_ShouSpell3Init
global.SpellCaptured = true //Is the spellcard Captured?

if global.Diff = "Easy" or global.Diff = "Normal"
{ 
   global.Spellcardname = "Straight Line Flying" //"Straight Line Flying" //spellcard name
}
else 
{
    global.Spellcardname = "Multi Directional Flying" //spellcard name
}

if global.Diff = "Easy"{ global.SpellBonus = BaseScoreVal*Stage2Val*EasyVal }//the Spellcard Bonus Avalible 
if global.Diff = "Normal"{ global.SpellBonus  = BaseScoreVal*Stage2Val*NormalVal }//the Spellcard Bonus Avalible 
if global.Diff = "Hard"{ global.SpellBonus = BaseScoreVal*Stage2Val*HardVal }//the Spellcard Bonus Avalible 
if global.Diff = "Flightless"{ global.SpellBonus = BaseScoreVal*Stage2Val*FlightlessVal }//the Spellcard Bonus Avalible 

global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "TimeOut" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 10
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
//global.SpellTimerActive = true
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true
Nonspellfailed = false

//Charge = instance_create(x, y, obj_BossBigCharge)
//Charge.host = id
//Charge.Hue = 64

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

Planecontact = false
direction = 0
speed = 0
x = 512
y = -100

xcord = 512
ycord = -100
Speed = 8

AttackSwitch = false

//Set Up Variables
if global.Diff = "Easy"
{ 
   DiffAngle = 10 
   DiffAngleFlip = 180
}

if global.Diff = "Normal"
{ 
   DiffAngle = 30 
   DiffAngleFlip = 180
} 

if global.Diff = "Hard"
{ 
   DiffAngle = 10 
   DiffAngleFlip = 90
}

if global.Diff = "Flightless"
{ 
   DiffAngle = 10 
   DiffAngleFlip = 90
}


SpellcardDead = false
SetUpTimer = 0

instance_create(x, y, obj_SpellcardInitialeffect)
Cutin = instance_create(x, y, obj_SpellAnimation)
Cutin.CutinDisplay = true
Cutin.Banner = spr_AojiBanner
Cutin.Cutin = BossCutin

//SpellCircle = instance_create(1024/2,768/2,obj_SpellcardSpawner)
//SpellCircle.Host = obj_ParPlayer


//Custom Attack Variables
PlaneSpawn = 0
PlaneNo = 0
PlaneInc = 50

AngleFlip = 0 
PPhase = 0
PPClock = 0

#define scr_ShouSpell3
/*if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
            
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        MoveRate = 0
        xcord = 512
        ycord = 768/2
        Speed = 8
        
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
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
        
        //Reset Values
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards -= 1
        
        //Next Spell
        if KillTimer < 30
        {
            KillTimer += 1
        }
        else
        {
            global.SpellcardType = "NonSpell"
        }
        
        Explosion = instance_create(x, y, obj_BossDefeatedExplosion)
        Explosion.ScreenShake = true
        Explosion.DeathDialog = PostDialog
        
        //Items droped
        scr_BossDrops()
        
        //Onetime switch
        SpellcardDead = true
    }
}*/       
    
//If Times up
if global.SpellcardTimeSec = 0 and global.SpellcardTimeMiliSec = 0
{
    if global.SpellTimerActive = true
    {
        Explosion = instance_create(190, 768/2, obj_BossDefeatedExplosion)
        Explosion.ScreenShake = true
        Explosion.DeathDialog = PostDialog
        
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
        
        if instance_exists(obj_ParLaser)
        {
            with (obj_ParLaser){Deadly = false}
        }
            
            
        if DeathTimer < 30
        {
            DeathTimer += 1
        }
        else
        {
            global.SpellcardType = "NonSpell"
        }
        
        obj_ShouBoss.CustomMovement = true
        obj_ShouBoss.image_alpha = 0
        obj_ShouBoss.x = 512
        obj_ShouBoss.y = -100
        
        //Items droped
        scr_BossDrops()
        
        //Reset Values
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        global.RemainingSpellcards = 0
    }
}
    
//Attack 
if SpellcardDead = false
{
    if PPClock < 160
    {
        PPClock += 1
    }
    if PPClock = 60
    {
        obj_ShouBoss.CustomMovement = true
        obj_ShouBoss.image_alpha = 0
        obj_ShouBoss.x = 1024
        obj_ShouBoss.y = 768/2

        Charge = instance_create(500, 500, obj_BossBigCharge)
        Charge.host = id
        Charge.Hue = 64
        Charge.MaxScale = 3
        
        global.SpellTimerActive = true
    }
    
    if PPhase = 0 and PPClock >= 160
    {
        PlaneSpawn += 1
        PlaneSpawn = PlaneSpawn % floor((60*13)/5)
        if PlaneSpawn = 1
        {
            //Variable flips
            Rando = random_range(-DiffAngle,DiffAngle)
            Length = 500
            
            if AngleFlip = 180 or AngleFlip = 0
            {
                PPX = 1024/2 
                PPY =  obj_ParPlayer.y
            }
            else if AngleFlip = 90 or AngleFlip = 270
            {
                PPX = obj_ParPlayer.x
                PPY = 768/2
            }

            //Plane Spawn
            PlaneX = PPX + lengthdir_x(Length, AngleFlip+Rando)
            PlaneY = PPY + lengthdir_y(Length, AngleFlip+Rando)
            Plane = instance_create(PlaneX, PlaneY, obj_ShouPlane)
            Plane.FlightAngle = AngleFlip+Rando
            Plane.Phase = 0
            
            //postSpawn changes
            AngleFlip += DiffAngleFlip
            AngleFlip = AngleFlip % 360
            
            PlaneNo += 1
            if PlaneNo = 5
            {
                PPhase = 1
            } 
        }
    }
    
    if PPhase = 1
    {
        PlaneSpawn += 1
        PlaneSpawn = PlaneSpawn % 150
        if PlaneSpawn = 1
        {
            //Plane Spawn
            PlaneX = 1024/2 + lengthdir_x(Length, 180)
            PlaneY = 200 + lengthdir_y(Length, 180)
            Plane = instance_create(PlaneX, PlaneY, obj_ShouPlane)
            Plane.FlightAngle = 180
            Plane.Phase = 1
            
            //postSpawn changes
            AngleFlip += DiffAngleFlip
            AngleFlip = AngleFlip % 360
            PlaneNo = 0
            PPhase = 2
        }
    }
    
    if PPhase = 2
    {
        PlaneSpawn += 1
        PlaneSpawn = PlaneSpawn % (100 + PlaneInc)
        if PlaneSpawn = 1
        {
            //Variable flips
            Rando = random_range(-DiffAngle,DiffAngle)
            Length = 500
            
            if AngleFlip = 180 or AngleFlip = 0
            {
                PPX = 1024/2 
                PPY =  obj_ParPlayer.y
            }
            else if AngleFlip = 90 or AngleFlip = 270
            {
                PPX = obj_ParPlayer.x
                PPY = 768/2
            }

            //Plane Spawn
            PlaneX = PPX + lengthdir_x(Length, AngleFlip+Rando)
            PlaneY = PPY + lengthdir_y(Length, AngleFlip+Rando)
            Plane = instance_create(PlaneX, PlaneY, obj_ShouPlane)
            Plane.FlightAngle = AngleFlip+Rando
            Plane.ATKPause = AttackSwitch
            Plane.Phase = 2
            
            //postSpawn changes
            AngleFlip += DiffAngleFlip
            AngleFlip = AngleFlip % 360
            AttackSwitch = !AttackSwitch
            
            if PlaneInc > 0
            {
                PlaneInc -= floor(50/3)
            }
            else
            {
                PlaneNo += 1
            }
            
            if PlaneNo = 3
            {
                PPhase = 3 
            }
        }
    }
    
    if PPhase = 3
    {
        
    } 
}