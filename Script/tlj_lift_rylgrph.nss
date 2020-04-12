void main() {

    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "Royal_Gryphon_Key") != OBJECT_INVALID) {

        object oLift = GetNearestObjectByTag("TRG_LIFT", oPC);
        oPC = GetFirstInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        while (GetIsObjectValid(oPC)) {
            AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Exit_The_Royal_Gryphon"))));
            oPC = GetNextInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        }

    }
    else {
        FloatingTextStringOnCreature("You don't have the right key.", oPC, FALSE);
    }
}
