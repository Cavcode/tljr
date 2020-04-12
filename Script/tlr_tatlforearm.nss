// This script adds or removes a tattoo on the left forearm
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, iNew);
}
