#include "qx_craft_inc"

void main()
{
    object oPC = GetLastDisturbed();
    object oStation = OBJECT_SELF;
    object oItem = GetInventoryDisturbItem();
    object oItem2;
    int nCraftTableSeq = GetLocalInt(oStation, GetResRef(oItem));
    int nDisturb = GetInventoryDisturbType();
    int nState = GetLocalInt(oStation,VAR_CRAFT_STATION_STATE);
    object oUser = GetLocalObject(oStation,VAR_CRAFT_STATION_PC);
    int nBypassDisturb = GetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB);

    if (oUser != oPC)//this is not the crafter PC
    {
            if (nDisturb == INVENTORY_DISTURB_TYPE_REMOVED)
            {
                //SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, TRUE);
                oItem2 = CopyItem(oItem, oStation, TRUE);
                DestroyObject(oItem);
                //AssignCommand(oPC, ActionDoCommand(SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, FALSE)));
                SendMessageToPC(oPC, "*You are attempting to interfere in another players crafting attempt... Your actions have been logged... this is a bannable offense if repeated!");
            }
            else if (nDisturb == INVENTORY_DISTURB_TYPE_ADDED)
            {
                //SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, TRUE);
                oItem2 = CopyItem(oItem, oPC, TRUE);
                DestroyObject(oItem);
                //AssignCommand(oPC, ActionDoCommand(SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, FALSE)));
                SendMessageToPC(oPC, "*You are attempting to interfere in another players crafting attempt... Your actions have been logged... this is a bannable offense if repeated!");
            }
    }
    else //this is the crafter PC
    {
        if (nState == 1) //adding raw materials, do nothing
        {

        }
        else if (nState == 2) //choosing item to craft
        {
            if (nDisturb == INVENTORY_DISTURB_TYPE_REMOVED)
            {
                SendDebugMessage(oPC, "Function onDisturb: Item ResRef = [" + GetResRef(oItem) + "]");
                SendDebugMessage(oPC, "Function onDisturb: CRAFT_TABLE_SEQ = " + IntToString(nCraftTableSeq));
                if (!GiveRemainingRawMaterials(oPC, nCraftTableSeq))
                {
                    oItem2 = CopyItem(oItem, oStation, TRUE);
                    DestroyObject(oItem);
                }
                SendDebugMessage(oPC, "Final Amounts:");
                SendDebugMessage(oPC, "Cloth Remaining: " + IntToString(GetLocalInt(oPC, VAR_CRAFT_PC_CLOTH)));
                SendDebugMessage(oPC, "Scrap Remaining: " + IntToString(GetLocalInt(oPC, VAR_CRAFT_PC_SCRAP)));
                SendDebugMessage(oPC, "Toxin Remaining: " + IntToString(GetLocalInt(oPC, VAR_CRAFT_PC_TOXIN)));
            }
            else if (nDisturb == INVENTORY_DISTURB_TYPE_ADDED)
            {
                SendMessageToPC(oPC, "You cannot add items to this station right now.");
                //SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, TRUE);
                oItem2 = CopyItem(oItem, oPC, TRUE);
                DestroyObject(oItem);
                //AssignCommand(oPC, ActionDoCommand(SetLocalInt(oStation, VAR_CRAFT_STATION_BYPASS_DISTURB, FALSE)));
            }
        }
        else if (nState == 3) //adding items to breakdown, do nothing
        {

        }
        else if (nState == 4) //retrieving raw materials from breakdown, do nothing
        {

        }
    }
}
