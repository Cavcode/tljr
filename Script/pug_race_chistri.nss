void main()
{
object oPC = GetPCSpeaker();

SetCreatureAppearanceType(GetPCSpeaker(), 6);
SetCreatureBodyPart(CREATURE_PART_HEAD, 211, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

//object oRace = CreateItemOnObject("subrace", oPC);
//SetName(oRace, "Chistori");
SetSubRace(oPC, "Chistori");
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
//AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
