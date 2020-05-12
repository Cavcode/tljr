
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "shadow_allow") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
