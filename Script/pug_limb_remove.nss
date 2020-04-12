void main()
{
object oKiller = GetLastDamager();
object oWeapon = GetLastWeaponUsed(oKiller);
object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST,OBJECT_SELF);
int nLightSabre = FALSE;
int nRando = d4(1);

SendMessageToPC(OBJECT_SELF, IntToString(nRando));

if (GetBaseItemType(oWeapon) == BASE_ITEM_SHORTSWORD)
    {
    nLightSabre = TRUE;
    }
else if (GetBaseItemType(oWeapon) == BASE_ITEM_TWOBLADEDSWORD)
    {
    nLightSabre = TRUE;
    }
else if (GetBaseItemType(oWeapon) == BASE_ITEM_GREATSWORD)
    {
    nLightSabre = TRUE;
    }

if (nLightSabre == TRUE && nRando == 4)
    {
    SetCreatureBodyPart(CREATURE_PART_LEFT_HAND, 0, OBJECT_SELF);
    FloatingTextStringOnCreature("Your left hand has been cut off", OBJECT_SELF, FALSE);
    FloatingTextStringOnCreature("You have cut off the left hand of your opponent", oKiller, FALSE);
    SetCampaignInt("starwars", "LIMB_LEFT_HAND", TRUE, OBJECT_SELF);
    ClearAllActions(TRUE);
    AssignCommand(OBJECT_SELF, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, OBJECT_SELF)));
    AssignCommand(OBJECT_SELF, ActionEquipItem(CopyItemAndModify(oArmor, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_LHAND, 0, TRUE), INVENTORY_SLOT_CHEST));
    DestroyObject(oArmor);
    }
}
