void main()
{
object oPC = GetPCSpeaker();
int nSex;

    if (GetGender(oPC) == GENDER_MALE)
        {
        nSex=38;
        }
    else if (GetGender(oPC) == GENDER_FEMALE)
        {
        nSex=181;
        }
    SetCreatureBodyPart(CREATURE_PART_HEAD, nSex, GetPCSpeaker());

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
        {
        DestroyObject(GetItemPossessedBy(oPC, "subrace"));
        }

    object oRace = CreateItemOnObject("subrace", oPC);
    SetName(oRace, "Duros");
    SetSubRace(oPC, "Duros");
    SetColor(oPC, COLOR_CHANNEL_TATTOO_1, 35);
    SetColor(oPC, COLOR_CHANNEL_SKIN, 51);
    SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_INT, 2), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 1), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
