void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_YELLOW");

nColour = nColour-1;

    if (nColour < 54)
        {
        nColour = 155;
        }
    else if (nColour > 55 && nColour < 66)
        {
        nColour = 55;
        }
    else if (nColour > 66 && nColour < 93)
        {
        nColour = 66;
        }
    else if (nColour > 95 && nColour < 154)
        {
        nColour = 95;
        }

SetLocalInt(oPC, "COLOUR_YELLOW", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

