// This script adds or removes a tattoo on the chest
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_TORSO);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_TORSO, iNew);
}
