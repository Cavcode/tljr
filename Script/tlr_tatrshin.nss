// This script adds or removes a tattoo on the right shin
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN, iNew);
}
