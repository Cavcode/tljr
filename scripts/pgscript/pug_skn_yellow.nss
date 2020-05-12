void main()
{
object oPC = GetPCSpeaker();
int nColour = GetLocalInt(oPC, "COLOUR_YELLOW");    //yellow

if (nColour < 54)
    {
    nColour = 54;
    }
else
    {
    nColour = nColour+1;

    if (nColour > 55 && nColour < 66)
        {
        nColour = 66;
        }
    else if (nColour > 66 && nColour < 93)
        {
        nColour = 93;
        }
    else if (nColour > 95 && nColour < 154)
        {
        nColour = 154;
        }
    else if (nColour > 155)
        {
        nColour = 54;
        }
    }

SetLocalInt(oPC, "COLOUR_YELLOW", nColour);
SetColor(oPC, COLOR_CHANNEL_SKIN, nColour);
}

