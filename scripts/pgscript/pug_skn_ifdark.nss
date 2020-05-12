int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Wookiee"){return TRUE;}
else if (sRace == "Zabrak"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
