int StartingConditional()
{
  object oPC = GetPCSpeaker();
  int nCredit = GetCampaignInt("kpb_bank", "KPB_CREDIT_AMT", oPC);
  int nGlobalInterest = GetCampaignInt("kpb_bank", "KPB_GLO_INT");
  if (nCredit <= 24)
  {
   SetCustomToken(20,"terrible");
   int nPersonalCredit = 25;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  if (nCredit >= 25 && nCredit <= 70)
  {
   SetCustomToken(20,"mediocre");
   int nPersonalCredit = 20;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  if (nCredit >= 71 && nCredit <= 100)
  {
   SetCustomToken(20,"average");
   int nPersonalCredit = 16;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  if (nCredit >= 101 && nCredit <= 200)
  {
   SetCustomToken(20,"decent");
   int nPersonalCredit = 12;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  if (nCredit >= 201 && nCredit <= 350)
  {
   SetCustomToken(20,"good");
   int nPersonalCredit = 8;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  if (nCredit > 350)
  {
   SetCustomToken(20,"excellent");
   int nPersonalCredit = 4;
   int nAdjustedInterest = nGlobalInterest + nPersonalCredit;
   string sAdjustedInterest = IntToString(nAdjustedInterest);
   SetCustomToken(21,sAdjustedInterest);
   SetCampaignInt("kpb_bank", "KPB_CREDIT_RATE", nAdjustedInterest, oPC);
  }
  return TRUE;
}

