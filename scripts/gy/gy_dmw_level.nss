void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
    int nHD = GetHitDice(oTarget);
    int nCurrentXP = GetXP(oTarget);
    int nCount,nNeededXP;
    for (nCount =1; nCount<(nHD+1);nCount++)
    {
        nNeededXP= nNeededXP +1000*nCount;
    }
    nNeededXP = nNeededXP-nCurrentXP;
    GiveXPToCreature(oTarget,nNeededXP);
}
