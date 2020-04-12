int StartingConditional()
{
object oPC = GetPCSpeaker();
string sArea = GetTag(GetArea(oPC));
object oShip;
if (sArea == "pug_isd_1"){oShip = GetObjectByTag("PL_S_ISD");}
else if (sArea == "pug_mcc_1"){oShip = GetObjectByTag("PL_S_MCC");}
string sShip = GetStringRight(GetTag(oShip),3);
    // Inspect local variables
    if(!(GetLocalInt(oShip, "SHIP_FIGHTERS") == 1))
        return FALSE;

    return TRUE;
}
