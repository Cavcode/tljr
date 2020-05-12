#include "x2_inc_itemprop"

const int COST_MULTIPLIER = 5;

const string STRING_YELLOW = "<cþþ>";
const string STRING_GREEN = "<cþ>";
const string STRING_RED = "<cþ>";
const string STRING_PURPLE = "<cu-„>";
const string STRING_BLUE = "<cþ>";

string SF_ColourString(string sString, string sColour)
{
    return sColour + sString + "</c>";
}

float SF_GetBaseItemMultiplier(object oItem)
{
    float fMultiplier = -1.0;

    switch (GetBaseItemType(oItem))
    {
        case BASE_ITEM_ARROW :
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:          fMultiplier = 0.01; break;
        case BASE_ITEM_AMULET:
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_BRACER:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_GLOVES:
        case BASE_ITEM_HELMET:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD:     fMultiplier = 1.0; break;
        case BASE_ITEM_RING:            fMultiplier = 1.25; break;
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTFLAIL :
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE :
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_WHIP:            fMultiplier = 2.0; break;
    }

    return fMultiplier;
}

float SF_GetItemPropertMeleeCost(int nBonus)
{
    float fMeleeCost = -1.0;

    switch (nBonus)
    {
        case 1: fMeleeCost = 0.9; break;
        case 2: fMeleeCost = 1.9; break;
        case 3: fMeleeCost = 2.9; break;
        case 4: fMeleeCost = 3.9; break;
        case 5: fMeleeCost = 4.9; break;
    }

    return fMeleeCost;
}

float SF_GetItemPropertyDamageCost(int nBonus)
{
    float fDamageCost = -1.0;
    switch (nBonus)
    {
        case 6: fDamageCost = 0.25; break;      //  1d4
        case 7: fDamageCost = 0.4; break;       //  1d6
        case 8: fDamageCost = 0.65; break;      //  1d8
        case 9: fDamageCost = 0.75; break;      //  1d10
        case 10: fDamageCost = 0.85; break;     //  2d6
        case 11: fDamageCost = 0.95; break;     //  2d8
        case 12: fDamageCost = 0.75; break;     //  2d4
        case 13: fDamageCost = 1.75; break;     //  2d10
        case 14: fDamageCost = 1.5; break;      //  1d12
        case 15: fDamageCost = 2.0; break;      //  2d12
    }
    return fDamageCost;
}

int SF_GetItemPropertyCostTable(int nItemProperty)
{
    switch (nItemProperty)
    {
        case ITEM_PROPERTY_HASTE:
        case ITEM_PROPERTY_KEEN:                nItemProperty = 0; break;
        case ITEM_PROPERTY_ABILITY_BONUS:       nItemProperty = 1; break;
        case ITEM_PROPERTY_AC_BONUS:
        case ITEM_PROPERTY_ATTACK_BONUS:
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:
        case ITEM_PROPERTY_REGENERATION:
        case ITEM_PROPERTY_SAVING_THROW_BONUS:  nItemProperty = 2; break;
        case ITEM_PROPERTY_DAMAGE_BONUS:
        case ITEM_PROPERTY_MASSIVE_CRITICALS:   nItemProperty = 4; break;
    }
    return nItemProperty;
}

float SF_GetItemPropertyCostTableValue(int nCostTable, int nValue)
{
    float fPropCost = -1.0;

    switch (nCostTable)
    {
        case 0: fPropCost = 1.0; break;
        case 1: fPropCost = IntToFloat(nValue); break;
        case 2: fPropCost = SF_GetItemPropertMeleeCost(nValue); break;
        case 4: fPropCost = SF_GetItemPropertyDamageCost(nValue); break;
    }

    return fPropCost;
}

float SF_ItemPropertyCost(int nProperty)
{
    float fPropDefCost = -1.0;

    switch (nProperty)
    {
        case ITEM_PROPERTY_ABILITY_BONUS:       fPropDefCost = 1.2; break;
        case ITEM_PROPERTY_AC_BONUS:            fPropDefCost = 0.9; break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:   fPropDefCost = 1.0; break;
        case ITEM_PROPERTY_DAMAGE_BONUS:        fPropDefCost = 3.5; break;
        case ITEM_PROPERTY_HASTE:               fPropDefCost = 3.5; break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS:  fPropDefCost = 2.0; break;
        case ITEM_PROPERTY_KEEN:                fPropDefCost = 1.0; break;
        case ITEM_PROPERTY_REGENERATION:        fPropDefCost = 2.0; break;
        case ITEM_PROPERTY_ATTACK_BONUS:        fPropDefCost = 0.5; break;
        case ITEM_PROPERTY_MASSIVE_CRITICALS:   fPropDefCost = 0.75; break;
    }

    return fPropDefCost;
}


int SF_CalculateItemPropertyCost(object oItem)
{
    int nBaseCost = GetGoldPieceValue(oItem);
    int nPropAmount = 0; int nLoop = 0; int nIPType = 0; int nTotalCost = 0;
    float fCostTableValue1 = 0.0; float fCostTableValue2 = 0.0; float fCostTableValue3 = 0.0;
    float fPropCost1 = 0.0; float fPropCost2 = 0.0; float fPropCost3 = 0.0;
    float fMultiplier = SF_GetBaseItemMultiplier(oItem);
    string sIPType = GetLocalString(OBJECT_SELF, "IPTYPE_1");
    int nIPAmount = StringToInt(GetLocalString(OBJECT_SELF, "IPAMOUNT_1"));

    if (sIPType != "")
    {
        nIPType = StringToInt(sIPType);
        fCostTableValue1 += SF_GetItemPropertyCostTableValue(SF_GetItemPropertyCostTable(nIPType), nIPAmount);
        fPropCost1 += SF_ItemPropertyCost(nIPType);
    }

    sIPType = GetLocalString(OBJECT_SELF, "IPTYPE_2");
    nIPAmount = StringToInt(GetLocalString(OBJECT_SELF, "IPAMOUNT_2"));

    if (sIPType != "")
    {
        nIPType = StringToInt(sIPType);
        fCostTableValue2 += SF_GetItemPropertyCostTableValue(SF_GetItemPropertyCostTable(nIPType), nIPAmount);
        fPropCost2 += SF_ItemPropertyCost(nIPType);
    }

    sIPType = GetLocalString(OBJECT_SELF, "IPTYPE_3");
    nIPAmount = StringToInt(GetLocalString(OBJECT_SELF, "IPAMOUNT_3"));

    if (sIPType != "")
    {
        nIPType = StringToInt(sIPType);
        fCostTableValue3 += SF_GetItemPropertyCostTableValue(SF_GetItemPropertyCostTable(nIPType), nIPAmount);
        fPropCost3 += SF_ItemPropertyCost(nIPType);
    }



    nTotalCost = FloatToInt(nBaseCost + (fMultiplier * pow((fPropCost1 * fCostTableValue1 + fPropCost2 * fCostTableValue2 + fPropCost3 * fCostTableValue3), 2.) * 1000));
    SetLocalInt(OBJECT_SELF, "TOTAL_COST", nTotalCost * COST_MULTIPLIER);

    return nTotalCost;
}

int SF_GetItemLevelFromCost(int nItemCost)
{
    // Get itnems level based on its value
    if (nItemCost < 1000)      nItemCost = 1;
    else if (nItemCost < 1500) nItemCost = 2;
    else if (nItemCost < 2500) nItemCost = 3;
    else if (nItemCost < 3500) nItemCost = 4;
    else if (nItemCost < 5000) nItemCost = 5;
    else if (nItemCost < 6500) nItemCost = 6;
    else if (nItemCost < 9000) nItemCost = 7;
    else if (nItemCost < 12000) nItemCost = 8;
    else if (nItemCost < 15000) nItemCost = 9;
    else if (nItemCost < 19500) nItemCost = 10;
    else if (nItemCost < 25000) nItemCost = 11;
    else if (nItemCost < 30000) nItemCost = 12;
    else if (nItemCost < 35000) nItemCost = 13;
    else if (nItemCost < 40000) nItemCost = 14;
    else if (nItemCost < 50000) nItemCost = 15;
    else if (nItemCost < 65000) nItemCost = 16;
    else if (nItemCost < 75000) nItemCost = 17;
    else if (nItemCost < 90000) nItemCost = 18;
    else if (nItemCost < 110000) nItemCost = 19;
    else if (nItemCost < 130000) nItemCost = 20;
    else if (nItemCost < 250000) nItemCost = 21;
    else if (nItemCost < 500000) nItemCost = 22;
    else if (nItemCost < 750000) nItemCost = 23;
    else if (nItemCost < 1000000) nItemCost = 24;
    else if (nItemCost < 1200000) nItemCost = 25;
    else if (nItemCost < 1400000) nItemCost = 26;
    else if (nItemCost < 1600000) nItemCost = 27;
    else if (nItemCost < 1800000) nItemCost = 28;
    else if (nItemCost < 2000000) nItemCost = 29;
    else if (nItemCost < 2200000) nItemCost = 30;
    else if (nItemCost < 2400000) nItemCost = 31;
    else if (nItemCost < 2600000) nItemCost = 32;
    else if (nItemCost < 2800000) nItemCost = 33;
    else if (nItemCost < 3000000) nItemCost = 34;
    else if (nItemCost < 3200000) nItemCost = 35;
    else if (nItemCost < 3400000) nItemCost = 36;
    else if (nItemCost < 3600000) nItemCost = 37;
    else if (nItemCost < 3800000) nItemCost = 38;
    else if (nItemCost < 4000000) nItemCost = 39;
    else if (nItemCost < 4200000) nItemCost = 40;
    else if (nItemCost < 4400000) nItemCost = 41;
    else if (nItemCost < 4600000) nItemCost = 42;
    else if (nItemCost < 4800000) nItemCost = 43;
    else if (nItemCost < 5000000) nItemCost = 44;
    else if (nItemCost < 5200000) nItemCost = 45;
    else if (nItemCost < 5400000) nItemCost = 46;
    else if (nItemCost < 5600000) nItemCost = 47;
    else if (nItemCost < 5800000) nItemCost = 48;
    else if (nItemCost < 6000000) nItemCost = 49;
    else if (nItemCost < 6200000) nItemCost = 50;
    else if (nItemCost < 6400000) nItemCost = 51;
    else if (nItemCost < 6600000) nItemCost = 52;
    else if (nItemCost < 6800000) nItemCost = 53;
    else if (nItemCost < 7000000) nItemCost = 54;
    else if (nItemCost < 7200000) nItemCost = 55;
    else if (nItemCost < 7400000) nItemCost = 56;
    else if (nItemCost < 7600000) nItemCost = 57;
    else if (nItemCost < 7800000) nItemCost = 58;
    else if (nItemCost < 8000000) nItemCost = 59;
    else                          nItemCost = 60;

    // Return the items required level
    return nItemCost;
}

string SF_GetAbilityType(int nAbility)
{
    string sAbility;
    switch (nAbility)
    {
        case ABILITY_CHARISMA:      sAbility = "Cha"; break;
        case ABILITY_CONSTITUTION:  sAbility = "Con"; break;
        case ABILITY_DEXTERITY:     sAbility = "Dex"; break;
        case ABILITY_INTELLIGENCE:  sAbility = "Int"; break;
        case ABILITY_STRENGTH:      sAbility = "Str"; break;
        case ABILITY_WISDOM:        sAbility = "Wis"; break;
   }
   return sAbility;
}

string SF_GetDamageType(int nDamage)
{
    string sDamage;
    switch (nDamage)
    {
        case IP_CONST_DAMAGETYPE_ACID:        sDamage = "Acid"; break;
        case IP_CONST_DAMAGETYPE_BLUDGEONING: sDamage = "Bludgeoning"; break;
        case IP_CONST_DAMAGETYPE_COLD:        sDamage = "Cold"; break;
        case IP_CONST_DAMAGETYPE_DIVINE:      sDamage = "Divine"; break;
        case IP_CONST_DAMAGETYPE_ELECTRICAL:  sDamage = "Electrical"; break;
        case IP_CONST_DAMAGETYPE_FIRE:        sDamage = "Fire"; break;
        case IP_CONST_DAMAGETYPE_MAGICAL:     sDamage = "Magical"; break;
        case IP_CONST_DAMAGETYPE_NEGATIVE:    sDamage = "Negative"; break;
        case IP_CONST_DAMAGETYPE_PIERCING:    sDamage = "Piercing"; break;
        case IP_CONST_DAMAGETYPE_POSITIVE:    sDamage = "Positive"; break;
        case IP_CONST_DAMAGETYPE_SLASHING:    sDamage = "Slashing"; break;
        case IP_CONST_DAMAGETYPE_SONIC:       sDamage = "Sonic"; break;
   }
   return sDamage;
}

string SF_GetSavingThrowType(int nSave)
{
    string sSave;
    switch (nSave)
    {
        case IP_CONST_SAVEBASETYPE_FORTITUDE:  sSave = "Fort"; break;
        case IP_CONST_SAVEBASETYPE_REFLEX:     sSave = "Reflex"; break;
        case IP_CONST_SAVEBASETYPE_WILL:       sSave = "Will"; break;
    }
    return sSave;
}

string SF_GetDamageAmount(int nIPAmount)
{
    string sIPAmount = "";

    switch (nIPAmount)
    {
        case IP_CONST_DAMAGEBONUS_1d4: sIPAmount = "1d4"; break;
        case IP_CONST_DAMAGEBONUS_1d6: sIPAmount = "1d6"; break;
        case IP_CONST_DAMAGEBONUS_1d8: sIPAmount = "1d8"; break;
        case IP_CONST_DAMAGEBONUS_1d10: sIPAmount = "1d10"; break;
        case IP_CONST_DAMAGEBONUS_1d12: sIPAmount = "1d12"; break;
        case IP_CONST_DAMAGEBONUS_2d4: sIPAmount = "2d4"; break;
        case IP_CONST_DAMAGEBONUS_2d6: sIPAmount = "2d6"; break;
        case IP_CONST_DAMAGEBONUS_2d8: sIPAmount = "2d8"; break;
        case IP_CONST_DAMAGEBONUS_2d10: sIPAmount = "2d10"; break;
        case IP_CONST_DAMAGEBONUS_2d12: sIPAmount = "2d12"; break;
    }

    return sIPAmount;
}

string SF_GetItemPropertyType(int nPropType)
{
    string sBonus = "";
    switch (nPropType)
    {
        case ITEM_PROPERTY_AC_BONUS:           sBonus = "AC Bonus";break;
        case ITEM_PROPERTY_ABILITY_BONUS:      sBonus = "Ability Bonus";break;
        case ITEM_PROPERTY_ATTACK_BONUS:       sBonus = "Attack Bonus"; break;
        case ITEM_PROPERTY_DAMAGE_BONUS:       sBonus = "Damage Bonus"; break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:  sBonus = "Enhancement Bonus"; break;
        case ITEM_PROPERTY_HASTE:              sBonus = "Haste"; break;
        case ITEM_PROPERTY_KEEN:               sBonus = "Keen"; break;
        case ITEM_PROPERTY_MASSIVE_CRITICALS:  sBonus = "Massive Criticals"; break;
        case ITEM_PROPERTY_REGENERATION:       sBonus = "Regeneration"; break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS: sBonus = "Saving Throw"; break;
    }
    return sBonus;
}


int SF_SetLocalItemProperty()
{
    string sIPType = GetLocalString(OBJECT_SELF, "IPTYPE");
    string sIPSubType = GetLocalString(OBJECT_SELF, "IPSUBTYPE");
    string sIPAmount = GetLocalString(OBJECT_SELF, "IPAMOUNT");
    string sMatchIPType = ""; string sMatchIPSubType = "";
    int nLoop = 0;

    for (nLoop = 1; nLoop <=3; nLoop ++)
    {
        sMatchIPType = GetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop));
        sMatchIPSubType = GetLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nLoop));

        if ((sMatchIPType == sIPType) && (sIPSubType == sMatchIPSubType || sIPSubType == ""))
        {
            SetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop), sIPType);

            if (sIPSubType != "")
            {
                SetLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nLoop), sIPSubType);
            }
            if (sIPAmount != "")
            {
                SetLocalString(OBJECT_SELF, "IPAMOUNT_" + IntToString(nLoop), sIPAmount);
            }

            return TRUE;
        }
    }

    for (nLoop = 1; nLoop <=3; nLoop ++)
    {
        if (GetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop)) == "")
        {
            SetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop), sIPType);

            if (sIPSubType != "")
            {
                SetLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nLoop), sIPSubType);
            }
            if (sIPAmount != "")
            {
                SetLocalString(OBJECT_SELF, "IPAMOUNT_" + IntToString(nLoop), sIPAmount);
            }

            return TRUE;
        }
    }

    return -1;
}

string SF_GetLocalItemProperty(int nIP)
{
    string sIPType = GetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nIP));

    if (sIPType == "")
    {
        return sIPType;
    }

    int nIPSubType = StringToInt(GetLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nIP)));
    string sIPAmount = GetLocalString(OBJECT_SELF, "IPAMOUNT_" + IntToString(nIP));
    int nIPType = StringToInt(sIPType);
    sIPType = "";

    switch (nIPType)
    {
        case ITEM_PROPERTY_ABILITY_BONUS: sIPType = SF_GetAbilityType(nIPSubType) + " "; break;
        case ITEM_PROPERTY_DAMAGE_BONUS: sIPType = SF_GetDamageType(nIPSubType) + " "; break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS: sIPType = SF_GetSavingThrowType(nIPSubType) + " "; break;
    }

    sIPType += SF_GetItemPropertyType(nIPType);

    if (sIPAmount != "")
    {
        if (nIPType == ITEM_PROPERTY_DAMAGE_BONUS ||
            nIPType == ITEM_PROPERTY_MASSIVE_CRITICALS)
        {
            sIPAmount = SF_GetDamageAmount(StringToInt(sIPAmount));
        }
        sIPType += " +" + sIPAmount;
    }

    return sIPType;
}


void SF_CraftItem(object oPC)
{
    object oItem = GetLocalObject(OBJECT_SELF, "CRAFT_ITEM");
    string sIPType = "";  itemproperty ipProp;
    int nLoop = 0; int nIPSubType = 0; int nIPAmount = 0;

    for (nLoop = 1; nLoop <= 3; nLoop ++)
    {
        sIPType = GetLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop));

        if (sIPType == "")
        {
            break;
        }

        nIPSubType = StringToInt(GetLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nLoop)));
        nIPAmount = StringToInt(GetLocalString(OBJECT_SELF, "IPAMOUNT_" + IntToString(nLoop)));

        switch (StringToInt(sIPType))
        {
            // Weapons
            case ITEM_PROPERTY_ATTACK_BONUS:       ipProp = ItemPropertyAttackBonus(nIPAmount); break;
            case ITEM_PROPERTY_DAMAGE_BONUS:       ipProp = ItemPropertyDamageBonus(nIPSubType, nIPAmount); break;
            case ITEM_PROPERTY_ENHANCEMENT_BONUS:  ipProp = ItemPropertyEnhancementBonus(nIPAmount); break;
            case ITEM_PROPERTY_KEEN:               ipProp = ItemPropertyKeen(); break;
            case ITEM_PROPERTY_MASSIVE_CRITICALS:  ipProp = ItemPropertyMassiveCritical(nIPAmount); break;
            // Armour
            case ITEM_PROPERTY_AC_BONUS:           ipProp = ItemPropertyACBonus(nIPAmount);  break;
            case ITEM_PROPERTY_ABILITY_BONUS:      ipProp = ItemPropertyAbilityBonus(nIPSubType, nIPAmount); break;
            case ITEM_PROPERTY_HASTE:              ipProp = ItemPropertyHaste(); break;
            case ITEM_PROPERTY_REGENERATION:       ipProp = ItemPropertyRegeneration(nIPAmount); break;
            case ITEM_PROPERTY_SAVING_THROW_BONUS: ipProp = ItemPropertyBonusSavingThrow(nIPSubType, nIPAmount); break;
            default: break;
        }

        IPSafeAddItemProperty(oItem, ipProp);
    }

    //TakeGoldFromCreature(GetLocalInt(OBJECT_SELF, "TOTAL_COST"), oPC, TRUE);
    CopyItem(oItem, oPC, TRUE);
}

void SF_PurgeCurrentItemProperty()
{
    DeleteLocalString(OBJECT_SELF, "IPTYPE");
    DeleteLocalString(OBJECT_SELF, "IPSUBTYPE");
    DeleteLocalString(OBJECT_SELF, "IPAMOUNT");
}
void SF_PurgeLocalVariables()
{
    DeleteLocalInt(OBJECT_SELF, "TOTAL_COST");
    DeleteLocalString(OBJECT_SELF, "BASE");
    DeleteLocalString(OBJECT_SELF, "ITEM_RESREF");
    DestroyObject(GetLocalObject(OBJECT_SELF, "CRAFT_ITEM"));

    int nLoop = 0;

    for (nLoop = 0; nLoop <= 3; nLoop ++)
    {
        DeleteLocalString(OBJECT_SELF, "IPTYPE_" + IntToString(nLoop));
        DeleteLocalString(OBJECT_SELF, "IPSUBTYPE_" + IntToString(nLoop));
        DeleteLocalString(OBJECT_SELF, "IPAMOUNT_" + IntToString(nLoop));
    }
}
void SF_PurgeArmourCrafting()
{
    SetCustomToken(1000, "");
    SF_PurgeCurrentItemProperty();
    SF_PurgeLocalVariables();
}
void SF_PurgeWeaponCrafting()
{
    SetCustomToken(1001, "");
    SF_PurgeCurrentItemProperty();
    SF_PurgeLocalVariables();
}

int SF_RefreshArmourCraftingToken()
{
    object oItem = GetLocalObject(OBJECT_SELF, "CRAFT_ITEM");
    int nItemLevel = SF_GetItemLevelFromCost(SF_CalculateItemPropertyCost(oItem));
    int nItemCost = GetLocalInt(OBJECT_SELF, "TOTAL_COST");
    int nLoop = 0;
    string sCraftingToken = "";
    string sItemName = GetName(oItem);
    string sBase = GetLocalString(OBJECT_SELF, "BASE");
    string sIP = "";

    if (sItemName != "")
    {
        sCraftingToken += SF_ColourString(sItemName, STRING_GREEN);
    }
    if (sBase != "")
    {
        sCraftingToken += SF_ColourString("\n" + sBase, STRING_BLUE);
    }

    sCraftingToken += SF_ColourString("\nItem Cost: " + IntToString(nItemCost), STRING_YELLOW) +
    SF_ColourString("\nItem Level: " + IntToString(nItemLevel), STRING_RED);

    for (nLoop = 1; nLoop <= 3; nLoop ++)
    {
        sIP = SF_GetLocalItemProperty(nLoop);

        if (sIP == "")
        {
            break;
        }
        sCraftingToken += "\n" + sIP;
    }

    SetCustomToken(1000, sCraftingToken);
    SF_PurgeCurrentItemProperty();

    return TRUE;
}

int SF_RefreshWeaponCraftingToken()
{
    object oItem = GetLocalObject(OBJECT_SELF, "CRAFT_ITEM");
    int nItemLevel = SF_GetItemLevelFromCost(SF_CalculateItemPropertyCost(oItem));
    int nItemCost = GetLocalInt(OBJECT_SELF, "TOTAL_COST");
    int nLoop = 0;
    string sCraftingToken = "";
    string sItemName = GetName(oItem);
    string sBase = GetLocalString(OBJECT_SELF, "BASE");
    string sIP = "";

    if (sItemName != "")
    {
        sCraftingToken += SF_ColourString(sItemName, STRING_GREEN);
    }
    if (sBase != "")
    {
        sCraftingToken += SF_ColourString("\n" + sBase, STRING_BLUE);
    }

    sCraftingToken += SF_ColourString("\nItem Cost: " + IntToString(nItemCost), STRING_YELLOW) +
    SF_ColourString("\nItem Level: " + IntToString(nItemLevel), STRING_RED);

    for (nLoop = 1; nLoop <= 3; nLoop ++)
    {
        sIP = SF_GetLocalItemProperty(nLoop);

        if (sIP == "")
        {
            break;
        }
        sCraftingToken += "\n" + sIP;
    }

    SetCustomToken(1001, sCraftingToken);
    SF_PurgeCurrentItemProperty();

    return TRUE;
}
