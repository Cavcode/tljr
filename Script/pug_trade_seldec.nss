#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(oPC, "COM_PLANET");
int nAmount = GetLocalInt(oPC, "TRADE_COUNTER");
if (nAmount > 1)
    {
    SetLocalInt(oPC, "TRADE_COUNTER", nAmount - 1);
    nAmount = nAmount -1;
    }

string sGood; int nDemand, nQuality, nCost;

    sGood = GetLocalString(oPlanet, "TRADE_DEMAND_TYPE");
    nDemand = GetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT");
    nQuality = GetLocalInt(oPC, "TRADE_DEMAND_QUALITY");
    float fDemand = 1+ (nDemand/100.0);
    float fCost=0.0; float x = IntToFloat(nAmount);
    while (x > 0.0)
        {
        fCost = fCost+50*IntToFloat(nQuality)*(fDemand+((1-x)/100));
        x=x-1.0;
        }
    nCost = FloatToInt(fCost);

SetCustomToken(123615, "You will receive "+IntToString(nCost)+" credits for selling "+IntToString(nAmount)+" "+sGood+":"+CommodityName(sGood, nQuality));

}
