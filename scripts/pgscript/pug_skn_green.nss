void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_GREEN");    //green

if (nColour < 33)
    {
    nColour = 33;
    }
else
    {
    nColour++;

    if (nColour > 34 && nColour < 52)
        {
        nColour = 52;
        }
    else if (nColour > 55 && nColour < 108)
        {
        nColour = 108;
        }
    else if (nColour > 111 && nColour < 172)
        {
        nColour = 172;
        }
    else if (nColour > 172)
        {
        nColour = 33;
        }
    }

SetLocalInt(oPC, "COLOUR_GREEN", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

