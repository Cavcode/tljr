#include "pug_inc"
void main()
{
int nChoice = GetLocalInt(GetPCSpeaker(), "CONVO_CHOICE")-1;
object oTrader = GetLocalObject(GetPCSpeaker(), "CMRC_VIEW_PERSON");
object oPC = GetPCSpeaker();
int nRank = GetCampaignInt("cmrcgld", "CMRC_RANK", oTrader);
int nPCRank = GetCampaignInt("cmrcgld", "CMRC_RANK", oPC);
string sTitle, sOld;

if (nChoice == 0){sTitle = "TRADER";}
else if (nChoice == 1){sTitle = "MERCH";}
else if (nChoice == 2){sTitle = "PROP";}
else if (nChoice == 3){sTitle = "EXEC";}
if (nChoice == 0){sOld = "TRADER";}
else if (nChoice == 1){sOld = "MERCH";}
else if (nChoice == 2){sOld = "PROP";}
else if (nChoice == 3){sOld = "EXEC";}

if (nPCRank > 2 && nRank < nPCRank)
    {
    SetCampaignInt("cmrcgld", "CMRC_RANK", nChoice,oTrader);
    CommerceGuildRemoveFromListByRank(oTrader, sOld);
    CommerceGuildAddToListByRank(oTrader, sTitle);
    FloatingTextStringOnCreature(GetName(oTrader)+"'s rank has been set to "+IntToString(nChoice), oPC, FALSE);
    FloatingTextStringOnCreature("Your Commerce Guild rank has been set to "+IntToString(nChoice), oTrader, FALSE);
    }
else {FloatingTextStringOnCreature("You are unable to do that", oPC, FALSE);}
}
