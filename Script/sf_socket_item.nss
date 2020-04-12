//::///////////////////////////////////////////////
//:: Scarface's Socketed Items Script
//:: V1.5
//:: sf_socket_item
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////

#include "sf_socket_inc"
#include "x2_inc_switches"
void main()
{
    // Check we have the correct event firing the script
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    // Vars
    object oPC = GetItemActivator(),
           oItem = GetItemActivated(),
           oTarget = GetItemActivatedTarget();
    string sGemType = GetLocalString(oTarget, "GEM_TYPE");

    // Check Sockets Left
    if (oTarget == oItem)
    {
        SF_GetSocketsLeft(oItem, oPC);
    }
    // Weapon Type Socketed Gems
    else if (GetItemPossessor(oTarget) != oPC)
    {
         FloatingTextStringOnCreature("You can only target items in your possession", oPC);
    }
    else if(sGemType == "")
    {
        FloatingTextStringOnCreature("This item can't be socketed", oPC);
    }
    else if (sGemType == "ATTACK_BONUS")
    {
        SF_SocketAttackBonusGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "ACID_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_ACID);
    }
    else if (sGemType == "BLUDGEONING_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_BLUDGEONING);
    }
    else if (sGemType == "COLD_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_COLD);
    }
    else if (sGemType == "DIVINE_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_DIVINE);
    }
    else if (sGemType == "ELECTIRCAL_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_ELECTRICAL);
    }
    else if (sGemType == "FIRE_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_FIRE);
    }
    else if (sGemType == "MAGICAL_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_MAGICAL);
    }
    else if (sGemType == "NEGATIVE_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_NEGATIVE);
    }
    else if (sGemType == "PIERCING_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_PIERCING);
    }
    else if (sGemType == "POSITIVE_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_POSITIVE);
    }
    else if (sGemType == "SLASHING_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_SLASHING);
    }
    else if (sGemType == "SONIC_DAMAGE_BONUS")
    {
        SF_SocketDamageBonusGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_SONIC);
    }
    else if (sGemType == "ENHANCEMENT_BONUS")
    {
        SF_SocketEnhancementBonusGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "KEEN")
    {
        SF_SocketKeenGem(oItem, oTarget, oPC);
    }
    // Armour Type Socketed Gems
    else if (sGemType == "AC_BONUS")
    {
        SF_SocketACBonusGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "ACID_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_ACID);
    }
    else if (sGemType == "BLUDGEONING_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_BLUDGEONING);
    }
    else if (sGemType == "COLD_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_COLD);
    }
    else if (sGemType == "DIVINE_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_DIVINE);
    }
    else if (sGemType == "ELECTRICAL_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_ELECTRICAL);
    }
    else if (sGemType == "FIRE_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_FIRE);
    }
    else if (sGemType == "MAGICAL_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_MAGICAL);
    }
    else if (sGemType == "NEGATIVE_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_NEGATIVE);
    }
    else if (sGemType == "PIERCING_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_PIERCING);
    }
    else if (sGemType == "POSITIVE_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_POSITIVE);
    }
    else if (sGemType == "SLASHING_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_SLASHING);
    }
    else if (sGemType == "SONIC_DAMAGE_RESISTANCE")
    {
        SF_SocketDamageResistGem(oItem, oTarget, oPC, IP_CONST_DAMAGETYPE_SONIC);
    }
    else if (sGemType == "HASTE")
    {
        SF_SocketHasteGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "FREEDOM")
    {
        SF_SocketFreedomGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "IMPROVED_EVASION")
    {
        SF_SocketImprovedEvasionGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "REGENERATION")
    {
        SF_SocketRegenerationGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "CHARISMA_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_CHARISMA);
    }
    else if (sGemType == "CONSTITUTION_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_CONSTITUTION);
    }
    else if (sGemType == "DEXTERITY_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_DEXTERITY);
    }
    else if (sGemType == "INTELLEGENCE_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_INTELLIGENCE);
    }
    else if (sGemType == "STRENGTH_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_STRENGTH);
    }
    else if (sGemType == "WISDOM_ABILITY_BONUS")
    {
        SF_SocketAbilityBonusGem(oItem, oTarget, oPC, ABILITY_WISDOM);
    }
    else if (sGemType == "TRUE_SEEING")
    {
        SF_SocketTrueSeeingGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "HOLY_AVENGER")
    {
        SF_SocketHolyAvengerGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "VAMPIRIC_REGENERATION")
    {
        SF_SocketVampiricRegenerationGem(oItem, oTarget, oPC);
    }
    else if (sGemType == "MASSIVE_CRITICAL")
    {
        SF_SocketMassiveCritsGem(oItem, oTarget, oPC);
    }
}
