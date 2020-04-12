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
    float fSupply = 1+ (nSupply/100.0);
    float fCost=0.0; float x = IntToFloat(nAmount);
    while (x > 0.0)
        {
        fCost = fCost+50*IntToFloat(nQuality)*(fSupply+((1-x)/100));
        x=x-1.0;
        }
    nCost = FloatToInt(fCost);

SetCustomToken(123611, "It will cost "+IntToString(nCost)+" credits to buy "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));
}
