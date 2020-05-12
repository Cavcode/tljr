void main()
{
object oPC = GetPCSpeaker();
object oOther = GetLocalObject(oPC, "APT_TRANSFER");
string sHouse = GetTag(OBJECT_SELF);
    SetCampaignString("swhouses", "OWNER_NAME_"+sHouse, GetName(oOther));
    SetCampaignString("swhouses", "OWNER_ID_"+sHouse, GetPCPlayerName(oOther));

}
