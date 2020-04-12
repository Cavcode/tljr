void main()
{
object oItem = GetFirstItemInInventory(OBJECT_SELF);
int nCount = 0;
string sTag = GetTag(OBJECT_SELF);
int nReset = GetLocalInt(OBJECT_SELF, "RESETTING");

while (GetIsObjectValid(oItem) == TRUE)
    {
    nCount++;
    oItem = GetNextItemInInventory(OBJECT_SELF);
    }
if (nCount == 0 && nReset == FALSE)
    {
    SetLocalInt(OBJECT_SELF, "RESETTING", TRUE);
    int nRoll = Random(6)+1;    object oPrize, oChest;
    if (GetIsObjectValid(GetObjectByTag("LOOT_"+sTag)) == TRUE)
        {
        oChest = GetObjectByTag("LOOT_"+sTag);
        }
    else
        {
        oChest = GetObjectByTag("LOOT_other");
        }

    if (GetIsObjectValid(oChest) == TRUE)
        {
            object oCrap = GetFirstItemInInventory(oChest);
            int nItemCount = 0;
            while (GetIsObjectValid(oCrap) == TRUE && nItemCount < nRoll)
                {
                nItemCount = nItemCount +1;
                if (nItemCount == nRoll)
                    {
                    oPrize = CopyItem(oCrap, OBJECT_SELF, FALSE);
                    if (GetDroppableFlag(oPrize) == FALSE)
                        {
                        SetDroppableFlag(oPrize, TRUE);
                        }
                    }
                oCrap = GetNextItemInInventory(oChest);
                }
        }
    }
}
