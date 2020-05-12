void main()
{
    int nConversation = GetListenPatternNumber();
    object oPC = GetLastSpeaker();
    int iMonth = GetCalendarMonth();
    int iDay = GetCalendarDay();
    int iYear = GetCalendarYear();

    if (nConversation == -1 && GetCommandable(OBJECT_SELF))
    {
        ClearAllActions();
        BeginConversation();
    }

    if(GetIsPC(oPC) == FALSE)
        return;

    if(nConversation == 20)
    {
        string sGold = GetMatchedSubstring(2);
        int nGold = StringToInt(sGold);
        int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
        int nGoldHeld = GetGold(oPC);

        if(nGoldHeld == 0)
        {
            SpeakString("What, bringing me some pocket lint?  We only accept gold at our bank!");
            return;
        }

        if(nGold > nGoldHeld)
            {
            SpeakString("You cannot deposit more gold than you have!");
            }

        else if(nGold <= 0)
            {
            SpeakString("You cannot deposit NO gold... we don't have the forms for such things!");
            }

        else
        {
                int nAmount = (nBalance + nGold);
                SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
                SpeakString("I have added your gold to your account.  Thank you for your business.");
                TakeGoldFromCreature(nGold, oPC, TRUE);
        }
    }

    if(nConversation == 21)
    {
        string sGold = GetMatchedSubstring(2);
        int nGold = StringToInt(sGold);
        int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);

        if(nBalance == 0)
        {
            SpeakString("I am sorry, we cannot process your request.  It appears you do not have any funds stored with our bank.");
            return;
        }

        if(nGold <= 0)
            {
            SpeakString("What?!  Do not waste me time!");
            }

        else if(nGold > nBalance)
            {
            SpeakString("You cannot withdraw more gold than you have!");
            }

        else
        {
            int nAmount = (nBalance - nGold);
            SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
            SpeakString("I have your funds here.  Have a nice day.");
            GiveGoldToCreature(oPC, nGold);
        }
    }

    if(nConversation == 22)
    {
        int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);

        if(nBalance == 0)
        {
            SpeakString("You have no gold in your bank account.");
            return;
        }
        if(nBalance >= 1)
        {
            SpeakString("You currently have " + IntToString(nBalance) + " gold pieces stored in our vaults.", TALKVOLUME_TALK);
        }
    }

    if(nConversation == 23)
    {
        int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);

        if(nBalance == 0)
        {
            SpeakString("I am sorry, we cannot process your request.  It appears you do not have any funds stored with our bank.");
            return;
        }

        else if(nBalance >= 1)
        {
            int nAmount = 0;
            int nGold = nBalance;
            SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
            SpeakString("I have your funds here.  Have a nice day.");
            GiveGoldToCreature(oPC, nGold);
        }
    }

    if(nConversation == 24)
    {
        int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);
        int nGoldHeld = GetGold(oPC);

        if(nGoldHeld == 0)
        {
            SpeakString("What, bringing me some pocket lint?  We only accept gold at our bank!");
            return;
        }

        else if (nGoldHeld >= 1)
        {
                int nAmount = (nBalance + nGoldHeld);
                SetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", nAmount, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_YEAR", iYear, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_DAY", iDay, oPC);
                SetCampaignInt("kpb_bank", "KPB_DEPO_MONTH", iMonth, oPC);
                SpeakString("I have added your gold to your account.  Thank you for your business.");
                TakeGoldFromCreature(nGoldHeld, oPC, TRUE);
        }
    }
}
