#define scr_TiaNonSpell1Init
//General Spell Settings
global.SpellCaptured = false //Is the spellcard Captured?
global.Spellcardname = "" //spellcard name
global.SpellBonus = 0 //the Spellcard Bonus Avalible
global.SpellcardTimeSec = 30 //how many seconds the spellcard starts with
global.SpellcardTimeMiliSec = 0 
global.SpellcardType = "NonSpell" //Types: NonSpell, Spellcard, TimeOut
global.LastWord = false
global.SpellcardMaxHealth = 300
global.SpellcardHealth = global.SpellcardMaxHealth
global.SpellcardBulletRes = 0 //this shows the damamge the player will do to the boss at 0 equals Normal Damage
global.SpellcardBombRes = 0 //similar to Bullet Resistence but for Bomb related damages
global.SpellTimerActive = false
global.SpellHUDdisplay = true
global.SpellcardCleared = false
global.SecondarynonSpell = true
Nonspellfailed = false

SpellcardDead = false

Charge = instance_create(x, y, obj_BossBigCharge)
Charge.host = id
Charge.Hue = 25

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
xcord = 512
ycord = 250
Speed = 8

//Set Up Variables
SpellcardDead = false
SetUpTimer = 0

//Custom Attack Variables
FireMode1 = true
PTP = point_direction(x, y, obj_ParPlayer.x, obj_ParPlayer.y)

AltFire = true

FM1direct = -90
FM2direct = -90

WispRate = 0

MoveWait = 0
Phase = -1

Fire1 = 0
if global.Diff = "Easy"{Fire1Rate = 6}
if global.Diff = "Normal"{Fire1Rate = 3}
if global.Diff = "Hard"{Fire1Rate = 2}
if global.Diff = "Flightless"{Fire1Rate = 2}


#define scr_TiaNonSpell1
if global.SpellcardHealth <= 0
{
    //Kill remaining health
    global.SpellcardHealth = 0
    
    if SpellcardDead = false  //Onetime Switch for when the boss dies
    {
        //BulletKill
        ClearBullets = true
        with (obj_ParDanmaku){Deadly = false}
        
        if instance_exists(obj_ParEnemy)
        {
            with (obj_ParEnemy){instance_destroy()}
        }
        
        //Next Spell
        global.SpellcardBulletRes = 0
        global.SpellcardBombRes = 0
        global.SpellTimerActive = false
        
        alarm[0] = 60
        
        if Nonspellfailed = false
        {
            //Items droped
            scr_BossDrops()
        }
            
        //Spellcard get?
        //instance_create(0, 0, obj_SpellcardGet)
        
        //Onetime switch
        SpellcardDead = true
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
         if SetUpTimer < 60
         {
            if SetUpTimer = 0
            {
                global.SpellcardBulletRes = 1
                global.SpellcardBombRes = 1
                global.SpellTimerActive = true
                Phase = 0
                
            }
            SetUpTimer += 1
         }
         else
         {
            //Attack=(When Standing Still)====  obj_TiaDanmaku1
            
            //================================
         }
          
    }
    //Attack=(When Moving)=============
    //Attack 1
    if Phase = 0
    {
        Fire1 += 1
        Fire1 = Fire1 % Fire1Rate //Firrate

        if Fire1 = 1
        {
            //Bullet = instance_create(x, y, obj_TiaDanmaku1)
            //Bullet.direction = PTP + FM1direct //Point to player + Firemode1 Direction
            //Bullet.speed = 1
            RingRad = 30
            advanced_bullet_burst(obj_TiaDanmaku1, x, y, 0, 1, 1, RingRad, RingRad, PTP + FM1direct, 0)
        }
                
        if FM1direct < 90
        {
            FM1direct += 180/60
        }
        else
        {
            Phase = 0.5
            PTP = point_direction(x, y, obj_ParPlayer.x, obj_ParPlayer.y)
            FM1direct = -90
        }
    }
        
    Spawnspeed = 30    
    
    //Intermission 1 
    if Phase = 0.5
    {
        //Wisp spawning
        WispRate += 1
        WispRate = WispRate % Spawnspeed
        if WispRate = 1
        {
            instance_create(x + lengthdir_x(150, random(360)), y + lengthdir_y(150, random(360)), obj_TiaFamiliars) 
        }
        
        //Movement
        if MoveWait = 1
        {
            Rand_Movement_Improved(50, 100, 200, 300, 8)
        }
        
        if MoveWait < 60
        {
            MoveWait += 1
        }
        else
        {
            Phase = 1
            MoveWait = 0
            WispRate = 0
        }
    }
    
    //Attack 2
    if Phase = 1 
    {
        Fire1 += 1
        Fire1 = Fire1 % Fire1Rate //Fire rate

        if Fire1 = 1
        {
            //Bullet = instance_create(x, y, obj_TiaDanmaku1) cord
            //Bullet.direction = PTP + FM1direct //Point to player + Firemode1 Direction
            //Bullet.speed = 1
            RingRad = 30
            advanced_bullet_burst(obj_TiaDanmaku1, x, y, 0, 1, 1, RingRad, RingRad, PTP - FM2direct, 0)
        }
                
        if FM2direct < 90
        {
            FM2direct += 180/60
        }
        else
        {
            Phase = 1.5
            PTP = point_direction(x, y, obj_ParPlayer.x, obj_ParPlayer.y)
            FM2direct = -90
        }
                
    }
     
    // Intermission 2
    if Phase = 1.5
    {
        if global.Diff = "Hard"
        {
            //Wisp spawning  Hard
            if MoveWait = 1
            {
                if AltFire = true
                {
                    instance_create(191 + 50, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2) 
                    instance_create(833 - 50, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                    instance_create(191 + 150, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                    instance_create(833 - 150, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                }
                
                //AltFire =! AltFire
            }
        }
        
        if global.Diff = "Flightless"
        {
            //Wisp spawning Flightless
            if MoveWait = 1
            {
                if AltFire = true
                {
                    instance_create(191 + 100, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2) 
                    instance_create(833 - 100, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                    instance_create(191 + 230, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                    instance_create(833 - 230, y + lengthdir_y(10, random(360)), obj_TiaFamiliars2)
                }
                
                //AltFire =! AltFire
            }
        }
        
        //Movement
        if MoveWait = 1
        {
            Rand_Movement_Improved(50, 100, 200, 300, 8)
        }
        
        if MoveWait < 60
        {
            MoveWait += 1
        }
        else
        {
            Phase = 0
            MoveWait = 0
            WispRate = 0
        }
    }
    //=================================
}