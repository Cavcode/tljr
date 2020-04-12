void main()
{
object oPC = GetPCSpeaker();

SetCreatureAppearanceType(GetPCSpeaker(), 6);
SetCreatureBodyPart(CREATURE_PART_HEAD, 210, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

object oRace = CreateItemOnObject("subrace", oPC);
SetName(oRace, "Bothan");
SetSubRace(oPC, "Bothan");
SetColor(oPC, COLOR_CHANNEL_HAIR, 14);
SetColor(oPC, COLOR_CHANNEL_SKIN, 6);
SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_DEX, 2), oRace);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CON, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
