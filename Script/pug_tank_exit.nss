void main()
{
    object oPC = GetExitingObject();
    string sTank =GetStringRight(GetTag(OBJECT_SELF),1);
    string sFaction;

        if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
            {sFaction="Rebels";}
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
            {sFaction="Empire";}
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE)
            {sFaction="Fringe";}

        SetLocalInt(GetWaypointByTag("DEAD_"+sFaction+"_"+sTank), "OCCUPIED"+sTank, FALSE);
}
