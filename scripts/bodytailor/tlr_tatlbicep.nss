// This script adds or removes a tattoo on the left bicep
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_LEFT_BICEP);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, iNew);
}
