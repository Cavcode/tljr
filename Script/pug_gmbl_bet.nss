void main()
{
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();

    if (nMatch == 828 && GetName(oShouter) == GetLocalString(OBJECT_SELF, "RECORDER"))
        {
            string sMessage = GetMatchedSubstring(0);
            int nBet = StringToInt(sMessage);

            if (nBet > 0 && nBet <= GetGold(oShouter))
                {
                SetLocalInt(OBJECT_SELF, "1", 1);
                SetLocalInt(OBJECT_SELF, "2", 2);
                SetLocalInt(OBJECT_SELF, "3", 3);
                SetLocalInt(OBJECT_SELF, "4", 4);
                SetLocalInt(OBJECT_SELF, "5", 5);
                SetLocalInt(OBJECT_SELF, "6", 6);
                SetLocalInt(OBJECT_SELF, "7", 7);
                SetLocalInt(OBJECT_SELF, "8", 8);
                SetLocalInt(OBJECT_SELF, "9", 9);
                int A2=0; int A3=0; int B1=0; int B2=0; int B3=0;
                SetLocalInt(oShouter, "BET", nBet);
                TakeGoldFromCreature(nBet, oShouter, TRUE);
                int A1 = Random(8)+1;
                SetLocalInt(OBJECT_SELF, IntToString(A1), 0);
                while (A2 == 0){A2=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
                SetLocalInt(OBJECT_SELF, IntToString(A2), 0);
                while (A3 == 0){A3=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
                SetLocalInt(OBJECT_SELF, IntToString(A3), 0);
                while (B1 == 0){B1=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
                SetLocalInt(OBJECT_SELF, IntToString(B1), 0);
                while (B2 == 0){B2=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
                SetLocalInt(OBJECT_SELF, IntToString(B2), 0);
                while (B3 == 0){B3=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
                SetLocalInt(OBJECT_SELF, IntToString(B3), 0);

                SetLocalInt(OBJECT_SELF, "CARD_A_1", A1);
                SetLocalInt(OBJECT_SELF, "CARD_A_2", A2);
                SetLocalInt(OBJECT_SELF, "CARD_A_3", A3);
                SetLocalInt(OBJECT_SELF, "CARD_B_1", B1);
                SetLocalInt(OBJECT_SELF, "CARD_B_2", B2);
                SetLocalInt(OBJECT_SELF, "CARD_B_3", B3);
                SetCustomToken(22456, "Your Hand: ["+IntToString(A1)+"] ["+IntToString(A2)+"] ["+IntToString(A3)+"]   Dealer's Hand: ["+IntToString(B1)+"] ["+IntToString(B2)+"] ["+IntToString(B3)+"]    Your Bet: "+IntToString(nBet));
                //SendMessageToPC(oShouter, "       ___  ___  ___           ___  ___  ___");
                //SendMessageToPC(oShouter, " |   ||   ||   |  |   ||   ||   |");
                SendMessageToPC(oShouter, "You : ["+IntToString(A1)+"] ["+IntToString(A2)+"] ["+IntToString(A3)+"]  Dealer: ["+IntToString(B1)+"] ["+IntToString(B2)+"] ["+IntToString(B3)+"]");
                //SendMessageToPC(oShouter, "      |___||___||___|         |___||___||___|");
                SendMessageToPC(oShouter, "Bet : "+IntToString(nBet));
                SetCustomToken(22457, "Trade Card 1: ["+IntToString(A1)+"]");
                SetCustomToken(22458, "Trade Card 2: ["+IntToString(A2)+"]");
                SetCustomToken(22459, "Trade Card 3: ["+IntToString(A3)+"]");
                }
            else if (nBet > GetGold(oShouter))
                {
                SetLocalInt(oShouter, "BET", 0);
                SpeakString("Sure, pal. Come back when you have that kind of money.", TALKVOLUME_TALK);
                return;
                }
            else
                {
                SetLocalInt(oShouter, "BET", 0);
                SpeakString("Are you an idiot? This is for serious players, get out of here!", TALKVOLUME_TALK);
                return;
                }
        }
}
