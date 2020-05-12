#include "kpb_dateinc"
int StartingConditional()
{
  object oPC = GetPCSpeaker();
  int nBalance = GetCampaignInt("kpb_bank", "KPB_BANK_BALANCE", oPC);

  string sBalance = IntToString(nBalance);
  SetCustomToken(25, sBalance);

  return TRUE;
}

