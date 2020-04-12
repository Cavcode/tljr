void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_PALE");

if (nColour < 1)
    {
    nColour = 1;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 1 && nColour < 8)
        {
        nColour = 8;
        }
    else if (nColour > 9 && nColour < 24)
        {
        nColour = 24;
        }
    else if (nColour > 25 && nColour < 74)
        {
        nColour = 74;
        }
    else if (nColour > 74 && nColour < 116)
        {
        nColour = 116;
        }
    else if (nColour > 117 && nColour < 129)
        {
        nColour = 129;
        }
    else if (nColour > 129 && nColour < 156)
        {
        nColour = 156;
        }
    else if (nColour > 156)
        {
        nColour = 1;
        }
    }

SetLocalInt(oPC, "COLOUR_PALE", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

