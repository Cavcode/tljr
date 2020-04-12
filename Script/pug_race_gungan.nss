void main()
{
object oPC = GetPCSpeaker();
int nModel;

if (GetGender(oPC)== GENDER_MALE)
    {
    nModel = 42;
    }
else if ( GetGender(oPC) == GENDER_FEMALE)
    {
    nModel = 209;
    }

//SetCreatureAppearanceType(GetPCSpeaker(), 6);
SetCreatureBodyPart(CREATURE_PART_HEAD, nModel, GetPCSpeaker());

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }

object oRace = CreateItemOnObject("subrace", oPC);
SetName(oRace, "Gungan");
SetSubRace(oPC, "Gungan");
SetColor(oPC, COLOR_CHANNEL_SKIN, 25);
SetLocalInt(oPC, "SKIN_CHOOSE", TRUE);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAbilityBonus(IP_CONST_ABILITY_CON, 2), oRace);
//AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_CHA, 2), oRace);
AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDecreaseAbility(IP_CONST_ABILITY_WIS, 2), oRace);
AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
}
