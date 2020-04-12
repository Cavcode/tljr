void main()
{
object oPC = GetEnteringObject();
object oCaster = GetFirstObjectInArea(GetArea(oPC));

ExploreAreaForPlayer(GetArea(oPC), oPC, TRUE);

if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_SPAWN")) && GetLocalInt(OBJECT_SELF, "SETUP") == FALSE)
    {
    ExecuteScript("pug_dfnd_onenter", OBJECT_SELF);
    }

if (GetIsPC(oPC) == TRUE)
    {
    while (GetIsObjectValid(oCaster) == TRUE)
        {
        if(GetResRef(oCaster) == "traffic_shooter")
            {
            object oPC = GetFirstPC();
            int nCount = 0;
            while (GetIsObjectValid(oPC)==TRUE)
                {
                if (GetArea(oPC) == GetArea(oCaster))
                    {
                    nCount = nCount+1;
                    }
                oPC = GetNextPC();
                }
            if (nCount < 2)
                {
                ExecuteScript("pug_trfc_shoot", oCaster);
                }
            }
        oCaster = GetNextObjectInArea(GetArea(oPC));
        }
    }
}
