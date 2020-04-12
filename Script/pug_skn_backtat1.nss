void main()
{
object oPC = GetPCSpeaker();

if (GetTag(OBJECT_SELF) == "bodymodel")
    {oPC=OBJECT_SELF;}

SetColor(oPC, COLOR_CHANNEL_TATTOO_1, GetColor(oPC, COLOR_CHANNEL_TATTOO_1)-1);
}
