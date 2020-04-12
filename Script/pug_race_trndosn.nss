void main()
{
object oPC = GetPCSpeaker();
int nModel;

if (GetGender(oPC)== GENDER_MALE)
    {
    nModel = 203;
    }
else if ( GetGender(oPC) == GENDER_FEMALE)
    {
    nModel = 204;
    }

SetCreatureAppearanceType(GetPCSpeaker(), 6);
SetCreatureBodyPart(CREATURE_PART_HEAD, nModel, GetPCSpeaker());
SetColor(oPC, COLOR_CHANNEL_SKIN, 53);
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

object oRace = CreateItemOnObject("subrace", oPC);
SetName(oRace, "Trandoshan");
SetSubRace(oPC, "Trandoshan");
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_STR, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_DEX, 2), oRace);
AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
