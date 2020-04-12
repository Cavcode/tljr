void main()
{
object oNPC = OBJECT_SELF;
int nInt = 7;
int nBluff = 19;
string sMsg;
string sLoc = GetLocalString(oNPC, "NEGOTIATION_LOCATION");

if (GetLocalInt(oNPC, IntToString(SKILL_PERSUADE)+"_RANK") == 0 && GetLocalInt(oNPC, IntToString(SKILL_BLUFF)+"_RANK") == 0 && GetLocalInt(oNPC, IntToString(SKILL_INTIMIDATE)+"_RANK") == 0)
    {
    SetLocalInt(oNPC, IntToString(SKILL_PERSUADE)+"_RANK", Random(3)*3);
    while (GetLocalInt(oNPC, IntToString(SKILL_PERSUADE)+"_RANK") == nInt)
        {
        nInt = Random(3)*3;
        }
   SetLocalInt(oNPC, IntToString(SKILL_INTIMIDATE)+"_RANK", nInt);
   while (GetLocalInt(oNPC, IntToString(SKILL_PERSUADE)+"_RANK") == nBluff || GetLocalInt(oNPC, IntToString(SKILL_INTIMIDATE)+"_RANK") == nBluff)
        {
        nBluff = Random(3)*3;
        }
   SetLocalInt(oNPC, IntToString(SKILL_BLUFF)+"_RANK", nBluff);

    int nAmnt = (Random(8)+5)*10000;
    SetLocalInt(oNPC, "MISSION_AMOUNT", nAmnt);
   if (nInt = 6)
    {
    sMsg = "I am "+GetName(oNPC)+", Ambassador of "+sLoc+". I want to transport goods through your sector of space and I will give you "+IntToString(nAmnt)+" credits per shipment, no more no less.";
    }
   else if (nBluff = 6)
    {
    sMsg = "My name is "+GetName(oNPC)+". I am an Ambassador of "+sLoc+". I want to transport goods through your sector of space and I am willing to pay "+IntToString(nAmnt)+" credits for each shipment for the right to transport our through an area of space under your cotrol. This is a deal that I'm sure you can accept.";
    }
   else
    {
    sMsg = "I am "+GetName(oNPC)+", Ambassador from "+sLoc+". My people would like to have trade rights through your sector of space. We are willing to pay "+IntToString(nAmnt)+" credits per shipment for these trade rights.";
    }
   SetCustomToken(7343901, sMsg);
   SetCustomToken(7343902, "I will offer you "+IntToString(FloatToInt(nAmnt*1.1)));
   SetCustomToken(7343903, "I will offer you "+IntToString(FloatToInt(nAmnt*1.4)));
   SetCustomToken(7343904, "I will offer you "+IntToString(nAmnt*2));
   }
}
