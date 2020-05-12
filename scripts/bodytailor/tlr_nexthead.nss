// This script changes the head model by
// increasing the number associated with it
void main()
{
    int nHead = GetCreatureBodyPart(CREATURE_PART_HEAD);
    object oPC = GetPCSpeaker();
    int nRace = GetRacialType(oPC);
    string sModel;
    string sColumn;
    int nMax;

    nHead++;

    // Check for the end cap. We go by gender and race to determine it.
    // Females
    if(GetGender(oPC) == GENDER_FEMALE)
    {
        switch(nRace)
        {
            case 0:
                nMax = 27;
                sColumn = "HEAD_FEMALE_DWARF";
                break;
            case 1:
                nMax = 186;
                sColumn = "HEAD_FEMALE_ELF";
                break;
            case 2:
                nMax = 20;
                sColumn = "HEAD_FEMALE_GNOME";
                break;
            case 3:
                nMax = 176;
                sColumn = "HEAD_FEMALE_HALFLING";
                break;
            case 4: case 6:
                nMax = 191;
                sColumn = "HEAD_FEMALE_HUMAN";
                break;
            case 5:
               nMax = 23;
                sColumn = "HEAD_FEMALE_HALF_ORC";
                break;
            case 1000:
                nMax = 2;
                sColumn = "HEAD_FEMALE_WEMIC";
                break;
            case 1002:
                nMax = 36;
                sColumn = "HEAD_FEMALE_BROWNIE";
                break;
        }
    }
    else // males and everything else
    {
        switch(nRace)
        {
            case 0:
                nMax = 28;
                sColumn = "HEAD_MALE_DWARF";
                break;
            case 1:
                nMax = 39;
                sColumn = "HEAD_MALE_ELF";
                break;
            case 2:
                nMax = 39;
                sColumn = "HEAD_MALE_GNOME";
                break;
            case 3:
                nMax = 169;
                sColumn = "HEAD_MALE_HALFLING";
                break;
            case 4: case 6:
                nMax = 165;
                sColumn = "HEAD_MALE_HUMAN";
                break;
            case 5:
                nMax = 36;
                sColumn = "HEAD_MALE_HALF_ORC";
                break;
            case 1000:
                nMax = 4;
                sColumn = "HEAD_MALE_WEMIC";
                break;
            case 1002:
                nMax = 32;
                sColumn = "HEAD_MALE_BROWNIE";
                break;
        }
    }

    //Loop to 0 if greater than max head
//    if(nHead > nMax)
//     {
//         nHead = 0;
//     }
//     else
//    {
//        // Skip the blank heads
//        sModel = Get2DAString("cepheadmodel", sColumn, nHead);
//        while(sModel == "")
//        {
//            nHead++;
//            sModel = Get2DAString("cepheadmodel", sColumn, nHead);
//        }
//    }

    // Set the head model
    SetCreatureBodyPart(CREATURE_PART_HEAD, nHead);

    SendMessageToPC(oPC, "New Appearance: " + IntToString(nHead));
}
