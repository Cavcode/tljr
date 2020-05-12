#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();
object oPlanet = GetLocalObject(oPC, "COM_PLANET");
int nStart = GetLocalInt(oPlanet, "TRADE_START");
string sSupply, sDemand, sSupplyName, sDemandName; int nSupply, nSupplyQuality, nDemand, nDemandQuality;

if (nStart == TRUE)
    {
    sSupply = GetLocalString(oPlanet, "TRADE_SUPPLY_TYPE");
    nSupply = GetLocalInt(oPlanet, "TRADE_SUPPLY_AMOUNT");
    nSupplyQuality = GetLocalInt(oPlanet, "TRADE_SUPPLY_QUALITY");
    sDemand = GetLocalString(oPlanet, "TRADE_DEMAND_TYPE");
    nDemand = GetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT");
    //nDemandQuality = GetLocalInt(oPlanet, "TRADE_DEMAND_QUALITY");
    }
else
    {
    int x = Random(5);
    if (x == 0){sSupply = "Food";}
    else if (x == 1){sSupply = "Water";}
    else if (x == 2){sSupply = "Ammunition";}
    else if (x == 3){sSupply = "Weaponry";}
    else if (x == 4){sSupply = "Armor";}

    int y = Random(5);
    while (x==y){y = Random(5);}
    if (y == 0){sDemand = "Food";}
    else if (y == 1){sDemand = "Water";}
    else if (y == 2){sDemand = "Ammunition";}
    else if (y == 3){sDemand = "Weaponry";}
    else if (y == 4){sDemand = "Armor";}

    x = Random(8);
    if (x == 0){nSupplyQuality = 20;}
    else if (x == 1){nSupplyQuality = x;}
    else if (x == 2){nSupplyQuality = x;}
    else if (x == 3){nSupplyQuality = x;}
    else if (x == 4){nSupplyQuality = x;}
    else if (x == 5){nSupplyQuality = 10;}
    else if (x == 6){nSupplyQuality = x;}
    else if (x == 7){nSupplyQuality = 12;}

    nSupply = d6(4)*(-1);
    nDemand = d3(8);

    SetLocalInt(oPlanet, "TRADE_SUPPLY_AMOUNT", nSupply);
    SetLocalInt(oPlanet, "TRADE_DEMAND_AMOUNT", nDemand);
    SetLocalString(oPlanet, "TRADE_SUPPLY_TYPE", sSupply);
    SetLocalInt(oPlanet, "TRADE_SUPPLY_QUALITY", nSupplyQuality);
    SetLocalString(oPlanet, "TRADE_DEMAND_TYPE", sDemand);
    SetLocalInt(oPlanet, "TRADE_DEMAND_QUALITY", nDemandQuality);


    SetLocalInt(oPlanet, "TRADE_START", TRUE);
    }
float fDemand = 1+ (nDemand/100.0);
float fSupply = 1+ (nSupply/100.0);

sSupplyName = CommodityName(sSupply, nSupplyQuality);
sDemandName = CommodityName(sDemand, nDemandQuality);
SetCustomToken(123614, GetName(oPlanet)+" is currently buying all types of "+sDemand+" and is selling "+sSupply+":"+sSupplyName+" for "+IntToString(FloatToInt(50.0*nSupplyQuality*fSupply))+" credits per unit" );
SetLocalInt(oPC, "TRADE_COUNTER", 1);

}
