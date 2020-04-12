#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(oPC, "COM_PLANET");
int nAmount = GetLocalInt(oPC, "TRADE_COUNTER");
string sGood, sSupplyName; int nSupply, nQuality, nCost;

    sGood = GetLocalString(oPlanet, "TRADE_SUPPLY_TYPE");
    nSupply = GetLocalInt(oPlanet, "TRADE_SUPPLY_AMOUNT");
    nQuality = GetLocalInt(oPlanet, "TRADE_SUPPLY_QUALITY");
    int nHas = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_"+IntToString(nQuality), oPC);
    int nCargo = GetCampaignInt("SWTrading", "CARGO", oPC);
   //nCost = nAmount*50*nQuality*(1+((nDemand+1-nAmount)/100));
    float fSupply = 1+ (nSupply/100.0);
    float fCost=0.0; float x = IntToFloat(nAmount);
    while (x > 0.0)
        {
        fCost = fCost+50*IntToFloat(nQuality)*(fSupply+((x-1)/100));
        x=x-1.0;
        }
    nCost = FloatToInt(fCost);

if (GetGold(oPC) >= nCost && nCost > 0 && nCargo+nAmount < 51)
    {
    TakeGoldFromCreature(nCost, oPC, TRUE);
    SetLocalInt(oPlanet, "TRADE_SUPPLY_AMOUNT", nSupply + nAmount);
    SetCampaignInt("SWTrading", "TRADE_"+sGood+"_"+IntToString(nQuality), nHas+nAmount, oPC);
    SendMessageToPC(oPC, "You have purchased "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));
    SetCampaignInt("SWTrading", "CARGO", nCargo+nAmount, oPC);
    }
else if (nCargo+nAmount > 50)
    {
    SendMessageToPC(oPC, "Your ship can only hold 50 units of cargo.");
    SetLocalInt(oPC, "TRADE_COUNTER", 1);
    }
else
    {
    SendMessageToPC(oPC, "You do not have enough credits to make this purchase");
    SetLocalInt(oPC, "TRADE_COUNTER", 1);
    }
SetCustomToken(123611, "It will cost "+IntToString(nCost)+" credits to buy "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));

}
