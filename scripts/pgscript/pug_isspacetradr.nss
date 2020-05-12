int StartingConditional()
{
    int iPassed = 0;
    object oPlanet = GetLocalObject(GetPCSpeaker(), "COM_PLANET");
    if(GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "TraderBadge"))==TRUE && GetObjectType(oPlanet)== OBJECT_TYPE_PLACEABLE)
        iPassed = 1;
    if(iPassed == 0)
        return FALSE;

    return TRUE;
}
