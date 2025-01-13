//draw_sprite_tiled_ext(spr_AlexandraBG3, 0, 0, -SBGYScroll, 1, 1, c_white, ActiveAlpha)
draw_sprite_ext(spr_HaijiProp4, 1, 1024/2, 768/2, 1.5, 1.5, rotation, c_white, ActiveAlpha-0.4)

rotation += 0.1
rotation = rotation % 360

//draw_sprite_ext(spr_HaijiProp3, 0, 0, 0, 1, 1, 0, c_white, ActiveAlpha)

repeat(NoOfCards1)
{
    draw_sprite_ext(spr_HaijiProp2, 1, 1024 + Cardmovement1[nn2], Y1[nn2], 0.7, 0.7, 0, c_gray, ActiveAlpha-0.2)

    Cardmovement1[nn2] -= RandIncrease1[nn2]
    Cardmovement1[nn2] = Cardmovement1[nn2] % 1024
    if Cardmovement1[nn2] <= -1000 
    {
        Y1[nn2] = random_range(0, 768)
        Cardmovement1[nn2] = 0
    }
    
    nn2 += 1
    nn2 = nn2 % NoOfCards1
}

draw_sprite_ext(spr_HaijiProp1, 0, 512, 386, 1, 1, 0, c_white, ActiveAlpha)

repeat(NoOfCards)
{
    draw_sprite_ext(spr_HaijiProp2, 1, Cardmovement[n2], Y[n2], 1, 1, 0, c_white, ActiveAlpha-0.4)

    Cardmovement[n2] += RandIncrease[n2]
    Cardmovement[n2] = Cardmovement[n2] % 1024
    if Cardmovement[n2] >= 1000 {Y[n2] = random_range(0, 768)}
    n2 += 1
    n2 = n2 % NoOfCards
}

//Alpha Activation
if global.SpellcardType = "Spellcard" or global.SpellcardType = "TimeOut"
{
    if ActiveAlpha < 1 {ActiveAlpha += 0.05 }
}else{
    if ActiveAlpha > 0 {ActiveAlpha -= 0.05 }
}
