/*  qx_inc_lightsbr.nss
    by Quixsilver
*/

#include "nono_inc"

//void main(){}

// function UnIgnite
void UnIgnite(object oItem, object oPC, int bCopyVars, int bEquip=FALSE, int nInventorySlot=INVENTORY_SLOT_RIGHTHAND);

// function Ignite
void Ignite(object oItem, object oPC, int bCopyVars, int bEquip=FALSE, int nInventorySlot=INVENTORY_SLOT_RIGHTHAND);

// function GetLightsaberIgnited
int GetLightsaberIgnited(object oItem);

// function GetLightsaberSlot
int GetLightsaberSlot(object oItem, object oPC);

// function GetDualLightsabers
int GetDualLightsabers(object oPC);

void UnIgnite(object oItem, object oPC, int bCopyVars, int bEquip=FALSE, int nInventorySlot=INVENTORY_SLOT_RIGHTHAND)
{
    //SendMessageToPC(oPC, "In function UnIgnite");
    if ((GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_DOUBLELIGHTSABER))
    {
        object oOtherItem;
        int bDual = FALSE;

        oOtherItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

        if (GetBaseItemType(oOtherItem) != BASE_ITEM_LIGHTSABER || GetBaseItemType(oOtherItem) != BASE_ITEM_GREATLIGHTSABER || GetBaseItemType(oOtherItem) != BASE_ITEM_DOUBLELIGHTSABER)
        {
            AssignCommand(oPC,ActionUnequipItem(oOtherItem));
        }

        if (GetDualLightsabers(oPC))
        {
            oOtherItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
            bDual = TRUE;
        }
        //SendMessageToPC(oPC, "Item is of type Lightsaber");
        SetLocalInt(oItem, "UNIGNITING", TRUE);
        SetLocalInt(oOtherItem, "UNIGNITING", TRUE);
        int iWModel = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
        int iWColor = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
        //SendMessageToPC(oPC, "iWModel = " + IntToString(iWModel));
        //SendMessageToPC(oPC, "iWColor = " + IntToString(iWColor));



        object oItem2;
        if (!(iWModel == 2 && iWColor == 4))
        {
            //SendMessageToPC(oPC, "Now un-igniting the saber");
            AssignCommand(oPC, PlaySound("saberoff"));
            SetLocalInt(oItem, "TOPCOLOR", iWColor);
            SetLocalInt(oItem, "TOPMODEL", iWModel);
            oItem2 = CopyItemAndModify(oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, 2, bCopyVars);
            DestroyObject(oItem);
            oItem = CopyItemAndModify(oItem2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, 4, bCopyVars);
            DestroyObject(oItem2);
        }
        /*if (!GetItemHasItemProperty(oItem, ITEM_PROPERTY_NO_DAMAGE))
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyNoDamage(), oItem);
            SendMessageToPC(oPC, "Added the no_damage property to lightsaber");
        } */
        if (bDual)
        {
            int iWModel = GetItemAppearance( oOtherItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
            int iWColor = GetItemAppearance( oOtherItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
            //SendMessageToPC(oPC, "iWModel = " + IntToString(iWModel));
            //SendMessageToPC(oPC, "iWColor = " + IntToString(iWColor));
            if (!(iWModel == 2 && iWColor == 4))
            {
                //SendMessageToPC(oPC, "Now un-igniting the saber");
                AssignCommand(oPC, PlaySound("saberoff"));
                SetLocalInt(oOtherItem, "TOPCOLOR", iWColor);
                SetLocalInt(oOtherItem, "TOPMODEL", iWModel);
                oItem2 = CopyItemAndModify(oOtherItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, 2, bCopyVars);
                DestroyObject(oOtherItem);
                oOtherItem = CopyItemAndModify(oItem2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, 4, bCopyVars);
                DestroyObject(oItem2);
            }
        }

        if (bEquip)
        {
            AssignCommand(oPC, ActionEquipItem(oItem, nInventorySlot));
            if (bDual)
            {
                AssignCommand(oPC, ActionEquipItem(oOtherItem, INVENTORY_SLOT_LEFTHAND));
            }
            //SendMessageToPC(oPC, "Equipping lightsaber");
        }
        SetLocalInt(oItem, "UNIGNITING", FALSE);
        SetLocalInt(oOtherItem, "UNIGNITING", FALSE);
    }
}

void Ignite(object oItem, object oPC, int bCopyVars, int bEquip=FALSE, int nInventorySlot=INVENTORY_SLOT_RIGHTHAND)
{
    //SendMessageToPC(oPC, "In function Ignite");
    if ((GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_DOUBLELIGHTSABER))
    {
        object oOtherItem;
        int bDual = FALSE;

        if (GetDualLightsabers(oPC))
        {
            oOtherItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
            bDual = TRUE;
        }
        //SendMessageToPC(oPC, "Item is of type Lightsaber");
        int iWModel = GetLocalInt(oItem, "TOPMODEL");
        int iWColor = GetLocalInt(oItem, "TOPCOLOR");
        int iCWModel = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
        int iCWColor = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
        //SendMessageToPC(oPC, "iWModel = " + IntToString(iWModel));
        //SendMessageToPC(oPC, "iWColor = " + IntToString(iWColor));
        object oItem2;
        if (iCWModel == 2 && iCWColor == 4)
        {
            //SendMessageToPC(oPC, "Now igniting the saber");
            AssignCommand(oPC, PlaySound("saberon"));
            oItem2 = CopyItemAndModify(oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, iWModel, bCopyVars);
            DestroyObject(oItem);
            oItem = CopyItemAndModify(oItem2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, iWColor, bCopyVars);
            DestroyObject(oItem2);
        }

        if (bDual)
        {
            int iWModel = GetLocalInt(oOtherItem, "TOPMODEL");
            int iWColor = GetLocalInt(oOtherItem, "TOPCOLOR");
            int iCWModel = GetItemAppearance( oOtherItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
            int iCWColor = GetItemAppearance( oOtherItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
            //SendMessageToPC(oPC, "iWModel = " + IntToString(iWModel));
            //SendMessageToPC(oPC, "iWColor = " + IntToString(iWColor));
            if (iCWModel == 2 && iCWColor == 4)
            {
                //SendMessageToPC(oPC, "Now igniting the saber");
                AssignCommand(oPC, PlaySound("saberon"));
                oItem2 = CopyItemAndModify(oOtherItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, iWModel, bCopyVars);
                DestroyObject(oOtherItem);
                oOtherItem = CopyItemAndModify(oItem2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, iWColor, bCopyVars);
                DestroyObject(oItem2);
            }
        }
        /*if (GetItemHasItemProperty(oItem, ITEM_PROPERTY_NO_DAMAGE))
        {
            itemproperty ipLoop=GetFirstItemProperty(oItem);

            //Loop for as long as the ipLoop variable is valid
            while (GetIsItemPropertyValid(ipLoop))
            {
                //If ipLoop is a no_damage property, remove it
                if (GetItemPropertyType(ipLoop)==ITEM_PROPERTY_NO_DAMAGE)
                    RemoveItemProperty(oItem, ipLoop);

                //Next itemproperty on the list...
                ipLoop=GetNextItemProperty(oItem);

            }
            SendMessageToPC(oPC, "Removed the no_damage property from lightsaber");
        } */
        if (bEquip)
        {
            AssignCommand(oPC, ActionEquipItem(oItem, nInventorySlot));
            if (bDual)
            {
                AssignCommand(oPC, ActionEquipItem(oOtherItem, INVENTORY_SLOT_LEFTHAND));
            }
            //SendMessageToPC(oPC, "Equipping lightsaber");
        }
    }
}

int GetLightsaberIgnited(object oItem)
{
    if ((GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_DOUBLELIGHTSABER))
    {
        int iWModel = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP);
        int iWColor = GetItemAppearance( oItem, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP);
        //object oItem2;
        if (iWModel == 2 && iWColor == 4)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    else
        return TRUE;
}

int GetLightsaberSlot(object oItem, object oPC)
{
    if ((GetBaseItemType(oItem) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem) == BASE_ITEM_DOUBLELIGHTSABER))
    {
        if (GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC) == oItem)
        {
            return INVENTORY_SLOT_RIGHTHAND;
        }
        else if (GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC) == oItem)
        {
            return INVENTORY_SLOT_LEFTHAND;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

int GetDualLightsabers(object oPC)
{
    object oItem1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oItem2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    if (((GetBaseItemType(oItem1) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem1) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem1) == BASE_ITEM_DOUBLELIGHTSABER)) && ((GetBaseItemType(oItem2) == BASE_ITEM_LIGHTSABER) || (GetBaseItemType(oItem2) == BASE_ITEM_GREATLIGHTSABER) || (GetBaseItemType(oItem2) == BASE_ITEM_DOUBLELIGHTSABER)))
    {
        return 1;
    }
    else
    {
        return 2;
    }
}
