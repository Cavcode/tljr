#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(oPC, "COM_PLANET");
string sGood; int nDemand, nQuality;

    sGood = GetLocalString(oPlanet, "TRADE_DEMAND_TYPE");
    nDemand = GetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT");
    float fDemand = 1+ (nDemand/100.0);

    int nCost1 = FloatToInt(50*1*fDemand);
    int nCost2 = FloatToInt(50*2*fDemand);
    int nCost3 = FloatToInt(50*3*fDemand);
    int nCost4 = FloatToInt(50*4*fDemand);
    int nCost6 = FloatToInt(50*6*fDemand);
    int nCost10 = FloatToInt(50*10*fDemand);
    int nCost12 = FloatToInt(50*12*fDemand);
    int nCost20 = FloatToInt(50*20*fDemand);
                                             // could have done a for loop in 3 lines, but didnt
int nGood1 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_1", oPC);
int nGood2 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_2", oPC);
int nGood3 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_3", oPC);
int nGood4 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_4", oPC);
int nGood6 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_6", oPC);
int nGood10 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_10", oPC);
int nGood12 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_12", oPC);
int nGood20 = GetCampaignInt("SWTrading", "TRADE_"+sGood+"_20", oPC);

SetCustomToken(123621, sGood+":"+CommodityName(sGood, 1)+" ("+IntToString(nGood1)+") selling for "+IntToString(nCost1)+" credits");
SetCustomToken(123622, sGood+":"+CommodityName(sGood, 2)+" ("+IntToString(nGood2)+") selling for "+IntToString(nCost2)+" credits");
SetCustomToken(123623, sGood+":"+CommodityName(sGood, 3)+" ("+IntToString(nGood3)+") selling for "+IntToString(nCost3)+" credits");
SetCustomToken(123624, sGood+":"+CommodityName(sGood, 4)+" ("+IntToString(nGood4)+") selling for "+IntToString(nCost4)+" credits");
SetCustomToken(123625, sGood+":"+CommodityName(sGood, 6)+" ("+IntToString(nGood6)+") selling for "+IntToString(nCost6)+" credits");
SetCustomToken(123626, sGood+":"+CommodityName(sGood, 10)+" ("+IntToString(nGood10)+") selling for "+IntToString(nCost10)+" credits");
SetCustomToken(123627, sGood+":"+CommodityName(sGood, 12)+" ("+IntToString(nGood12)+") selling for "+IntToString(nCost12)+" credits");
SetCustomToken(123628, sGood+":"+CommodityName(sGood, 20)+" ("+IntToString(nGood20)+") selling for "+IntToString(nCost20)+" credits");
}
