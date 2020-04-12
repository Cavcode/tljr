void main()
{
int nCard = GetLocalInt(OBJECT_SELF, "CARD_A_2");
int nNewCard=0;
object oPC = GetPCSpeaker();

while (nNewCard == 0){nNewCard=GetLocalInt(OBJECT_SELF,IntToString(Random(8)+1));}
SetLocalInt(OBJECT_SELF, IntToString(nNewCard), 0);
SetLocalInt(OBJECT_SELF, "CARD_A_2", nNewCard);
SetLocalInt(OBJECT_SELF, IntToString(nCard), nCard);

int A1 = GetLocalInt(OBJECT_SELF, "CARD_A_1");
int A2 = GetLocalInt(OBJECT_SELF, "CARD_A_2");
int A3 = GetLocalInt(OBJECT_SELF, "CARD_A_3");

int B1 = GetLocalInt(OBJECT_SELF, "CARD_B_1");
int B2 = GetLocalInt(OBJECT_SELF, "CARD_B_2");
int B3 = GetLocalInt(OBJECT_SELF, "CARD_B_3");

int nBet = GetLocalInt(oPC, "BET");

SetCustomToken(22451, "You have traded a ["+IntToString(nCard)+"] for a ["+IntToString(nNewCard)+"]");

SendMessageToPC(oPC, "You : ["+IntToString(A1)+"] ["+IntToString(A2)+"] ["+IntToString(A3)+"]  Dealer: ["+IntToString(B1)+"] ["+IntToString(B2)+"] ["+IntToString(B3)+"]");
SendMessageToPC(oPC, "Bet : "+IntToString(nBet));
}
