if instance_number(obj_MiddyBarrier) < BarAmount + BarAmount2 + BarAmount3
{
    repeat (BarAmount3)
    {
        Xrad = lengthdir_x(Rad3, BarDir)
        Yrad = lengthdir_y(Rad3, BarDir)
        Barrier = instance_create(x + Xrad, y + Yrad, obj_MiddyBarrier)
        Barrier.image_angle = ImgAng
        Barrier.image_xscale = 0.2
        Barrier.MaxAlpha = 1
        Barrier.Host = id
        Barrier.Rad = Rad3
        Barrier.Dir = BarDir
        Barrier.Type = 0
    
        ImgAng += 360/(BarAmount3)
        BarDir += 360/(BarAmount3)
    }
    
    repeat (BarAmount2)
    {
        Xrad = lengthdir_x(Rad2, BarDir)
        Yrad = lengthdir_y(Rad2, BarDir)
        Barrier = instance_create(x + Xrad, y + Yrad, obj_MiddyBarrier)
        Barrier.image_angle = ImgAng
        Barrier.image_xscale = 1
        Barrier.MaxAlpha = 1
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
        Barrier.MaxAlpha = 1
        Barrier.Host = id
        Barrier.Rad = Rad
        Barrier.Dir = BarDir
        Barrier.Type = 0
    
        ImgAng += 360/BarAmount
        BarDir += 360/BarAmount
    }
}
