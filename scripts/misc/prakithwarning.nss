
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

SendMessageToPC(oPC, "This area is intended for more than one challenger. If you are alone, prepare to die very fast.");

}

