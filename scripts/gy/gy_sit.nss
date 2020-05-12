void main()
{
// Put in onused of chairs
  object oChair = OBJECT_SELF;
  if(!GetIsObjectValid(GetSittingCreature(oChair)))
  {
    AssignCommand(GetLastUsedBy(), ActionSit(oChair));
  }
}
