int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Bith"){return TRUE;}
else if (sRace == "Gran"){return TRUE;}
else if (sRace == "Gungan"){return TRUE;}
else if (sRace == "Zabrak"){return TRUE;}
else if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
