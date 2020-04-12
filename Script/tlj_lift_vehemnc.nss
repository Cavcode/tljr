void main() {

    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "Key_tothe_Vehemence") != OBJECT_INVALID) {

        object oLift = GetNearestObjectByTag("TRG_LIFT", oPC);
        oPC = GetFirstInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        while (GetIsObjectValid(oPC)) {
            AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("WP_Exit_Rhailas_Ship"))));
            oPC = GetNextInPersistentObject(oLift, OBJECT_TYPE_CREATURE);
        }

    }
    else {
        FloatingTextStringOnCreature("You don't have the right key.", oPC, FALSE);
    }
}
