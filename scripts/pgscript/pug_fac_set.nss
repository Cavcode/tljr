#include "pug_inc"
#include "gy_base_inc"
void main()
{
object oPC = OBJECT_SELF;
object oFringe = GetObjectByTag("faction_fringe");
object oEmpire = GetObjectByTag("faction_empire");
object oRebels = GetObjectByTag("faction_rebels");
object oShirt= GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
string sFaction;

if (GetTag(oShirt)=="pug_disguise" && GetIsObjectValid(oShirt) == TRUE)
    {
    sFaction = "Fringe";
    }
else
    {
    sFaction = GetFaction(oPC, TRUE);
    }

object oRebMember = GetFirstFactionMember(oRebels, FALSE);
while (GetIsObjectValid(oRebMember)==TRUE)
    {
    if (sFaction == "Empire")
        {
        //PCFactions(oPC, sEmpireCivilianIDTag, sRebelSoldierIDTag);
        if (GetIsEnemy(oPC, oRebMember)==FALSE)
            {
            AdjustReputation(oPC, oRebMember, -100);
            SetIsTemporaryEnemy(oPC, oRebMember, FALSE);
            //SetPCDislike(oPC, oRebMember);
            }
        }
    else
        {
        if (GetIsEnemy(oPC, oRebMember)==TRUE)
            {
            AdjustReputation(oPC, oRebMember, 50);
            SetIsTemporaryNeutral(oPC, oRebMember, FALSE);
            SetPCLike(oPC, oRebMember);
            }
        }
    oRebMember = GetNextFactionMember(oRebels, FALSE);
    }

object oEmpMember = GetFirstFactionMember(oEmpire, FALSE);
while (GetIsObjectValid(oEmpMember)==TRUE)
    {
    if (sFaction == "Rebels")
        {
        //PCFactions(oPC, sRebelSoldierIDTag, sEmpireCivilianIDTag);
        if (GetIsEnemy(oPC, oEmpMember)==FALSE)
            {
            AdjustReputation(oPC, oEmpMember, -100);
            SetIsTemporaryEnemy(oPC, oEmpMember, FALSE);
            //SetPCDislike(oPC, oEmpMember);
            }
        }
    else
        {
        if (GetIsEnemy(oPC, oEmpMember)==TRUE)
            {
            AdjustReputation(oPC, oEmpMember, 50);
            SetIsTemporaryNeutral(oPC, oEmpMember, FALSE);
            SetPCLike(oPC, oEmpMember);
            }
        }
    oEmpMember = GetNextFactionMember(oEmpire, FALSE);
    }

object oFringeMember = GetFirstFactionMember(oFringe, FALSE);
while (GetIsObjectValid(oFringeMember)==TRUE)
    {
        if (GetIsEnemy(oPC, oFringeMember)==TRUE)
            {
            AdjustReputation(oPC, oFringeMember, 50);
            SetIsTemporaryNeutral(oPC, oFringeMember, FALSE);
            SetPCLike(oPC, oFringeMember);
            }
    oFringeMember = GetNextFactionMember(oFringe, FALSE);
    object oOther = GetFirstPC();
    while (GetIsObjectValid(oOther)==TRUE)
        {
        if (GetIsDM(oOther)==FALSE && GetIsReactionTypeHostile(oPC, oOther)==TRUE)
            {
                SetPCLike(oPC, oOther);
            }
        oOther = GetNextPC();
        }
    }
}
