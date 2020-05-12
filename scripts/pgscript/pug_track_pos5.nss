
const int RACE_SIZE = 5;//this is the max number of people in one race

const int POSITION = 5; //this is the position in the race this script is dealing with

#include "pug_inc"
void main()
{
object oMaster = OBJECT_SELF;
object oPC = GetPCSpeaker();

SetTrackStartingPosition(oMaster, oPC, POSITION, RACE_SIZE);

}

