int StartingConditional()
{
  int nGlobalInterest = GetCampaignInt("kpb_bank", "KPB_GLO_INT");
  if (nGlobalInterest < 1)
  {
  SetCampaignInt("kpb_bank", "KPB_GLO_INT", 1);
  int nGlobalInterest = 1;
  }
  string sGlobalInterest = IntToString(nGlobalInterest);
  SetCustomToken(30, sGlobalInterest);
  return TRUE;
}

