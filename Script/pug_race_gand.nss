void main()
{
object oPC = GetPCSpeaker();

    SetCreatureBodyPart(CREATURE_PART_HEAD, 36, GetPCSpeaker());

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
        {
        DestroyObject(GetItemPossessedBy(oPC, "subrace"));
        }

    object oRace = CreateItemOnObject("subrace", oPC);
    SetName(oRace, "Gand");
    SetSubRace(oPC, "Gand");
    SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_STR, 1), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 2), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyRegeneration(1), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 1), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
