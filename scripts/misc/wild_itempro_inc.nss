//::///////////////////////////////////////////////
//:: Item Property Functions Enhanced
//:: call to "x2_inc_itemprop" included
//:: Copyright (c) 2003 Bioware Corp. for "x2_inc_itemprop"
//:://////////////////////////////////////////////
/*

    Holds item property and item modification
    specific code.

    If you look for anything specific to item
    properties, your chances are good to find it
    in here.

    + 1 fonction made in Nono

*/

#include "x2_inc_itemprop"

//:://////////////////////////////////////////////
//:: Created By: Olivier alias Xylou alias Nono
//:: Created On: 2006-08-16
//:: Last Update: 2006-08-16
//:://////////////////////////////////////////////

// *  Version Speciale de IPWildShapeCopyItemProperties pour les gants
// *  oOldArms - Objet dont seront pris les proprietes. Idealement des gants
// *  oCreature - Creature sur laquelle seront transferees les proprietes
// *  Si les proprietes sont d'attaque, elles seront mises sur les attaques a mains nues
// *  sinon elles seront transferes sur la peau
void IPWildShapeCopyItemPropertiesArms(object oOldArms, object oCreature);

// ----------------------------------------------------------------------------
// Version Speciale de IPWildShapeCopyItemProperties pour les gants
// oOldArms - Objet dont seront pris les proprietes. Idealement des gants
// oCreature - Creature sur laquelle seront transferees les proprietes
// Si les proprietes sont d'attaque, elles seront mises sur les attaques a mains nues
// sinon elles seront transferes sur la peau
// ----------------------------------------------------------------------------
void IPWildShapeCopyItemPropertiesArms(object oOldArms, object oCreature)
{
    if (GetIsObjectValid(oOldArms) && GetIsObjectValid(oCreature))
    {
        object oArmorNew = GetItemInSlot(INVENTORY_SLOT_CARMOUR,oCreature);
        object oLeftHandNew = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L,oCreature);
        object oRightHandNew = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R,oCreature);
        itemproperty ip = GetFirstItemProperty(oOldArms);
        while (GetIsItemPropertyValid(ip))
        {
            switch(GetItemPropertyType(ip)) {

                case ITEM_PROPERTY_ATTACK_BONUS:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT:
                case ITEM_PROPERTY_DAMAGE_BONUS:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_DAMAGE_BONUS_VS_SPECIFIC_ALIGNMENT:
                case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:
                case ITEM_PROPERTY_DECREASED_DAMAGE:
                case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP:
                case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT:
                case ITEM_PROPERTY_EXTRA_MELEE_DAMAGE_TYPE:
                case ITEM_PROPERTY_KEEN:
                case ITEM_PROPERTY_MASSIVE_CRITICALS:
                case ITEM_PROPERTY_MONSTER_DAMAGE:
                case ITEM_PROPERTY_NO_DAMAGE:
                case ITEM_PROPERTY_ON_HIT_PROPERTIES:
                case ITEM_PROPERTY_ON_MONSTER_HIT:
                case ITEM_PROPERTY_ONHITCASTSPELL:
                case ITEM_PROPERTY_POISON:
                case ITEM_PROPERTY_REGENERATION_VAMPIRIC:
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oLeftHandNew);
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oRightHandNew);
                    break;


                default:
                    AddItemProperty(DURATION_TYPE_PERMANENT,ip,oArmorNew);
                    break;
            }
            ip = GetNextItemProperty(oOldArms);

        }
    }
}
