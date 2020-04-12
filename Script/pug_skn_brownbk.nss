void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_BROWN");

nColour = nColour-1;

    if (nColour < 4)
        {
        nColour = 174;
        }
    else if (nColour > 7 && nColour < 10)
        {
        nColour = 7;
        }
    else if (nColour > 11 && nColour < 129)
        {
        nColour = 11;
        }
    else if (nColour > 131 && nColour < 173)
        {
        nColour = 131;
        }

SetLocalInt(oPC, "COLOUR_BROWN", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

