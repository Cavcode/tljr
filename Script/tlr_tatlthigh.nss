// This script adds or removes a tattoo on the left thigh
void main()
{
    int iOld, iNew;

    iOld = GetCreatureBodyPart(CREATURE_PART_LEFT_THIGH);
    iNew = (iOld == 1) ? 2 : 1;
    SetCreatureBodyPart(CREATURE_PART_LEFT_THIGH, iNew);
}
