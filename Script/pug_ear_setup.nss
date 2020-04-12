void main()
{
object oPC = GetPCSpeaker();
string sFaction, sEnemy, sTag, sLevel;
object oItem = GetFirstItemInInventory(oPC);
int x=1; int nGold, nDifference; float fXP, fPenalty;

DeleteLocalObject(oPC, "EAR_TRADE_1");
DeleteLocalObject(oPC, "EAR_TRADE_2");
DeleteLocalObject(oPC, "EAR_TRADE_3");
DeleteLocalObject(oPC, "EAR_TRADE_4");
DeleteLocalObject(oPC, "EAR_TRADE_5");
DeleteLocalObject(oPC, "EAR_TRADE_6");
DeleteLocalObject(oPC, "EAR_TRADE_7");
DeleteLocalObject(oPC, "EAR_TRADE_8");
DeleteLocalObject(oPC, "EAR_TRADE_9");
DeleteLocalObject(oPC, "EAR_TRADE_10");

if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
    {
    sFaction = "Rebels";
    sEnemy = "Empire";
    }
else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
    {
    sFaction = "Empire";
    sEnemy = "Rebels";
    }

while (GetIsObjectValid(oItem) == TRUE)
    {
    sTag = GetTag(oItem);

    if ( GetStringLeft(sTag, 10) == "ear_"+sEnemy)
        {
        sLevel = GetStringRight(sTag, 2);
        nGold = StringToInt(sLevel)*300;
        fXP = StringToInt(sLevel)*(StringToInt(sLevel)-1)*500*0.02;
        nDifference = GetHitDice(oPC) - StringToInt(sLevel);
        if (nDifference > 9) {fPenalty = 1.0;}
        else if ( nDifference < 1) { fPenalty = 0.0;}
        else {fPenalty = nDifference * 0.1;}
        fXP = fXP - fXP*fPenalty;
        SetCustomToken(899169+x, "I'd like to collect a bounty on "+GetName(oItem));
        SetCustomToken(899179+x, "I will give you "+IntToString(nGold)+" credits and "+IntToString(FloatToInt(fXP))+" XP");
        SetLocalObject(oPC, "EAR_TRADE_"+IntToString(x), oItem);
        x=x+1;
        }
    oItem = GetNextItemInInventory(oPC);
    }

//"ear_"+sFaction2+"_"+IntToString(nLevel)

}

