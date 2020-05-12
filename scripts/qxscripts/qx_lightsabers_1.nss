//::///////////////////////////////////////////////
//:: Actuvate Item Script
//:: NW_S3_ActItem01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This fires the event on the module that allows
    for items to have special powers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Dec 19, 2001
//
//:: Modified by Quixsilver for RotR Lightsabers
//:://////////////////////////////////////////////

#include "qx_inc_lightsbr"


void main()
{
    object oItem = GetSpellCastItem();
    object oPC = GetSpellTargetObject();
    location lLocal = GetSpellTargetLocation();

    //SendMessageToPC(oPC, "Lightsaber Item's tag is: " + GetTag(oItem));

    if (oItem == GetItemInSlot(INVENTORY_SLOT_RIGHTHAND))
    {

        if (GetLightsaberIgnited(oItem) && !GetLocalInt(oItem, "UNIGNITING"))
        {
            //SendMessageToPC(oPC, "Lightsaber un-ignited.");
            //UnIgnite(oItem, oPC, TRUE, TRUE, GetLightsaberSlot(oItem, oPC));
            UnIgnite(oItem, oPC, TRUE, TRUE);
        }
        else
        {
            //SendMessageToPC(oPC, "Lightsaber ignited.");
            //Ignite(oItem, oPC, TRUE, TRUE, GetLightsaberSlot(oItem, oPC));
            Ignite(oItem, oPC, TRUE, TRUE);
        }
    }
    else
    {
        SendMessageToPC(oPC,"You may only ignite/unignite a lightsaber equipped in the righthand."
                            + " If 2 lightsabers are equipped, igniting/unigniting the righthand will also ignite/unignite the left.");
    }
    //SignalEvent(GetModule(), EventActivateItem(oItem, lLocal, oTarget));
    //SignalEvent(GetModule(), EventActivateItem(oItem, lLocal, oItem));
}


