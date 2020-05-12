#include "x0_i0_anims"
//#include "x0_i0_walkway"
#include "x0_i0_treasure"
void main()
{
//int x = Random(8)+1;
//int y = Random(99)+1;
//if (y>49){y=x+49;}
//object oItem = CreateItemOnObject("basicclothing"+IntToString(x), OBJECT_SELF, 1, "civ_shirt");
//AssignCommand(OBJECT_SELF, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));

//SetCreatureBodyPart(CREATURE_PART_HEAD, y, OBJECT_SELF);
SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);

if (GetStringRight(GetTag(OBJECT_SELF), 6) == "wander")
    {DelayCommand(3.0, ActionRandomWalk());}
if (GetStringRight(GetTag(OBJECT_SELF), 6) == "sitter")
    {
    object oChair = GetNearestObjectByTag("Sit", OBJECT_SELF);
    DelayCommand(3.0, AssignCommand(OBJECT_SELF, ActionSit(oChair)));
    //AssignCommand(OBJECT_SELF, ActionSit(GetObjectByTag("sitonme")));
    }

}
