void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_PURPLE");

    nColour = nColour-1;

    if (nColour < 46)
        {
        nColour = 170;
        }
    else if (nColour > 47 && nColour < 69)
        {
        nColour = 47;
        }
    else if (nColour > 73 && nColour < 82)
        {
        nColour = 73;
        }
    else if (nColour > 83 && nColour < 146)
        {
        nColour = 83;
        }
    else if (nColour > 147 && nColour < 160)
        {
        nColour = 147;
        }
    else if (nColour > 163 && nColour < 170)
        {
        nColour = 163;
        }

SetLocalInt(oPC, "COLOUR_PURPLE", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

