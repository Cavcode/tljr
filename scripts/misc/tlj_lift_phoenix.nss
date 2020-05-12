void main() {

    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "Key_to_The_Pheonix") != OBJECT_INVALID) {

   object oWaypoint = GetObjectByTag("phoenix_enter");
   location lLocation = GetLocation(oWaypoint);

   SetAreaTransitionBMP(AREA_TRANSITION_RURAL);

   AssignCommand(oPC,ClearAllActions());
   AssignCommand(oPC,ActionJumpToLocation(lLocation));
   AssignCommand(oPC,SetFacing(GetFacing(oWaypoint)));




    }
    else {
        FloatingTextStringOnCreature("You don't have the right key.", oPC, FALSE);
    }
}
