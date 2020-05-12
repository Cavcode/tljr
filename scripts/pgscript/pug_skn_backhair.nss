void main()
{
object oPC = GetPCSpeaker();

SetColor(oPC, COLOR_CHANNEL_HAIR, GetColor(oPC, COLOR_CHANNEL_HAIR)-1);
}
