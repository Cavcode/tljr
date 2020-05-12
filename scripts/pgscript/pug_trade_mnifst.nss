#include "pug_trade_inc"
void main()
{
object oPC = GetPCSpeaker();

SendMessageToPC(oPC, "CURRENT CARGO:");
int x, z, nSupplyQuality; string sSupply;
for (z = 0; z < (4+1); z++)
    {
    if (z == 0){sSupply = "Food";}
    else if (z == 1){sSupply = "Water";}
    else if (z == 2){sSupply = "Ammunition";}
    else if (z == 3){sSupply = "Weaponry";}
    else if (z == 4){sSupply = "Armor";}

    for (x = 0; x < (7+1); x++)
        {
        if (x == 0){nSupplyQuality = 20;}
        else if (x == 1){nSupplyQuality = x;}
        else if (x == 2){nSupplyQuality = x;}
        else if (x == 3){nSupplyQuality = x;}
        else if (x == 4){nSupplyQuality = x;}
        else if (x == 5){nSupplyQuality = 10;}
        else if (x == 6){nSupplyQuality = x;}
        else if (x == 7){nSupplyQuality = 12;}

        if (GetCampaignInt("SWTrading", "TRADE_"+sSupply+"_"+IntToString(nSupplyQuality), oPC) > 0 )
            {
            SendMessageToPC(oPC, CommodityName(sSupply, nSupplyQuality)+" : "+IntToString(GetCampaignInt("SWTrading", "TRADE_"+sSupply+"_"+IntToString(nSupplyQuality), oPC)) );
            }
        }
    }
}
