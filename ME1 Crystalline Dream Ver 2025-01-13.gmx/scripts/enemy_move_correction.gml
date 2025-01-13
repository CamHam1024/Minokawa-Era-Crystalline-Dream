///for when you need to use LengthDir
if x = xprevious {ImageIndex = 0}
if x < xprevious {ImageIndex = 4}
if x > xprevious {ImageIndex = 8}

Anim += 0.10
Anim = Anim mod 4
image_index = ImageIndex + Anim
