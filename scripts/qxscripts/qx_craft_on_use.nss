#include "qx_craft_inc"

void main()
{
    object oStation = OBJECT_SELF;
    object oPC = GetLastUsedBy();
    int nUsable = GetLocalInt(oStation,VAR_CRAFT_STATION_USABLE);
    int nState = GetLocalInt(oStation,VAR_CRAFT_STATION_STATE);
    object oUser = GetLocalObject(oStation,VAR_CRAFT_STATION_PC);

    if (nUsable > 0)//craft station is usable
    {
        if (nState == 0)//craft station in initial state
        {
            ResetCraftStation(oStation);

            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(oPC, ActionStartConversation(oStation, "", TRUE, FALSE));
        }
        if (nState > 0)//craft station in use
        {
            if (GetIsObjectValid(oUser) && (oPC == oUser))
            {
                if (nState == 1)//adding raw materials
                {
                    OpenInventory(oStation, oPC);
                }
                else if (nState == 2)//selecting items to craft
                {
                    OpenInventory(oStation, oPC);
                }
                else if (nState == 3)//adding items to breakdown
                {
                    OpenInventory(oStation, oPC);
                }
                else if (nState == 4)//retrieve raw materials from breakdown
                {
                    OpenInventory(oStation, oPC);
                }
                else
                {
                    ResetCraftStation(oStation);
                    AssignCommand(oPC, ClearAllActions(TRUE));
                    AssignCommand(oPC, ActionStartConversation(oStation, "", TRUE, FALSE));
                }
            }
            else
            {
                AssignCommand(oPC, ClearAllActions(TRUE));
                SendMessageToPC(oPC, "This crafting station is currently in use, please try again later...");
            }
        }
    }
    else //not usable, locked, etc..
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        SendMessageToPC(oPC, "This crafting station is locked.");
        FloatingTextStringOnCreature("Locked.", oPC);
    }
}
