void main()
{
object oPC = GetLastUsedBy();
int nCount=1;
object oShop = GetObjectByTag("cmrc_001");
string sNum;

while (GetIsObjectValid(oShop) == TRUE)
    {
    if (nCount < 10)
        {
        sNum = "00"+IntToString(nCount);
        }
    else if (nCount >= 10 && nCount <100)
        {
        sNum = "0"+IntToString(nCount);
        }
    else if (nCount >= 100)
        {
        sNum = IntToString(nCount);
        }
    oShop = GetObjectByTag("cmrc_"+sNum);
    if (GetIsObjectValid(oShop) == TRUE)
        {
        SendMessageToPC(oPC, "Shop "+IntToString(nCount)+": "+GetName(GetArea(oShop))+" ("+GetCampaignString("cmrcgld", "OWNER_"+GetTag(oShop))+")");
        }
    nCount = nCount+1;
    }
}
