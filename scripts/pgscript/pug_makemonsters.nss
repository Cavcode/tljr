void main()
{
object oPC = GetEnteringObject();
string sTag = GetTag(OBJECT_SELF);
string sResRef;
int nCount = StringToInt(GetStringRight(sTag, 1));
int nBad = 0;
object oMonster = GetFirstObjectInArea(OBJECT_SELF);
    while (GetIsObjectValid(oMonster) == TRUE)
        {
        if (GetTag(oMonster) == "Rancor" && GetIsDead(oMonster) == FALSE)
            {
            nBad = nBad+1;
            }
        else if (GetTag(oMonster) == "BullRancor" && GetIsDead(oMonster) == FALSE)
            {
            nBad = nBad+1;
            }
        else if (GetTag(oMonster) == "KraytDragon" && GetIsDead(oMonster) == FALSE)
            {
            nBad = nBad+1;
            }
        oMonster = GetNextObjectInArea(OBJECT_SELF);
        }
if (GetHitDice(oPC) > 24 && nBad == 0)
    {
    if (GetStringLeft(sTag, 9) == "rancor001")
        {
        sResRef = "rancor001";
        }
    else if (GetStringLeft(sTag, 11) == "kraytdragon")
        {
        sResRef = "kraytdragon";
        }
    else if (GetStringLeft(sTag, 6) == "rancor" && GetStringLeft(sTag, 9) != "rancor001")
        {
        sResRef = "rancor";
        }
    if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_1")) == TRUE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF)+"_1")), FALSE);
        }
    if (GetIsObjectValid(GetWaypointByTag(GetTag(OBJECT_SELF)+"_2")) == TRUE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF)+"_2")), FALSE);
        }
    }
}
