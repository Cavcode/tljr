void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_BLACK");

nColour = nColour-1;

    if (nColour < 29)
        {
        nColour = 172;
        }
    else if (nColour > 31 && nColour < 63)
        {
        nColour = 31;
        }
    else if (nColour > 63 && nColour < 113)
        {
        nColour = 63;
        }
    else if (nColour > 115 && nColour < 127)
        {
        nColour = 115;
        }
    else if (nColour > 127 && nColour < 132)
        {
        nColour = 127;
        }
    else if (nColour > 135 && nColour < 167)
        {
        nColour = 135;
        }
    else if (nColour > 167 && nColour < 172)
        {
        nColour = 167;
        }

SetLocalInt(oPC, "COLOUR_BLACK", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

