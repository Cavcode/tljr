void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_GREEN");

nColour=nColour-1;

    if (nColour < 33)
        {
        nColour = 172;
        }
    else if (nColour > 34 && nColour < 52)
        {
        nColour = 34;
        }
    else if (nColour > 55 && nColour < 108)
        {
        nColour = 55;
        }
    else if (nColour > 111 && nColour < 172)
        {
        nColour = 111;
        }

SetLocalInt(oPC, "COLOUR_GREEN", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

