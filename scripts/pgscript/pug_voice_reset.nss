#include "nwnx_creature"
void main()
{
object oPC = GetPCSpeaker();
int nVoice = GetLocalInt(oPC, "VOICE_SET");
NWNX_Creature_SetSoundset(oPC, nVoice);
SetCustomToken( 3311000, "Voice Set: Original Voice");
}
