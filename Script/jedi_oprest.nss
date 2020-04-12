#include "jedi_functions"
void main()
{
    //object oPC = GetLastPCRested();
    object oPC = OBJECT_SELF;

    if (GetLastRestEventType()==REST_EVENTTYPE_REST_FINISHED) {
        if(GetNiveauForce(oPC) > 0) {
            NoFatigue(oPC);
            StopTelepathie(oPC);
        }
    }
}

