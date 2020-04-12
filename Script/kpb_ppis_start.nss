/////////////////////////////////
//: Kittrell's Persistent Banking
//: kbp_ppis_start.css
//: Modified By: Brian J. Kittrell
//: Modified On: 19-2-2004
//:
//: Originally By: OldManWhistler
//: PPIS System
/////////////////////////////////

int PPISUserDefinedAllowAccess(object oPC)
{
    int nRentalCheck = GetCampaignInt("kpb_bank", "KPB_BANK_RENTAL", oPC);
    if (nRentalCheck == 1)
    {
    return(TRUE);
    }
    SendMessageToPC(oPC, "You must first buy the rights to store items from a banker!");
    return(FALSE);
}

const string PPIS_DB_NAME = "kpb_bank";
const string PPIS_DB_UNIQUE = "KPB_PPIS";
const float PPIS_STORAGE_HEARTBEAT = 6.0;
const int PPIS_STORAGE_TYPE = 0;
const int PPIS_STORAGE_TYPE_CREATURE = 0;
const int PPIS_STORAGE_TYPE_ITEMS = 1;
const int PPIS_STATE_UNKNOWN = 0;
const int PPIS_STATE_RETRIEVED = 1;
const int PPIS_STATE_STORED = 2;
const string PPIS_STATE = "PPISState";
const string PPIS_CHEST = "PPISChest";
const string PPIS_COUNT = "PPISCount";
const string PPIS_HB_MUTEX = "PPISMutex";
const string PPIS_ACCESS_POINT = "PPISAxs";
const string PPIS_OBJECT_CREATURE = "ppis_individual";
const string PPIS_OBJECT_LOCKER = "ppis_invis_store";
const string PPIS_OBJECT_START = "ppis_start_store";

string PPISIntToString(int iNum);
void PPISStorageHeartbeat(object oPC, object chest);
int PPISRetrieve(object oStorage);
int PPISStore(object oStorage);
void PPISWaitUntilRetrieved(object oStorage, int iTry);

string PPISIntToString(int iNum)
{
    if (iNum < 10) return ("000"+IntToString(iNum));
    if (iNum < 100) return ("00"+IntToString(iNum));
    if (iNum < 1000) return ("0"+IntToString(iNum));
    return (IntToString(iNum));
}

void PPISStorageHeartbeat(object oPC, object oChest)
{
    float fDist = GetDistanceBetween(oChest, oPC);
    if ((fDist > 0.0) && (fDist < 5.0))
    {
        DelayCommand(PPIS_STORAGE_HEARTBEAT, PPISStorageHeartbeat(oPC, oChest));
        return;
    }
    object oStorage = OBJECT_SELF;
    DeleteLocalInt(oStorage, PPIS_HB_MUTEX);
    if(PPISStore(oStorage))
    {
        SendMessageToPC(oPC, IntToString(GetLocalInt(oStorage, PPIS_COUNT))+" items were stored persistently.");
    } else {
        SpeakString("Error: unable to store "+GetName(oPC)+"'s items to the database in area:"+GetName(GetArea(OBJECT_SELF))+".", TALKVOLUME_SHOUT);
    }
    return;
}

int PPISRetrieve(object oStorage)
{
    string sID = GetTag(oStorage);
    if (PPIS_STORAGE_TYPE == PPIS_STORAGE_TYPE_CREATURE)
    {
        location lLoc = Location(GetArea(OBJECT_SELF), GetPosition(OBJECT_SELF) - 1.0*AngleToVector(GetFacing(OBJECT_SELF)), GetFacing(OBJECT_SELF));
        object oCreature = RetrieveCampaignObject(PPIS_DB_NAME, sID, lLoc);
        if (GetIsObjectValid(oCreature))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oCreature);
            int iGold = GetGold(oCreature);
            int i = 0;
            while (iGold > 50000)
            {
                CreateItemOnObject("NW_IT_GOLD001", oStorage, 50000);
                i++;
                iGold = iGold - 50000;
            }
            if (iGold > 0)
            {
                CreateItemOnObject("NW_IT_GOLD001", oStorage, iGold);
                i++;
            }
            object oItem = GetFirstItemInInventory(oCreature);
            while(GetIsObjectValid(oItem))
            {
                CopyItem(oItem, oStorage);
                i++;
                oItem = GetNextItemInInventory(oCreature);
            }
            SetLocalInt(oStorage, PPIS_STATE, PPIS_STATE_RETRIEVED);
            DestroyObject(oCreature, 0.3);
            SetLocalInt(oStorage, PPIS_COUNT, i);
            return (TRUE);
        }
        SetLocalInt(oStorage, PPIS_STATE, PPIS_STATE_RETRIEVED);
        return (FALSE);
    }
    if (PPIS_STORAGE_TYPE == PPIS_STORAGE_TYPE_ITEMS)
    {
        location lLoc = GetLocation(oStorage);
        int i = 0;
        int iMax = GetCampaignInt(PPIS_DB_NAME, sID+"0000");
        for (i=1; i<=iMax; i++)
        {
            RetrieveCampaignObject(PPIS_DB_NAME, sID+PPISIntToString(i), lLoc, oStorage);
        }
        SetLocalInt(oStorage, PPIS_STATE, PPIS_STATE_RETRIEVED);
        SetLocalInt(oStorage, PPIS_COUNT, iMax);
        return (TRUE);
    }
    return (FALSE);
}

int PPISStore(object oStorage)
{
    string sID = GetTag(oStorage);
    if (PPIS_STORAGE_TYPE == PPIS_STORAGE_TYPE_CREATURE)
    {
        location lLoc = Location(GetArea(OBJECT_SELF), GetPosition(OBJECT_SELF) - 1.0*AngleToVector(GetFacing(OBJECT_SELF)), GetFacing(OBJECT_SELF));
        object oCreature = CreateObject(OBJECT_TYPE_CREATURE, PPIS_OBJECT_CREATURE, lLoc, FALSE, sID);
        if (GetIsObjectValid(oCreature))
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), oCreature);
            object oCopy;
            object oItem = GetFirstItemInInventory(oStorage);
            int i = 0;
            while(GetIsObjectValid(oItem))
            {
                oCopy = CopyItem(oItem, oCreature);
                oItem = GetNextItemInInventory(oStorage);
                i++;
            }
            int iRet = StoreCampaignObject(PPIS_DB_NAME, sID, oCreature);
            SetLocalInt(oStorage, PPIS_STATE, PPIS_STATE_STORED);
            SetLocalInt(oStorage, PPIS_COUNT, i);
            DestroyObject(oCreature, 0.3);
            return (iRet);
        }
        return (FALSE);
    }
    if (PPIS_STORAGE_TYPE == PPIS_STORAGE_TYPE_ITEMS)
    {
        int i = 0;
        object oItem = GetFirstItemInInventory(oStorage);
        while(GetIsObjectValid(oItem))
        {
            i++;
            if(!StoreCampaignObject(PPIS_DB_NAME, sID+PPISIntToString(i), oItem))
            {
                SetCampaignInt(PPIS_DB_NAME, sID+"0000", i);
                return(FALSE);
            }
            oItem = GetNextItemInInventory(oStorage);
        }
        SetCampaignInt(PPIS_DB_NAME, sID+"0000", i);
        SetLocalInt(oStorage, PPIS_STATE, PPIS_STATE_STORED);
        SetLocalInt(oStorage, PPIS_COUNT, i);
        return (TRUE);
    }
    return (FALSE);
}

void PPISWaitUntilRetrieved(object oStorage, int iTry)
{
    if (GetLocalInt(oStorage, PPIS_STATE) == PPIS_STATE_UNKNOWN)
    {
        if (iTry < 60)
        {
            AssignCommand(OBJECT_SELF, ActionWait(1.5));
            SendMessageToPC(OBJECT_SELF, "Retrieving stored inventory.");
            AssignCommand(OBJECT_SELF, PPISWaitUntilRetrieved(oStorage, iTry+1));
        } else {
            SpeakString("PPIS ERROR: Unable to load inventory! Too much lag.", TALKVOLUME_SHOUT);
        }
    } else {
        SendMessageToPC(OBJECT_SELF, "You have "+IntToString(GetLocalInt(oStorage, PPIS_COUNT))+" items stored.");
        AssignCommand(OBJECT_SELF, ActionInteractObject(oStorage));
    }
}

void main()
{
    object oPC = GetLastUsedBy();
    if (PPISUserDefinedAllowAccess(oPC) != 1) return;

    object oStorage = GetLocalObject(oPC, PPIS_CHEST);
    if (GetIsObjectValid(oStorage))
    {
        if (GetLocalObject(oPC, PPIS_ACCESS_POINT) != OBJECT_SELF)
        {
            DestroyObject(oStorage);
            oStorage = OBJECT_INVALID;
        }
    }
    if (!GetIsObjectValid(oStorage))
    {
        int iLength = (32 - GetStringLength(PPIS_DB_UNIQUE)) / 2;
        if (PPIS_STORAGE_TYPE == PPIS_STORAGE_TYPE_ITEMS) iLength = iLength - 2;
        string sID = PPIS_DB_UNIQUE + GetStringLeft(GetPCPlayerName(oPC), iLength) + GetStringRight(GetName(oPC), iLength);
        vector vChest = GetPosition(OBJECT_SELF);
        location lStorage = Location(GetArea(OBJECT_SELF), Vector(vChest.x, vChest.y, vChest.z - 10.0) , GetFacing(OBJECT_SELF));
        oStorage = CreateObject(OBJECT_TYPE_PLACEABLE, PPIS_OBJECT_LOCKER, lStorage, FALSE, sID);
        SetLocalObject(oPC, PPIS_CHEST, oStorage);
        SetLocalObject(oPC, PPIS_ACCESS_POINT, OBJECT_SELF);
        PPISRetrieve(oStorage);
    }
    if (GetLocalInt(oStorage, PPIS_HB_MUTEX) == 0)
    {
        object oChest = OBJECT_SELF;
        AssignCommand(oStorage, DelayCommand(PPIS_STORAGE_HEARTBEAT, PPISStorageHeartbeat(oPC, oChest)));
        SetLocalInt(oStorage, PPIS_HB_MUTEX, 1);
    }

    AssignCommand(oPC, PPISWaitUntilRetrieved(oStorage, 1));
}
