const int SPEED = 99;
#include "nwnx_creature"
void ChaseCam(object oPC);

void main()
{
// Disabled mounting of speeders until they are fully fixed.
//   To re-enable just remove this comment and the one at the end of this script.

object oPC = GetLastUsedBy();

ExecuteScript("clearactions", oPC);

if (oPC == OBJECT_INVALID)
{
    oPC = GetPlaceableLastClickedBy();
}
object oBike = OBJECT_SELF;
if (GetDistanceBetween(oPC, oBike) > 3.0)
{
    AssignCommand(oPC, ActionMoveToObject(oBike));
    return;
}

int nPheno = GetLocalInt(OBJECT_SELF, "PHENO");
int nTail = GetLocalInt(OBJECT_SELF, "TAIL");
int bLocked = GetLocalInt(oBike, "SPEEDER_LOCKED");
int bHasKeys = FALSE;
string sKeyName;
//SendMessageToPC(oPC, "p: " + IntToString(nPheno) + ".");
//SendMessageToPC(oPC, "t: " + IntToString(nTail) + ".");

if (!(GetPhenoType(oPC) == 22 || GetPhenoType(oPC) == 23))
{
    if (!(GetIsPC(oPC) || GetIsDM(oPC)))
    {
        CreateItemOnObject("dismountspeeder",oPC);
        bLocked = FALSE;
    }

    if (bLocked)
    {
        //see if PC has keys to vehicle (could add security check here)
        object oKeys = GetFirstItemInInventory(oPC);
        while (GetIsObjectValid(oKeys) == TRUE)
        {
            sKeyName = GetStringLeft(GetName(oKeys),FindSubString(GetName(oKeys),"'"));
            if (GetLocalString(oBike, "BIKE_OWNER") == sKeyName)
            {
                bHasKeys = TRUE;
            }
            oKeys = GetNextItemInInventory(oPC);
        }
        if (bHasKeys == TRUE)
        {
            SetLocalInt(oBike, "SPEEDER_LOCKED", FALSE);
            FloatingTextStringOnCreature("Vehicle Unlocked.", oPC, FALSE);
            bLocked = FALSE;
        }
        else
        {
            FloatingTextStringOnCreature("Locked.", oPC, FALSE);
            SendMessageToPC(oPC, "This vehicle is locked and you do not have the keys.");
            bLocked = TRUE;
            return;
        }
    }
    else
    {
        bLocked = FALSE;
    }

    if (bLocked == FALSE)
    {
        if (nPheno == 0) {nPheno = 22;}
        int nPilot = GetSkillRank( 27, oPC, FALSE);
        SetLocalInt(oPC,"BIKE", 22);
        SetLocalInt(oPC,"SPEED", GetMovementRate(oPC));
        SetLocalInt(oPC, "PHENO", GetPhenoType(oPC));
        SetLocalString(oPC, "BIKE_OWNER", GetLocalString(oBike, "BIKE_OWNER"));

        SetCutsceneMode(oPC, TRUE);

        SetPhenoType(nPheno, oPC);

        //Tail models:
        //--816 = Swoopbike (must use phenotype 22!)
        //--817 = Speederbike (must use phenotype 22!)
        //--818 = Land Speeder(must use phenotype 23!)
        if (nTail == 0) {nTail = 817;}
        SetCreatureTailType(nTail , oPC);

        effect eSpeed = EffectMovementSpeedIncrease(SPEED);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSpeed, oPC);
        if (nTail != 818)
        {
            effect eHaste = EffectHaste();
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, eHaste, oPC);
        }

        DestroyObject(oBike);
        AssignCommand(oPC,ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC)));

        //Create and equip Speeder Blaster
        object oBlaster = CreateItemOnObject("speederblaster1", oPC);
        AssignCommand(oPC,ActionEquipItem(oBlaster, INVENTORY_SLOT_RIGHTHAND));
        if (nPilot >= 10 && nTail != 818)
            {
            NWNX_Creature_SetMovementRate(oPC, NWNX_CREATURE_MOVEMENT_RATE_DM_FAST);
            }
        else
            {
            NWNX_Creature_SetMovementRate(oPC, NWNX_CREATURE_MOVEMENT_RATE_VERY_FAST);
            }
        SetCutsceneMode(oPC, FALSE);
    }
    else
    {
         SendMessageToPC(oPC, "This vehicle is locked and you do not have the keys.");
    }
}
}

void ChaseCam(object oPC)
{
float fDirection = GetFacing(oPC);

//SetCameraFacing(fDirection, 10.0, 5.0, CAMERA_TRANSITION_TYPE_FAST);
SetCameraMode(oPC, CAMERA_MODE_STIFF_CHASE_CAMERA);

if(GetPhenoType(oPC) == 22)
    {
    DelayCommand(0.8, ChaseCam(oPC));
    }
else
    {
    RestoreCameraFacing();
    }
}
