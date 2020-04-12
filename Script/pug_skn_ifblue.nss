int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Duros"){return TRUE;}
else if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
