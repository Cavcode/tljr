void main()
{
    object oItem        = GetItemActivated();
    object oPC          = GetItemActivator();
    object oTarget      = GetItemActivatedTarget();
    location lLocation  = GetItemActivatedTargetLocation();
    string sItemTag     = GetTag(oItem);

if (sItemTag == "DyeKit") AssignCommand(oPC, ActionStartConversation(oPC, "dye_dyekit", TRUE));
 }
