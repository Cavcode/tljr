void main() {

    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "VERMILLION_H_KEY") != OBJECT_INVALID) {

        object oLift = GetNearestObjectByTag("TRG_LIFT", oPC);
        oPC = GetFirstInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        while (GetIsObjectValid(oPC)) {
            AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("SP_TO_VERMILLION_HAWK"))));
            oPC = GetNextInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        }

    }
    else {
        FloatingTextStringOnCreature("You don't have the right key.", oPC, FALSE);
    }
}
