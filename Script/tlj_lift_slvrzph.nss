void main() {

    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "The_Silver_Zephyr_Key") != OBJECT_INVALID) {

        object oLift = GetNearestObjectByTag("TRG_LIFT", oPC);
        oPC = GetFirstInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        while (GetIsObjectValid(oPC)) {
            AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Exit_The_Silver_Zephyr"))));
            oPC = GetNextInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        }

    }
    else {
        FloatingTextStringOnCreature("You don't have the right key.", oPC, FALSE);
    }
}
