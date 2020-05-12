void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_RED");

if (nColour < 13)
    {
    nColour = 13;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 15 && nColour < 44)
        {
        nColour = 44;
        }
    else if (nColour > 45 && nColour < 64)
        {
        nColour = 64;
        }
    else if (nColour > 65 && nColour < 88)
        {
        nColour = 88;
        }
    else if (nColour > 91 && nColour < 96)
        {
        nColour = 96;
        }
    else if (nColour > 103 && nColour < 117)
        {
        nColour = 117;
        }
    else if (nColour > 119 && nColour < 157)
        {
        nColour = 157;
        }
    else if (nColour > 159)
        {
        nColour = 13;
        }
    }

SetLocalInt(oPC, "COLOUR_RED", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

