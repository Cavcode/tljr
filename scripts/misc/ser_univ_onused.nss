void main()
{

    object oPC = GetLastUsedBy();
    object oUsed = OBJECT_SELF;

    // Geonosis Arena Gong
    if (GetTag(oUsed) == "Geo_Arena_Gong")
    {
        int nGongNumber = GetLocalInt(oUsed, "GONG_NUMBER");
        int nMobNumber = GetLocalInt(oUsed, "MOB_NUMBER");
        int i;

        if (nGongNumber >= 5)
        {
            FloatingTextStringOnCreature("The sound of the gong echoes through the Arena, but nothing more approaches.", oPC);
        }

        for (i = nMobNumber; i > 0; i--)
        {
            FloatingTextStringOnCreature("The sound of the gong rings out! Something stirs!", oPC);
            CreateObject(OBJECT_TYPE_CREATURE, "GEO_ARENA_MOB_" +IntToString(nGongNumber),
            GetLocation( GetWaypointByTag( "GEO_ARENA_"+IntToString( Random(3) +1 ) ) ), FALSE);
        }
        SetLocalInt(oUsed, "MOB_NUMBER", nMobNumber--);
        SetLocalInt(oUsed, "GONG_NUMBER", nGongNumber++);
    }

}
