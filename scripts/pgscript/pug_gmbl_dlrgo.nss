void main()
{
object oPC = GetPCSpeaker();
string sAction, sCard; int nCard=0; int nNewCard=0;
int nBet = GetLocalInt(oPC, "BET");
int A1 = GetLocalInt(OBJECT_SELF, "CARD_A_1");
int A2 = GetLocalInt(OBJECT_SELF, "CARD_A_2");
int A3 = GetLocalInt(OBJECT_SELF, "CARD_A_3");
int B1 = GetLocalInt(OBJECT_SELF, "CARD_B_1");
int B2 = GetLocalInt(OBJECT_SELF, "CARD_B_2");
int B3 = GetLocalInt(OBJECT_SELF, "CARD_B_3");
int nAvg = (45 - (A1+A2+A3+B1+B2+B3))/3;

if (B1+B2+B3 == 15)
    {
    sAction = "The dealer keeps all of his cards";
    }
else if (B1+B2+B3 == A1+A2+A3)
    {
    sAction = "The dealer keeps all of his cards";
    }
else if (B1+B2+B3 < 16 && B1+B2+B3 > A1+A2+A3)
    {
    sAction = "The dealer keeps all of his cards";
    }
else if (B1+B2+B3 < 16 && A1+A2+A3 > 15)
    {
    sAction = "The dealer keeps all of his cards";
    }
else if (B1+B2+B3 > 15)
    {
    if (nAvg+B2+B3 > 15 && nAvg+B1+B3 > 15 && nAvg+B1+B2 > 15)
        {
        if (B1<B2 && B1<B3){nCard =B1; sCard = "B_1";}
        else if (B2<B2 && B2<B3){nCard =B2; sCard = "B_2";}
        else if (B3<B1 && B3<B2){nCard =B3; sCard = "B_3";}
        else
            {
            nCard = GetLocalInt(OBJECT_SELF, "CARD_B_"+IntToString(Random(2)+1));
            while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
            SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
            SetLocalInt(OBJECT_SELF, "CARD_B_1", nNewCard);
            SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
            sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
            }
        if (nCard !=0)
            {
            while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
            SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
            SetLocalInt(OBJECT_SELF, "CARD_"+sCard, nNewCard);
            SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
            sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
            }
        }
    else if (nAvg+B2+B3 <= 15 && nAvg+B2+B3 <= nAvg+B2+B1 && nAvg+B2+B3 <= nAvg+B3+B1)
        {
        nCard = B1;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_1", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else if (nAvg+B1+B3 <= 15 && nAvg+B1+B3 <= nAvg+B1+B2 && nAvg+B1+B3 <= nAvg+B3+B2)
        {
        nCard = B2;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_2", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction ="The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else if (nAvg+B2+B1 <= 15 && nAvg+B2+B1 <= nAvg+B3+B1 && nAvg+B2+B1 <= nAvg+B3+B2)
        {
        nCard = B3;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_3", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else
        {
        if (B1>B2 && B1>B3){nCard =B1; sCard = "B_1";}
        else if (B2>B2 && B2>B3){nCard =B2; sCard = "B_2";}
        else if (B3>B1 && B3>B2){nCard =B3; sCard = "B_3";}
        else {sAction = "The dealer keeps all of his cards -test2";}
        if (nCard !=0)
            {
            while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
            SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
            SetLocalInt(OBJECT_SELF, "CARD_"+sCard, nNewCard);
            SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
            sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
            }
        }
    }
else if (B1+B2+B3 < 15 && B1+B2+B3 < A1+A2+A3)
    {
    if (nAvg+B2+B3 <= 15 && nAvg+B2+B3 >= nAvg+B2+B1 && nAvg+B2+B3 >= nAvg+B3+B1 && nAvg+B2+B3 >= A1+A2+A3 )
        {
        nCard = B1;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_1", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else if (nAvg+B1+B3 <= 15 && nAvg+B1+B3 >= nAvg+B2+B3 && nAvg+B1+B3 >= nAvg+B2+B1 && nAvg+B1+B3 >= A1+A2+A3 )
        {
        nCard = B2;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_2", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else if (nAvg+B1+B2 <= 15 && nAvg+B1+B2 >= nAvg+B2+B3 && nAvg+B1+B2 >= nAvg+B3+B1 && nAvg+B1+B2 >= A1+A2+A3 )
        {
        nCard = B3;
        while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
        SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
        SetLocalInt(OBJECT_SELF, "CARD_B_3", nNewCard);
        SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
        sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
        }
    else
        {
        if (B1<B2 && B1<B3){nCard =B1; sCard = "B_1";}
        else if (B2<B2 && B2<B3){nCard =B2; sCard = "B_2";}
        else if (B3<B1 && B3<B2){nCard =B3; sCard = "B_3";}
        else
            {
            nCard = GetLocalInt(OBJECT_SELF, "CARD_B_"+IntToString(Random(2)+1));
            while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
            SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
            SetLocalInt(OBJECT_SELF, "CARD_B_1", nNewCard);
            SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
            sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
            }
        if (nCard !=0)
            {
            while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
            SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
            SetLocalInt(OBJECT_SELF, "CARD_"+sCard, nNewCard);
            SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);
            sAction = "The dealer has traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]";
            }
        }
    }
B1 = GetLocalInt(OBJECT_SELF, "CARD_B_1");
B2 = GetLocalInt(OBJECT_SELF, "CARD_B_2");
B3 = GetLocalInt(OBJECT_SELF, "CARD_B_3");

SetCustomToken(22452, sAction);

SendMessageToPC(oPC, "You : ["+IntToString(A1)+"] ["+IntToString(A2)+"] ["+IntToString(A3)+"]  Dealer: ["+IntToString(B1)+"] ["+IntToString(B2)+"] ["+IntToString(B3)+"]");
SendMessageToPC(oPC, "Bet : "+IntToString(nBet));
}
