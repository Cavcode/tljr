void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_GREY");    //grey

if (nColour < 16)
    {
    nColour = 16;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 18 && nColour < 26)
        {
        nColour = 26;
        }
    else if (nColour > 27 && nColour < 41)
        {
        nColour = 41;
        }
    else if (nColour > 42 && nColour < 84)
        {
        nColour = 84;
        }
    else if (nColour > 87 && nColour < 112)
        {
        nColour = 112;
        }
    else if (nColour > 115 && nColour < 121)
        {
        nColour = 121;
        }
    else if (nColour > 128)
        {
        nColour = 16;
        }
    }

SetLocalInt(oPC, "COLOUR_GREY", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

