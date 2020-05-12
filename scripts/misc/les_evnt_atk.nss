#include "nwnx_events"
#include "qx_inc_lightsbr"
#include "fky_chat_instant"
#include "nwnx_creature"
#include "qx_ship_stat_fnc"
#include "nwnx_object"

void main()
{
    object oPC = OBJECT_SELF;
    object  oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("TARGET"));
    WriteTimestampedLogEntry(GetName(oPC)+" attacked "+GetName(oTarget));
    //FloatingTextStringOnCreature("Attacking "+GetName(oTarget), oPC, FALSE);
    int bIsShip = GetLocalInt(oPC, "PILOTING_SHIP");

    if(bIsShip)
    {
        NWNX_Events_SkipEvent();
    }
    else
    {
        object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        if (!GetLightsaberIgnited(oItem))
        {
        NWNX_Events_SkipEvent();
        DelayCommand(0.2,Ignite(oItem, oPC, TRUE, TRUE));
        DelayCommand(0.6,AssignCommand(oPC,ActionAttack(oTarget)));
        }
        //if ((GetBaseItemType(oItem) == BASE_ITEM_HEAVYCROSSBOW) || (GetBaseItemType(oItem) == BASE_ITEM_LIGHTCROSSBOW))
        //{
        //    DelayCommand(0.1,AssignCommand(oPC,ClearAllActions(TRUE)));
        //    DelayCommand(0.2,AssignCommand(oPC,ActionAttack(oTarget)));
        //    BypassEvent();
        //}
     }

}
