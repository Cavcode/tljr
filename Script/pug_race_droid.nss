void main()
{
object oPC = GetPCSpeaker();
int nModel;
int nCount = GetLocalInt(oPC, "DROID")+1;

if (nCount == 1){nModel = 2017;}
else if (nCount == 2){nModel = 2026;}
else if (nCount == 3){nModel = 2027;SetLocalInt(oPC, "DROID", 0); nCount =0;}

SetLocalInt(oPC, "DROID", nCount);

SetCreatureAppearanceType(GetPCSpeaker(), nModel);

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

object oRace = CreateItemOnObject("subrace", oPC);
SetName(oRace, "Droid");
SetSubRace(oPC, "Droid");
SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_INT, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_DEX, 2), oRace);
AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
