///Player_Movement(unfocused spd, focused spd)

//=Player movement speed=
ufspd = argument0*global.PlayerSpeed
fspd = argument1*global.PlayerSpeed

if keyboard_check(vk_right)
    {
    if x < 1024 - 192 - 5 - WalledInvar
        {
        if Focused = false
            {
            x += ufspd
            }else{
            x += fspd
            }
        }
    }
    
if keyboard_check(vk_left)
    {
    if x > 192 + 5 + WalledInvar
        {
        if Focused = false
            {
            x -= ufspd
            }else{
            x -= fspd
            }
        }
    }

if x > 1024 - 192 - 5 - WalledInvar
{
    x = 1024 - 192 - 5 - WalledInvar - 1
}

if x < 192 + 5 + WalledInvar
{
    x = 192 + 5 + WalledInvar + 1
}
    
if keyboard_check(vk_up)
    {
    if y > 14 + 5 + WalledInvar
        {
        if Focused = false
            {
            y -= ufspd
            }else{
            y -= fspd
            }
        }
    }
if keyboard_check(vk_down)
    {
    if y < 768 - 14 - 5 - WalledInvar
        {
        if Focused = false
            {
            y += ufspd
            }else{
            y += fspd
            }
        }
    }
    
if y > 768 - 14 - 5 - WalledInvar
{
    y = 768 - 14 - 5 - WalledInvar - 1
}

if y < 14 + 5 + WalledInvar
{
    y = 14 + 5 + WalledInvar + 1
}
    
if keyboard_check(vk_left) and keyboard_check(vk_right)
    {
    if x > 205
        {
        if Focused = false
            {
            x -= ufspd
            }else{
            x -= fspd
            }
        }
    }
if Dead = false
{
    if keyboard_check(vk_shift)
    {
        Focused = true
    }
    
    if !keyboard_check(vk_shift)
    {
        Focused = false
    }
}

//=Player Sprite Animation=
if keyboard_check(vk_left)
    {
    image_xscale = 1
    if Stationary = true
        {
        Index = 4
        Stationary = false
        }
    }

if keyboard_check(vk_right)
    {
    image_xscale = -1
    if Stationary = true
        {
        Index = 4
        Stationary = false
        }
    }
    
if keyboard_check(vk_left) and keyboard_check(vk_right)
    {
    image_xscale = 1
    if Stationary = true
        {
        Index = 4
        Stationary = false
        }
    }
    
if !keyboard_check(vk_left) and !keyboard_check(vk_right)
    {
    image_xscale = 1
    if Stationary = false
        {
        Index = 0
        Stationary = true
        }
    } 
    
if Stationary = true
    {
    if Index > 3
        {
        Index = 0
        }
    }else{
    if Index > 11
        {
        Index = 8
        }
    }
