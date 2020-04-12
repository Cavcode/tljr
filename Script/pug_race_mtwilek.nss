void main()
{
object oPC = GetPCSpeaker();
int nModel;

nModel = 207;

SetCreatureAppearanceType(GetPCSpeaker(), 6);
SetCreatureBodyPart(CREATURE_PART_HEAD, nModel, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

object oRace = CreateItemOnObject("subrace", oPC);
SetName(oRace, "Twi'lek");
SetSubRace(oPC, "Twi'lek");
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_CHA, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
