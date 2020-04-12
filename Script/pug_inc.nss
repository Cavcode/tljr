#include "pug_points"
//#include "nwnx_funcs"

void ConquerArea(object oPC, object oArea, object oBase, string sFaction, int nCount);
void BaseControl(string sBase);
void AttackTime(object oPC, object oPackage);
void RepairUnit(object oShip, object oUnit);
string GetNPCFaction(object oNPC);
//Sets LocalString FIRST_NAME
string GenerateMaleName()
{
        int nRando = Random(97);
        string sName;

    if (nRando == 0){sName="Ait";}
    if (nRando == 1){sName="Erik";}
    if (nRando == 2){sName="Darin";}
    if (nRando == 3){sName="Zev";}
    if (nRando == 4){sName="Dhirh";}
    if (nRando == 5){sName="Ardana";}
    if (nRando == 6){sName="Sandel";}
    if (nRando == 7){sName="Sair";}
    if (nRando == 8){sName="Chester";}
    if (nRando == 9){sName="Worma";}
    if (nRando == 10){sName="Yet";}
    if (nRando == 11){sName="Rail";}
    if (nRando == 12){sName="Waric";}
    if (nRando == 13){sName="Renato";}
    if (nRando == 14){sName="Zark";}
    if (nRando == 15){sName="Jorol";}
    if (nRando == 16){sName="Jorgen";}
    if (nRando == 17){sName="Lucius";}
    if (nRando == 18){sName="Auros";}
    if (nRando == 19){sName="Jhoren";}
    if (nRando == 20){sName="Umino";}
    if (nRando == 21){sName="Kirana";}
    if (nRando == 22){sName="Ryben";}
    if (nRando == 23){sName="Dralin";}
    if (nRando == 24){sName="Jarlork";}
    if (nRando == 25){sName="Gormes";}
    if (nRando == 26){sName="Drugah";}
    if (nRando == 27){sName="Danison";}
    if (nRando == 28){sName="Amminius";}
    if (nRando == 29){sName="Andrew";}
    if (nRando == 30){sName="Ulon";}
    if (nRando == 31){sName="Marius";}
    if (nRando == 32){sName="Rath";}
    if (nRando == 33){sName="Keever";}
    if (nRando == 34){sName="Kazdan";}
    if (nRando == 35){sName="Renato";}
    if (nRando == 36){sName="Tans";}
    if (nRando == 37){sName="Janev";}
    if (nRando == 38){sName="Orrell";}
    if (nRando == 39){sName="Daos";}
    if (nRando == 40){sName="Wagg";}
    if (nRando == 41){sName="Cort";}
    if (nRando == 42){sName="Exeden";}
    if (nRando == 43){sName="Thaneo";}
    if (nRando == 44){sName="Darren";}
    if (nRando == 45){sName="Schwanzkranz";}
    if (nRando == 46){sName="Cain";}
    if (nRando == 47){sName="Tesvalo";}
    if (nRando == 48){sName="Ben";}
    if (nRando == 49){sName="El'kar";}
    if (nRando == 50){sName="Ares";}
    if (nRando == 51){sName="Hersh";}
    if (nRando == 52){sName="Daclif";}
    if (nRando == 53){sName="Kale";}
    if (nRando == 54){sName="Darren";}
    if (nRando == 55){sName="Jagen";}
    if (nRando == 56){sName="Wyrren";}
    if (nRando == 57){sName="Rayfe";}
    if (nRando == 58){sName="Corellan";}
    if (nRando == 59){sName="Jaster";}
    if (nRando == 60){sName="Wurth";}
    if (nRando == 61){sName="Niuk";}
    if (nRando == 62){sName="Daran";}
    if (nRando == 63){sName="Rebar";}
    if (nRando == 64){sName="Jashara";}
    if (nRando == 65){sName="Dannen";}
    if (nRando == 66){sName="Lando";}
    if (nRando == 67){sName="Fabian";}
    if (nRando == 68){sName="Trl";}
    if (nRando == 69){sName="Kandar";}
    if (nRando == 70){sName="Malius";}
    if (nRando == 71){sName="Arix";}
    if (nRando == 72){sName="Zandro";}
    if (nRando == 73){sName="Foxdi";}
    if (nRando == 74){sName="Zechs";}
    if (nRando == 75){sName="Aaron";}
    if (nRando == 76){sName="Mardos";}
    if (nRando == 77){sName="Quan";}
    if (nRando == 78){sName="Morla";}
    if (nRando == 79){sName="Lan";}
    if (nRando == 80){sName="Zerrak";}
    if (nRando == 81){sName="Ra'Eff";}
    if (nRando == 82){sName="Valenquiss";}
    if (nRando == 83){sName="Eldo";}
    if (nRando == 84){sName="Zev";}
    if (nRando == 85){sName="Nessle";}
    if (nRando == 86){sName="Markus";}
    if (nRando == 87){sName="Daye";}
    if (nRando == 88){sName="Bruenor";}
    if (nRando == 89){sName="Cander";}
    if (nRando == 90){sName="Dunta";}
    if (nRando == 91){sName="Jinn-Tu";}
    if (nRando == 92){sName="Bruan";}
    if (nRando == 93){sName="Klai";}
    if (nRando == 94){sName="Athin";}
    if (nRando == 95){sName="Pollix";}
    if (nRando == 96){sName="Varn";}
return sName;
}

void MaleName(object oNPC)
{
SetLocalString(oNPC, "FIRST_NAME", GenerateMaleName());
}

//Sets LocalString LAST_NAME
string GenerateLastName()
{
        int nRando = Random(148);
        string sName;

        if (nRando == 0){sName="Lopez";}
        if (nRando == 1){sName="Ne Dago";}
        if (nRando == 2){sName="Kirra";}
        if (nRando == 3){sName="Teff";}
        if (nRando == 4){sName="Terrano";}
        if (nRando == 5){sName="Rehal";}
        if (nRando == 6){sName="Xidgol";}
        if (nRando == 7){sName="Maximus";}
        if (nRando == 8){sName="Bahol";}
        if (nRando == 9){sName="Rowan";}
        if (nRando == 10){sName="Holgor";}
        if (nRando == 11){sName="Jing";}
        if (nRando == 12){sName="Rivas";}
        if (nRando == 13){sName="Anor";}
        if (nRando == 14){sName="Vytuia";}
        if (nRando == 15){sName="Abya";}
        if (nRando == 16){sName="Torsin";}
        if (nRando == 17){sName="Watashi";}
        if (nRando == 18){sName="Orikan";}
        if (nRando == 19){sName="Lacer";}
        if (nRando == 20){sName="L'hnnar";}
        if (nRando == 21){sName="Maymier";}
        if (nRando == 22){sName="Bowman";}
        if (nRando == 23){sName="Grainer";}
        if (nRando == 24){sName="Bokiana";}
        if (nRando == 25){sName="Brolen";}
        if (nRando == 26){sName="Riencam";}
        if (nRando == 27){sName="Zythor";}
        if (nRando == 28){sName="Kase";}
        if (nRando == 29){sName="Hu";}
        if (nRando == 30){sName="Ghast";}
        if (nRando == 31){sName="Wagner";}
        if (nRando == 32){sName="Lacer";}
        if (nRando == 33){sName="Hansol";}
        if (nRando == 34){sName="Richardson";}
        if (nRando == 35){sName="Telsh";}
        if (nRando == 36){sName="Morastus";}
        if (nRando == 37){sName="Phet";}
        if (nRando == 38){sName="Rohana";}
        if (nRando == 39){sName="Duann";}
        if (nRando == 40){sName="Dreiz";}
        if (nRando == 41){sName="Danakar";}
        if (nRando == 42){sName="Kelbier";}
        if (nRando == 43){sName="Min";}
        if (nRando == 44){sName="Spunns";}
        if (nRando == 45){sName="Goloc";}
        if (nRando == 46){sName="Lindemann";}
        if (nRando == 47){sName="Falkrowe";}
        if (nRando == 48){sName="M'n";}
        if (nRando == 49){sName="Broxin";}
        if (nRando == 50){sName="Kuolor";}
        if (nRando == 51){sName="Cornag";}
        if (nRando == 52){sName="Cleeze";}
        if (nRando == 53){sName="Logoth";}
        if (nRando == 54){sName="Storm";}
        if (nRando == 55){sName="Kyle";}
        if (nRando == 56){sName="Vuusen";}
        if (nRando == 57){sName="Horizonis";}
        if (nRando == 58){sName="Masaque";}
        if (nRando == 59){sName="Isod";}
        if (nRando == 60){sName="Archer";}
        if (nRando == 61){sName="Darran";}
        if (nRando == 62){sName="Peoly";}
        if (nRando == 63){sName="Chode";}
        if (nRando == 64){sName="Fyaar";}
        if (nRando == 65){sName="Kuolor";}
        if (nRando == 66){sName="Drackon";}
        if (nRando == 67){sName="Starroy";}
        if (nRando == 68){sName="Fel";}
        if (nRando == 69){sName="Sarn";}
        if (nRando == 70){sName="Tyandas";}
        if (nRando == 71){sName="Sedaya";}
        if (nRando == 72){sName="Leuf";}
        if (nRando == 73){sName="Drakar";}
        if (nRando == 74){sName="Darmal";}
        if (nRando == 75){sName="Steveus";}
        if (nRando == 76){sName="Riada";}
        if (nRando == 77){sName="Corsh";}
        if (nRando == 78){sName="Chias";}
        if (nRando == 79){sName="B'hme";}
        if (nRando == 80){sName="Banab";}
        if (nRando == 81){sName="Dago";}
        if (nRando == 82){sName="Shesh";}
        if (nRando == 83){sName="Chin";}
        if (nRando == 84){sName="Danjapa";}
        if (nRando == 85){sName="Ferndike";}
        if (nRando == 86){sName="Pohar";}
        if (nRando == 87){sName="Vasch";}
        if (nRando == 88){sName="Cooc";}
        if (nRando == 89){sName="Maru";}
        if (nRando == 90){sName="Shaasa";}
        if (nRando == 91){sName="Drexel";}
        if (nRando == 92){sName="Tallon";}
        if (nRando == 93){sName="Guerrin";}
        if (nRando == 94){sName="Zess";}
        if (nRando == 95){sName="Miransi";}
        if (nRando == 96){sName="Roseland";}
        if (nRando == 97){sName="Getz";}
        if (nRando == 98){sName="Thont";}
        if (nRando == 99){sName="Obarel";}
        if (nRando == 100){sName="Numarkus";}
        if (nRando == 101){sName="Lendix";}
        if (nRando == 102){sName="Corsh";}
        if (nRando == 103){sName="Antilles";}
        if (nRando == 104){sName="Zayelt";}
        if (nRando == 105){sName="Rabor";}
        if (nRando == 106){sName="Zionz";}
        if (nRando == 107){sName="Fleetfire";}
        if (nRando == 108){sName="Sim";}
        if (nRando == 109){sName="Chavez";}
        if (nRando == 110){sName="Orden";}
        if (nRando == 111){sName="Bastra";}
        if (nRando == 112){sName="Abya";}
        if (nRando == 113){sName="Myndraav";}
        if (nRando == 114){sName="Joben";}
        if (nRando == 115){sName="Moonwood";}
        if (nRando == 116){sName="Hollinger";}
        if (nRando == 117){sName="Zythor";}
        if (nRando == 118){sName="Cath";}
        if (nRando == 119){sName="Addacess";}
        if (nRando == 120){sName="Quest";}
        if (nRando == 121){sName="Mavr";}
        if (nRando == 122){sName="Janson";}
        if (nRando == 123){sName="Doha";}
        if (nRando == 124){sName="Bastra";}
        if (nRando == 125){sName="Amavia";}
        if (nRando == 126){sName="Varik";}
        if (nRando == 127){sName="Hocha";}
        if (nRando == 128){sName="Rivas";}
        if (nRando == 129){sName="Hennis";}
        if (nRando == 130){sName="Tull";}
        if (nRando == 131){sName="Antur";}
        if (nRando == 132){sName="We";}
        if (nRando == 133){sName="Foss";}
        if (nRando == 134){sName="Green";}
        if (nRando == 135){sName="Scutu";}
        if (nRando == 136){sName="Tallav";}
        if (nRando == 137){sName="Folen";}
        if (nRando == 138){sName="Kymeri";}
        if (nRando == 139){sName="Zoler";}
        if (nRando == 140){sName="Leoet";}
        if (nRando == 141){sName="Sherrol";}
        if (nRando == 142){sName="Forlin";}
        if (nRando == 143){sName="Kennison";}
        if (nRando == 144){sName="Belanger";}
        if (nRando == 145){sName="Solaris";}
        if (nRando == 146){sName="Holgor";}
        if (nRando == 147){sName="Vadith";}

        return sName;
}

void LastName(object oNPC)
{
        SetLocalString(oNPC, "LAST_NAME", GenerateLastName());
}

//Sets LocalString FIRST_NAME
string GenerateFemaleName()
{
        int nRando = Random(100);
        string sName;

    if (nRando == 0){sName="Timmser";}
    if (nRando == 1){sName="Duena";}
    if (nRando == 2){sName="Sola";}
    if (nRando == 3){sName="Arcas";}
    if (nRando == 4){sName="Caileta";}
    if (nRando == 5){sName="Davessi";}
    if (nRando == 6){sName="Solstice";}
    if (nRando == 7){sName="Vucora";}
    if (nRando == 8){sName="Jemmila";}
    if (nRando == 9){sName="Nelia";}
    if (nRando == 10){sName="Sabrina";}
    if (nRando == 11){sName="Esli";}
    if (nRando == 12){sName="Aliura";}
    if (nRando == 13){sName="Abia";}
    if (nRando == 14){sName="Danni";}
    if (nRando == 15){sName="Lel";}
    if (nRando == 16){sName="Relain";}
    if (nRando == 17){sName="Kara";}
    if (nRando == 18){sName="Garnet";}
    if (nRando == 19){sName="Dolara";}
    if (nRando == 20){sName="Rhea";}
    if (nRando == 21){sName="Jan";}
    if (nRando == 22){sName="Ami";}
    if (nRando == 23){sName="Asori";}
    if (nRando == 24){sName="Lana";}
    if (nRando == 25){sName="Rathma";}
    if (nRando == 26){sName="Alsia";}
    if (nRando == 27){sName="Grinte";}
    if (nRando == 28){sName="Crysenia";}
    if (nRando == 29){sName="Ariel";}
    if (nRando == 30){sName="Nayva";}
    if (nRando == 31){sName="Calista";}
    if (nRando == 32){sName="Bernarda";}
    if (nRando == 33){sName="Sarli";}
    if (nRando == 34){sName="Yasinda";}
    if (nRando == 35){sName="Yras";}
    if (nRando == 36){sName="Mora";}
    if (nRando == 37){sName="Nyla";}
    if (nRando == 38){sName="Cira";}
    if (nRando == 39){sName="Delaana";}
    if (nRando == 40){sName="Sarin";}
    if (nRando == 41){sName="Teeana";}
    if (nRando == 42){sName="Teela";}
    if (nRando == 43){sName="Talia";}
    if (nRando == 44){sName="Ari";}
    if (nRando == 45){sName="Shaneeka";}
    if (nRando == 46){sName="Arili";}
    if (nRando == 47){sName="Audrey";}
    if (nRando == 48){sName="Delinia";}
    if (nRando == 49){sName="Aayla";}
    if (nRando == 50){sName="D'arial";}
    if (nRando == 51){sName="Kaida";}
    if (nRando == 52){sName="Varina";}
    if (nRando == 53){sName="Delara";}
    if (nRando == 54){sName="Dyles";}
    if (nRando == 55){sName="Kelisea";}
    if (nRando == 56){sName="Ashlyn";}
    if (nRando == 57){sName="Mugami";}
    if (nRando == 58){sName="Hannah";}
    if (nRando == 59){sName="Iocasta";}
    if (nRando == 60){sName="Aerith";}
    if (nRando == 61){sName="Carh`la";}
    if (nRando == 62){sName="Menka ";}
    if (nRando == 63){sName="Fen";}
    if (nRando == 64){sName="Tour";}
    if (nRando == 65){sName="Azah";}
    if (nRando == 66){sName="Lynorri";}
    if (nRando == 67){sName="Vara";}
    if (nRando == 68){sName="Taza";}
    if (nRando == 69){sName="Lyyr";}
    if (nRando == 70){sName="Raven ";}
    if (nRando == 71){sName="Aleane";}
    if (nRando == 72){sName="Corinna";}
    if (nRando == 73){sName="Erisi";}
    if (nRando == 74){sName="Damasa";}
    if (nRando == 75){sName="Tera";}
    if (nRando == 76){sName="Sarin";}
    if (nRando == 77){sName="Harli";}
    if (nRando == 78){sName="Ratha";}
    if (nRando == 79){sName="Aria";}
    if (nRando == 80){sName="Fianna";}
    if (nRando == 81){sName="Marab";}
    if (nRando == 82){sName="Nicole";}
    if (nRando == 83){sName="Xyras";}
    if (nRando == 84){sName="Xzara";}
    if (nRando == 85){sName="Li";}
    if (nRando == 86){sName="Tavrie";}
    if (nRando == 87){sName="Zeno";}
    if (nRando == 88){sName="Thalassa";}
    if (nRando == 89){sName="Zizzy";}
    if (nRando == 90){sName="Varias";}
    if (nRando == 91){sName="Solange";}
    if (nRando == 92){sName="Maryna";}
    if (nRando == 93){sName="Rowana";}
    if (nRando == 94){sName="Roxis";}
    if (nRando == 95){sName="Branada";}
    if (nRando == 96){sName="Zoras";}
    if (nRando == 97){sName="T'Rani";}
    if (nRando == 98){sName="Ruby";}
    if (nRando == 99){sName="Ethea";}
    return sName;
}
void FemaleName(object oNPC)
{
SetLocalString(oNPC, "FIRST_NAME", GenerateFemaleName());
}

//Sets LocalString RANK
void RebelRank(object oNPC)
{
        int nRando = Random(7);
        string sName;

    if (nRando == 0){sName="Major";}
    if (nRando == 1){sName="First Officer";}
    if (nRando == 2){sName="Officer";}
    if (nRando == 3){sName="Captain";}
    if (nRando == 4){sName="First Cadet";}
    if (nRando == 5){sName="Cadet";}
    if (nRando == 6){sName="First Ensign";}

SetLocalString(oNPC, "RANK", sName);
}

//Sets LocalString RANK
void EmpireRank(object oNPC)
{
        int nRando = Random(7);
        string sName;

    if (nRando == 0){sName="Commander";}
    if (nRando == 1){sName="First Lieutenant";}
    if (nRando == 2){sName="Lieutenant-Commander";}
    if (nRando == 3){sName="Lieutenant-Captain";}
    if (nRando == 4){sName="Lieutenant";}
    if (nRando == 5){sName="Captain";}
    if (nRando == 6){sName="First Private";}

SetLocalString(oNPC, "RANK", sName);
}

void EquipHenchman(object oSoldier)
{
string sArmor = GetLocalString(oSoldier, "SOLDIER_ARMOR");
string sSword = GetLocalString(oSoldier, "SOLDIER_SWORD");
string sHat = GetLocalString(oSoldier, "SOLDIER_HAT");

DestroyObject(GetItemInSlot(INVENTORY_SLOT_CHEST,OBJECT_SELF));
DestroyObject(GetItemInSlot(INVENTORY_SLOT_HEAD,OBJECT_SELF));
DestroyObject(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,OBJECT_SELF));

if (sArmor == "" && GetTag(oSoldier) == "empire_soldier")
    {
        sArmor="stormtrooperarmo";
        SetLocalString(oSoldier, "SOLDIER_ARMOR", sArmor);
        sHat = "stormtrooperhelm";
    }
if (sArmor == "" && GetTag(oSoldier) == "rebel_soldier")
    {
        sArmor="rebelscamouflag";
        SetLocalString(oSoldier, "SOLDIER_ARMOR", sArmor);
        sHat = "rebelshelmet";
    }
if (sSword == "" && GetTag(oSoldier) == "empire_soldier")
    {
        sSword="84ublasterrif";
        SetLocalString(oSoldier, "SOLDIER_SWORD", sSword);
    }
if (sSword == "" && GetTag(oSoldier) == "rebel_soldier")
    {
        sSword="cdefcarbine";
        SetLocalString(oSoldier, "SOLDIER_SWORD", sSword);
    }


CreateItemOnObject(sArmor, oSoldier, 1, "armor");
CreateItemOnObject(sHat, oSoldier, 1, "soldier_hat");
CreateItemOnObject(sSword, oSoldier, 1, "sword");

AssignCommand(oSoldier, ActionEquipItem(GetObjectByTag("soldier_hat"),INVENTORY_SLOT_HEAD));
ActionEquipMostEffectiveArmor();
ActionEquipMostDamagingRanged();
}

//sBad is not required, but you must use either Rebels or Empire for sGood
void PCFactions(object oPC, string sGood, string sBad)
{
    object oOther = GetFirstPC();
    string sOtherContract, sContract;

    if (sGood == "Rebels")
        {
        sGood = "RebelAllianceID";
        sBad = "GalaticEmpireID";
        }
    else if (sGood == "Empire")
        {
        sGood = "GalaticEmpireID";
        sBad = "RebelAllianceID";
        }

    if (sBad == "RebelAllianceID")
        {
        sContract = "Rebels";
        }
    else if (sBad == "GalaticEmpireID")
        {
        sContract = "Empire";
        }

     while (GetIsPC(oOther)==TRUE)
        {
        sOtherContract = GetCampaignString("starwars", "CONTRACT", oOther);
        if (GetIsObjectValid(GetItemPossessedBy(oPC, "TraderBadge"))==TRUE && GetIsObjectValid(GetItemPossessedBy(oOther, "TraderBadge"))==TRUE && oOther != oPC && GetIsDM(oOther)==FALSE && GetIsReactionTypeHostile(oPC, oOther)==TRUE)
            {
                SetPCLike(oPC, oOther);
            }
        else if (GetIsEnemy(oPC, oOther)==FALSE && GetIsObjectValid(GetItemPossessedBy(oPC, sGood))==TRUE && GetIsObjectValid(GetItemPossessedBy(oOther, "FringeID"))==TRUE && oOther != oPC && sOtherContract==sContract && GetIsDM(oOther)==FALSE)
            {
                SetPCDislike(oPC, oOther);
            }
        else if (GetIsEnemy(oPC, oOther)==TRUE && GetIsObjectValid(GetItemPossessedBy(oPC, sGood))==TRUE && GetIsObjectValid(GetItemPossessedBy(oOther, "FringeID"))==TRUE && oOther != oPC && sOtherContract!=sContract && GetIsDM(oOther)==FALSE)
            {
                SetPCLike(oPC, oOther);
            }
        else if (GetIsEnemy(oPC, oOther)==FALSE && GetIsObjectValid(GetItemPossessedBy(oPC, sGood))==TRUE && GetIsObjectValid(GetItemPossessedBy(oOther, sBad))==TRUE && oOther != oPC && GetIsDM(oOther)==FALSE)
            {
                SetPCDislike(oPC, oOther);
            }
        else if (GetIsEnemy(oPC, oOther)==TRUE && GetIsObjectValid(GetItemPossessedBy(oPC, sGood))==TRUE && GetIsObjectValid(GetItemPossessedBy(oOther, sGood))==TRUE && oOther != oPC && GetIsDM(oOther)==FALSE)
            {
                SetPCLike(oPC, oOther);
            }
        oOther = GetNextPC();
        }
}

void ApplyRevivePenalty(object oPC, int STACK)
{
        int nPenalty;

        if (STACK == FALSE)
            {
            nPenalty = GetLocalInt(oPC, "REVIVE_PENALTY");
            }

        else if (STACK == TRUE)
            {
            SetLocalInt(oPC, "REVIVE_PENALTY", GetLocalInt(oPC, "REVIVE_PENALTY")+1);
            nPenalty=GetLocalInt(oPC, "REVIVE_PENALTY")+1;
            }

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, nPenalty)), oPC, 3600.0);
        //ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CONSTITUTION, nPenalty)), oPC, 3600.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_DEXTERITY, nPenalty)), oPC, 3600.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_INTELLIGENCE, nPenalty)), oPC, 3600.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_STRENGTH, nPenalty)), oPC, 3600.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_WISDOM, nPenalty)), oPC, 3600.0);

}

location GetDefenderSpawnPoint(string sTag, string sBase)
{
location lSpawn;

if (GetIsObjectValid(GetWaypointByTag("POST_"+sTag)))
    {
    lSpawn = GetLocation(GetWaypointByTag("POST_"+sTag));
    }
else if (GetIsObjectValid(GetWaypointByTag("WP_"+sTag+"_1")))
    {
    lSpawn = GetLocation(GetWaypointByTag("WP_"+sTag+"_1"));
    }
else
    {
    lSpawn = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
    }
return lSpawn;
}

//Sets up defending units in a base depending on string planetname_area#
void SetUpBase(string sBase, int nSize)
{
string sFaction = GetCampaignString("starwars", sBase+"_CONTROL");
int x;
string sEmpireDefender, sDefender;
if (sBase == "pug_isd_1" && GetIsObjectValid(GetObjectByTag("PL_S_ISD")) == TRUE)
    {
    sFaction = GetNPCFaction(GetObjectByTag("PL_S_ISD"));
    }
else if (sBase == "pug_mcc_1" && GetIsObjectValid(GetObjectByTag("PL_S_MCC")) == TRUE)
    {
    sFaction = GetNPCFaction(GetObjectByTag("PL_S_MCC"));
    }

if (sFaction != "Empire" && sFaction != "Rebels" && sFaction != "Locals")
    {
    SetCampaignString("starwars", sBase+"_CONTROL", "Locals");
    sFaction = "Locals";
    }

if (GetStringLeft(sBase, 7) == "rhenvar")
    {
    sEmpireDefender = "dfnd_snowtroop";
    sDefender = "dfnd_battledroid";
    }
else if (GetStringLeft(sBase, 7) == "iridnia")
    {
    sEmpireDefender = "dfnd_stormtroop";
    sDefender = "dfnd_localzabrak";
    }
else if (GetStringLeft(sBase, 7) == "bespinn")
    {
    sEmpireDefender = "dfnd_stormtroop";
    sDefender = "bespinwingguar";
    }
else
    {
    sEmpireDefender = "dfnd_stormtroop";
    sDefender = "dfnd_localguard";
    }

BaseControl(sBase);
location lSpawn, lSpawn1, lSpawn2;

if (sFaction == "Empire")
    {
    lSpawn1 = GetDefenderSpawnPoint(sBase+"_1", sBase);
    CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, lSpawn1, FALSE, sBase+"_1");

    if (GetIsObjectValid(GetObjectByTag(sBase+"_2"))==FALSE && GetIsAreaInterior(GetArea(GetObjectByTag(sBase+"_1"))) == FALSE)
        {
        lSpawn2 = GetDefenderSpawnPoint(sBase+"_2", sBase);
        CreateObject(OBJECT_TYPE_CREATURE, "dfnd_atst", lSpawn2, FALSE, sBase+"_2");
        }
    else if (GetIsObjectValid(GetObjectByTag(sBase+"_2"))==FALSE && GetIsAreaInterior(GetArea(GetObjectByTag(sBase+"_1"))) == TRUE)
        {
        lSpawn2 = GetDefenderSpawnPoint(sBase+"_2", sBase);
        CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, lSpawn2, FALSE, sBase+"_2");
        }

        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_empdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_1");

        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_empdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_2");

    for (x = 3; x < (nSize+1); x++)
        {
        lSpawn = GetDefenderSpawnPoint(sBase+"_"+IntToString(x), sBase);
        CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, lSpawn, FALSE, sBase+"_"+IntToString(x));
        }
    }
else if (sFaction == "Rebels")
    {
    lSpawn1 = GetDefenderSpawnPoint(sBase+"_1", sBase);
    lSpawn2 = GetDefenderSpawnPoint(sBase+"_2", sBase);
    CreateObject(OBJECT_TYPE_CREATURE, "dfnd_frefight", lSpawn1, FALSE, sBase+"_1");
    CreateObject(OBJECT_TYPE_CREATURE, "dfnd_liberator", lSpawn2, FALSE, sBase+"_2");

        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_1");

        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_2");

    for (x = 3; x < (nSize+1); x++)
        {
        lSpawn = GetDefenderSpawnPoint(sBase+"_"+IntToString(x), sBase);
        CreateObject(OBJECT_TYPE_CREATURE, "dfnd_frefight", lSpawn, FALSE, sBase+"_"+IntToString(x));
        }
    }
else if (sFaction == "Locals")
    {
        //CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_1");

        //CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_2");

    for (x = 1; x < (nSize+1); x++)
        {
        lSpawn = GetDefenderSpawnPoint(sBase+"_"+IntToString(x), sBase);
        CreateObject(OBJECT_TYPE_CREATURE, sDefender, lSpawn, FALSE, sBase+"_"+IntToString(x));
        }
    }
}

void BaseControl(string sBase)
{
    string sPlanet = GetStringLeft(sBase, 7);
    object oPlanet = GetObjectByTag(sPlanet);  int nColour, nColour2;
    string sFaction = GetCampaignString("starwars", sBase+"_CONTROL");
    string sControl1 = GetCampaignString("starwars", sPlanet+"_1_CONTROL");
    string sControl2 = GetCampaignString("starwars", sPlanet+"_2_CONTROL");
    string sControl3 = GetCampaignString("starwars", sPlanet+"_3_CONTROL");

    if (sControl1 == sFaction && sControl2 == sFaction && sControl3 == sFaction)
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", sFaction);
        if (sControl1 == "Empire")
            {
            nColour = VFX_DUR_AURA_BLUE_DARK;
            nColour2 = VFX_DUR_GLOW_BLUE;
            }
        else if (sControl1 == "Rebels")
            {
            nColour = VFX_DUR_AURA_GREEN_DARK;
            nColour2 = VFX_DUR_GLOW_GREEN;
            }
        else if (sControl1 == "Locals")
            {
            nColour = VFX_DUR_AURA_YELLOW_DARK;
            nColour2 = VFX_DUR_GLOW_YELLOW;
            }
        }

    else if (sControl1 != sControl2)
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        nColour = VFX_DUR_AURA_RED_DARK;
        nColour2 = VFX_DUR_GLOW_RED;
        }

    else if (sControl1 != sControl3)
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        nColour = VFX_DUR_AURA_RED_DARK;
        nColour2 = VFX_DUR_GLOW_RED;
        }

    else if (sControl3 != sControl2)
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        nColour = VFX_DUR_AURA_RED_DARK;
        nColour2 = VFX_DUR_GLOW_RED;
        }

    if (sFaction == "Rebels")
        {
        object oBase = GetObjectByTag(sBase+"_GLOW");
        effect eBad = GetFirstEffect(oBase);
        while(GetIsEffectValid(eBad)==TRUE)
            {
                if (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oBase, eBad);
                    }
                eBad = GetNextEffect(oBase);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_GREEN_DARK, FALSE)), oBase, 12000.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_GLOW_GREEN, FALSE)), oBase, 12000.0);
        }
    else if (sFaction == "Empire")
        {
        object oBase = GetObjectByTag(sBase+"_GLOW");
        effect eBad = GetFirstEffect(oBase);
        while(GetIsEffectValid(eBad)==TRUE)
            {
                if (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oBase, eBad);
                    }
                eBad = GetNextEffect(oBase);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_BLUE_DARK, FALSE)), oBase, 12000.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_GLOW_BLUE, FALSE)), oBase);
        }
    else if (sFaction == "Locals")
        {
        object oBase = GetObjectByTag(sBase+"_GLOW");
        effect eBad = GetFirstEffect(oBase);
        while(GetIsEffectValid(eBad)==TRUE)
            {
                if (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oBase, eBad);
                    }
                eBad = GetNextEffect(oBase);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_YELLOW_DARK, FALSE)), oBase, 12000.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_GLOW_YELLOW, FALSE)), oBase, 12000.0);
        }
    else
        {
        object oBase = GetObjectByTag(sBase+"_GLOW");
        effect eBad = GetFirstEffect(oBase);
        while(GetIsEffectValid(eBad)==TRUE)
            {
                if (GetEffectType(eBad) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oBase, eBad);
                    }
                eBad = GetNextEffect(oBase);
            }

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_PULSE_ORANGE_BLACK, FALSE)), oBase, 12000.0);
        //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectVisualEffect(VFX_IMP_FLAME_M, FALSE)), oBase, 12000.0);
        }
        effect eGlow = GetFirstEffect(oPlanet);
        while(GetIsEffectValid(eGlow)==TRUE)
            {
                if (GetEffectType(eGlow) == EFFECT_TYPE_VISUALEFFECT)
                    {
                        RemoveEffect(oPlanet, eGlow);
                    }
                eGlow = GetNextEffect(oPlanet);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(nColour, FALSE)), oPlanet, 12000.0);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(nColour2, FALSE)), oPlanet, 12000.0);

}

//resets defending units in a base depending on string planetname_area# after an enemy retreat
/*void ResetBase(string sBase)
{
string sFaction = GetCampaignString("starwars", sBase+"_CONTROL");
int x;
string sEmpireDefender;

if (GetStringLeft(sBase, 7) == "rhenvar")
    {
    sEmpireDefender =  "dfnd_snowtroop";
    }
else {sEmpireDefender="dfnd_empdfndr";}

    string sPlanet = GetStringLeft(sBase, 7);
    if (sPlanet+"_1_CONTROL" == sFaction && sPlanet+"_2_CONTROL" == sFaction && sPlanet+"_3_CONTROL" == sFaction)
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", sFaction);
        }

    else if (sPlanet+"_1_CONTROL" != sPlanet+"_2_CONTROL")
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        }

    else if (sPlanet+"_1_CONTROL" != sPlanet+"_3_CONTROL")
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        }

    else if (sPlanet+"_3_CONTROL" != sPlanet+"_2_CONTROL")
        {
        SetCampaignString("starwars", sPlanet+"_CONTROL", "Disputed");
        }

if (sFaction == "Empire")
    {
    if (GetIsObjectValid(GetObjectByTag(sBase+"_1"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_1");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_2"))==FALSE && GetIsAreaInterior(GetArea(GetObjectByTag(sBase+"_1"))) == FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfnd_atst", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_2");
        }
    else if (GetIsObjectValid(GetObjectByTag(sBase+"_2"))==FALSE && GetIsAreaInterior(GetArea(GetObjectByTag(sBase+"_1"))) == TRUE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_2");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_PROBE_1"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_empdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_1");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_PROBE_2"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_empdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_2");
        }
    for (x = 3; x < 11; x++)
        {
        if (GetIsObjectValid(GetObjectByTag(sBase+"_"+IntToString(x)))==FALSE)
            {
            CreateObject(OBJECT_TYPE_CREATURE, sEmpireDefender, GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_"+IntToString(x));
            }
        }
    }
else if (sFaction == "Rebels")
    {
    if (GetIsObjectValid(GetObjectByTag(sBase+"_1"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfnd_frefight", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_1");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_2"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfnd_liberator", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_2");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_PROBE_1"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_1");
        }
    if (GetIsObjectValid(GetObjectByTag(sBase+"_PROBE_2"))==FALSE)
        {
        CreateObject(OBJECT_TYPE_CREATURE, "dfndr_rebdroid", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_PROBE_2");
        }
    for (x = 3; x < 11; x++)
        {
        if (GetIsObjectValid(GetObjectByTag(sBase+"_"+IntToString(x)))==FALSE)
            {
            CreateObject(OBJECT_TYPE_CREATURE, "dfnd_frefight", GetLocation(GetWaypointByTag(sBase+"_SPAWN")), FALSE, sBase+"_"+IntToString(x));
            }
        }
    }
}   */

void ConquerArea(object oPC, object oArea, object oBase, string sFaction, int nCount)
{
int nAttack = GetLocalInt(oBase, "UNDER_ATTACK");
int nStopped = GetLocalInt(oBase, "STOPPED_ATTACK");
string sControl = GetCampaignString("starwars", GetTag(oArea)+"_CONTROL");
string sControl1 = GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_1_CONTROL");
string sControl2 = GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_2_CONTROL");
string sControl3 = GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_3_CONTROL");
object oInArea;
int nBonus;

if (GetArea(oPC)==oArea && nAttack == TRUE && GetIsDead(oPC)==FALSE && sControl != sFaction && nStopped == FALSE && nCount > 0)
    {
    ApplyPoints();
    FloatingTextStringOnCreature("Hold this area for "+IntToString(nCount)+" seconds to conquer it for the "+sFaction, oPC, FALSE);
    DelayCommand(5.0, ConquerArea(oPC, oArea, oBase, sFaction, nCount - 5));
    }

else if (GetArea(oPC)==oArea && nAttack == TRUE && GetIsDead(oPC)==FALSE && sControl != sFaction && nStopped == FALSE && nCount == 0)
    {
    //ApplyPoints();
    SetLocalInt(oBase, "UNDER_ATTACK", FALSE);
    SetCampaignString("starwars", GetTag(oArea)+"_CONTROL", sFaction);
    oInArea = GetFirstPC();
    BaseControl(GetTag(GetArea(oPC)));

        object oOld = GetFirstObjectInArea(GetArea(oPC));
        while (GetIsObjectValid(oOld) == TRUE)
            {
            if (GetStringLeft(GetTag(GetArea(oPC)), 7) == GetStringLeft(GetTag(GetArea(oOld)), 7) && GetStringLeft(GetResRef(oOld), 4) == "dfnd")
                {
                ChangeToStandardFaction(oOld, STANDARD_FACTION_HOSTILE);
                }
            oOld = GetNextObjectInArea(GetArea(oPC));
            }
        if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPC) != 50)
            {
            SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC);
            }
        ExecuteScript("pug_fac_set", oPC);
    while (GetIsObjectValid(oInArea) == TRUE)
        {
        if (GetStringLeft(GetTag(GetArea(oPC)), 7) == GetStringLeft(GetTag(GetArea(oInArea)), 7))
            {
            FloatingTextStringOnCreature(GetName(oPC)+" has captured "+GetName(oArea)+" for the "+sFaction, oPC, TRUE);
            }
        oInArea = GetNextPC();
        }
    if (GetCampaignString("starwars", GetTag(oArea)+"_CONTROL") == GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_1_CONTROL") && GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_1_CONTROL") == GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_2_CONTROL") && GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_1_CONTROL") == GetCampaignString("starwars", GetStringLeft(GetTag(oArea),7)+"_3_CONTROL"))
        {
        nBonus = 50;
        }
    else { nBonus = 0;}

    int nPoints = GetCampaignInt("swpcpoints", "POINTS_"+sFaction);
    SetCampaignInt("swpcpoints", "POINTS_"+sFaction, nPoints+50+nBonus);
    SetCampaignInt("swpcpoints", "POINTS_PLANET_"+sFaction, GetCampaignInt("starwars", "POINTS_PLANET_"+sFaction)+50+nBonus);

    SetCampaignInt("swpcpoints", "PC_POINTS", GetCampaignInt("starwars", "PC_POINTS", oPC)+50+nBonus, oPC);
    SetCampaignInt("swpcpoints", "PC_POINTS_PLANET", GetCampaignInt("starwars", "PC_POINTS_PLANET",oPC)+50+nBonus, oPC);

    UpdatePointsScore(oPC);
    }
else if (GetArea(oPC)==oArea && nAttack == TRUE && GetIsDead(oPC)==FALSE && sControl != sFaction && nStopped == TRUE)
    {
    SetLocalInt(oBase, "UNDER_ATTACK", FALSE);
    SetLocalInt(oBase, "STOPPED_ATTACK", FALSE);
    FloatingTextStringOnCreature("The enemy is defending their base, you must remove them first", oPC, FALSE);
    //BaseControl(GetTag(GetArea(oPC)));
    }
}

void CreateBountyTarget(object oMaster, int nLevel)
{
string sName, sLocation, sClass, sJob;
int x = Random(30)+1;
int y = Random(10)+1; //should be 10
//int nBounty = d10(50) * (((nLevel-4)/6)+1)+150;
int nBounty=FloatToInt(IntToFloat(d4(100))*(IntToFloat(nLevel*nLevel)/100.0)+1.0)+200;

if (x == 1){sJob = "Beggar"; sClass = "2";} //Rogue
else if (x == 2){sJob = "Thief"; sClass = "2";}
else if (x == 3){sJob = "Criminal"; sClass = "2";}
else if (x == 4){sJob = "Pickpocket"; sClass = "2";}
else if (x == 5){sJob = "Spy"; sClass = "2";}
else if (x == 6){sJob = "Prostitute"; sClass = "2";}
else if(x == 7){sJob = "Smuggler"; sClass = "2";}
else if(x == 8){sJob = "Crimelord"; sClass = "2";}
else if(x == 9){sJob = "Assassin"; sClass = "2";}
else if(x == 10){sJob = "Bounty Hunter"; sClass = "2";}
else if(x == 11){sJob = "Mugger"; sClass = "1";}    //Fighter
else if(x == 12){sJob = "Soldier"; sClass = "1";}
else if(x == 13){sJob = "Guard"; sClass = "1";}
else if(x == 14){sJob = "Mandalorian"; sClass = "1";}
else if(x == 15){sJob = "Mercenary"; sClass = "1";}
else if(x == 16){sJob = "Ruffian"; sClass = "1";}
else if(x == 17){sJob = "Trooper"; sClass = "1";}
else if(x == 18){sJob = "Rebel"; sClass = "1";}
else if(x == 19){sJob = "Duelist"; sClass = "1";}
else if(x == 20){sJob = "Mechanic"; sClass = "1";}
else if(x == 21){sJob = "Merchant"; sClass = "3";} //Noble aka Bard
else if(x == 22){sJob = "Noble"; sClass = "3";}
else if(x == 23){sJob = "Lord"; sClass = "3";}
else if(x == 24){sJob = "Count"; sClass = "3";}
else if(x == 25){sJob = "Duke"; sClass = "3";}
else if(x == 26){sJob = "Trader"; sClass = "3";}
else if(x == 27){sJob = "Craftsman"; sClass = "3";}
else if(x == 28){sJob = "Slave Trader"; sClass = "3";}
else if(x == 29){sJob = "Landlord"; sClass = "3";}
else if(x == 30){sJob = "Politican"; sClass = "3";}
else if(x == 31){sJob = "Jedi"; sClass = "4";}  //Force Master aka Wizard or 4ce master
else if(x == 32){sJob = "Sith"; sClass = "4";}
else if(x == 33){sJob = "Grey Jedi"; sClass = "4";}
else if(x == 34){sJob = "Witch"; sClass = "4";}
else if(x == 35){sJob = "Healer"; sClass = "4";}
else if(x == 36){sJob = "Doctor"; sClass = "4";}

if(y == 1) { sLocation = "Coruscant";}
else if(y == 2) { sLocation = "Corellia";}
else if(y == 3) { sLocation = "NarShaddaa";}
else if(y == 4) { sLocation = "Tatooine";}
else if(y == 5) { sLocation = "Bespin";}
else if(y == 6) { sLocation = "Naboo";}
else if(y == 7) { sLocation = "Cerea";}
else if(y == 8) { sLocation = "Iridonia";}
else if(y == 9) { sLocation = "Kashyyyk";}
else if(y == 10) { sLocation = "Corulag";}
else if(y == 11) { sLocation = "Duro";}
else if(y == 12) { sLocation = "Ryloth";}
else if(y == 13) { sLocation = "Manaan";}
else if(y == 14) { sLocation = "NarShaddaa";}
else if(y == 15) { sLocation = "MonCalamari";}
else if(y == 16) { sLocation = "Rodia";}
else if(y == 17) { sLocation = "Gamorr";}
else if(y == 18) { sLocation = "Honoghr";}
else if(y == 19) { sLocation = "Bothawui";}
else if(y == 20) { sLocation = "Dosha";}
else if(y == 21) { sLocation = "Dorin ";}
else if(y == 22) { sLocation = "Ithor";}
else if(y == 23) { sLocation = "Sullust";}
/*MaleName(GetObjectByTag("bnty_master"));
LastName(GetObjectByTag("bnty_master"));

sName =  GetLocalString(GetObjectByTag("bnty_master"), "FIRST_NAME")+" "+GetLocalString(GetObjectByTag("bnty_master"), "LAST_NAME");
SetLocalString(oMaster, "TARGET_NAME_"+IntToString(nLevel),sName);  */
if (GetIsObjectValid(GetObjectByTag("bnty_"+IntToString(nLevel))) == FALSE)
    {
    SetLocalInt(oMaster, "TARGET_BOUNTY_"+IntToString(nLevel), nBounty);
    SetLocalString(oMaster, "TARGET_LOCATION_"+IntToString(nLevel),sLocation);
    SetLocalString(oMaster, "TARGET_JOB_"+IntToString(nLevel), sJob);
    CreateObject(OBJECT_TYPE_CREATURE, "bnty_"+sClass+"_"+IntToString(nLevel), GetLocation(GetWaypointByTag("BOUNTY_"+sLocation+"_1")), FALSE, "bnty_"+IntToString(nLevel));
    }
//SetName(oTarget, sName);
}

/*void AttackTime(object oPC, object oPackage)
{
    int nUnderAttack = GetLocalInt(oPC, "SMUGGLE_UNDERATTACK");
    object oAttacker;
    int nItem = StringToInt(GetStringLeft(GetStringRight(GetTag(oPackage),5),1));
    if(GetItemPossessor(oPackage)==oPC && nUnderAttack != TRUE)
        {
        FloatingTextStringOnCreature("You have been ambushed for the package you are carrying", oPC, FALSE);
        effect ePoly = GetFirstEffect(oPC);
        while (GetIsEffectValid(ePoly) == TRUE && GetEffectType(ePoly) != EFFECT_TYPE_POLYMORPH)
            {
            ePoly = GetNextEffect(oPC);
            }
        if (GetEffectType(ePoly) == EFFECT_TYPE_POLYMORPH)
            {//ship
            oAttacker = CreateObject(OBJECT_TYPE_CREATURE, "ambusher_"+IntToString(nItem), GetLocation(oPC), FALSE, "spice_ambush");
            }
        else
            {//guy
            oAttacker = CreateObject(OBJECT_TYPE_CREATURE, "ambusher_"+IntToString(nItem), GetLocation(oPC), FALSE, "spice_ambush");
            }

        int nSpace = GetLocalInt(oPC, "IN_SPACE");
        if (nSpace == TRUE)
            {//ship
            oAttacker = CreateObject(OBJECT_TYPE_CREATURE, "ambusher_"+IntToString(nItem), GetLocation(oPC), FALSE, "spice_ambush");
            }
        else
            {//guy
            oAttacker = CreateObject(OBJECT_TYPE_CREATURE, "ambusher_"+IntToString(nItem), GetLocation(oPC), FALSE, "spice_ambush");
            }
        SetLocalObject(oAttacker, "ATTACK_TARGET", oPC);
        float fTimer = IntToFloat(Random(90));
        DelayCommand(250.0+fTimer, AttackTime(oPC, oPackage));
        }
}      */

string GetFaction(object oPC, int nContractAllowed)
{
        string sFaction;

        if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
            {
            sFaction = "Rebels";
            }
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
            {
            sFaction = "Empire";
            }
        else if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE)
            {
            if (GetCampaignString("starwars", "CONTRACT", oPC) == "Rebels" && nContractAllowed == TRUE)
                {
                sFaction = "Rebels";
                }
            else if (GetCampaignString("starwars", "CONTRACT", oPC) == "Empire" && nContractAllowed == TRUE)
                {
                sFaction = "Empire";
                }
            else
                {
                sFaction = "Fringe";
                }
            }
    return sFaction;
}

string GetNPCFaction(object oNPC)
{
        string sFaction;

object oFringe = GetObjectByTag("faction_fringe");
object oEmpire = GetObjectByTag("faction_empire");
object oRebels = GetObjectByTag("faction_rebels");

        if (GetFactionEqual(oNPC, oRebels) == TRUE)
            {
            sFaction = "Rebels";
            }
        else if (GetFactionEqual(oNPC, oEmpire) == TRUE)
            {
            sFaction = "Empire";
            }
        else if (GetFactionEqual(oNPC, oFringe) == TRUE)
            {
            sFaction = "Fringe";
            }
    return sFaction;
}

string VoiceName(int nVoice)
{
string sName;
if ( nVoice == 112 ){sName = "BarbarianF1";}
else if ( nVoice == 127 ){sName = "ComOldF1";}
else if ( nVoice == 128 ){sName = "DruidF1";}
else if ( nVoice == 133 ){sName = "FanaticF1";}
else if ( nVoice == 135 ){sName = "GenBarF1";}
else if ( nVoice == 136 ){sName = "GenBarF3";}
else if ( nVoice == 137 ){sName = "GenBarF4";}
else if ( nVoice == 144 ){sName = "HalflF1";}
else if ( nVoice == 154 ){sName = "NwGrdF1";}
else if ( nVoice == 149 ){sName = "NWComF1";}
else if ( nVoice == 150 ){sName = "NWComF2";}
else if ( nVoice == 151 ){sName = "NWComF3";}
else if ( nVoice == 157 ){sName = "NwNobF1";}
else if ( nVoice == 158 ){sName = "NwNobF2";}
else if ( nVoice == 162 ){sName = "PreludeF1";}
else if ( nVoice == 166 ){sName = "ProstiF1";}
else if ( nVoice == 167 ){sName = "ProstiF2";}
else if ( nVoice == 168 ){sName = "ProstiF3";}
else if ( nVoice == 176 ){sName = "ThugF1";}
else if ( nVoice == 180 ){sName = "WizardF1";}
else if ( nVoice == 188 ){sName = "NwGrdF2";}
else if ( nVoice == 197 ){sName = "NymphF";}
else if ( nVoice == 199 ){sName = "CelestF";}
else if ( nVoice == 205 ){sName = "SuccF";}
else if ( nVoice == 220 ){sName = "EltoorF_PCV";}
else if ( nVoice == 225 ){sName = "OphalaF_PCV";}
else if ( nVoice == 226 ){sName = "RangerF_PCV";}
else if ( nVoice == 227 ){sName = "ShaldrF_PCV";}
else if ( nVoice == 230 ){sName = "AribetF";}
else if ( nVoice == 231 ){sName = "HaedraF";}
else if ( nVoice == 233 ){sName = "MoragF";}
else if ( nVoice == 242 ){sName = "ffightf_PCV";}
else if ( nVoice == 243 ){sName = "fkiller_PCV";}
else if ( nVoice == 244 ){sName = "fseductf_pCV";}
else if ( nVoice == 245 ){sName = "fthugf_pcv";}
else if ( nVoice == 346 ){sName = "Deekin_Scalesinger";}
else if ( nVoice == 348 ){sName = "Drogan_Droganson";}
else if ( nVoice == 347 ){sName = "Dorna_Trapspringer";}
else if ( nVoice == 350 ){sName = "JNah";}
else if ( nVoice == 351 ){sName = "Katriana";}
else if ( nVoice == 353 ){sName = "Malthia_Drammar";}
else if ( nVoice == 354 ){sName = "Mischa_Waymeet";}
else if ( nVoice == 355 ){sName = "Uppsala";}
else if ( nVoice == 357 ){sName = "Female_Berserker_PCV";}
else if ( nVoice == 358 ){sName = "Female_Feisty_PCV";}
else if ( nVoice == 359 ){sName = "Female_MatCmdr_PCV";}
else if ( nVoice == 360 ){sName = "Female_Playful_PCV";}
else if ( nVoice == 361 ){sName = "Female_QuLdr_PCV";}
else if ( nVoice == 371 ){sName = "Ayala";}
else if ( nVoice == 381 ){sName = "Drow_Matron";}
else if ( nVoice == 398 ){sName = "Drow_Valsharess";}
else if ( nVoice == 410 ){sName = "Linu_XP2";}
else if ( nVoice == 411 ){sName = "Sharwyn_XP2";}
else if ( nVoice == 414 ){sName = "Nathyrra";}
else if ( nVoice == 417 ){sName = "Aribeth_XP2_PALADIN";}
else if ( nVoice == 423 ){sName = "The_Maiden";}
else if ( nVoice == 424 ){sName = "Mhaere";}
else if ( nVoice == 433 ){sName = "Female_Adventurer";}
else if ( nVoice == 429 ){sName = "Sobrey";}
else if ( nVoice == 430 ){sName = "Agarly";}
else if ( nVoice == 444 ){sName = "Aribeth_XP2_BLACKGUA";}
else if ( nVoice == 901 ){sName = "GenericAlien";}
else if ( nVoice == 902 ){sName = "Aqualish";}
else if ( nVoice == 903 ){sName = "AssassinDroid";}
else if ( nVoice == 905 ){sName = "Bith";}
else if ( nVoice == 906 ){sName = "Chandra";}
else if ( nVoice == 907 ){sName = "DarkJediFem";}
else if ( nVoice == 910 ){sName = "Droid";}
else if ( nVoice == 911 ){sName = "Duro1";}
else if ( nVoice == 912 ){sName = "Duro2";}
else if ( nVoice == 914 ){sName = "Gand";}
else if ( nVoice == 915 ){sName = "Gran";}
else if ( nVoice == 924 ){sName = "MedicalDroid";}
else if ( nVoice == 925 ){sName = "Nikto";}
else if ( nVoice == 928 ){sName = "RodianF";}
else if ( nVoice == 930 ){sName = "SithF";}
else if ( nVoice == 934 ){sName = "Sullustan";}
else if ( nVoice == 935 ){sName = "TankDroid";}
else if ( nVoice == 938 ){sName = "Trandoshan";}
else if ( nVoice == 939 ){sName = "TwilekFemale";}
else if ( nVoice == 942 ){sName = "weequay";}
else if ( nVoice == 113 ){sName = "BarbarianM1";}
else if ( nVoice == 114 ){sName = "BarbarianM2";}
else if ( nVoice == 115 ){sName = "BarbarianM3";}
else if ( nVoice == 116 ){sName = "BeggerM1";}
else if ( nVoice == 117 ){sName = "BeggerM2";}
else if ( nVoice == 118 ){sName = "BloodSail1";}
else if ( nVoice == 119 ){sName = "BloodSail2";}
else if ( nVoice == 123 ){sName = "ClericM1";}
else if ( nVoice == 124 ){sName = "ClericM2";}
else if ( nVoice == 125 ){sName = "ClericM3";}
else if ( nVoice == 126 ){sName = "ClerkM1";}
else if ( nVoice == 129 ){sName = "DruidM1";}
else if ( nVoice == 130 ){sName = "DwarfM1";}
else if ( nVoice == 131 ){sName = "ElfM1";}
else if ( nVoice == 132 ){sName = "NeverM1";}
else if ( nVoice == 134 ){sName = "FanaticM1";}
else if ( nVoice == 138 ){sName = "GenBarM1";}
else if ( nVoice == 139 ){sName = "GenBarM2";}
else if ( nVoice == 140 ){sName = "GenBarM3";}
else if ( nVoice == 141 ){sName = "GenBarM4";}
else if ( nVoice == 142 ){sName = "GnomeM1";}
else if ( nVoice == 143 ){sName = "GnomeM2";}
else if ( nVoice == 145 ){sName = "HalflM1";}
else if ( nVoice == 146 ){sName = "LusGenM1";}
else if ( nVoice == 147 ){sName = "LusGenM2";}
else if ( nVoice == 148 ){sName = "LusGenM3";}
else if ( nVoice == 152 ){sName = "NWComM1";}
else if ( nVoice == 153 ){sName = "NWComM2";}
else if ( nVoice == 155 ){sName = "NwGrdM2";}
else if ( nVoice == 156 ){sName = "NwGrdM3";}
else if ( nVoice == 159 ){sName = "NwNobm1";}
else if ( nVoice == 160 ){sName = "NwNobm2";}
else if ( nVoice == 161 ){sName = "PaladM1";}
else if ( nVoice == 163 ){sName = "PreludeM1";}
else if ( nVoice == 164 ){sName = "PreludeM2";}
else if ( nVoice == 165 ){sName = "PreludeM3";}
else if ( nVoice == 169 ){sName = "ProstiM1";}
else if ( nVoice == 170 ){sName = "ProstiM2";}
else if ( nVoice == 171 ){sName = "RangerM1";}
else if ( nVoice == 172 ){sName = "RogueM1";}
else if ( nVoice == 173 ){sName = "ShopKpM1";}
else if ( nVoice == 174 ){sName = "ShopKpM2";}
else if ( nVoice == 175 ){sName = "ShopKpM3";}
else if ( nVoice == 177 ){sName = "ThugM1";}
else if ( nVoice == 178 ){sName = "ThugM2";}
else if ( nVoice == 179 ){sName = "ThugM3";}
else if ( nVoice == 181 ){sName = "WizardM1";}
else if ( nVoice == 183 ){sName = "WNComM3";}
else if ( nVoice == 184 ){sName = "WNComM4";}
else if ( nVoice == 185 ){sName = "WNComM5";}
else if ( nVoice == 186 ){sName = "GenGrdM1";}
else if ( nVoice == 187 ){sName = "GenGrdM2";}
else if ( nVoice == 189 ){sName = "NTeenM";}
else if ( nVoice == 190 ){sName = "NwGrdM1";}
else if ( nVoice == 191 ){sName = "WizardM3";}
else if ( nVoice == 192 ){sName = "HalfOrcM1";}
else if ( nVoice == 193 ){sName = "HHenchM1";}
else if ( nVoice == 194 ){sName = "WNComF4";}
else if ( nVoice == 195 ){sName = "FarmerM1";}
else if ( nVoice == 196 ){sName = "QuintM";}
else if ( nVoice == 198 ){sName = "ZorM";}
else if ( nVoice == 200 ){sName = "ZeliepM";}
else if ( nVoice == 201 ){sName = "EbraxxM";}
else if ( nVoice == 202 ){sName = "KarlatM";}
else if ( nVoice == 210 ){sName = "AvHen1F";}
else if ( nVoice == 211 ){sName = "AvHen2F";}
else if ( nVoice == 212 ){sName = "AvHen3M";}
else if ( nVoice == 213 ){sName = "AvHen4M";}
else if ( nVoice == 214 ){sName = "AvHen5M";}
else if ( nVoice == 215 ){sName = "AvHen6M";}
else if ( nVoice == 216 ){sName = "AldoM_PCV";}
else if ( nVoice == 217 ){sName = "CallahM_PCV";}
else if ( nVoice == 218 ){sName = "ChristM_PCV";}
else if ( nVoice == 219 ){sName = "ClauduM_PCV";}
else if ( nVoice == 221 ){sName = "JalekM_PCV";}
else if ( nVoice == 222 ){sName = "NeurikM_PCV";}
else if ( nVoice == 223 ){sName = "NyatarM_PCV";}
else if ( nVoice == 224 ){sName = "OlefM_PCV";}
else if ( nVoice == 228 ){sName = "SirilM_PCV";}
else if ( nVoice == 229 ){sName = "VengauM_PCV";}
else if ( nVoice == 232 ){sName = "MaugriM";}
else if ( nVoice == 234 ){sName = "NasherM";}
else if ( nVoice == 235 ){sName = "FenthiM";}
else if ( nVoice == 236 ){sName = "DestheM";}
else if ( nVoice == 237 ){sName = "DrawlM";}
else if ( nVoice == 238 ){sName = "IntdevM";}
else if ( nVoice == 239 ){sName = "DWhiteM";}
else if ( nVoice == 240 ){sName = "GulnanF";}
else if ( nVoice == 241 ){sName = "GendM";}
else if ( nVoice == 352 ){sName = "Wizard";}
else if ( nVoice == 356 ){sName = "Xanos";}
else if ( nVoice == 363 ){sName = "Male_Dumb_PCV";}
else if ( nVoice == 364 ){sName = "Male_PwrHngry_PCV";}
else if ( nVoice == 365 ){sName = "Male_Prankster_PCV";}
else if ( nVoice == 366 ){sName = "Male_Sociopath_PCV";}
else if ( nVoice == 367 ){sName = "Male_Stealth_PCV";}
else if ( nVoice == 368 ){sName = "Male_Subtle_PCV";}
else if ( nVoice == 369 ){sName = "Ashtara";}
else if ( nVoice == 379 ){sName = "Drow_Rebel";}
else if ( nVoice == 380 ){sName = "Drow_Wizard";}
else if ( nVoice == 400 ){sName = "Arden_Swift";}
else if ( nVoice == 401 ){sName = "Sensei_Dharvana";}
else if ( nVoice == 405 ){sName = "Deekin_XP2";}
else if ( nVoice == 406 ){sName = "Durnan";}
else if ( nVoice == 408 ){sName = "Mephisopheles";}
else if ( nVoice == 409 ){sName = "Daelan_XP2";}
else if ( nVoice == 412 ){sName = "Tomi_XP2";}
else if ( nVoice == 413 ){sName = "Valen_Shadowbreath";}
else if ( nVoice == 418 ){sName = "The_Good_Wizard";}
else if ( nVoice == 419 ){sName = "The_Typical_Fighter";}
else if ( nVoice == 420 ){sName = "The_Archer";}
else if ( nVoice == 421 ){sName = "Halfing_Rogue";}
else if ( nVoice == 422 ){sName = "The_Healer";}
else if ( nVoice == 426 ){sName = "Grovel";}
else if ( nVoice == 431 ){sName = "Berger";}
else if ( nVoice == 432 ){sName = "Halaster";}
else if ( nVoice == 434 ){sName = "Armand";}
else if ( nVoice == 436 ){sName = "Drow_Seer";}
else if ( nVoice == 437 ){sName = "Drow_Imloth";}
else if ( nVoice == 438 ){sName = "Drow_Matron2";}
else if ( nVoice == 439 ){sName = "Boatman";}
else if ( nVoice == 440 ){sName = "Slave_Leader";}
else if ( nVoice == 901 ){sName = "GenericAlien";}
else if ( nVoice == 902 ){sName = "Aqualish";}
else if ( nVoice == 903 ){sName = "AssassinDroid";}
else if ( nVoice == 905 ){sName = "Bith";}
else if ( nVoice == 906 ){sName = "Chandra";}
else if ( nVoice == 908 ){sName = "DarkJediMale";}
else if ( nVoice == 909 ){sName = "Devaronian";}
else if ( nVoice == 910 ){sName = "Droid";}
else if ( nVoice == 911 ){sName = "Duro1";}
else if ( nVoice == 912 ){sName = "Duro2";}
else if ( nVoice == 913 ){sName = "Gamorean";}
else if ( nVoice == 914 ){sName = "Gand";}
else if ( nVoice == 915 ){sName = "Gran";}
else if ( nVoice == 921 ){sName = "RodianMale";}
else if ( nVoice == 922 ){sName = "MandalorianA";}
else if ( nVoice == 923 ){sName = "MandalorianB";}
else if ( nVoice == 924 ){sName = "MedicalDroid";}
else if ( nVoice == 925 ){sName = "Nikto";}
else if ( nVoice == 926 ){sName = "RepSoldier";}
else if ( nVoice == 927 ){sName = "RepublicOff";}
else if ( nVoice == 929 ){sName = "SithAssassin";}
else if ( nVoice == 931 ){sName = "SithMale";}
else if ( nVoice == 932 ){sName = "SithSoldier";}
else if ( nVoice == 934 ){sName = "Sullustan";}
else if ( nVoice == 935 ){sName = "TankDroid";}
else if ( nVoice == 936 ){sName = "ToughRodian";}
else if ( nVoice == 937 ){sName = "ToughTwilek";}
else if ( nVoice == 938 ){sName = "Trandoshan";}
else if ( nVoice == 940 ){sName = "TwilekMale";}
else if ( nVoice == 941 ){sName = "TwilekMaleB";}
else if ( nVoice == 942 ){sName = "weequay";}
else if ( nVoice == 943 ){sName = "Wookie";}
else if ( nVoice == 944 ){sName = "HK47";}

return sName;
}

void DeathLoot(location lLoc, string sTag)
{
    //int nRare = Random(50);
    int nRoll = Random(10)+1;    object oPrize,oCorpse, oChest;
    /*if (nRare == 10)
        {
        nRoll = Random(28)+1;
        oChest = GetObjectByTag("LOOT_unique");
        }

    else */if (GetIsObjectValid(GetObjectByTag("LOOT_"+sTag)) == TRUE)
        {
        oChest = GetObjectByTag("LOOT_"+sTag);
        }
    else
        {
        oChest = GetObjectByTag("LOOT_other");
        }
                       if (GetLootable(oCorpse) == FALSE)
                        {
                        SetLootable(oCorpse, TRUE);
                        }
    if (GetIsObjectValid(oChest) == TRUE)
        {
            object oCrap = GetFirstItemInInventory(oChest);
            int nItemCount = 0;
            while (GetIsObjectValid(oCrap) == TRUE && nItemCount < nRoll)
                {
                nItemCount = nItemCount +1;
                if (nItemCount == nRoll)
                    {
                    oCorpse = CreateObject(OBJECT_TYPE_PLACEABLE, "loot_corpse", lLoc);
                    if (GetLootable(oCorpse) == FALSE)
                        {
                        SetLootable(oCorpse, TRUE);
                        }
                    oPrize = CopyItem(oCrap, oCorpse, FALSE);
                    if (GetDroppableFlag(oPrize) == FALSE)
                        {
                        SetDroppableFlag(oPrize, TRUE);
                        }
                    }
                oCrap = GetNextItemInInventory(oChest);
                }
        }
if (GetIsObjectValid(GetFirstItemInInventory(oCorpse)) == FALSE && GetIsObjectValid(oCorpse) == TRUE)
    {
    DestroyObject(OBJECT_SELF);
    }
}

int CalculateXP(float fLevel, float fCR)
{
    float fXPModifier, fDiff = fabs(fLevel - fCR), fBonus = (((0.1 * fCR) * 10) / 2);
    if (fCR >= fLevel)
    {
        if (fDiff >= 10.0) fXPModifier = 100.0;
        else if (fDiff >= 5.0 && fDiff < 10.0) fXPModifier = 70.0;
        else if (fDiff >= 4.0 && fDiff < 5.0) fXPModifier = 50.0;
        else if (fDiff >= 3.0 && fDiff < 4.0) fXPModifier = 30.0;

//0 && fDiff < 4.0) fXPModifier = 35.0;
        else if (fDiff >= 2.0 && fDiff < 3.0) fXPModifier = 20.0;
        else if (fDiff >= 1.0 && fDiff < 2.0) fXPModifier = 10.0;
        else fXPModifier = 5.0;
}
    else if (fCR < fLevel)
    {
        if (fDiff >= 4.0) fXPModifier = 0.25;
        else if (fDiff >= 3.0 && fDiff < 4.0) fXPModifier = 0.5;
        else if (fDiff >= 2.0 && fDiff < 3.0) fXPModifier = 1.0;
        else if (fDiff >= 1.0 && fDiff < 2.0) fXPModifier = 1.5;
        else fXPModifier = 2.0;
    }
    return FloatToInt((fXPModifier * 10) + fBonus);
}

int GetArmorType(object oItem)
{
    // Make sure the item is valid and is an armor.
    if (!GetIsObjectValid(oItem))
        return -1;
    if (GetBaseItemType(oItem) != BASE_ITEM_ARMOR)
        return -1;

    // Get the identified flag for safe keeping.
    int bIdentified = GetIdentified(oItem);
    SetIdentified(oItem,FALSE);

    int nType = -1;
    switch (GetGoldPieceValue(oItem))
    {
        case    1: nType = 0; break; // None
        case    5: nType = 1; break; // Padded
        case   10: nType = 2; break; // Leather
        case   15: nType = 3; break; // Studded Leather / Hide
        case  100: nType = 4; break; // Chain Shirt / Scale Mail
        case  150: nType = 5; break; // Chainmail / Breastplate
        case  200: nType = 6; break; // Splint Mail / Banded Mail
        case  600: nType = 7; break; // Half-Plate
        case 1500: nType = 8; break; // Full Plate
    }
    // Restore the identified flag, and return armor type.
    SetIdentified(oItem,bIdentified);
    return nType;
}
void CommerceGuildCheckListDuplicate(string sRank)
{
int x = 1;
string sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x));
string sNext = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x+1));

while (sMerch != "")
    {
    if  (sMerch == sNext)
        {
        SetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x+1), GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x+2)));
        }
    x++;
    sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x));
    sNext = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(x+1));
    }
}



void CommerceGuildRemoveFromListByRank(object oPC, string sRank)
{
string sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_1");
int nMerchCount, z, nCount;

    while (sMerch != "")
        {
        nCount = 0;
        if (sMerch == GetName(oPC))
            {
            nCount = nMerchCount;
            }
        nMerchCount=nMerchCount+1;
        sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(nMerchCount));
        }
    if (nMerchCount>0 && nCount > 0)
        {
        //for (z = nCount; z < (nMerchCount); z++)
        z = nCount;
        while (GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(z)) == "")
            {
            SetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(z), GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(z+1)) );
            z = z+1;
            }
        SetCampaignInt("cmrcgld", "CMRC_"+sRank+"_COUNT", nMerchCount-1);
        }
    else
        {
        SetCampaignInt("cmrcgld", "CMRC_"+sRank+"_COUNT", nMerchCount);
        }
CommerceGuildCheckListDuplicate(sRank);
}

void CommerceGuildAddToListByRank(object oPC, string sRank)
{
string sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_1");
int nMerchCount, z, nCount;

    while (sMerch != "")
        {
        nCount = 0;
        if (sMerch == GetName(oPC))
            {
            nCount = TRUE;
            }
        nMerchCount=nMerchCount+1;
        sMerch = GetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(nMerchCount));
        }
    if (nMerchCount>0 && nCount == FALSE)
        {
        //for (z = nCount; z < (nMerchCount); z++)
        SetCampaignString("cmrcgld", "CMRC_"+sRank+"_"+IntToString(nMerchCount+1), GetName(oPC) );
        SetCampaignInt("cmrcgld", "CMRC_"+sRank+"_COUNT", nMerchCount+1);
        }
     else
        {
        SetCampaignInt("cmrcgld", "CMRC_"+sRank+"_COUNT", nMerchCount);
        }
CommerceGuildCheckListDuplicate(sRank);
}

void CommerceGuildRankCheck(object oPC)
{
int nRank = GetCampaignInt("cmrcgld", "CMRC_RANK", oPC);

if (nRank != 1)
    {
    CommerceGuildRemoveFromListByRank(oPC, "MERCH");
    }
else if (nRank != 2)
    {
    CommerceGuildRemoveFromListByRank(oPC, "PROP");
    }
else if (nRank != 3)
    {
    CommerceGuildRemoveFromListByRank(oPC, "EXEC");
    }
if (nRank == 1)
    {
    CommerceGuildAddToListByRank(oPC, "MERCH");
    }
else if (nRank == 2)
    {
    CommerceGuildAddToListByRank(oPC, "PROP");
    }
else if (nRank == 3)
    {
    CommerceGuildAddToListByRank(oPC, "EXEC");
    }
}

int CustomSkillCheck(int DC, int nSkill, object oTarget)
{
    /*
    Easy = Lvl/4 ...rounded up
    Moderate = 3/Lvl + Lvl ...rounded up
    Difficult = Lvl * 1.5 + 6 ...rounded up
    */
    int nLevel = GetHitDice(OBJECT_SELF);
    int nTest = 0;

    // * July 2
    // * If nLevel is less than 0 or 0 then set it to 1
    if (nLevel <= 0)
    {
        nLevel = 1;
    }

    switch (DC)
    {
    case 0: nTest = nLevel / 4 + 1; break;
        // * minor tweak to lower the values a little
    case 1: nTest = (3 / nLevel + nLevel) - abs( (nLevel/2) -2); break;
    case 2: nTest = FloatToInt(nLevel * 1.5 + 6) - abs( ( FloatToInt(nLevel/1.5) -2));   break;
    }
    //SpeakString(IntToString(nTest));

    // * Roll d20 + skill rank vs. DC + 10
    if (nSkill + d20() >= nTest + 10)
    {
       return TRUE;
    }
       return FALSE;
}

//use after a delay to respawn civs, droids, jawas or defenders
void NewDefender(string sTag, location lLoc, object oDead)
    {
    string sSoldier;
    location lLoc;
    int nScan = FALSE;
    string sBase = GetStringLeft(sTag, 9);
    string sFaction = GetCampaignString("starwars", sBase+"_CONTROL");
    if (GetStringLeft(sTag, 5) == "droid")
        {
        sSoldier =  "pug_droid";
        }
    else if(GetStringLeft(sTag, 8) == "civilian")
        {
        if (Random(10) < 6)
            {
            sSoldier =  "civilian";
            }
        else
            {
            sSoldier =  "civilianf";
            }
        }
    else if(GetStringLeft(sTag, 4) == "jawa")
        {
        sSoldier =  "jawa";
        }
    else if (sFaction == "Empire" && GetStringLeft(sTag, 5) != "droid" && GetStringLeft(sTag, 8) != "civilian" && GetStringLeft(sTag, 4) == "jawa")
        {
        nScan = TRUE;
        if (GetStringRight(sTag, 2) == "_2" && GetIsAreaInterior(GetArea(GetWaypointByTag(sBase+"_SPAWN"))) == FALSE)
            {
            sSoldier = "dfnd_atst";
            }
        else if (GetStringLeft(sBase, 7) == "rhenvar")
            {
            sSoldier =  "dfnd_snowtroop";
            }
        else {sSoldier="dfnd_stormtroop";}
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        }
    else if (sFaction == "Rebels" && GetStringLeft(sTag, 5) != "droid" && GetStringLeft(sTag, 8) != "civilian" && GetStringLeft(sTag, 4) == "jawa")
        {
        nScan = TRUE;
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        if (GetStringRight(sTag, 2) == "_2")
            {
            sSoldier = "dfnd_liberator";
            }
        else {sSoldier="dfnd_frefight";}
        }
    else if (sFaction != "Empire" && sFaction != "Rebels" && GetStringLeft(sTag, 5) != "droid" && GetStringLeft(sTag, 8) != "civilian" && GetStringLeft(sTag, 4) == "jawa")
        {
        lLoc = GetLocation(GetWaypointByTag(sBase+"_SPAWN"));
        nScan = TRUE;
        if (GetStringLeft(sBase, 7) == "rhenvar")
            {
            sSoldier =  "dfnd_battledroid";
            }
        else if (GetStringLeft(sBase, 7) == "iridnia")
            {
            sSoldier = "dfnd_localzabrak";
            }
        else if (GetStringLeft(sBase, 7) == "bespinn")
            {
            sSoldier = "bespinwingguar";
            }
        else {sSoldier="dfnd_localguard";}
        }

    object oDefender = CreateObject(OBJECT_TYPE_CREATURE, sSoldier, lLoc, FALSE, sTag);
    if(nScan == TRUE)
        {
        object oPC = GetFirstPC();
        string sNPC = GetNPCFaction(oDefender);
        string sPC;
        //DestroyObject(OBJECT_SELF);
        while (GetIsObjectValid(oPC) == TRUE)
            {
            sPC = GetFaction(oPC, TRUE);
            if (sNPC != sPC && sNPC != "Fringe" && sPC != "Fringe")
                {
                ExecuteScript("pug_fac_set", oPC);
                }
            oPC = GetNextPC();
            }
        }
    }

//used for repairing capital ships' systems.
void RepairUnit(object oShip, object oUnit)
{
string sUnit = GetTag(oUnit);
int nHeal = GetLocalInt(oUnit, "REPAIR");
int nHP = GetLocalInt(oShip, sUnit);
int nMax = GetLocalInt(oUnit, "MAX_POWER");

//if the unit is already fully repaired
if (nHP >= nMax)
    {
    AssignCommand(oUnit, SpeakString("System Fully Repaired", TALKVOLUME_TALK));
    nHeal = 0;
    SetLocalInt(oUnit, "REPAIR", nHeal);
    }
//if the unit is damaged less than the amount it is being repaired
else if (nHP < nMax && nHP+10 >= nMax && nHeal > 0)
    {
    AssignCommand(oUnit, SpeakString("Repair Complete", TALKVOLUME_TALK));
    SetLocalInt(oShip, sUnit, nMax);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nMax-nHP), oShip);
    nHeal = 0;
    SetLocalInt(oUnit, "REPAIR", nHeal);
    }
//total damage is greater than the amount it is being repaired
else if (nHP < nMax && nHP+10 < nMax && nHeal >= 10)
    {
    SetLocalInt(oShip, sUnit, nHP+10);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(10), oShip);
    nHeal = nHeal-10;
    SetLocalInt(oUnit, "REPAIR", nHeal);
    DelayCommand(8.0, RepairUnit(oShip, oUnit));
    }
else if (nHP < nMax && nHP+10 < nMax && nHeal > 0)
    {
    SetLocalInt(oShip, sUnit, nHP+10);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(10), oShip);
    nHeal = 0;
    SetLocalInt(oUnit, "REPAIR", nHeal);
    AssignCommand(oUnit, SpeakString("Repair Complete", TALKVOLUME_TALK));
    }
if (GetLocalInt(oUnit, "BROKEN") == TRUE && (IntToFloat(nHP)/IntToFloat(nMax)) > 0.2)
    {
    SetLocalInt(oUnit, "BROKEN", FALSE);
    AssignCommand(oUnit, SpeakString("System Reactivated", TALKVOLUME_TALK));
    if (GetStringRight(sUnit, 8) == "_ENGINES")
        {
        effect eStop = GetFirstEffect(oShip);
            while (GetIsEffectValid(eStop))
                {
                if (GetEffectType(eStop) == EFFECT_TYPE_PARALYZE)
                    {
                    RemoveEffect(oShip, eStop);
                    }
                eStop = GetNextEffect(oShip);
                }
        }
    else if (GetStringRight(sUnit, 8) == "_WEAPONS")
        {
        //DestroyObject(GetItemPossessedBy(oShip, "pug_no_attack"));
        //object oGun = CreateItemOnObject("ser_shipgun_bomb", oShip);
        //AssignCommand(oShip, ActionEquipItem(oGun, INVENTORY_SLOT_RIGHTHAND));
        }
    }
}

//This is set object oPC neutral to all other PCs
void SetPCNeutral(object oPC)
{
    object oOther = GetFirstPC();
    while (GetIsPC(oOther)==TRUE)
        {
        if (GetIsEnemy(oPC, oOther)==TRUE)
            {
                SetPCLike(oPC, oOther);
            }
        oOther = GetNextPC();
        }
}


//This is used for setting up the positions of racers in a competitive race
void SetTrackStartingPosition(object oMaster, object oPC, int nPos, int nMax)
{
int x = 1;
string sTrack = GetTag(oMaster);
int nFail=0;
object oRacer;
int nToken = 956000;

//see if this person is already signed up to race.
for (x = 1; x < (nMax+1); x++)
    {
    oRacer = GetLocalObject(oMaster, sTrack+"_pos_"+IntToString(x));
    if (oRacer == oPC)
        {
        nFail++;
        }
    if (GetIsObjectValid(oRacer))
        {
        SetCustomToken(nToken+x, "Position "+IntToString(x)+": "+GetName(oRacer));
        }
    else if (GetIsObjectValid(oRacer) == FALSE)
        {
        SetCustomToken(nToken+x, "Position "+IntToString(x)+": Empty");
        }
    }
//if this person is not already racing then sign them up
if (nFail == 0)
    {
    SetLocalObject(oMaster, sTrack+"_pos_"+IntToString(nPos), oPC);
    AssignCommand(oMaster, ActionSpeakString("You are now signed up for position "+IntToString(nPos)+" in the next race", TALKVOLUME_TALK));
    SetCustomToken(nToken+nPos, "Position "+IntToString(nPos)+": "+GetName(oPC));
    }
}


void ClearObjectVariableOnTimer(object oPC, string sVar)
    {
    DeleteLocalObject(oPC, sVar);
    }

//void main (){}
