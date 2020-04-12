void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_PURPLE");

if (nColour < 46)
    {
    nColour = 46;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 47 && nColour < 69)
        {
        nColour = 69;
        }
    else if (nColour > 73 && nColour < 82)
        {
        nColour = 82;
        }
    else if (nColour > 83 && nColour < 146)
        {
        nColour = 146;
        }
    else if (nColour > 147 && nColour < 160)
        {
        nColour = 160;
        }
    else if (nColour > 163 && nColour < 170)
        {
        nColour = 170;
        }
    else if (nColour > 170)
        {
        nColour = 46;
        }
    }

SetLocalInt(oPC, "COLOUR_PURPLE", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

