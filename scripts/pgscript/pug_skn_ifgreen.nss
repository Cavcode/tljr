int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Aqualish"){return TRUE;}
else if (sRace == "Duros"){return TRUE;}
else if (sRace == "Rodian"){return TRUE;}
else if (sRace == "Trandoshan"){return TRUE;}
else if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
