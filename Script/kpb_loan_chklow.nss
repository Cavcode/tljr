int StartingConditional()
{
  object oPC = GetPCSpeaker();
  int nLoan = GetCampaignInt("kpb_bank", "KPB_LOAN_AMT", oPC);
  int nCredit = GetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", oPC);

  if (nLoan >= 1)
  {
  return FALSE;
  }
  if (nCredit <= 70)
  {
  return FALSE;
  }
  else
  {
  return TRUE;
  }
}

