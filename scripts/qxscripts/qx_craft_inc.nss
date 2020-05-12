// Crafting System Include File
//
/////////////////////////////////////////
#include "aps_include"

const int CRAFT_DEBUG = FALSE;

const int SKILL_CRAFT_CHEMICAL      = 36;
const int SKILL_CRAFT_ELECTRONIC    = 37;
const int SKILL_CRAFT_MECHANICAL    = 38;
const int SKILL_BUILD_REPAIR        = 28;

const int TABLE_CRAFT_TRAP          = 1;
const int TABLE_CRAFT_ARMOR         = 2;
const int TABLE_CRAFT_WEAPON        = 3;
const int TABLE_CRAFT_CHEMICAL      = 4;
const int TABLE_CRAFT_ELECTRONIC    = 5;
const int TABLE_CRAFT_MECHANICAL    = 6;

const int CRAFT_COMPONENT_CLOTH     = 1;
const int CRAFT_COMPONENT_SCRAP     = 2;
const int CRAFT_COMPONENT_TOXIN     = 3;

const string VAR_CRAFT_STATION_USABLE           = "USABLE";
const string VAR_CRAFT_STATION_CURRENT_TABLE    = "CRAFT_STATION_CURRENT_TABLE";
const string VAR_CRAFT_STATION_STATE            = "CRAFT_STATION_STATE";
const string VAR_CRAFT_STATION_PC               = "CRAFT_STATION_PC";
const string VAR_CRAFT_STATION_BYPASS_DISTURB   = "CRAFT_STATION_BYPASS_DISTURB";
const string VAR_CRAFT_TABLE_SEQ                = "CRAFT_TABLE_SEQ";
const string VAR_CRAFT_PC_TOXIN                 = "CRAFT_PC_TOXIN";
const string VAR_CRAFT_PC_CLOTH                 = "CRAFT_PC_CLOTH";
const string VAR_CRAFT_PC_SCRAP                 = "CRAFT_PC_SCRAP";
const string VAR_CRAFT_RESREF_TOXIN             = "toxin";
const string VAR_CRAFT_RESREF_CLOTH             = "cloth";
const string VAR_CRAFT_RESREF_SCRAP             = "scrap";

//void main()
//{
//}

void SendDebugMessage(object oObject, string sMessage);

// Fills oContainer with the items that oPC can craft based on:
//      nCraftTable     = TABLE_CRAFT_* craft table to retrieve items from
//      nSkillType      = SKILL_* required for crafting the items
//      nSkillAmount    = the number of ranks in nSkillType required
//      nItem1Type      = CRAFT_COMPONENT_* type of raw item required
//      nItem1Amount    = the number components required
//      nItem2Type      = CRAFT_COMPONENT_* type of raw item required
//      nItem2Amount    = the number components required
void FillCraftStation(object oContainer, int nCraftTable, int nSkillType, int nSkillAmount, int nItem1Type, int nItem1Amount, int nItem2Type, int nItem2Amount, int nItem3Type, int nItem3Amount);

// Gives oPC back their remaining raw materials after crafting the item
// defined by nCraftTableSeq which is:
//      LocalInt on oPC, varname defined by constant VAR_CRAFT_TABLE_SEQ
// Returns TRUE on success and FALSE on failure
int GiveRemainingRawMaterials(object oPC, int nCraftTableSeq);

void ResetCraftStation(object oStation);

void ClearCraftStationInventory(object oStation);

// returns the skill required for nCraftTable
//      nCraftTable = TABLE_CRAFT_* constant
//      return = SKILL_CRAFT_* constant
//      0 returned on error
int GetCraftTableSkillType(int nCraftTable);

void FillCraftStationRawMaterials(object oPC, object oStation);

// returns 0 if total value of items is not enough to create a single raw material
// else returns total value of items
int GetBreakdownRawMaterials(object oStation, object oPC);


int GetBreakdownRawMaterials(object oStation, object oPC)
{
    object oItem = GetFirstItemInInventory(oStation);
    int nValue = 0;
    int nAmount = 0;
    int nItem1Amount = 0;  //cloth
    int nItem2Amount = 0;  //scrap
    int nItem3Amount = 0;  //toxin
    int nRoll = 0;
    int nSkillDivide = 1;

    while (GetIsObjectValid(oItem))
    {
        nValue = GetGoldPieceValue(oItem);
        oItem = GetNextItemInInventory(oStation);
    }

    if (!GetIsSkillSuccessful(oPC, SKILL_BUILD_REPAIR, d20(3)))
    {
        nSkillDivide = 2;
    }

    if (nValue < 100)
    {
        nRoll = d6();
        switch (nRoll)
        {
            case 1:
            case 2:
            case 3: return 0; break;
            case 4: nItem1Amount = 1; break;
            case 5: nItem2Amount = 1; break;
            case 6: nItem3Amount = 1; break;
            default: return 0; break;
        }
    }
    else
    {
        nAmount = nValue / 100;
        nRoll = d12();
        switch (nRoll)
        {
            case 1:     nItem1Amount = nAmount; break;
            case 2:     nItem1Amount = nAmount/2; nItem2Amount = nAmount/2; break;
            case 3:     nItem1Amount = nAmount/3; nItem2Amount = nAmount/3; nItem3Amount = nAmount/3; break;
            case 4:     nItem1Amount = nAmount/2; nItem2Amount = nAmount/4; nItem3Amount = nAmount/4; break;
            case 5:     nItem1Amount = nAmount/4; nItem2Amount = nAmount/2; nItem3Amount = nAmount/4; break;
            case 6:     nItem1Amount = nAmount/3; nItem2Amount = nAmount/3; nItem3Amount = nAmount/3; break;
            case 7:     nItem1Amount = nAmount/4; nItem2Amount = nAmount/4; nItem3Amount = nAmount/2; break;
            case 8:     nItem2Amount = nAmount/2; nItem3Amount = nAmount/2; break;
            case 9:     nItem2Amount = nAmount/2; nItem3Amount = 2*nAmount/4; break;
            case 10:    nItem1Amount = nAmount/4; nItem2Amount = nAmount/2; nItem3Amount = nAmount/4; break;
            case 11:    nItem1Amount = nAmount/4; nItem2Amount = nAmount/4; nItem3Amount = nAmount/4; break;
            case 12:    nItem1Amount = nAmount/4; nItem2Amount = nAmount/4; nItem3Amount = nAmount/4; break;
            default:    nItem1Amount = nAmount; break;
        }
    }
    SetLocalInt(oPC, VAR_CRAFT_PC_CLOTH, nItem1Amount/nSkillDivide);
    SetLocalInt(oPC, VAR_CRAFT_PC_SCRAP, nItem2Amount/nSkillDivide);
    SetLocalInt(oPC, VAR_CRAFT_PC_TOXIN, nItem3Amount/nSkillDivide);
    // do something with item amounts
    return nValue;
}


void SendDebugMessage(object oObject, string sMessage)
{
    if(CRAFT_DEBUG)
    {
        SendMessageToPC(oObject, sMessage);
    }
}

void FillCraftStationRawMaterials(object oPC, object oStation)
{
    int nAmount1 = GetLocalInt(oPC,VAR_CRAFT_PC_CLOTH);
    int nAmount2 = GetLocalInt(oPC,VAR_CRAFT_PC_SCRAP);
    int nAmount3 = GetLocalInt(oPC,VAR_CRAFT_PC_TOXIN);

    if (nAmount1 > 0)
    {
        CreateItemOnObject(VAR_CRAFT_RESREF_CLOTH,oStation,nAmount1);
    }
    if (nAmount2 > 0)
    {
        CreateItemOnObject(VAR_CRAFT_RESREF_SCRAP,oStation,nAmount2);
    }
    if (nAmount3 > 0)
    {
        CreateItemOnObject(VAR_CRAFT_RESREF_TOXIN,oStation,nAmount3);
    }
}

int GetCraftTableSkillType(int nCraftTable)
{
    int nReturn;
    switch(nCraftTable)
    {
        case TABLE_CRAFT_ARMOR: nReturn = SKILL_CRAFT_ARMOR; break;
        case TABLE_CRAFT_CHEMICAL: nReturn = SKILL_CRAFT_CHEMICAL; break;
        case TABLE_CRAFT_ELECTRONIC: nReturn = SKILL_CRAFT_ELECTRONIC; break;
        case TABLE_CRAFT_MECHANICAL: nReturn = SKILL_CRAFT_MECHANICAL; break;
        case TABLE_CRAFT_TRAP: nReturn = SKILL_CRAFT_TRAP; break;
        case TABLE_CRAFT_WEAPON: nReturn = SKILL_CRAFT_WEAPON; break;
        default: nReturn = 0; break;
    }
    return nReturn;
}

void ClearCraftStationInventory(object oStation)
{
    object oItem = GetFirstItemInInventory(oStation);
    while(GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oStation);
    }
}

void ResetCraftStation(object oStation)
{
    SetLocalInt(oStation,VAR_CRAFT_STATION_CURRENT_TABLE,0);
    SetLocalInt(oStation,VAR_CRAFT_STATION_STATE,0);
    DeleteLocalObject(oStation, VAR_CRAFT_STATION_PC);
    ClearCraftStationInventory(oStation);
}

int GiveRemainingRawMaterials(object oPC, int nCraftTableSeq)
{
    SendDebugMessage(oPC, "Function GiveRemainingRawMaterials: CRAFT_TABLE_SEQ = " + IntToString(nCraftTableSeq));
    int nItem1Type = CRAFT_COMPONENT_CLOTH;
    int nItem2Type = CRAFT_COMPONENT_SCRAP;
    int nItem3Type = CRAFT_COMPONENT_TOXIN;
    string nItem1ResRef = VAR_CRAFT_RESREF_CLOTH;
    string nItem2ResRef = VAR_CRAFT_RESREF_SCRAP;
    string nItem3ResRef = VAR_CRAFT_RESREF_TOXIN;
    int nItem1Amount, nItem2Amount, nItem3Amount;
    int nItem1TypeTemp, nItem2TypeTemp, nItem3TypeTemp;
    int nItem1AmountTemp, nItem2AmountTemp, nItem3AmountTemp;
    int nSkillType, nSkillRank;
    string sTable = "crafting_tables";
    string sSQL = "SELECT component1_type, component1_amount," +
                        " component2_type, component2_amount," +
                        " component3_type, component3_amount," +
                        " skill_type, skill_rank" +
                     " FROM " + sTable +
                     " WHERE craft_table_seq = " + IntToString(nCraftTableSeq);

    SendDebugMessage(oPC, "Database: " + sSQL);

    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        nItem1Amount = GetLocalInt(oPC, VAR_CRAFT_PC_CLOTH);
        nItem2Amount = GetLocalInt(oPC, VAR_CRAFT_PC_SCRAP);
        nItem3Amount = GetLocalInt(oPC, VAR_CRAFT_PC_TOXIN);
        nItem1TypeTemp = StringToInt(SQLGetData(1));
        nItem1AmountTemp = StringToInt(SQLGetData(2));
        nItem2TypeTemp = StringToInt(SQLGetData(3));
        nItem2AmountTemp = StringToInt(SQLGetData(4));
        nItem3TypeTemp = StringToInt(SQLGetData(5));
        nItem3AmountTemp = StringToInt(SQLGetData(6));
        nSkillType = StringToInt(SQLGetData(7));
        nSkillRank = StringToInt(SQLGetData(8));

        SendDebugMessage(oPC, "Initial Amounts:");
        SendDebugMessage(oPC, "Cloth Amount: " + IntToString(nItem1Amount));
        SendDebugMessage(oPC, "Scrap Amount: " + IntToString(nItem2Amount));
        SendDebugMessage(oPC, "Toxin Amount: " + IntToString(nItem3Amount));

        SendDebugMessage(oPC, "Cost Amounts:");
        SendDebugMessage(oPC, "Cloth Cost: " + IntToString(nItem1AmountTemp));
        SendDebugMessage(oPC, "Scrap Cost: " + IntToString(nItem2AmountTemp));
        SendDebugMessage(oPC, "Toxin Cost: " + IntToString(nItem3AmountTemp));

        //switch (nItem1TypeTemp)
        //{
            //case CRAFT_COMPONENT_CLOTH:
                nItem1Amount -= nItem1AmountTemp; //break;
            //case CRAFT_COMPONENT_SCRAP:
            //    nItem2Amount -= nItem1AmountTemp; break;
            //case CRAFT_COMPONENT_TOXIN:
            //    nItem3Amount -= nItem1AmountTemp; break;
        //}
        //switch (nItem2TypeTemp)
        //{
            //case CRAFT_COMPONENT_CLOTH:
            //    nItem1Amount -= nItem2AmountTemp; break;
            //case CRAFT_COMPONENT_SCRAP:
                nItem2Amount -= nItem2AmountTemp; //break;
            //case CRAFT_COMPONENT_TOXIN:
            //    nItem3Amount -= nItem2AmountTemp; break;
        //}
        //switch (nItem3TypeTemp)
        //{
            //case CRAFT_COMPONENT_CLOTH:
            //    nItem1Amount -= nItem3AmountTemp; break;
            //case CRAFT_COMPONENT_SCRAP:
            //    nItem2Amount -= nItem3AmountTemp; break;
            //case CRAFT_COMPONENT_TOXIN:
                nItem3Amount -= nItem3AmountTemp; //break;
        //}

        SendDebugMessage(oPC, "Calculated Amounts:");
        SendDebugMessage(oPC, "Cloth Remaining: " + IntToString(nItem1Amount));
        SendDebugMessage(oPC, "Scrap Remaining: " + IntToString(nItem2Amount));
        SendDebugMessage(oPC, "Toxin Remaining: " + IntToString(nItem3Amount));

        if (nItem1Amount > -1)
        {
            //CreateItemOnObject(nItem1ResRef,oPC,nItem1Amount);
            SetLocalInt(oPC, VAR_CRAFT_PC_CLOTH, nItem1Amount);
        }
        else
        {
            return FALSE;
        }
        if (nItem2Amount > -1)
        {
            //CreateItemOnObject(nItem2ResRef,oPC,nItem2Amount);
            SetLocalInt(oPC, VAR_CRAFT_PC_SCRAP, nItem2Amount);
        }
        else
        {
            return FALSE;
        }
        if (nItem3Amount > -1)
        {
            //CreateItemOnObject(nItem3ResRef,oPC,nItem3Amount);
            SetLocalInt(oPC, VAR_CRAFT_PC_TOXIN, nItem3Amount);
        }
        else
        {
            return FALSE;
        }

        // Skill Check
        if (GetIsSkillSuccessful(oPC, nSkillType, nSkillRank))
        {
            return TRUE;
        }
        return FALSE;
    }
    else
    {
        return FALSE;
    }
}

void FillCraftStation(object oContainer, int nCraftTable, int nSkillType, int nSkillAmount,
                      int nItem1Type, int nItem1Amount, int nItem2Type, int nItem2Amount,
                      int nItem3Type, int nItem3Amount)
{
    object oPC = GetLocalObject(oContainer, VAR_CRAFT_STATION_PC);
    string sTable = "crafting_tables";
    string sSQL = "SELECT DISTINCT craft_resref, craft_table_seq" +
                     " FROM " + sTable +
                     " WHERE craft_table_type=" + IntToString(nCraftTable) +
                     " AND skill_type =" + IntToString(nSkillType) +
                     " AND skill_rank <=" + IntToString(nSkillAmount) +
                     " AND component1_type =" + IntToString(nItem1Type) +
                     " AND component1_amount <=" + IntToString(nItem1Amount) +
                     " AND component2_type =" + IntToString(nItem2Type) +
                     " AND component2_amount <=" + IntToString(nItem2Amount) +
                     " AND component3_type =" + IntToString(nItem3Type) +
                     " AND component3_amount <=" + IntToString(nItem3Amount);

    SendDebugMessage(oPC, "Database: SQL Statement = ");
    SendDebugMessage(oPC, sSQL);

    object oItem;
    int nCount = 0;

    SQLExecDirect(sSQL);

    while (SQLFetch() == SQL_SUCCESS)
    {
        oItem = CreateItemOnObject(SQLGetData(1), oContainer);
        SendDebugMessage(oPC, "Database: Found Item = " + GetName(oItem));
        SetLocalInt(oContainer, SQLGetData(1), StringToInt(SQLGetData(2)));
        SendDebugMessage(oPC, "Database: Item ResRef = [" + SQLGetData(1) + "]");
        SendDebugMessage(oPC, "Database: Setting Local sequence on item to " + SQLGetData(2));
        DelayCommand (0.5, SetIdentified(oItem, TRUE));
        if (GetIsObjectValid(oItem)) {nCount += 1;}
    }
    SendDebugMessage(oPC, "Database: Total Items retrieved = " + IntToString(nCount));
}








