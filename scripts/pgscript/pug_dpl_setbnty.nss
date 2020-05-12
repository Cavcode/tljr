void main()
{
object oNPC = OBJECT_SELF;
int nInt = 7;
int nBluff = 19;
string sMsg;
string sLoc = GetLocalString(oNPC, "NEGOTIATION_LOCATION");
SetLocalInt(GetPCSpeaker(), "CONVO_DC", 2);
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

    int nAmnt = (Random(5)+6)*1000;
    SetLocalInt(oNPC, "MISSION_AMOUNT", nAmnt);
   if (nInt = 6)
    {
    sMsg = "So he sent you to pay me did he? Well then hand over the "+IntToString(nAmnt)+" credits.";
    }
   else if (nBluff = 6)
    {
    sMsg = "Well then, I'll take the "+IntToString(nAmnt)+" credits and be on my way.";
    }
   else
    {
    sMsg = "A pleasure. That will be "+IntToString(nAmnt)+" credits then.";
    }
   SetCustomToken(7343911, sMsg);

   }
}
