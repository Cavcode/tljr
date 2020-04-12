#include "gy_base_inc"
#include "pug_inc"
void main()
{
    object oPC = GetFirstPC();

    while (GetIsObjectValid(oPC)==TRUE && GetTag(OBJECT_SELF) == "faction_empire")
        {
        int nFactionify = GetLocalInt(oPC, "FACTIONIFY");
        string sContract = GetCampaignString("starwars", "CONTRACT", oPC);

        if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE && nFactionify > 0)
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("empire hates you rebel", oPC, FALSE);

           while (GetIsObjectValid(oFaction)==TRUE)
                {
                    if (GetIsEnemy(oPC, oFaction)==FALSE)
                        {
                        AdjustReputation(oPC, oFaction, -100);
                        SetIsTemporaryEnemy(oPC, oFaction, FALSE);
                        SetPCDislike(oPC, oFaction);
                        }
                    oFaction = GetNextFactionMember(OBJECT_SELF, FALSE);

                }
            SetLocalInt(oPC, "FACTIONIFY", nFactionify -1);
            }
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, sEmpireCivilianIDTag))==TRUE && nFactionify > 0)
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("empire loves you imperial", oPC, FALSE);

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
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, sFringeIDTag))==TRUE && nFactionify > 0 && sContract != "Rebels")
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("empire loves you non-rebel", oPC, FALSE);

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
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, sFringeIDTag))==TRUE && nFactionify > 0 && sContract == "Rebels")
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("empire hates you rebel wannabe", oPC, FALSE);

           while (GetIsObjectValid(oFaction)==TRUE)
                {
                if (GetIsEnemy(oPC, oFaction)==FALSE)
                        {
                        AdjustReputation(oPC, oFaction, -100);
                        SetIsTemporaryEnemy(oPC, oFaction, FALSE);
                        SetPCDislike(oPC, oFaction);
                        }

                oFaction = GetNextFactionMember(OBJECT_SELF, FALSE);
                }
            SetLocalInt(oPC, "FACTIONIFY", nFactionify -1);
            }

    PCFactions(oPC, sEmpireCivilianIDTag, sRebelSoldierIDTag);

    oPC = GetNextPC();
    }
}
