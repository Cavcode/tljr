#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(oPC, "COM_PLANET");
int nAmount = GetLocalInt(oPC, "TRADE_COUNTER");
string sGood; int nDemand, nQuality, nCost;

    sGood = GetLocalString(oPlanet, "TRADE_DEMAND_TYPE");
    nDemand = GetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT");
    nQuality = GetLocalInt(oPC, "TRADE_DEMAND_QUALITY");
    int nHas = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_"+IntToString(nQuality), oPC);
    int nCargo = GetCampaignInt("SWTrading", "CARGO", oPC);

    float fDemand = 1+ (nDemand/100.0);
    float fCost=0.0; float x = IntToFloat(nAmount);
    while (x > 0.0)
        {
        fCost = fCost+50*IntToFloat(nQuality)*(fDemand+((1-x)/100));
        x=x-1;
        }
    nCost = FloatToInt(fCost);

if (nHas >= nAmount)
    {
    GiveGoldToCreature(oPC, nCost);
    SetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT", nDemand - nAmount);
    SetCampaignInt("SWTrading", "TRADE_"+sGood+"_"+IntToString(nQuality), nHas-nAmount, oPC);
    SendMessageToPC(oPC, "You have sold "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));

    if (nCargo-nAmount <0)
        {SetCampaignInt("SWTrading", "CARGO", 0, oPC);}
    else
        {SetCampaignInt("SWTrading", "CARGO", nCargo-nAmount, oPC);}
    }
else
    {
    SendMessageToPC(oPC, "You do not have enough "+CommodityName(sGood, nQuality)+" to make this sale");
    SetLocalInt(oPC, "TRADE_COUNTER", 1);
    }
SetCustomToken(123615, "You will receive "+IntToString(nCost)+" credits for selling "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));
}
