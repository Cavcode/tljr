#include "gy_base_inc"
void main()
{
    object oPC = GetFirstPC();
    object oOther = GetFirstPC();
    string sContract;

    while (GetIsObjectValid(oPC)==TRUE && GetTag(OBJECT_SELF) == "faction_fringe")
        {
        int nFactionify = GetLocalInt(oPC, "FACTIONIFY");
        sContract = GetCampaignString("starwars", "CONTRACT", oPC);

        if (nFactionify > 0)
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("fringe always loves you", oPC, FALSE);
            while (GetIsObjectValid(oFaction)==TRUE)
                {
                if (GetIsEnemy(oPC, oFaction)==TRUE)
                        {
                        AdjustReputation(oPC, oFaction, 100);
                        SetIsTemporaryNeutral(oPC, oFaction, FALSE);
                        SetPCLike(oPC, oFaction);
                        }
                oFaction = GetNextFactionMember(OBJECT_SELF, FALSE);
                }
            SetLocalInt(oPC, "FACTIONIFY", nFactionify -1);
            }

   while (GetIsObjectValid(oOther)==TRUE)
        {
        if (GetIsEnemy(oPC, oOther)==TRUE && GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE && sContract!="Rebels"&& sContract!="Empire"&& oOther != oPC && GetIsDM(oOther)==FALSE)
            {
                SetPCLike(oPC, oOther);
            }
        oOther = GetNextPC();
        }
    oPC = GetNextPC();
    }
}

