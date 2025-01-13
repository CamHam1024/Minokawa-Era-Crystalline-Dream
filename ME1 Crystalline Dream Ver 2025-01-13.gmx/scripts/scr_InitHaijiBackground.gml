///AlexandraSpellBackground
StageBackground = 0
BossSpellBackground = 0

ActiveAlpha = 0
rotation = 0

NoOfCards = 10
NoOfCards1 = 14

n = 0
n2 = 0

nn = 0
nn2 = 0

repeat(NoOfCards)
{
    Cardmovement[n] = random_range(-500, 0)
    Y[n] = random_range(0, 768)
    RandIncrease[n] = random_range(3, 5)
    n += 1
}

repeat(NoOfCards1)
{
    Cardmovement1[nn] = random_range(1024, 1524)
    Y1[nn] = random_range(0, 768)
    RandIncrease1[nn] = random_range(3, 5)
    nn += 1
}

/*Cardmovement[1] = 0
Y[1] = random_range(0, 768)
RandIncrease[1] = random_range(3, 5)

Cardmovement[2] = 0
Y[2] = random_range(0, 768)
RandIncrease[2] = random_range(3, 5)

Cardmovement[3] = 0
Y[3] = random_range(0, 768)
RandIncrease[3] = random_range(3, 5)

Cardmovement[4] = 0
Y[4] = random_range(0, 768)
RandIncrease[4] = random_range(3, 5)

Cardmovement[5] = 0
Y[5] = random_range(0, 768)
RandIncrease[5] = random_range(3, 5)

Cardmovement[6] = 0
Y[6] = random_range(0, 768)
RandIncrease[6] = random_range(3, 5)

Cardmovement[7] = 0
Y[7] = random_range(0, 768)
RandIncrease[7] = random_range(3, 5)

Cardmovement[8] = 0
Y[8] = random_range(0, 768)
RandIncrease[8] = random_range(3, 5)

Cardmovement[9] = 0
Y[9] = random_range(0, 768)
RandIncrease[9] = random_range(3, 5)

