void main()
{
object oPC = GetPCSpeaker();
int nSex;

    if (GetGender(oPC) == GENDER_MALE)
        {
        nSex=39;
        }
    else if (GetGender(oPC) == GENDER_FEMALE)
        {
        nSex=182;
        }
    SetCreatureBodyPart(CREATURE_PART_HEAD, nSex, GetPCSpeaker());

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
        {
        DestroyObject(GetItemPossessedBy(oPC, "subrace"));
        }

    object oRace = CreateItemOnObject("subrace", oPC);
    SetName(oRace, "Rodian");
    SetSubRace(oPC, "Rodian");
    SetColor(oPC, COLOR_CHANNEL_SKIN, 53);
    SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 1), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 1), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
