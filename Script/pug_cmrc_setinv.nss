#include "aps_include"
void main()
{
object oItem = GetFirstItemInInventory(OBJECT_SELF);
object oShop = GetObjectByTag("inv_"+GetStringRight(GetTag(OBJECT_SELF),8));
//int nCurrentCount = GetCampaignInt("cmrcgld", "INV_COUNT", OBJECT_SELF);
//int nCurrentCount = GetPersistentInt(OBJECT_SELF, "INV_COUNT", "cmrcgld");
int nCount = 1; int nSize =1; int x = 1;
//int nOpen = GetLocalInt(OBJECT_SELF, "STORE_OPEN");
//object oPC = GetLastClosedBy();
object oGood; string sResRef;

object oSale = GetFirstItemInInventory(oShop);
while (GetIsObjectValid(oSale))
    {
    DestroyObject(oSale);
    oSale = GetNextItemInInventory(oShop);
    }

//while (GetStringLength(GetPersistentString(OBJECT_SELF, "INV_"+IntToString(x))) > 0 && x<100)
while (GetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(x))!="" && x<100)
    {
    DeleteCampaignVariable("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(x));
    x++;
    }

while (GetIsObjectValid(oItem) && nCount < 100)
    {
    if (GetPlotFlag(oItem) == FALSE)
        {
        sResRef = GetResRef(oItem);
        /*if(GetBaseItemType(oItem)==BASE_ITEM_ARROW){nSize = 99;}
        else if(GetBaseItemType(oItem)==BASE_ITEM_BOLT){nSize = 99;}
        else if(GetBaseItemType(oItem)==BASE_ITEM_BULLET){nSize = 99;}
        else { nSize = 1;}*/
        oGood = CreateItemOnObject(sResRef, oShop);
        if (GetInfiniteFlag(oGood) == FALSE)
            {
            SetInfiniteFlag(oGood, TRUE);
            }
        //SetPersistentString(OBJECT_SELF, "INV_"+IntToString(nCount), sResRef, 0);
        SetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(nCount), sResRef);
        DestroyObject(oItem);
        nCount++;
        }

    oItem = GetNextItemInInventory(OBJECT_SELF);

    }




/*
if (nOpen = TRUE && oPC == GetLocalObject(OBJECT_SELF, "STORE_SETTER"))
    {
    while (nCurrentCount > 0)
        {
        //DeleteCampaignVariable("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(nCount), OBJECT_SELF);
        DeletePersistentVariable(OBJECT_SELF, "INV_"+IntToString(nCount), "cmrcgld");
        nCurrentCount = nCurrentCount-1;
        }

    while(GetIsObjectValid(oItem) == TRUE)
        {
        nCount=nCount+1;
        if (GetPlotFlag(oItem) == TRUE){nCount=nCount-1;}
        else
            {
            //SetCampaignString("cmrcgld", GetStringRight(GetTag(OBJECT_SELF),8)+"_"+IntToString(nCount), GetResRef(oItem), OBJECT_SELF);
            SetPersistentString(OBJECT_SELF, "INV_"+IntToString(nCount), GetResRef(oItem), 0, "cmrcgld");
            if(GetBaseItemType(oItem)==BASE_ITEM_ARROW){nSize = 99;}
            else if(GetBaseItemType(oItem)==BASE_ITEM_BOLT){nSize = 99;}
            else if(GetBaseItemType(oItem)==BASE_ITEM_BULLET){nSize = 99;}
            else { nSize = 1;}
            oGood = CreateItemOnObject(GetResRef(oItem), oShop, nSize);
            if (GetInfiniteFlag(oGood) == FALSE)
                {
                SetInfiniteFlag(oGood, TRUE);
                }
            }
        oItem = GetNextItemInInventory(OBJECT_SELF);

        }
    //SetCampaignInt("cmrcgld", "INV_COUNT", nCount,OBJECT_SELF);
    SetPersistentInt(OBJECT_SELF, "INV_COUNT", nCount,0,"cmrcgld");
    SetLocalInt(OBJECT_SELF, "STORE_OPEN", FALSE);
    DeleteLocalObject(OBJECT_SELF, "STORE_SETTER");
    }    */
SetLocked(OBJECT_SELF, TRUE);
}
