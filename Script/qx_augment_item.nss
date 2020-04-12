//::///////////////////////////////////////////////
//:: Quix's Weapon/Armor Augmentation System
//::
//:: based on Scarface's Socketed Items Script
//////////////////////////////////////////////////

#include "qx_augment_inc"
#include "x2_inc_switches"
void main()
{
    // Check we have the correct event firing the script
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    // Vars
    object oPC = GetItemActivator(),
           oAugment = GetItemActivated(),
           oItem = GetItemActivatedTarget();
    int nItemType = GetBaseItemType(oItem);
    int nHasAugment = GetLocalInt(oItem, "HAS_AUGMENT");
    int nValidItemType = FALSE;
    int nIsArmor = FALSE;
    int nIsBlaster = FALSE;
    int nIsMelee = FALSE;
    int nBonusAB = 0;
    int nBonusDamage = 0;
    int nBonusDR = 0;
    int nDamageType;

    SendDebugMessage(oPC, "ITEM AUGMENTATION:: Item = " + GetName(oItem) + ", Augment = " + GetName(oAugment));

    if (nHasAugment)
    {
        SendMessageToPC(oPC, sRedText + "*" + GetName(oItem) + " has already been augmented*");
        return;
    }

    switch (nItemType)
    {
        case BASE_ITEM_ARMOR:
            {
                nValidItemType = TRUE;
                SendDebugMessage(oPC, "ITEM AUGMENTATION::Item Type ARMOR, setting valid item to TRUE");
                nIsArmor = TRUE;
                break;
            }
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_WHIP:
            {
                nValidItemType = TRUE;
                SendDebugMessage(oPC, "ITEM AUGMENTATION::Item Type MELEE, setting valid item to TRUE");
                nIsMelee = TRUE;
                nDamageType = IP_CONST_DAMAGETYPE_SONIC;
                break;
            }
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SLING:
            {
                nValidItemType = TRUE;
                SendDebugMessage(oPC, "ITEM AUGMENTATION::Item Type BLASTER, setting valid item to TRUE");
                nIsBlaster = TRUE;
                nDamageType = IP_CONST_DAMAGETYPE_FIRE;
                break;
            }
    }

    if (!nValidItemType)
    {
        SendMessageToPC(oPC, sRedText + "*" + GetName(oAugment) + " cannot be installed on " + GetName(oItem) + "*");
        return;
    }

    if (GetItemPossessor(oItem) != oPC)
    {
        SendMessageToPC(oPC, sRedText + "*You can only install augments on items in your possession*");
    }
    else
    {
        if (nIsBlaster && GetTag(oAugment) == "augment_blaster")
        {
            nBonusAB = GetLocalInt(oAugment, "ATTACK_BONUS");
            SendDebugMessage(oPC, "ITEM AUGMENTATION::variable found setting BonusAB to " + IntToString(nBonusAB));
            nBonusDamage = GetLocalInt(oAugment, "DAMAGE_BONUS");
            SendDebugMessage(oPC, "ITEM AUGMENTATION::variable found setting BonusDamage to " + IntToString(nBonusDamage));
        }
        else if (nIsMelee && GetTag(oAugment) == "augment_melee")
        {
            nBonusAB = GetLocalInt(oAugment, "ATTACK_BONUS");
            SendDebugMessage(oPC, "ITEM AUGMENTATION::variable found setting BonusAB to " + IntToString(nBonusAB));
            nBonusDamage = GetLocalInt(oAugment, "DAMAGE_BONUS");
            SendDebugMessage(oPC, "ITEM AUGMENTATION::variable found setting BonusDamage to " + IntToString(nBonusDamage));
        }
        else if (nIsArmor && GetTag(oAugment) == "augment_armor")
        {
            nBonusDR = GetLocalInt(oAugment, "DAMAGE_RESIST");
            SendDebugMessage(oPC, "ITEM AUGMENTATION::variable found setting DamageReduction to " + IntToString(nBonusDR));
        }
        else
        {
            SendMessageToPC(oPC, sRedText + "*" + GetName(oAugment) + " cannot be installed on " + GetName(oItem) + "*");
            return;
        }

        if (nBonusAB > 0)
        {
            SendDebugMessage(oPC, "ITEM AUGMENTATION::Calling QX_SocketAttackBonusGem()");
            QX_SocketAttackBonusGem(nBonusAB, oAugment, oItem, oPC);
        }
        if (nBonusDamage > 0)
        {
            SendDebugMessage(oPC, "ITEM AUGMENTATION::Calling QX_SocketDamageBonusGem()");
            QX_SocketDamageBonusGem(nBonusDamage, oAugment, oItem, oPC, nDamageType);
        }
        if (nBonusDR > 0)
        {
            int nEnhance, nSoak;
            switch (nBonusDR)
            {
                case 1: nEnhance = IP_CONST_DAMAGEREDUCTION_3; nSoak = IP_CONST_DAMAGESOAK_5_HP; break;
                case 2: nEnhance = IP_CONST_DAMAGEREDUCTION_6; nSoak = IP_CONST_DAMAGESOAK_5_HP; break;
                case 3: nEnhance = IP_CONST_DAMAGEREDUCTION_9; nSoak = IP_CONST_DAMAGESOAK_5_HP; break;
                case 4: nEnhance = IP_CONST_DAMAGEREDUCTION_9; nSoak = IP_CONST_DAMAGESOAK_10_HP; break;
                default: return;
            }
            SendDebugMessage(oPC, "ITEM AUGMENTATION::Calling QX_SocketDamageReductionGem()");
            QX_SocketDamageReductionGem(nEnhance, nSoak, oAugment, oItem, oPC);
        }
    }
}
