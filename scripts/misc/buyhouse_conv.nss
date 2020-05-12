void main()
{
    object oPC = GetLastUsedBy();
    string sHouse = GetTag(OBJECT_SELF);
    string sOwner = GetCampaignString("swhouses", "OWNER_NAME_"+sHouse);
    string sID = GetCampaignString("swhouses", "OWNER_ID_"+sHouse);
    int nPrice;
    if (GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse) > 0) {nPrice = GetCampaignInt("swhouses", "HOUSE_PRICE_"+sHouse);}
    else if (GetLocalInt(OBJECT_SELF,"PRICE")>0){nPrice = GetLocalInt(OBJECT_SELF, "PRICE");}
    else {nPrice = 50000;}

    if (sOwner == "")
      {
      SetCampaignString("swhouses", "OWNER_NAME_"+sHouse, "For Sale");
      sOwner = "For Sale";
      }

    if(sOwner == "For Sale")
        {
        SetCustomToken(587771, "You can buy this property for "+IntToString(nPrice)+" credits.");
        AssignCommand(OBJECT_SELF, ActionStartConversation (oPC, "buyhouse_conv", TRUE, FALSE));
        }
    else if (sOwner == GetName(oPC) && GetPCPlayerName(oPC) == sID)
        {
        SetCustomToken(587771, "What would you like to do?");
        SetCustomToken(587772, "Are you sure you wish to sell this property for "+IntToString(FloatToInt(GetLocalInt(OBJECT_SELF,"PRICE")*0.8))+"?");
        AssignCommand(OBJECT_SELF, ActionStartConversation (oPC, "buyhouse_conv", TRUE, FALSE));
        }
    else if (GetIsDM(oPC) == TRUE)
        {
        SetCustomToken(587771, "Owner: "+sOwner+". What would you like to do?");
        AssignCommand(OBJECT_SELF, ActionStartConversation (oPC, "buyhouse_conv", TRUE, FALSE));
        }
    else {AssignCommand(OBJECT_SELF,ActionSpeakString("Owner: "+sOwner, TALKVOLUME_TALK));}

    }
