void main()
{
object oPC = GetPCSpeaker();
string sTag, sLevel, sFaction;
string sChoice = GetLocalString(GetPCSpeaker(), "EAR_CHOICE");
object oItem = GetLocalObject(oPC, "EAR_TRADE_"+sChoice);
int nGold, nDifference; float fXP, fPenalty;

if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
    {
    sFaction = "Rebels";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
    {
    sFaction = "Empire";
    }

if (GetIsObjectValid(oItem) == TRUE)
    {
    sTag = GetTag(oItem);
    sLevel = GetStringRight(sTag, 2);
    nGold = StringToInt(sLevel)*300;
    fXP = StringToInt(sLevel)*(StringToInt(sLevel)-1)*500*0.02;
    nDifference = GetHitDice(oPC) - StringToInt(sLevel);
    if (nDifference > 9) {fPenalty = 1.0;}
    else if ( nDifference < 1) { fPenalty = 0.0;}
    else {fPenalty = nDifference * 0.1;}
    fXP = fXP - fXP*fPenalty;
    GiveGoldToCreature(oPC, nGold);
    GiveXPToCreature(oPC, FloatToInt(fXP));
    DestroyObject(oItem);
    int nPoints = GetCampaignInt("swpcpoints", "POINTS_"+sFaction);
    SetCampaignInt("swpcpoints", "POINTS_"+sFaction, nPoints + StringToInt(sLevel));
    SetCampaignInt("swpcpoints", "PC_POINTS_KILL", GetCampaignInt("swpcpoints", "PC_POINTS_KILL", oPC)+ StringToInt(sLevel), oPC);
    SetCampaignInt("swpcpoints", "PC_POINTS", GetCampaignInt("swpcpoints", "PC_POINTS", oPC)+ StringToInt(sLevel), oPC);
    SetCampaignInt("swpcpoints", "POINTS_KILL_"+sFaction, GetCampaignInt("swpcpoints", "POINTS_KILL_"+sFaction)+ StringToInt(sLevel));
    }

}
