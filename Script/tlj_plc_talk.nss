// Makes the placeable speak to the PC
void main()
{
    object oPC = GetLastUsedBy();
    ActionStartConversation(oPC, "", TRUE, FALSE);
}
