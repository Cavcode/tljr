void main()
{
object oPC = GetLocalObject(OBJECT_SELF, "BOMB_SETTER");
SetLocalObject(oPC, "BOMB_BLAST", OBJECT_SELF);
ExecuteScript("pug_bomb_blast", oPC);
}
