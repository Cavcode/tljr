void main()
{
object oPC = GetEnteringObject();
//int nNoNoob = GetCampaignInt("starwars", "NOT_A_NOOB", oPC);
int nLevel = GetXP(oPC);

if (nLevel < 1500 && GetIsDM(oPC)==FALSE && GetIsPC(oPC) == TRUE)
    {
    object oItem = GetFirstItemInInventory(oPC);
    DestroyObject(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC));

    while (GetIsObjectValid(oItem)==TRUE)
        {
        DestroyObject(oItem);
        //FloatingTextStringOnCreature(GetName(oItem), oPC, FALSE);
        oItem = GetNextItemInInventory(oPC);
        }
    TakeGoldFromCreature(GetGold(oPC), oPC, TRUE);
    //SetCampaignInt("starwars", "NOT_A_NOOB", TRUE, oPC);
    GiveXPToCreature(oPC, 1500);
    }


}
