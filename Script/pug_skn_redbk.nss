void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_RED");

nColour = nColour-1;

    if (nColour < 13)
        {
        nColour = 159;
        }
    else if (nColour > 15 && nColour < 44)
        {
        nColour = 15;
        }
    else if (nColour > 45 && nColour < 64)
        {
        nColour = 45;
        }
    else if (nColour > 65 && nColour < 88)
        {
        nColour = 65;
        }
    else if (nColour > 91 && nColour < 96)
        {
        nColour = 91;
        }
    else if (nColour > 103 && nColour < 117)
        {
        nColour = 103;
        }
    else if (nColour > 119 && nColour < 157)
        {
        nColour = 119;
        }

SetLocalInt(oPC, "COLOUR_RED", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

