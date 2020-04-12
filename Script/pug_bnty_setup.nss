#include "pug_inc"
void main()
{
object oMaster = OBJECT_SELF;
int nBounty10, nBounty16, nBounty22, nBounty28, nBounty34;

if (GetIsObjectValid(GetObjectByTag("bnty_10")) == FALSE){CreateBountyTarget(OBJECT_SELF, 10); }
if (GetIsObjectValid(GetObjectByTag("bnty_16")) == FALSE){CreateBountyTarget(OBJECT_SELF, 16); }
if (GetIsObjectValid(GetObjectByTag("bnty_22")) == FALSE){CreateBountyTarget(OBJECT_SELF, 22); }
if (GetIsObjectValid(GetObjectByTag("bnty_28")) == FALSE){CreateBountyTarget(OBJECT_SELF, 28); }
if (GetIsObjectValid(GetObjectByTag("bnty_34")) == FALSE){CreateBountyTarget(OBJECT_SELF, 34); }

nBounty10 = GetLocalInt(oMaster, "TARGET_BOUNTY_10");
nBounty16 = GetLocalInt(oMaster, "TARGET_BOUNTY_16");
nBounty22 = GetLocalInt(oMaster, "TARGET_BOUNTY_22");
nBounty28 = GetLocalInt(oMaster, "TARGET_BOUNTY_28");
nBounty34 = GetLocalInt(oMaster, "TARGET_BOUNTY_34");

string sName10 = GetLocalString(oMaster, "TARGET_NAME_10");
string sName16 = GetLocalString(oMaster, "TARGET_NAME_16");
string sName22 = GetLocalString(oMaster, "TARGET_NAME_22");
string sName28 = GetLocalString(oMaster, "TARGET_NAME_28");
string sName34 = GetLocalString(oMaster, "TARGET_NAME_34");

string sLocation10 = GetLocalString(oMaster, "TARGET_LOCATION_10");
string sLocation16 = GetLocalString(oMaster, "TARGET_LOCATION_16");
string sLocation22 = GetLocalString(oMaster, "TARGET_LOCATION_22");
string sLocation28 = GetLocalString(oMaster, "TARGET_LOCATION_28");
string sLocation34 = GetLocalString(oMaster, "TARGET_LOCATION_34");

string sJob10 = GetLocalString(oMaster, "TARGET_JOB_10");
string sJob16 = GetLocalString(oMaster, "TARGET_JOB_16");
string sJob22 = GetLocalString(oMaster, "TARGET_JOB_22");
string sJob28 = GetLocalString(oMaster, "TARGET_JOB_28");
string sJob34 = GetLocalString(oMaster, "TARGET_JOB_34");

SetCustomToken(97710, sName10+", the Novice "+sJob10+" last seen on "+sLocation10+" : "+IntToString(nBounty10)+" credits");
SetCustomToken(97716, sName16+", the Adept "+sJob16+" last seen on "+sLocation16+" : "+IntToString(nBounty16)+" credits");
SetCustomToken(97722, sName22+", the Tough "+sJob22+" last seen on "+sLocation22+" : "+IntToString(nBounty22)+" credits");
SetCustomToken(97728, sName28+", the Veteran "+sJob28+" last seen on "+sLocation28+" : "+IntToString(nBounty28)+" credits");
SetCustomToken(97734, sName34+", the Master "+sJob34+" last seen on "+sLocation34+" : "+IntToString(nBounty34)+" credits");
}
