void main()
{

    //AREA_TRANSITION_CITY MODIFIES THE LOADING PICTURE.  TO CHANGE IT, JUST CHANGE CITY TO WHATEVER TYPE OF TERRAIN THE AREA
    //YOU WILL BE TRANSPORTED TO IS.
    //EXAMPLE: AREA_TRANSITION_RURAL

    //YOUR DONE!  FOR BEST EFFECTS, USE WHEN TAKING A "CARAVAN", OR SITUATIONS LIKE THAT.

   object oPC = GetPCSpeaker();
   object oWaypoint = GetObjectByTag("portmepod");
   location lLocation = GetLocation(oWaypoint);

   SetAreaTransitionBMP(AREA_TRANSITION_RURAL);

   AssignCommand(oPC,ClearAllActions());
   AssignCommand(oPC,ActionJumpToLocation(lLocation));
   AssignCommand(oPC,SetFacing(GetFacing(oWaypoint)));

}

