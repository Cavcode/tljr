void main()
{
object oPC = GetPCSpeaker();
int nSex;

    if (GetGender(oPC) == GENDER_MALE)
        {
        nSex=41;
        }
    else if (GetGender(oPC) == GENDER_FEMALE)
        {
        nSex=184;
        }
    SetCreatureBodyPart(CREATURE_PART_HEAD, nSex, GetPCSpeaker());

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
        {
        DestroyObject(GetItemPossessedBy(oPC, "subrace"));
        }

    object oRace = CreateItemOnObject("subrace", oPC);
    SetName(oRace, "Aqualish");
    SetSubRace(oPC, "Aqualish");
    SetColor(oPC, COLOR_CHANNEL_SKIN, 41);
    SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertySkillBonus(SKILL_INTIMIDATE, 3), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyReducedSavingThrow(IP_CONST_SAVEBASETYPE_REFLEX, 3), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
