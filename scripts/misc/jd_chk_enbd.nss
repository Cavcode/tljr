
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "enbd_allow") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
