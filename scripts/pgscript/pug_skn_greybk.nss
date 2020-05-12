void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_GREY");

nColour = nColour - 1;

    if (nColour < 16)
        {
        nColour = 128;
        }
    else if (nColour > 18 && nColour < 26)
        {
        nColour = 18;
        }
    else if (nColour > 27 && nColour < 41)
        {
        nColour = 27;
        }
    else if (nColour > 42 && nColour < 84)
        {
        nColour = 42;
        }
    else if (nColour > 87 && nColour < 112)
        {
        nColour = 87;
        }
    else if (nColour > 115 && nColour < 121)
        {
        nColour = 115;
        }

SetLocalInt(oPC, "COLOUR_GREY", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

