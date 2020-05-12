
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "tukatapup_allow") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
