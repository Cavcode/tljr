// This script adds or removes a tattoo on the right forearm
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM, iNew);
}
