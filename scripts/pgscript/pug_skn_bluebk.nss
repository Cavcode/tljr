void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_BLUE");

nColour = nColour-1;

    if (nColour < 20)
        {
        nColour = 165;
        }
    else if (nColour > 23 && nColour < 28)
        {
        nColour = 23;
        }
    else if (nColour > 28 && nColour < 36)
        {
        nColour = 28;
        }
    else if (nColour > 38 && nColour < 47)
        {
        nColour = 38;
        }
    else if (nColour > 51 && nColour < 76)
        {
        nColour = 51;
        }
    else if (nColour > 78 && nColour < 82)
        {
        nColour = 78;
        }
    else if (nColour > 83 && nColour < 136)
        {
        nColour = 83;
        }
    else if (nColour > 143 && nColour < 149)
        {
        nColour = 143;
        }
    else if (nColour > 151 && nColour < 165)
        {
        nColour = 151;
        }

SetLocalInt(oPC, "COLOUR_BLUE", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

