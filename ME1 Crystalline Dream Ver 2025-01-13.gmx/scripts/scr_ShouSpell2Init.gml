#define scr_ShouSpell2Init
//General Spell Settings
global.SpellCaptured = true //Is the spellcard Captured?

if global.Diff = "Easy"
{ 
   global.SpellBonus = BaseScoreVal*Stage2Val*EasyVal //the Spellcard Bonus Avalible 
   global.Spellcardname = "Paper Shreader: Shou's junk mail disposal service" //spellcard name
}

if global.Diff = "Normal"
{ 
   global.SpellBonus = BaseScoreVal*Stage2Val*NormalVal //the Spellcard Bonus Avalible 
   global.Spellcardname = "Paper Shreader: Shou's junk mail disposal service" //spellcard name
}

if global.Diff = "Hard"
{ 
   global.SpellBonus = BaseScoreVal*Stage2Val*HardVal //the Spellcard Bonus Avalible 
   global.Spellcardname = "Object crusher: Shou's firework disposal service" //spellcard name
}

if global.Diff = "Flightless"
{ 
   global.SpellBonus = BaseScoreVal*Stage2Val*FlightlessVal //the Spellcard Bonus Avalible 
   global.Spellcardname = "Object crusher: Shou's explosive ordanance disposal service" //spellcard name
}

global.SpellcardTimeSec = 50 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 700
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

xcord = 512
ycord = 300
Speed = 8

EndWait = 0
EndWaitPhase = 0

//Set Up Variables
ShouPlaneSetup = 0

SpellcardDead = false
SetUpTimer = 0

StartUpSwitch = false

deathSetup = false

//Custom Attack Variables
//warning
WA = instance_create(x, y, obj_WarningArea)
WA.X1 = (190) //Starting Point
WA.Y1 = (768-14)-90 //Starting Point's Y
WA.X2 = (1024-190) //Parallell point
WA.Y2 = (768-14) //Parallell point's Y
WA.WarningLength = 60

//blades
Adjust = 0 
BladeNum = 10



//Spellc variables
Phase = -1
PhaseTimer = 0
Starttime = 60

Fire = 0
Fire1 = 0
Fire2 = 0
SecFire = false

SecPhase = 0
GlaiveAlt = 0

if global.Diff = "Easy"
{
    FR1 = 30
    FR2 = 80
}

if global.Diff = "Normal"
{
    FR1 = 20
    FR2 = 50
}

if global.Diff = "Hard"
{
    FR1 = 20
    FR2 = 50
}

if global.Diff = "Flightless"
{
   FR1 = 20
   FR2 = 50
}



#define scr_ShouSpell2
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
        
        if instance_exists(obj_SpellGlaive1)
        {
            with(obj_SpellGlaive1){instance_destroy()}
        }
        
        //Onetime switch
        SpellcardDead = true
    }
        
    //Next Spell
    global.SpellcardBulletRes = 0
    global.SpellcardBombRes = 0
    global.SpellTimerActive = false
    global.RemainingSpellcards -= 1
    
    global.SpellcardType = "NonSpell"
    
    //Spellcard Specific Setup
    
    //xcord = 512
    //ycord = 300
    //Speed = 20
    
    EndWait += 1
    if EndWait = 1
    {
        //Items droped
        scr_BossDrops()
    }
    
    if EndWait = 60
    {
        instance_create(x , y, obj_WhistleSpawner)
        
        //Play_Sound_Fancy(snd_whistle,global.VolSFX)
    }
    
    if EndWait = 170
    {
        instance_create(1024,300,obj_SetUpPlane)
        
        //Play_Sound_Fancy(snd_planesound,global.VolSFX)
        
        obj_GameHUD.SecSwitch = true
       
        alarm[0] = 120
    }
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
         if SetUpTimer <= Starttime
         {
            if SetUpTimer = Starttime
            {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                global.SpellTimerActive = true
            }
            
            if SetUpTimer = 10
            {
                repeat(BladeNum)
                {
                    glaive = instance_create(0+(1024/BladeNum)/2+Adjust, 830+random_range(-5,5), obj_SpellGlaive1)
                    glaive.ImgScale = 1.3
                    glaive.image_angle = random(360)
                    Adjust += 1024/BladeNum
                }
                
                Adjust = 0 
                repeat(BladeNum)
                {
                    glaive = instance_create(0+Adjust, 800+random_range(-20,20), obj_SpellGlaive1)
                    glaive.image_angle = random(360)
                    
                    Adjust += 1024/BladeNum
                }
            }
            
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====
            
            //================================
         }
          
    }
    
    if SetUpTimer >= Starttime
    {
        
        //Attack=(When Moving)=============
        if StartUpSwitch = false
        {
            global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
            instance_create(x, y, obj_SpellcardInitialeffect)
            
            Cutin = instance_create(x, y, obj_SpellAnimation)
            Cutin.Banner = spr_AojiBanner
            Cutin.Cutin = BossCutin
            
            SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
            SpellCircle.Host = id
            
            StartUpSwitch = true
        }
        
        if Phase = -1
        {
            if PhaseTimer = 1
            {
                SMCharge = instance_create(x, y, obj_SmallCharge)
                SMCharge.Hue = 65
                SMCharge.Host = id
            }
            
            if PhaseTimer = 60
            {
                PhaseTimer = 0
                Phase = 0
            }
            
            PhaseTimer ++
        }
        
        if Phase = 0
        {
            //Shou shot Bullets
            Fire2 += 1
            Fire2 = Fire2 % 20
            if Fire2 = 1
            {
                Play_Sound_Fancy(snd_SFX_BulletFired,global.VolSFX)
                
                PointToPlayer = point_direction(x,y,obj_ParPlayer.x,obj_ParPlayer.y)
                basic_bullet_burst(obj_ShouPackageDanmaku3, 3, PointToPlayer, 50, x, y, 3, 0, 45)
                //basic_bullet_burst(obj_ShouPackageDanmaku3, 8, (360/8)/2, 25, x, y, 1.5, 0, 360)
                //basic_bullet_burst(obj_ShouPackageDanmaku3, 8, (360/8)/2, 0, x, y, 2, 0, 360)
            }
            // ================
            
            // Main Package
            if !instance_exists(obj_SpellPackage1)
            {
                package = instance_create(obj_ParBoss.x, 0, obj_SpellPackage1)
                package.speed = 3
                package.direction = -90
            }
            else
            {
                xcord = obj_SpellPackage1.x
                ycord = 300
                Speed = 8
                
                if place_meeting(x, y, obj_SpellPackage1)
                {
                    Phase = 1
                }
            }
            // =========
        }
    
        if Phase = 1
        {
            //Player Follow Phase
            if PhaseTimer < 60
            {
                xcord = obj_ParPlayer.x
                ycord = 300
                Speed = 3
            }
            // =========
            //Charge before throw
            if PhaseTimer = 60
            {
                SMCharge = instance_create(x, y, obj_SmallCharge)
                SMCharge.Hue = 65
                SMCharge.Host = id
            }
            
            if PhaseTimer < 120-1
            {
                with(obj_SpellPackage1)
                {
                    x = obj_ParBoss.x
                    y = obj_ParBoss.y
                    speed = 0
                    RotationSpeed = 0
                }
            }
            // =========
            //Package throw
            if PhaseTimer = 120
            {
                basic_bullet_burst(obj_ShouPackageDanmaku1, 8, 90, 0, x, y, 8, 0, 100)
                with(obj_SpellPackage1)
                {
                    direction = -90
                    speed = 5
                    RotationSpeed = 5
                }
                
                Phase = 2
                PhaseTimer = 0
            }
            
            PhaseTimer ++
            // =========
        }
        // Reset
        if Phase = 2
        {
            if PhaseTimer = 120
            {
                Phase = -1
                PhaseTimer = 0
                SecFire = true
            }
            PhaseTimer ++
        }
        // =========
        
        //Secondary Fire
        if SecFire = true
        {
            Fire += 1
            Fire = Fire % FR1
            if Fire = 1
            {
                instance_create(512-random_range(-400,400), 0, obj_ShouPackageDanmaku2)
                
            }
            
            Fire1 += 1
            Fire1 = Fire1 % FR2
            if Fire1 = 1
            {
                Play_Sound_Fancy(snd_SFX_BulletFired1,global.VolSFX)
                
                Harmlesspack = instance_create(512-random_range(-400,400), 0, obj_ShouPackage2)
                Harmlesspack.speed = ceil(random_range(1,3))
                Harmlesspack.direction = -90+random_range(-20,20)
            }
        }
        //=================================
    }
}

#define scr_ShouSpell2Hard
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
        
        if instance_exists(obj_SpellGlaive1)
        {
            with(obj_SpellGlaive1){instance_destroy()}
        }
        
        //Onetime switch
        SpellcardDead = true
    }
        
    //Next Spell
    global.SpellcardBulletRes = 0
    global.SpellcardBombRes = 0
    global.SpellTimerActive = false
    global.RemainingSpellcards -= 1
    
    global.SpellcardType = "NonSpell"
    
    //Spellcard Specific Setup
    
    //xcord = 512
    //ycord = 300
    //Speed = 20
    
    EndWait += 1
    if EndWait = 1
    {
        //Items droped
        scr_BossDrops()
    }
    
    if EndWait = 60
    {
        instance_create(x , y, obj_WhistleSpawner)
        
        Play_Sound_Fancy(snd_whistle,global.VolSFX)
    }
    
    if EndWait = 170
    {
        instance_create(1024,300,obj_SetUpPlane)
        
        Play_Sound_Fancy(snd_planesound,global.VolSFX)
        
        obj_GameHUD.SecSwitch = true
       
        alarm[0] = 120
    }
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
         if SetUpTimer <= Starttime
         {
            if SetUpTimer = Starttime
            {
                global.SpellTimerActive = false
            }
            
            if SetUpTimer = 10
            {
                repeat(BladeNum)
                {
                    glaive = instance_create(0+(1024/BladeNum)/2+Adjust, 830+random_range(-5,5), obj_SpellGlaive1)
                    glaive.ImgScale = 1.3
                    glaive.image_angle = random(360)
                    Adjust += 1024/BladeNum
                }
                
                Adjust = 0 
                repeat(BladeNum)
                {
                    glaive = instance_create(0+Adjust, 800+random_range(-20,20), obj_SpellGlaive1)
                    glaive.image_angle = random(360)
                    
                    Adjust += 1024/BladeNum
                }
            }
            
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====
            
            //================================
         }
          
    }
    
    if SetUpTimer >= Starttime
    {
        
        //Attack=(When Moving)=============
        if StartUpSwitch = false
        {
            global.SpellcardType = "Spellcard" //Types: NonSpell, Spellcard, TimeOut
            instance_create(x, y, obj_SpellcardInitialeffect)
            
            Cutin = instance_create(x, y, obj_SpellAnimation)
            Cutin.Banner = spr_AojiBanner
            Cutin.Cutin = BossCutin
            
            SpellCircle = instance_create(x,y,obj_SpellcardSpawner)
            SpellCircle.Host = id
            
            StartUpSwitch = true
        }
        
        if Phase = -1
        {
            if PhaseTimer = 1
            {
                SMCharge = instance_create(x, y, obj_SmallCharge)
                SMCharge.Hue = 65
                SMCharge.Host = id
            }
            
            if PhaseTimer = 60
            {
                PhaseTimer = 0
                Phase = 0
            }
            
            PhaseTimer ++
        }
        
        // Main Package Summon
        if Phase = 0
        {
            if !instance_exists(obj_SpellDynimite)
            {
                package = instance_create(obj_ParBoss.x, 0, obj_SpellDynimite)
                package.speed = 3
                package.direction = -90
            }
            else
            {
                xcord = obj_SpellDynimite.x
                ycord = 300
                Speed = 8
                
                if place_meeting(x, y, obj_SpellDynimite)
                {
                    Phase = 1
                }
            }
        }
        
        // Startled Phase (holding Dynimite)
        if Phase = 1
        {
            if PhaseTimer < 50
            {
                with(obj_SpellDynimite)
                {
                    if speed > 0
                    {
                        speed -= 3/30
                    }
                    RotationSpeed = 0
                }
            }
            
            if PhaseTimer = 50 //Wait
            {
                instance_create(x, y - 100,obj_Wtf)
                
                Warnradi = instance_create(x, (768-14), obj_WarningAreaCircle)
                if global.Diff = "Hard"
                {
                    Warnradi.Radius = 150
                }
                
                if global.Diff = "Flightless"
                {
                   Warnradi.Radius = 250
                }
            }
            
            if PhaseTimer = 100 //Throw
            {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                
                basic_bullet_burst(obj_ShouPackageDanmaku1, 8, 90, 0, x, y, 8, 0, 100)
                package.speed = 8
                package.direction = -90
            }
            
            if PhaseTimer = 160
            {
                PhaseTimer = 0
                Phase = 2
            }
            PhaseTimer ++
        }
        
        //Moevement
        if Phase = 2
        {
            if PhaseTimer < 120
            {
                xcord = obj_ParPlayer.x
                ycord = 300
                Speed = 3
            }
            else
            {
                SecFire = true
                PhaseTimer = 0
                Phase = -1
            }
            PhaseTimer ++
        }
        
        //Secondary Fire
        if SecFire = true
        {
            Fire += 1
            Fire = Fire % FR1
            if Fire = 1
            {
                instance_create(512-random_range(-400,400), 0, obj_ShouPackageDanmaku2)
            }
            
            Fire1 += 1
            Fire1 = Fire1 % FR2
            if Fire1 = 1
            {
                Play_Sound_Fancy(snd_SFX_BulletFired1,global.VolSFX/2)
                
                Harmlesspack = instance_create(512-random_range(-400,400), 0, obj_ShouPackage2)
                Harmlesspack.speed = ceil(random_range(1,2))
                Harmlesspack.direction = -90+random_range(-20,20)
            }
        }
        //=================================
        //========================
    }
}