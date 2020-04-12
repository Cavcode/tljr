void main()
{
object oPC = GetPCSpeaker();
string sBuyer = GetLocalString(oPC, "SMUGGLE_BUYER");
string sPlanet = GetLocalString(oPC, "SMUGGLE_PLANET");
string sGood = GetLocalString(oPC, "SMUGGLE_GOOD");
int nItem = GetLocalInt(oPC, "SMUGGLE_ITEM");
int ySell = GetLocalInt(OBJECT_SELF, "SMUGGLE_Y");
int xSell = GetLocalInt(OBJECT_SELF, "SMUGGLE_X");

SetLocalString(OBJECT_SELF, "SMUGGLE_BUYER", "");

object oSpice = CreateItemOnObject("pug_spice", oPC, 1, "spice_"+GetStringLeft(sBuyer, 5)+"_"+IntToString(nItem)+"_"+IntToString(xSell)+"_"+IntToString(ySell));

SetName(oSpice, sGood+" for "+sBuyer+" on "+sPlanet);

ExecuteScript("pug_smgl_attack", oPC);
}
