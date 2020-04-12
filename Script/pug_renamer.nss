void main()
{
object oPC = GetItemActivator();
object oItem = GetItemActivated();
object oTarget = GetItemActivatedTarget();

if (GetTag(oItem) == "pug_renamer" && GetObjectType(oTarget) == OBJECT_TYPE_ITEM && GetPlotFlag(oTarget) == FALSE)
    {
    SetLocalInt(oPC, "RENAME_ITEM", TRUE);
    SetLocalObject(oPC, "RENAME_THIS_ITEM", oTarget);
    FloatingTextStringOnCreature("Say the new name of this item", oPC, FALSE);
    }
else if (GetTag(oItem) == "pug_renamer")
    {
    FloatingTextStringOnCreature("Rename Failed: Invalid Item", oPC, FALSE);
    }

}
