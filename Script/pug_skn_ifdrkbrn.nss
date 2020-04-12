int StartingConditional()
{
object oPC = GetPCSpeaker();
string sRace = GetSubRace(oPC);

if (sRace == "Trandoshan"){return TRUE;}
else if (sRace == "Twi'lek"){return TRUE;}
else if (sRace == "Wookiee"){return TRUE;}
else if (sRace == "Zabrak"){return TRUE;}
else if (sRace == "Bothan"){return TRUE;}
else if (sRace == "Mon Calamari"){return TRUE;}
else if (sRace == "Weequay"){return TRUE;}
else if (sRace == "Chistori"){return TRUE;}
else {return FALSE;}
}
