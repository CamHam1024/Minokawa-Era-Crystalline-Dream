if instance_number(obj_MiddyBarrier) < BarAmount + BarAmount2
{
    repeat (BarAmount2)
    {
        Xrad = lengthdir_x(Rad2, BarDir)
        Yrad = lengthdir_y(Rad2, BarDir)
        Barrier = instance_create(x + Xrad, y + Yrad, obj_MiddyBarrier)
        Barrier.image_angle = ImgAng
        Barrier.image_xscale = 1
        Barrier.MaxAlpha = 0.6
        Barrier.Host = id
        Barrier.Rad = Rad2
        Barrier.Dir = BarDir
        Barrier.Type = 1
    
        ImgAng += 360/(BarAmount2)
        BarDir += 360/(BarAmount2)
    }

    repeat (BarAmount)
    {
        Xrad = lengthdir_x(Rad, BarDir)
        Yrad = lengthdir_y(Rad, BarDir)
        Barrier = instance_create(x + Xrad, y + Yrad, obj_MiddyBarrier)
        Barrier.image_angle = ImgAng
        Barrier.image_xscale = 0.2
        Barrier.MaxAlpha = 0.8
        Barrier.Host = id
        Barrier.Rad = Rad
        Barrier.Dir = BarDir
        Barrier.Type = 0
    
        ImgAng += 360/BarAmount
        BarDir += 360/BarAmount
    }
}
