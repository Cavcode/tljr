//void main(){}

string CommodityName(string sGood, int nQuality)
{
string sName;

if (sGood == "Food")
    {
    if (nQuality == 1){sName = "Nutmeat";}
    else if (nQuality == 2){sName = "Wookiee-ookiees";}
    else if (nQuality == 3){sName = "QuickSnacks";}
    else if (nQuality == 4){sName = "Bantha Butter";}
    else if (nQuality == 6){sName = "Bantha Burgers";}
    else if (nQuality == 10){sName = "Dricklefruit Pies";}
    else if (nQuality == 12){sName = "Dewback Ribs";}
    else if (nQuality == 20){sName = "Ryshcates";}
    }
else if (sGood == "Water")
    {
    if (nQuality == 1){sName = "Nerfmilk";}
    else if (nQuality == 2){sName = "Arkanian Sweet Milk";}
    else if (nQuality == 3){sName = "Aquilie Water";}
    else if (nQuality == 4){sName = "Dressellian Beer";}
    else if (nQuality == 6){sName = "Doan Wine";}
    else if (nQuality == 10){sName = "Corellian Spiced Ale";}
    else if (nQuality == 12){sName = "Mistwater";}
    else if (nQuality == 20){sName = "Crème D'Infame";}
    }
else if (sGood == "Ammunition")
    {
    if (nQuality == 1){sName = "Vibration Cells";}
    else if (nQuality == 2){sName = "Ion Energy Cells";}
    else if (nQuality == 3){sName = "9J Ion Power Cells";}
    else if (nQuality == 4){sName = "X-80 Power Cells";}
    else if (nQuality == 6){sName = "Rylith Power Cells";}
    else if (nQuality == 10){sName = "Type-12B Stun Rockets";}
    else if (nQuality == 12){sName = "Type-12A Anti-Personnel Rockets";}
    else if (nQuality == 20){sName = "Diatium Power Cells";}
    }
else if (sGood == "Weaponry")
    {
    if (nQuality == 1){sName = "Vibrodaggers";}
    else if (nQuality == 2){sName = "Vibroblades";}
    else if (nQuality == 3){sName = "Stun Batons";}
    else if (nQuality == 4){sName = "Blaster Pistols";}
    else if (nQuality == 6){sName = "Blaster Rifles";}
    else if (nQuality == 10){sName = "Blaster Carbines";}
    else if (nQuality == 12){sName = "Sniper Rifles";}
    else if (nQuality == 20){sName = "Heavy Blasters";}
    }
else if (sGood == "Armor")
    {
    if (nQuality == 1){sName = "Enivromental Suits";}
    else if (nQuality == 2){sName = "Combat Suits";}
    else if (nQuality == 3){sName = "Light Armor";}
    else if (nQuality == 4){sName = "Battle Armor";}
    else if (nQuality == 6){sName = "Heavy Armor";}
    else if (nQuality == 10){sName = "Light Exoskeleton";}
    else if (nQuality == 12){sName = "Heavy Exoskeleton";}
    else if (nQuality == 20){sName = "Mandalorian Armor";}
    }
return sName;
}
