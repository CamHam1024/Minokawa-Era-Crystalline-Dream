//draw_text_outline(312, 768/2, "Leaf Scroll: "+string(LS1), c_white, c_dkgray, 2, ft_HUDText, 1)
//draw_text_outline(312, 768/2+30, "Leaf Col front: "+string(LC[0]), c_white, c_dkgray, 2, ft_HUDText, 1)
//draw_text_outline(312, 768/2+60, "Leaf Col back: "+string(LC[1]), c_white, c_dkgray, 2, ft_HUDText, 1)

LS1 += 5
if LS1 >= 1024
{
    LC[0] = LC[1]
    LC[1] = random(3)
    LS1 = 0
}

for (var i = 0; i < 2; i += 1)
{
    draw_sprite_ext(spr_Testtleaves, LC[i], 0-LS1+(1024*i), 768-58, 1, 1, 0, c_white, 1)
}

