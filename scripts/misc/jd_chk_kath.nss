
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "kath_allow") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
