
int StartingConditional()
{

    object oPC = GetPCSpeaker();

    if ( GetItemPossessedBy(oPC, "jd_sum_mstr") == OBJECT_INVALID )
        return FALSE;

    return TRUE;
}
