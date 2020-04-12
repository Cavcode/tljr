void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_BROWN");

if (nColour < 4)
    {
    nColour = 4;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 7 && nColour < 10)
        {
        nColour = 10;
        }
    else if (nColour > 11 && nColour < 129)
        {
        nColour = 129;
        }
    else if (nColour > 131 && nColour < 173)
        {
        nColour = 173;
        }
    else if (nColour > 174)
        {
        nColour = 4;
        }
    }

SetLocalInt(oPC, "COLOUR_BROWN", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

