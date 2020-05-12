#include "nwnx_creature"
void main()
{
object oPC = GetPCSpeaker();
int nSex;

if (GetRacialType(oPC) == RACIAL_TYPE_HUMAN && GetLocalInt(oPC, "HEAD_TYPE") == 0)
    {
    SetLocalInt(oPC, "HEAD_TYPE", GetCreatureBodyPart(CREATURE_PART_HEAD, oPC));
    SetLocalInt(oPC, "SKIN_COLOUR", GetColor(oPC, COLOR_CHANNEL_SKIN));
    SetLocalInt(oPC, "HAIR_COLOUR", GetColor(oPC, COLOR_CHANNEL_HAIR));
    SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);
    }
else if (GetRacialType(oPC) == RACIAL_TYPE_HALFORC)
    {
    object oSkin= CreateItemOnObject("wookieeshide", oPC);
    SetSubRace(oPC, "Wookiee");
    AssignCommand(oPC, ActionEquipItem(oSkin, INVENTORY_SLOT_CARMOUR));
    }
else if (GetRacialType(oPC) == RACIAL_TYPE_ELF)
    {
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
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 1), oRace);
    //AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 1), oRace);
    AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
    }
if (GetLocalInt(oPC, "VOICE_SET") == 0)
    {
    SetLocalInt(oPC, "VOICE_SET", NWNX_Creature_GetSoundset(oPC));
    }

}
