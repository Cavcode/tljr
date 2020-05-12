int StartingConditional()
{
  object oPC = GetPCSpeaker();
  int nLoan = GetCampaignInt("kpb_bank", "KPB_LOAN_AMT", oPC);

  if (nLoan >= 1)
  {
  return TRUE;
  }
  else
  {
  return FALSE;
  }
}

