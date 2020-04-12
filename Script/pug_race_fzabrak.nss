void main()
{
object oPC = GetPCSpeaker();
int nModel;
int nCount = GetLocalInt(oPC, "FZABRAK")+1;

SetCreatureAppearanceType(GetPCSpeaker(), 6);
if (nCount == 1){nModel = 210;}
else if (nCount == 2){nModel = 211; nCount =0; SetLocalInt(oPC, "FZABRAK", 0);}

SetLocalInt(oPC, "FZABRAK", nCount);

SetCreatureBodyPart(CREATURE_PART_HEAD, nModel, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

//object oRace = CreateItemOnObject("subrace", oPC);
//SetName(oRace, "Zabrak");
SetSubRace(oPC, "Zabrak");
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_CHA, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
//AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
