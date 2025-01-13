//Small SmallMana LargeMana SmallLife LargeLife
repeat(SmallMana)
{
     Manasmall = instance_create(x, y, obj_ManaSmall)
}
     
//Large
repeat(LargeMana)
{
     Manalarge = instance_create(x, y, obj_ManaLarge)
}

//Life fragments
//Small
repeat(SmallLife)
{
     Lifesmall = instance_create(x, y, obj_LifeSmall)
}
     
//Large
repeat(LargeLife)
{
     Lifelarge = instance_create(x, y, obj_LifeLarge)
}

//spellcard
if global.SpellCaptured = true
{
    SpellcardDrop = instance_create(x, y, obj_DroppedSpellcard)
    SpellcardDrop.StoredScore = global.SpellBonus * global.PreenPointMultiply
    SpellcardDrop.image_index = global.BossActive
}
