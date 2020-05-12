int lcs_GetBaseArmorACValue(object oItem)
{
    int armorAC = GetItemACValue(oItem);

    if(GetItemHasItemProperty(oItem, ITEM_PROPERTY_AC_BONUS))
    {
        itemproperty iProp = GetFirstItemProperty(oItem);
        while(GetItemPropertyType(iProp) != ITEM_PROPERTY_AC_BONUS)
        {
            iProp = GetNextItemProperty(oItem);
        }
        armorAC = armorAC - GetItemPropertyCostTableValue(iProp);
    }

    return armorAC;
}

string lcs_GetArmorPart2DAStringFromInt(int nPart)
{
    switch(nPart)
    {
        case ITEM_APPR_ARMOR_MODEL_BELT: return "parts_belt";
        case ITEM_APPR_ARMOR_MODEL_LBICEP: return "parts_bicep";
        case ITEM_APPR_ARMOR_MODEL_LFOOT: return "parts_foot";
        case ITEM_APPR_ARMOR_MODEL_LFOREARM: return "parts_forearm";
        case ITEM_APPR_ARMOR_MODEL_LHAND: return "parts_hand";
        case ITEM_APPR_ARMOR_MODEL_LSHIN: return "parts_shin";
        case ITEM_APPR_ARMOR_MODEL_LSHOULDER: return "parts_shoulder";
        case ITEM_APPR_ARMOR_MODEL_LTHIGH: return "parts_legs";
        case ITEM_APPR_ARMOR_MODEL_NECK: return "parts_neck";
        case ITEM_APPR_ARMOR_MODEL_PELVIS: return "parts_pelvis";
        case ITEM_APPR_ARMOR_MODEL_RBICEP: return "parts_bicep";
        case ITEM_APPR_ARMOR_MODEL_RFOOT: return "parts_foot";
        case ITEM_APPR_ARMOR_MODEL_RFOREARM: return "parts_forearm";
        case ITEM_APPR_ARMOR_MODEL_RHAND: return "parts_hand";
        case ITEM_APPR_ARMOR_MODEL_ROBE: return "parts_robe";
        case ITEM_APPR_ARMOR_MODEL_RSHIN: return "parts_shin";
        case ITEM_APPR_ARMOR_MODEL_RSHOULDER: return "parts_shoulder";
        case ITEM_APPR_ARMOR_MODEL_RTHIGH: return "parts_legs";
        case ITEM_APPR_ARMOR_MODEL_TORSO: return "parts_chest";
        default: return "";
    }
    return "";
}

int lcs_GetNextValidArmor2DALine(object oItem, int nPart)
{
    int nAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, nPart);
    string sPart = lcs_GetArmorPart2DAStringFromInt(nPart);

    if(nAppearance != 199)
    {
        nAppearance = nAppearance + 1;
    }
    else
    {
        nAppearance = 0;
    }


    string sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);

    if(nPart != ITEM_APPR_ARMOR_MODEL_TORSO)
    {
        while(sCurrent2DA == "")
        {
            if(nAppearance == 199)
            {
                nAppearance = 0;
            }
            else if(((nAppearance > 30) && (nAppearance < 150)) && (nPart == ITEM_APPR_ARMOR_MODEL_ROBE))
            {
                nAppearance = 150;
            }
            else if(((nAppearance < 100) && (nAppearance > 2)) && (nPart != ITEM_APPR_ARMOR_MODEL_ROBE))
            {
                nAppearance = 100;
            }
            else
            {
                nAppearance = nAppearance + 1;
            }
            sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);
        }
    }
    else
    {
        int nCurrentAC = lcs_GetBaseArmorACValue(oItem);
        int nNewAC;

        if(sCurrent2DA == "")
        {
            nNewAC = 10;
        }
        else
        {
            nNewAC = StringToInt(sCurrent2DA);
        }

        while((sCurrent2DA == "") || (nCurrentAC != nNewAC))
        {
            if(nAppearance == 199)
            {
                nAppearance = 0;
            }
            else if(((nAppearance < 100) && (nAppearance > 2)) && (sCurrent2DA == ""))
            {
                nAppearance = 100;
            }
            else if((nAppearance > 100) && (nCurrentAC > 0))
            {
                nAppearance = 0;
            }
            else
            {
                nAppearance = nAppearance + 1;
            }
            sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);
            if(sCurrent2DA == "")
            {
                nNewAC = 10;
            }
            else
            {
                nNewAC = StringToInt(sCurrent2DA);
            }
        }
    }

    return nAppearance;
}

int lcs_GetPreviousValidArmor2DALine(object oItem, int nPart)
{
    int nAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, nPart);
    string sPart = lcs_GetArmorPart2DAStringFromInt(nPart);

    if(nAppearance != 0)
    {
        nAppearance = nAppearance - 1;
    }
    else
    {
        nAppearance = 199;
    }

    string sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);

    if(nPart != ITEM_APPR_ARMOR_MODEL_TORSO)
    {
        while(sCurrent2DA == "")
        {
            if(nAppearance == 0)
            {
                nAppearance = 199;
            }
            else if(((nAppearance > 30) && (nAppearance < 150)) && (nPart == ITEM_APPR_ARMOR_MODEL_ROBE))
            {
                nAppearance = 30;
            }
            else
            {
                nAppearance = nAppearance - 1;
            }
            sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);
        }
    }
    else
    {
        int nCurrentAC = lcs_GetBaseArmorACValue(oItem);

        int nNewAC;

        if(sCurrent2DA == "")
        {
            nNewAC = 10;
        }
        else
        {
            nNewAC = StringToInt(sCurrent2DA);
        }

        while((sCurrent2DA == "") || (nCurrentAC != nNewAC))
        {
            if(nAppearance == 0)
            {
                nAppearance = 199;
            }
            else if((nCurrentAC > 0) && (nAppearance > 54))
            {
                nAppearance = 54;
            }
            else
            {
                nAppearance = nAppearance - 1;
            }
            sCurrent2DA = Get2DAString(sPart, "ACBONUS", nAppearance);

            if(sCurrent2DA == "")
            {
                nNewAC = 10;
            }
            else
            {
                nNewAC = StringToInt(sCurrent2DA);
            }
        }
        SendMessageToPC(GetItemPossessor(oItem), IntToString(nNewAC));
    }

    return nAppearance;
}

int lcs_GetNextValidColor(object oItem, int nPart)
{
    int nAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, nPart);
    if(nAppearance == 63)
    {
        nAppearance = 0;
    }
    else
    {
        nAppearance = nAppearance + 1;
    }
    return nAppearance;
}

int lcs_GetPreviousValidColor(object oItem, int nPart)
{
    int nAppearance = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, nPart);
    if(nAppearance == 0)
    {
        nAppearance = 63;
    }
    else
    {
        nAppearance = nAppearance - 1;
    }
    return nAppearance;
}


void lcs_ModifyandEquipNewArmor(object oItem, int nPart, int nAppearance)
{
    object oPC = GetItemPossessor(oItem);
    object oNewItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, nPart, nAppearance);
    DestroyObject(oItem);
    SetCommandable(TRUE, oPC);
    AssignCommand(oPC, ActionEquipItem(oNewItem, INVENTORY_SLOT_CHEST));
}

void lcs_ModifyTwiceandEquipNewArmor(object oItem, int nPart1, int nPart2, int nAppearance)
{
    object oPC = GetItemPossessor(oItem);
    object oNewItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, nPart1, nAppearance);
    object oSecondNewItem = CopyItemAndModify(oNewItem, ITEM_APPR_TYPE_ARMOR_MODEL, nPart2, nAppearance);
    DestroyObject(oItem);
    DestroyObject(oNewItem);
    SetCommandable(TRUE, oPC);
    AssignCommand(oPC, ActionEquipItem(oSecondNewItem, INVENTORY_SLOT_CHEST));
}

void lcs_ModifyColorandEquipNewArmor(object oItem, int nPart, int nAppearance)
{
    object oPC = GetItemPossessor(oItem);
    object oNewItem = CopyItemAndModify(oItem, ITEM_APPR_TYPE_ARMOR_COLOR, nPart, nAppearance);
    DestroyObject(oItem);
    SetCommandable(TRUE, oPC);
    AssignCommand(oPC, ActionEquipItem(oNewItem, INVENTORY_SLOT_CHEST));
}
