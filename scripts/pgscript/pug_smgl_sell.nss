void main()
{
object oPC = GetPCSpeaker();
int nPrice, nItem, xSell, ySell, nXP;
object oItem = GetFirstItemInInventory(oPC);
int yBuy = GetLocalInt(OBJECT_SELF, "SMUGGLE_Y");
int xBuy = GetLocalInt(OBJECT_SELF, "SMUGGLE_X");
int nSmugs = GetLocalInt(GetPCSpeaker(), "SMUGGLE_COUNT");

    while (GetResRef(oItem)!="pug_spice" && GetIsObjectValid(oItem) == TRUE)
        {
        oItem = GetNextItemInInventory(oPC);
        }

if (GetIsObjectValid(oPC)==TRUE && GetStringLeft(GetTag(oItem), 6) == "spice_")
    {
    ySell = StringToInt(GetStringRight(GetTag(oItem), 1));
    xSell = StringToInt(GetStringLeft(GetStringRight(GetTag(oItem),3), 1));
    nItem = StringToInt(GetStringLeft(GetStringRight(GetTag(oItem),5), 1));
    nPrice = 350*(abs(xBuy - xSell) + abs(yBuy - ySell)-1)+100*nItem*nItem;
    nXP = 50*(abs(xBuy - xSell) + abs(yBuy - ySell))*nItem;
    DeleteLocalString(oPC, "SMUGGLE_BUYER");
    DeleteLocalString(oPC, "SMUGGLE_PLANET");
    DeleteLocalString(oPC, "SMUGGLE_GOOD");
    DeleteLocalInt(oPC, "SMUGGLE_ITEM");
    GiveGoldToCreature(oPC, nPrice);
    GiveXPToCreature(oPC, nXP);
    DestroyObject(oItem);
    nSmugs = nSmugs -1;
    SetLocalInt(GetPCSpeaker(), "SMUGGLE_COUNT", nSmugs);
    string sBuyer = GetStringRight(GetStringLeft(GetTag(oItem),11), 5);
    int nRep = GetCampaignInt("starwars", "REPUTATION_"+sBuyer, oPC);
    if (nRep < 10)
        {
        SetCampaignInt("starwars", "REPUTATION_"+sBuyer, nRep + 1, oPC);
        SendMessageToPC(oPC, "Your Reputation with this Buyer has Increased");
        }
    }
}
