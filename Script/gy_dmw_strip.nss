void main()
{
    int bWasStunned,nSlot;
    object oItem;
    object oPC = GetPCSpeaker();

    object oTarget = GetLocalObject(oPC,"gy_dmwandTarget");
    //AssignCommand(oTarget,ClearAllActions(TRUE));
    for (nSlot=0;nSlot <NUM_INVENTORY_SLOTS;nSlot++)
    {
        //AssignCommand(oTarget,ActionSpeakString("strippping"));

        oItem = GetItemInSlot(nSlot,oTarget);//// change this to oTarget once test is done
        AssignCommand(oTarget,ActionUnequipItem(oItem));
    }
}
