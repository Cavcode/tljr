//Generic Onspawn Event
//  -- Uses creature tags to determine action
//
//Quix
#include "x0_i0_anims"
void main()
{
    int iObjType = GetObjectType(OBJECT_SELF);
    string sObjTag = GetTag(OBJECT_SELF);

    // Creature or Placable?
    if (iObjType == OBJECT_TYPE_CREATURE)
    {
        // Check Creature Tag and do something
        if (sObjTag == "EmperorPalpatine")
        {
            SetCreatureBodyPart(CREATURE_PART_HEAD, 212, OBJECT_SELF);
        }



        if (GetStringRight(GetTag(OBJECT_SELF), 6) == "wander")
            {DelayCommand(3.0, ActionRandomWalk());}
        else if (GetStringRight(GetTag(OBJECT_SELF), 6) == "sitter")
            {
            object oChair = GetNearestObjectByTag("Sit", OBJECT_SELF);
            DelayCommand(3.0, AssignCommand(OBJECT_SELF, ActionSit(oChair)));
            //AssignCommand(OBJECT_SELF, ActionSit(GetObjectByTag("sitonme")));
            }
        else {DelayCommand(3.0, WalkWayPoints(FALSE, 3.0));}

        //SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);
    }

}
