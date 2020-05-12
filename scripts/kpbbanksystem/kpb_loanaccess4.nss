////////////////////////////////////////////
//  Kittrell's Persistent Banking System  //
//  Designed by: Brian J. Kittrell        //
//                                        //
//  This script does the following:       //
//                                        //
//  kpb_loanaccess(4) - These scripts     //
//  players to pay their loan,            //
//  depending on which amount they wish   //
//  to pay.                               //
////////////////////////////////////////////
void main()
{
object oPC = GetPCSpeaker();
SetCampaignInt("kpb_bank", "KPB_LOAN_PAY", 10000, oPC);
ExecuteScript("kpb_payloan", OBJECT_SELF);
}
