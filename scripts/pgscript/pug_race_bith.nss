void main()
{
object oPC = GetPCSpeaker();

    SetCreatureBodyPart(CREATURE_PART_HEAD, 35, GetPCSpeaker());

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
        {
        DestroyObject(GetItemPossessedBy(oPC, "subrace"));
        }

    object oRace = CreateItemOnObject("subrace", oPC);
    SetName(oRace, "Bith");
    SetSubRace(oPC, "Bith");
    SetColor(oPC, COLOR_CHANNEL_SKIN, 8);
    SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 1), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_INT, 1), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 1), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
