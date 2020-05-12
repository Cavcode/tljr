void main()
{
object oPC = GetPCSpeaker();
int nPrice;
string sHouse = GetTag(OBJECT_SELF);
if (GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse) > 0) {nPrice = GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse);}
else if (GetLocalInt(OBJECT_SELF,"PRICE")>0){nPrice = GetLocalInt(OBJECT_SELF, "PRICE");}
else {nPrice = 50000;}

if (GetGold(oPC) >= nPrice)
    {
    SetCampaignString("swhouses", "OWNER_NAME_"+sHouse, GetName(oPC));
    SetCampaignString("swhouses", "OWNER_ID_"+sHouse, GetPCPlayerName(oPC));
    TakeGoldFromCreature(nPrice, oPC, TRUE);
    }
else
    {
    AssignCommand(OBJECT_SELF,ActionSpeakString("Insufficient funds.", TALKVOLUME_TALK));
    }
}
