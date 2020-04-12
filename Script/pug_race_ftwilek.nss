void main()
{
object oPC = GetPCSpeaker();
int nModel;
int nCount = GetLocalInt(oPC, "FTWILEK")+1;

if (nCount == 1){nModel = 205;}
else if (nCount == 2){nModel = 206;}
else if (nCount == 3){nModel = 207;}
else if (nCount == 4){nModel = 156;}
else if (nCount == 5){nModel = 183;}
else if (nCount > 5){nModel = 184;nCount = 0; SetLocalInt(oPC, "FTWILEK", 0);}

SetLocalInt(oPC, "FTWILEK", nCount);

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
