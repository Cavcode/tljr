void main()
{
object oPC = GetPCSpeaker();
string sRank = GetLocalString(oPC, "CMRC_SUBJECT");
int nCount = GetLocalInt(oPC, sRank+"_COUNT");
int nMulti = GetLocalInt(oPC, "CMRC_SETSHOP_PAGE");

if (nMulti >= nCount)
    {
    nMulti = 0;
    SetLocalInt(oPC, "CMRC_SETSHOP_PAGE", 0);
    }
else
    {
    nMulti = nMulti + 6;
    SetLocalInt(oPC, "CMRC_SETSHOP_PAGE", nMulti);
    }

SetCustomToken(40405500, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(1+nMulti))));
SetCustomToken(40405501, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(2+nMulti))));
SetCustomToken(40405502, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(3+nMulti))));
SetCustomToken(40405503, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(4+nMulti))));
SetCustomToken(40405504, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(5+nMulti))));
SetCustomToken(40405505, GetName(GetLocalObject(oPC, "CMRC_SETSHOP_"+IntToString(6+nMulti))));
}
