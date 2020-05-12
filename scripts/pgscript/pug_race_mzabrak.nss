void main()
{
object oPC = GetPCSpeaker();

if (GetAppearanceType(oPC) != APPEARANCE_TYPE_HUMAN)
    {
    SetCreatureAppearanceType(GetPCSpeaker(), APPEARANCE_TYPE_HUMAN);
    }

SetCreatureBodyPart(CREATURE_PART_HEAD, 156, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

//object oRace = CreateItemOnObject("subrace", oPC);
//SetName(oRace, "Zabrak");
SetSubRace(oPC, "Zabrak");
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_CON, 3), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
//AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
