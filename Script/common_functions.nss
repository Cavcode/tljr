#include "wild_itempro_inc"
#include "x2_inc_shifter"
#include "nw_i0_spells"
#include "x2_i0_spells"

const string SOUND_DESACTIVATED = "SOUND_DESACTIVATED";

//void main(){}

void UnPolymorph(object oPC);
int IsPolymorph(object oPC);
void Polymorph(object oPC, int nPoly, int nSubType=SUBTYPE_SUPERNATURAL,int nDurationType=DURATION_TYPE_PERMANENT, float fDuration = 0.0, int nSpell=SPELL_SHAPECHANGE, int bFear = FALSE, int nSpeedBonus = 0);
int GetPolymorphSpellId(object oPC);
void ClearInventory(object oTarget,int bPutToGround=FALSE);
int GetRealLevel(object oPC);
int GetLevelFromXP(int nXP);
int GetLevel(object oPC);
int CanLoseXP(object oPC,int nXPToLose);
int XPForLevel(int nLevel);
void XPLvlUp(object oPC);
void XPLvlDown(object oPC);
void PlaySoundOnLocation(location lTarget, string sSoundName);
void CheckAndPlaySound(string sSoundName);
int GetArmorType(object oItem);
void AddForceEffectToWeapon(object oTarget, float fDuration, int nCasterLvl);

void AddForceEffectToWeapon(object oTarget, float fDuration, int nCasterLvl)
{
   // If the spell is cast again, any previous itemproperties matching are removed.
   IPSafeAddItemProperty(oTarget, ItemPropertyOnHitCastSpell(127,nCasterLvl), fDuration, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING);
   IPSafeAddItemProperty(oTarget, ItemPropertyAttackBonus(nCasterLvl), fDuration, X2_IP_ADDPROP_POLICY_REPLACE_EXISTING);
   IPSafeAddItemProperty(oTarget, ItemPropertyVisualEffect(ITEM_VISUAL_HOLY), fDuration,X2_IP_ADDPROP_POLICY_REPLACE_EXISTING,FALSE,TRUE);
   return;
}

void UnPolymorph(object oPC) {

    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect)) {
        if(GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH) {
            RemoveEffect(oPC,eEffect);
            return;
        }
        eEffect = GetNextEffect(oPC);
    }
}

int IsPolymorph(object oPC) {
    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect)) {
        if(GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH) {
            return TRUE;
        }
        eEffect = GetNextEffect(oPC);
    }
    return FALSE;
}

void Polymorph(object oPC, int nPoly, int nSubType=SUBTYPE_SUPERNATURAL,int nDurationType=DURATION_TYPE_PERMANENT, float fDuration = 0.0, int nSpell=SPELL_SHAPECHANGE, int bFear = FALSE, int nSpeedBonus = 0) {
    effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
    effect ePoly;

    //--------------------------------------------------------------------------
    // Determine which items get their item properties merged onto the shifters
    // new form.
    //--------------------------------------------------------------------------
    int bWeapon = ShifterMergeWeapon(nPoly);
    int bArmor  = ShifterMergeArmor(nPoly);
    int bItems  = ShifterMergeItems(nPoly);

    //--------------------------------------------------------------------------
    // Store the old objects so we can access them after the character has
    // changed into his new form
    //--------------------------------------------------------------------------
    object oWeaponOld = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    object oArmorOld  = GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);
    object oRing1Old  = GetItemInSlot(INVENTORY_SLOT_LEFTRING,oPC);
    object oRing2Old  = GetItemInSlot(INVENTORY_SLOT_RIGHTRING,oPC);
    object oAmuletOld = GetItemInSlot(INVENTORY_SLOT_NECK,oPC);
    object oCloakOld  = GetItemInSlot(INVENTORY_SLOT_CLOAK,oPC);
    object oBootsOld  = GetItemInSlot(INVENTORY_SLOT_BOOTS,oPC);
    object oBeltOld   = GetItemInSlot(INVENTORY_SLOT_BELT,oPC);
    object oHelmetOld = GetItemInSlot(INVENTORY_SLOT_HEAD,oPC);
    object oShield    = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
    object oArmsOld   = GetItemInSlot(INVENTORY_SLOT_ARMS,oPC);

    if (GetIsObjectValid(oShield))
    {
        if (GetBaseItemType(oShield) !=BASE_ITEM_LARGESHIELD &&
            GetBaseItemType(oShield) !=BASE_ITEM_SMALLSHIELD &&
            GetBaseItemType(oShield) !=BASE_ITEM_TOWERSHIELD)
        {
            oShield = OBJECT_INVALID;
        }
    }


    //--------------------------------------------------------------------------
    // Here the actual polymorphing is done
    //--------------------------------------------------------------------------
    ePoly = EffectPolymorph(nPoly);
    if(bFear) {
        effect eFearAOE = EffectAreaOfEffect(36,"metamo_aoe_fear");
        ePoly = EffectLinkEffects(ePoly,eFearAOE);
    }
    if(nSpeedBonus > 0) {
        effect eMovementIncrease = EffectMovementSpeedIncrease(nSpeedBonus);
        ePoly = EffectLinkEffects(ePoly,eMovementIncrease);
    }
    if(nSpeedBonus < 0) {
        effect eMovementDecrease = EffectMovementSpeedDecrease(nSpeedBonus);
        ePoly = EffectLinkEffects(ePoly,eMovementDecrease);
    }
    switch(nSubType) {
        case SUBTYPE_MAGICAL : ePoly = MagicalEffect(ePoly); break;
        case SUBTYPE_EXTRAORDINARY : ePoly = ExtraordinaryEffect(ePoly); break;
        case SUBTYPE_SUPERNATURAL : ePoly = SupernaturalEffect(ePoly); break;
    }
    ClearAllActions(); // prevents an exploit
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    if(nDurationType == DURATION_TYPE_TEMPORARY) {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ePoly, oPC, fDuration);
    } else {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePoly, oPC);
    }

    //--------------------------------------------------------------------------
    // This code handles the merging of item properties
    //--------------------------------------------------------------------------
    object oWeaponNew = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    object oArmorNew = GetItemInSlot(INVENTORY_SLOT_CARMOUR,oPC);

    //identify weapon
    SetIdentified(oWeaponNew, TRUE);

    //--------------------------------------------------------------------------
    // ...Weapons
    //--------------------------------------------------------------------------
    if (bWeapon)
    {
        IPWildShapeCopyItemProperties(oWeaponOld,oWeaponNew, TRUE);
    }

    //--------------------------------------------------------------------------
    // ...Armor
    //--------------------------------------------------------------------------
    if (bArmor)
    {
        //----------------------------------------------------------------------
        // Merge item properties from armor and helmet...
        //----------------------------------------------------------------------
        IPWildShapeCopyItemProperties(oArmorOld,oArmorNew);
        IPWildShapeCopyItemProperties(oHelmetOld,oArmorNew);
        IPWildShapeCopyItemProperties(oShield,oArmorNew);
    }

    //--------------------------------------------------------------------------
    // ...Magic Items
    //--------------------------------------------------------------------------
    if (bItems)
    {
        //----------------------------------------------------------------------
        // Merge item properties from from rings, amulets, cloak, boots, belt
        //----------------------------------------------------------------------
        IPWildShapeCopyItemProperties(oRing1Old,oArmorNew);
        IPWildShapeCopyItemProperties(oRing2Old,oArmorNew);
        IPWildShapeCopyItemProperties(oAmuletOld,oArmorNew);
        IPWildShapeCopyItemProperties(oCloakOld,oArmorNew);
        IPWildShapeCopyItemProperties(oBootsOld,oArmorNew);
        IPWildShapeCopyItemProperties(oBeltOld,oArmorNew);
        IPWildShapeCopyItemPropertiesArms(oArmsOld,oPC);
    }
    //Fire cast spell at event for the specified target
    SignalEvent(oPC, EventSpellCastAt(oPC, GetSpellId(), FALSE));

}

int GetPolymorphSpellId(object oPC) {
    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect)) {
        if(GetEffectType(eEffect) == EFFECT_TYPE_POLYMORPH) {
            return GetEffectSpellId(eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    return -1;
}


void ClearInventory(object oTarget,int bPutToGround=FALSE) {

    object oItem = GetFirstItemInInventory(oTarget);
    int i;
    while(GetIsObjectValid(oItem)) {
        if(bPutToGround && GetDroppableFlag(oItem)) {
            CopyObject(oItem,GetLocation(oTarget));
        }
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oTarget);
    }
    for(i=0;i<=17;i++) {
        switch(i) {
            case INVENTORY_SLOT_CARMOUR:
            case INVENTORY_SLOT_CWEAPON_B:
            case INVENTORY_SLOT_CWEAPON_L:
            case INVENTORY_SLOT_CWEAPON_R:break;
            default:
                oItem = GetItemInSlot(i,oTarget);
                if(bPutToGround && GetDroppableFlag(oItem)) {
                    CopyObject(oItem,GetLocation(oTarget));
                }
                DestroyObject(oItem);
                break;
        }
    }
}

int GetRealLevel(object oPC) {
    int nXP = GetXP(oPC);
    return GetLevelFromXP(nXP);
}

int GetLevelFromXP(int nXP) {
    int nLevel = 1;
    int i=1;
    while(i * 1000 <= nXP) {
        nXP -= i * 1000;
        nLevel++;
        i++;
    }
    return nLevel;
}

int GetLevel(object oPC) {
    return GetLevelByPosition(1,oPC) + GetLevelByPosition(2,oPC) + GetLevelByPosition(3,oPC);
}


int CanLoseXP(object oPC,int nXPToLose) {
    int nXP = GetXP(oPC) - nXPToLose;
    if(GetLevelFromXP(nXP) >= GetLevel(oPC)) {
        return TRUE;
     } else {
        return FALSE;
     }
}

int XPForLevel(int nLevel) {
    return ((nLevel * (nLevel-1)) / 2) * 1000;
}

void XPLvlUp(object oPC) {
    if(GetIsObjectValid(oPC)) {
        int nLevel = GetRealLevel(oPC);
        int nXPCurrentLevel = XPForLevel(nLevel);
        int nXPNextLevel = XPForLevel(nLevel+1);
        if(nXPCurrentLevel < nXPNextLevel) {
            SetXP(oPC,nXPNextLevel);
        }
    }
}

void XPLvlDown(object oPC) {
    if(GetIsObjectValid(oPC)) {
        int nLevel = GetRealLevel(oPC);
        int nXPCurrentLevel = XPForLevel(nLevel);
        int nXPPreviousLevel = XPForLevel(nLevel-1);
        if(nXPCurrentLevel > nXPPreviousLevel) {
            SetXP(oPC,nXPPreviousLevel);
        }
    }
}

void PlaySoundOnLocation(location lTarget, string sSoundName) {
    if(GetLocalInt(GetModule(),SOUND_DESACTIVATED) != 1) {
        SendMessageToPC(GetFirstPC(),"son lance : "+sSoundName);
        object oMusicMan = CreateObject(OBJECT_TYPE_CREATURE,"musicman",lTarget);
        effect eInvisibility = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eInvisibility,oMusicMan);
        DelayCommand(0.2,AssignCommand(oMusicMan,CheckAndPlaySound(sSoundName)));
        DestroyObject(oMusicMan,0.5);
    }
}

void CheckAndPlaySound(string sSoundName) {
    if(GetLocalInt(GetModule(),SOUND_DESACTIVATED) != 1) {
        PlaySound(sSoundName);
    }
}

int GetArmorType(object oItem)
{
    // Make sure the item is valid and is an armor.
    if (!GetIsObjectValid(oItem))
        return -1;
    if (GetBaseItemType(oItem) != BASE_ITEM_ARMOR)
        return -1;

    // Get the identified flag for safe keeping.
    int bIdentified = GetIdentified(oItem);
    SetIdentified(oItem,FALSE);

    int nType = -1;
    switch (GetGoldPieceValue(oItem))
    {
        case    1: nType = 0; break; // None
        case    5: nType = 1; break; // Padded
        case   10: nType = 2; break; // Leather
        case   15: nType = 3; break; // Studded Leather / Hide
        case  100: nType = 4; break; // Chain Shirt / Scale Mail
        case  150: nType = 5; break; // Chainmail / Breastplate
        case  200: nType = 6; break; // Splint Mail / Banded Mail
        case  600: nType = 7; break; // Half-Plate
        case 1500: nType = 8; break; // Full Plate
    }
    if (nType >= 7)
    {
        nType = 2;
    }
    else if (nType >= 4)
    {
        nType = 1;
    }
    else
    {
        nType = 0;
    }
    // Restore the identified flag, and return armor type.
    SetIdentified(oItem,bIdentified);
    return nType;
}



// void main() {}
