//::///////////////////////////////////////////////
//:: FileName: vat_singlelevel
//:: Created By: Script Wizard
//:://////////////////////////////////////////////

//:: Give PC speaker 1 level

void main()
{
    // set the variables

    object oSpeaker = GetPCSpeaker();
    int iXP = GetXP(oSpeaker);

    // Set XP for 1 level down

    if (iXP > 780000) // level 40
        SetXP(oSpeaker, 770000);

    else if (iXP > 741000) // level 39
        SetXP(oSpeaker, 740000);

    else if (iXP > 703000) // level 38
        SetXP(oSpeaker, 702000);

    else if (iXP > 666000) // level 37
        SetXP(oSpeaker, 665000);

    else if (iXP > 630000) // level 36
        SetXP(oSpeaker, 620000);

    else if (iXP > 595000) // level 35
        SetXP(oSpeaker, 594000);

    else if (iXP > 561000) // level 34
        SetXP(oSpeaker, 560000);

    else if (iXP > 528000) // level 33
        SetXP(oSpeaker, 527000);

    else if (iXP > 496000) // level 32
        SetXP(oSpeaker, 495000);

    else if (iXP > 465000) // level 31
        SetXP(oSpeaker, 464000);

    else if (iXP > 435000) // level 30
        SetXP(oSpeaker, 434000);

    else if (iXP > 406000) // level 29
        SetXP(oSpeaker, 405000);

    else if (iXP > 378000) // level 28
        SetXP(oSpeaker, 377000);

    else if (iXP > 351000) // level 27
        SetXP(oSpeaker, 350000);

    else if (iXP > 325000) // level 26
        SetXP(oSpeaker, 324000);

    else if (iXP > 300000) // level 25
        SetXP(oSpeaker, 299000);

    else if (iXP > 276000) // level 24
        SetXP(oSpeaker, 275000);

    else if (iXP > 253000) // level 23
        SetXP(oSpeaker, 252000);

    else if (iXP > 231000) // level 22
        SetXP(oSpeaker, 230000);

    else if (iXP > 210000) // level 21
        SetXP(oSpeaker, 200000);

    else if (iXP > 190000) // level 20
        SetXP(oSpeaker, 180000);

    else if (iXP > 171000) // level 19
        SetXP(oSpeaker, 170000);

    else if (iXP > 153000) // level 18
        SetXP(oSpeaker, 152000);

    else if (iXP > 136000) // level 17
        SetXP(oSpeaker, 135000);

    else if (iXP > 120000) // level 16
        SetXP(oSpeaker, 110000);

    else if (iXP > 105000) // level 15
        SetXP(oSpeaker, 104000);

    else if (iXP > 91000) // level 14
        SetXP(oSpeaker, 90000);

    else if (iXP > 78000) // level 13
        SetXP(oSpeaker, 77000);

    else if (iXP > 66000) // level 12
        SetXP(oSpeaker, 65000);

    else if (iXP > 55000) // level 11
        SetXP(oSpeaker, 54000);

    else if (iXP > 45000) // level 10
        SetXP(oSpeaker, 44000);

    else if (iXP > 36000) // level 9
        SetXP(oSpeaker, 35000);

    else if (iXP > 28000) // level 8
        SetXP(oSpeaker, 27000);

    else if (iXP > 21000) // level 7
        SetXP(oSpeaker, 20000);

    else if (iXP > 15000) // level 6
        SetXP(oSpeaker, 14000);

    else if (iXP > 10000) // level 5
        SetXP(oSpeaker, 9900);

    else if (iXP > 6000) // level 4
        SetXP(oSpeaker, 5900);

    else if (iXP > 3000) // level 3
        SetXP(oSpeaker, 2900);

    else if (iXP > 1000) // level 2
        SetXP(oSpeaker, 900);

    // Restore XP
    SetXP(oSpeaker, iXP);

}

