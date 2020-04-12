int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
