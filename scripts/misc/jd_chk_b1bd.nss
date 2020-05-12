
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "b1bdroid_allow") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
