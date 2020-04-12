#include "pug_inc"

void TargetBahaviour(object oNPC);

void main()
{
int x = Random(8)+1;
string sLevel = GetStringRight(GetTag(OBJECT_SELF), 2);

//object oItem = CreateItemOnObject("basicclothing"+IntToString(x), OBJECT_SELF, 1, "civ_shirt");
//AssignCommand(OBJECT_SELF, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));

SetCreatureBodyPart(CREATURE_PART_HEAD, Random(31)+1, OBJECT_SELF);

SetName(OBJECT_SELF, GenerateMaleName()+" "+GenerateLastName());
SetLocalString(GetObjectByTag("bnty_master"), "TARGET_NAME_"+sLevel,GetName(OBJECT_SELF));
DelayCommand(5.0, TargetBahaviour(OBJECT_SELF));

if (GetStringLeft(GetName(GetArea(OBJECT_SELF)), 3) != GetStringLeft(GetLocalString(GetObjectByTag("bnty_master"), "TARGET_LOCATION_"+sLevel), 3) && GetStringLeft(sLevel, 3)!="Cor")
    {
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE,FALSE), OBJECT_SELF);
    }
else if(GetStringLeft(GetName(GetArea(OBJECT_SELF)), 4) != GetStringLeft(GetLocalString(GetObjectByTag("bnty_master"), "TARGET_LOCATION_"+sLevel), 4))
    {
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE,FALSE), OBJECT_SELF);
    }
}

void TargetBahaviour(object oNPC)
{
int x = Random(5)+1;
string sLevel = GetStringRight(GetTag(oNPC), 2);
string sLocation = GetLocalString(GetObjectByTag("bnty_master"), "TARGET_LOCATION_"+sLevel);

//AssignCommand(oNPC, ActionSpeakString(IntToString(x), TALKVOLUME_TALK));
//ActionSpeakString(IntToString(x), TALKVOLUME_TALK);
if (x < 6 && GetIsInCombat(oNPC) == FALSE && IsInConversation(oNPC) == FALSE)
    {
    ClearAllActions(FALSE);
    AssignCommand(oNPC, ActionMoveToObject(GetWaypointByTag("BOUNTY_"+sLocation+"_"+IntToString(x)), FALSE));
    //ActionForceMoveToObject(GetWaypointByTag("BOUNTY_"+sLocation+"_"+IntToString(x)), FALSE);
    }
if (x > 5 && GetIsInCombat(oNPC) == FALSE && IsInConversation(oNPC) == FALSE)
    {
    ClearAllActions(FALSE);
    ActionRandomWalk();
    DelayCommand(290.0, ClearAllActions(FALSE));
    }
DelayCommand(300.0, TargetBahaviour(oNPC));
}
