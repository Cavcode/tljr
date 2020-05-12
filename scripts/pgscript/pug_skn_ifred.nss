int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Kel Dor"){return TRUE;}
else if (sRace == "Devaronian"){return TRUE;}
else if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Quarren"){return TRUE;}
else if (sRace == "Zabrak"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
