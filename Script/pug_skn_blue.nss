void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_BLUE");    //blue

if (nColour < 20)
    {
    nColour = 20;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 23 && nColour < 28)
        {
        nColour = 28;
        }
    else if (nColour > 28 && nColour < 36)
        {
        nColour = 36;
        }
    else if (nColour > 38 && nColour < 47)
        {
        nColour = 47;
        }
    else if (nColour > 51 && nColour < 76)
        {
        nColour = 76;
        }
    else if (nColour > 78 && nColour < 82)
        {
        nColour = 82;
        }
    else if (nColour > 83 && nColour < 136)
        {
        nColour = 136;
        }
    else if (nColour > 143 && nColour < 149)
        {
        nColour = 149;
        }
    else if (nColour > 151 && nColour < 165)
        {
        nColour = 165;
        }
    else if (nColour > 165)
        {
        nColour = 20;
        }
    }

SetLocalInt(oPC, "COLOUR_BLUE", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

