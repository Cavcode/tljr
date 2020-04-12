#include "gy_base_inc"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iResult;
    if (HasItem(oPC,sEmpireCivilianIDTag))
    {
        iResult = TRUE;
    }
    else
        iResult = FALSE;
    return iResult;
}
