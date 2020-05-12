//::///////////////////////////////////////////////
//:: FileName pug_trade_qual1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/05/2008 4:10:02 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    string sGood, sSupplyName; int nQuality;
    object oPC = GetPCSpeaker();
    object oPlanet = GetLocalObject(oPC, "COM_PLANET");

    sGood = GetLocalString(oPlanet, "TRADE_DEMAND_TYPE");

    // Inspect local variables
    if(!(GetCampaignInt("SWTrading", "TRADE_"+sGood+"_10", GetPCSpeaker()) > 0))
        return FALSE;

    return TRUE;
}
