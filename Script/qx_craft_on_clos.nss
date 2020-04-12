#include "qx_craft_inc"
#include "nwnx_creature"

void main()
{
    object oStation = OBJECT_SELF;
    object oPC = GetLastClosedBy();
    int nState = GetLocalInt(oStation,VAR_CRAFT_STATION_STATE);
    int nCraftTable = GetLocalInt(oStation,VAR_CRAFT_STATION_CURRENT_TABLE);
    int bFinish = FALSE;
    int bContinue = TRUE;
    string nItem1ResRef = VAR_CRAFT_RESREF_CLOTH;
    string nItem2ResRef = VAR_CRAFT_RESREF_SCRAP;
    string nItem3ResRef = VAR_CRAFT_RESREF_TOXIN;
    int nItem1Type = CRAFT_COMPONENT_CLOTH;
    int nItem2Type = CRAFT_COMPONENT_SCRAP;
    int nItem3Type = CRAFT_COMPONENT_TOXIN;
    int nItem1Amount = 0;
    int nItem2Amount = 0;
    int nItem3Amount = 0;
    int nCount = 0;
    int nSkillType;
    int nSkillAmount;
    int nBreakdownReturn;

    object oItem = GetFirstItemInInventory(oStation);

    if (nState == 1) // adding raw materials
    {
        SendDebugMessage(oPC, "Processing Raw Materials...");
        while ((oItem!=OBJECT_INVALID) && (bContinue))
        {
            if (GetResRef(oItem) == nItem1ResRef)
            {
                nCount += 1;
                nItem1Amount += GetItemStackSize(oItem);
                bFinish = TRUE;
            }
            else if (GetResRef(oItem) == nItem2ResRef)
            {
                nCount += 1;
                nItem2Amount += GetItemStackSize(oItem);
                bFinish = TRUE;
            }
            else if (GetResRef(oItem) == nItem3ResRef)
            {
                nCount += 1;
                nItem3Amount += GetItemStackSize(oItem);
                bFinish = TRUE;
            }
            else
            {
                nCount += 1;
                bContinue = FALSE;
                bFinish = FALSE;
                SendMessageToPC(oPC, "*Only raw materials may be placed into the crafting station at this time, remove any other items and try again.*");
            }
            SendDebugMessage(oPC, "Count = " + IntToString(nCount) + ", ItemTag = " + GetTag(oItem));
            oItem = GetNextItemInInventory(oStation);
        }

        SendDebugMessage(oPC, "Finished Processing Raw Materials:");
        SendDebugMessage(oPC, "Cloth Count = " + IntToString(nItem1Amount));
        SendDebugMessage(oPC, "Scrap Count = " + IntToString(nItem2Amount));
        SendDebugMessage(oPC, "Toxin Count = " + IntToString(nItem3Amount));

        if (nCount > 0)
        {
            if (bFinish) //station contains only valid raw materials, continue
            {
                SendDebugMessage(oPC, "Raw Materials are all valid...");
                SetLocked(oStation, TRUE);
                nSkillType = GetCraftTableSkillType(nCraftTable);
                nSkillAmount = GetSkillRank(nSkillType, oPC) + 20;// show everything they can craft if they rolled a 20
                SendDebugMessage(oPC, "Skill Type = " + IntToString(nSkillType) + " , Ranks = " + IntToString(nSkillAmount));
                SetLocalInt(oPC,VAR_CRAFT_PC_CLOTH, nItem1Amount);
                SetLocalInt(oPC,VAR_CRAFT_PC_SCRAP, nItem2Amount);
                SetLocalInt(oPC,VAR_CRAFT_PC_TOXIN, nItem3Amount);
                SetLocalInt(oStation,VAR_CRAFT_STATION_STATE,2);// select items to craft
                ClearCraftStationInventory(oStation);
                SendDebugMessage(oPC, "Inventory Cleared:Raws...");
                FillCraftStation(oStation, nCraftTable, nSkillType, nSkillAmount,
                                                        nItem1Type, nItem1Amount,
                                                        nItem2Type, nItem2Amount,
                                                        nItem3Type, nItem3Amount);
                SendDebugMessage(oPC, "Crafting Items created...");
                DelayCommand(2.0, SetLocked(oStation, FALSE));
            }
        }
        else //station empty, reset the station
        {
            SendDebugMessage(oPC, "Station Empty, Resetting...");
            ResetCraftStation(oStation);
        }
    } // end nState 1 (adding raw materials)
    else if (nState == 2) // selecting item to craft
    {
        SendDebugMessage(oPC, "Craft Item selection closing...");
        SetLocalInt(oStation,VAR_CRAFT_STATION_STATE,1);// add raw materials
        ClearCraftStationInventory(oStation);
        SendDebugMessage(oPC, "Inventory Cleared:Crafts...");
        FillCraftStationRawMaterials(oPC, oStation);
        SendDebugMessage(oPC, "Raw Materials created...");
    } // end nState 2 (selecting item to craft)
    else if (nState == 3) //adding items to breakdown
    {
        SendDebugMessage(oPC, "Breakdown Items selection closing...");
        nBreakdownReturn = GetBreakdownRawMaterials(oStation, oPC);
        if (nBreakdownReturn > 0)
        {
            SetLocalInt(oStation,VAR_CRAFT_STATION_STATE,4);// retrieve raw materials from breakdown
            ClearCraftStationInventory(oStation);
            SendDebugMessage(oPC, "Inventory Cleared:Breakdown...");
            FillCraftStationRawMaterials(oPC, oStation);
            SendDebugMessage(oPC, "Raw Materials created...");
        }
        else //station empty, reset the station
        {
            SendDebugMessage(oPC, "Station Empty, Resetting...");
            ResetCraftStation(oStation);
        }
    } // end nState 3 (adding items to breakdown)
    else if (nState == 4) //retrieving raw materials from breakdown
    {
        oItem = GetFirstItemInInventory(oStation);
        if (GetIsObjectValid(oItem))
        {
            SendMessageToPC(oPC, "Retrieve your raw materials from the crafting station.");
        }
        else //station empty, reset the station
        {
            SendDebugMessage(oPC, "Station Empty, Resetting...");
            ResetCraftStation(oStation);
        }
    } // end nState 4 (retrieving raw materials from breakdown0
}
