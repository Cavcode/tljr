void main()
{
object oPC = GetPCSpeaker();
string sMessage;
int nBet = GetLocalInt(oPC, "BET");
int A1 = GetLocalInt(OBJECT_SELF, "CARD_A_1");
int A2 = GetLocalInt(OBJECT_SELF, "CARD_A_2");
int A3 = GetLocalInt(OBJECT_SELF, "CARD_A_3");
int B1 = GetLocalInt(OBJECT_SELF, "CARD_B_1");
int B2 = GetLocalInt(OBJECT_SELF, "CARD_B_2");
int B3 = GetLocalInt(OBJECT_SELF, "CARD_B_3");

if (A1+A2+A3 > B1+B2+B3 && A1+A2+A3 < 16)
    {
    sMessage = "You win! Care to play another hand?";
    GiveGoldToCreature(oPC, nBet*2);
    }
else if (A1+A2+A3 < B1+B2+B3 && B1+B2+B3 < 16)
    {
    sMessage = "You lose this hand, care to play another ?";
    }
else if (A1+A2+A3 == B1+B2+B3 && B1+B2+B3 < 16)
    {
    sMessage = "Tie goes to the dealer. Wish to try your luck again?";
    //GiveGoldToCreature(oPC, nBet);
    }
else if (A1+A2+A3 < B1+B2+B3 && B1+B2+B3 > 15)
    {
    sMessage = "You win! Care to play another hand?";
    GiveGoldToCreature(oPC, nBet*2);
    }
else if (A1+A2+A3 > B1+B2+B3 && A1+A2+A3 > 15)
    {
    sMessage = "You lose this hand, care to play another ?";
    }
else if (A1+A2+A3 == B1+B2+B3 && B1+B2+B3 > 15)
    {
    sMessage = "Tie goes to the dealer. Wish to try your luck again?";
    //GiveGoldToCreature(oPC, nBet);
    }

SetLocalInt(oPC, "BET", 0);
SetLocalInt(OBJECT_SELF, "CARD_A_1", 0);
SetLocalInt(OBJECT_SELF, "CARD_A_2", 0);
SetLocalInt(OBJECT_SELF, "CARD_A_3", 0);
SetLocalInt(OBJECT_SELF, "CARD_B_1", 0);
SetLocalInt(OBJECT_SELF, "CARD_B_2", 0);
SetLocalInt(OBJECT_SELF, "CARD_B_3", 0);

SetCustomToken(22453, "Your Hand: ["+IntToString(A1)+"] ["+IntToString(A2)+"] ["+IntToString(A3)+"]   Dealer's Hand: ["+IntToString(B1)+"] ["+IntToString(B2)+"] ["+IntToString(B3)+"]    Your Bet: "+IntToString(nBet)+"      "+sMessage);
}
