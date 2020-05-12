#include "gy_base_inc"
#include "pug_inc"
void main()
{
    object oPC = GetFirstPC();
    object oOther = GetFirstPC();
    string sOtherContract;

    while (GetIsObjectValid(oPC)==TRUE && GetTag(OBJECT_SELF) == "faction_rebels")
        {
        int nFactionify = GetLocalInt(oPC, "FACTIONIFY");
        string sContract = GetCampaignString("starwars", "CONTRACT", oPC);

        if (GetIsObjectValid(GetItemPossessedBy(oPC, sEmpireCivilianIDTag))==TRUE && nFactionify > 0)
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("rebel hates you imperial", oPC, FALSE);
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
        if (GetIsObjectValid(GetItemPossessedBy(oPC, sRebelSoldierIDTag))==TRUE && nFactionify > 0)
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("rebel loves you rebel", oPC, FALSE);
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
        if (GetIsObjectValid(GetItemPossessedBy(oPC, sFringeIDTag))==TRUE && nFactionify > 0 && sContract != "Empire")
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("rebel loves you non-imperial", oPC, FALSE);
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
        if (GetIsObjectValid(GetItemPossessedBy(oPC, sFringeIDTag))==TRUE && nFactionify > 0 && sContract == "Empire")
            {
            object oFaction = GetFirstFactionMember(OBJECT_SELF, FALSE);
            //FloatingTextStringOnCreature("rebel hates you imperial wannabe", oPC, FALSE);
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
