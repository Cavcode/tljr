// This script adds or removes a tattoo on the right thigh
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH, iNew);
}
