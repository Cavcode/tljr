#include "aps_include"
void main()
{
object oShop = GetObjectByTag("inv_"+GetStringRight(GetTag(OBJECT_SELF),8));
//int nCount = GetCampaignInt("cmrcgld", "INV_COUNT", OBJECT_SELF);
object oItem=OBJECT_SELF;
string sResRef= GetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_1");
int nCount = 1;
//object oPC = GetLastOpenedBy();

//while (GetStringLength(GetPersistentString(OBJECT_SELF, "INV_"+IntToString(nCount))) > 0)
while (sResRef!="")
    {
    //sResRef = GetPersistentString(OBJECT_SELF, "INV_"+IntToString(nCount));
    oItem = CreateItemOnObject(sResRef, OBJECT_SELF);
    nCount++;
    sResRef = GetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(nCount));
    }




/*if(GetCampaignInt("cmrcgld", "CMRC_RANK", oPC) > 1 && GetCampaignString("cmrcgld", "OWNER_"+GetStringRight(GetTag(OBJECT_SELF),8)) == GetName(oPC) )
    {
    while(nCount > 0)
        {
        //sResRef = GetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(nCount), OBJECT_SELF);
        sResRef = GetPersistentString(OBJECT_SELF, "INV_"+IntToString(nCount),"cmrcgld");

        oItem = GetFirstItemInInventory(oShop);

        while(GetIsObjectValid(oItem) == TRUE)
            {
            if (GetResRef(oItem) == sResRef) { DestroyObject(oItem);}
            oItem = GetNextItemInInventory(oShop);
            }
        nCount=nCount-1;
        }
    SetLocalInt(OBJECT_SELF, "STORE_OPEN", TRUE);
    SetLocalObject(OBJECT_SELF, "STORE_SETTER", oPC);
    }
else
    {
    AssignCommand(oPC, ClearAllActions(TRUE));
    SetLocked(OBJECT_SELF, TRUE);
    } */
}
