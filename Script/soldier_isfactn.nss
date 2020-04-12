#include "gy_base_inc"
int StartingConditional()
{
if (GetTag(OBJECT_SELF)== "rebel_soldier" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sRebelSoldierIDTag))==TRUE)
{return TRUE;}
else if (GetTag(OBJECT_SELF)== "empire_soldier" && GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), sEmpireCivilianIDTag))==TRUE)
{return TRUE;}
else if (GetMaster(OBJECT_SELF)== GetPCSpeaker())
{return TRUE;}
else if (GetHenchman(GetPCSpeaker()) == (OBJECT_SELF))
{return TRUE;}
else return FALSE;
}
