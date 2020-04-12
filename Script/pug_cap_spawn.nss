#include "pug_inc"
string NameMyShip(string sType)
{
int nRando;
string sName;

if (sType == "ISD")
    {
    nRando = Random(91);
    if(nRando==0){sName="Accuser";}
    else if(nRando==1){sName="Adamant";}
    else if(nRando==2){sName="Adarga";}
    else if(nRando==3){sName="Admonitor";}
    else if(nRando==4){sName="Adjucator";}
    else if(nRando==5){sName="Adjudicator";}
    else if(nRando==6){sName="Agonizer";}
    else if(nRando==7){sName="Allecto";}
    else if(nRando==8){sName="Assassin";}
    else if(nRando==9){sName="Avarice";}
    else if(nRando==10){sName="Avenger";}
    else if(nRando==11){sName="Badi Dea";}
    else if(nRando==12){sName="Basilisk";}
    else if(nRando==13){sName="Bellicose";}
    else if(nRando==14){sName="Chimaera";}
    else if(nRando==15){sName="Colosses";}
    else if(nRando==16){sName="Conqueror";}
    else if(nRando==17){sName="Conquest";}
    else if(nRando==18){sName="Courageous";}
    else if(nRando==19){sName="Crynyd";}
    else if(nRando==20){sName="Death's Head";}
    else if(nRando==21){sName="Devastator";}
    else if(nRando==22){sName="Direption";}
    else if(nRando==23){sName="Emancipator";}
    else if(nRando==24){sName="Emperor's Revenge";}
    else if(nRando==25){sName="Emperor's Will";}
    else if(nRando==26){sName="Engager";}
    else if(nRando==27){sName="Entor";}
    else if(nRando==28){sName="Eviscerator";}
    else if(nRando==29){sName="Freedom";}
    else if(nRando==30){sName="Firestorm";}
    else if(nRando==31){sName="Gauntlet";}
    else if(nRando==32){sName="Garrett";}
    else if(nRando==33){sName="Glory";}
    else if(nRando==34){sName="Gnisnal";}
    else if(nRando==35){sName="Gorgon";}
    else if(nRando==36){sName="Grey Wolf";}
    else if(nRando==37){sName="Hammer";}
    else if(nRando==38){sName="Hydra";}
    else if(nRando==39){sName="Inflexible";}
    else if(nRando==40){sName="Intrepid";}
    else if(nRando==41){sName="Immortal";}
    else if(nRando==42){sName="Imperator";}
    else if(nRando==43){sName="Inexorable";}
    else if(nRando==44){sName="Interrogator";}
    else if(nRando==45){sName="Invincible";}
    else if(nRando==46){sName="Judicator";}
    else if(nRando==47){sName="Kreiger";}
    else if(nRando==48){sName="Leonides";}
    else if(nRando==49){sName="Majestic";}
    else if(nRando==50){sName="Malice";}
    else if(nRando==51){sName="Manticore";}
    else if(nRando==52){sName="Monarch";}
    else if(nRando==53){sName="Moonshadow";}
    else if(nRando==54){sName="Nemesis";}
    else if(nRando==55){sName="Nihil";}
    else if(nRando==56){sName="Nitsa";}
    else if(nRando==57){sName="Peremptory";}
    else if(nRando==58){sName="Predator";}
    else if(nRando==59){sName="Pulsar";}
    else if(nRando==60){sName="Punisher";}
    else if(nRando==61){sName="Rage";}
    else if(nRando==62){sName="Rebel Dream";}
    else if(nRando==63){sName="Reckoning";}
    else if(nRando==64){sName="Red Gauntlet";}
    else if(nRando==65){sName="Redoubtable";}
    else if(nRando==66){sName="Relentless";}
    else if(nRando==67){sName="Reliance";}
    else if(nRando==68){sName="Render";}
    else if(nRando==69){sName="Resolution";}
    else if(nRando==70){sName="Retribution";}
    else if(nRando==71){sName="Reyna";}
    else if(nRando==72){sName="Riesa";}
    else if(nRando==73){sName="Skyhook";}
    else if(nRando==74){sName="Stalker";}
    else if(nRando==75){sName="Steadfast";}
    else if(nRando==76){sName="Stormhawk";}
    else if(nRando==77){sName="Thunderflare";}
    else if(nRando==78){sName="Thunderer";}
    else if(nRando==79){sName="Tiger";}
    else if(nRando==80){sName="Tormentor";}
    else if(nRando==81){sName="Triumph";}
    else if(nRando==82){sName="Tyrant";}
    else if(nRando==83){sName="Ultima";}
    else if(nRando==84){sName="Vanguard";}
    else if(nRando==85){sName="Vendetta";}
    else if(nRando==86){sName="Vengeance";}
    else if(nRando==87){sName="Virulence";}
    else if(nRando==88){sName="Warrior";}
    else if(nRando==89){sName="Whirlwind";}
    else if(nRando==90){sName="Wolf's Claw";}
    }
else if (sType == "MCC")
    {
    nRando = Random(17);
    if(nRando==0){sName="Ardent";}
    else if(nRando==1){sName="Independence";}
    else if(nRando==2){sName="Cathleen";}
    else if(nRando==3){sName="Columbia";}
    else if(nRando==4){sName="Defiance";}
    else if(nRando==5){sName="Excelsior";}
    else if(nRando==6){sName="Galactic Voyager";}
    else if(nRando==7){sName="Mon Delindo";}
    else if(nRando==8){sName="Kon Karren";}
    else if(nRando==9){sName="Mon Remonda";}
    else if(nRando==10){sName="Liberty IV";}
    else if(nRando==11){sName="Lutdze";}
    else if(nRando==12){sName="Lulsia";}
    else if(nRando==13){sName="Victory IX";}
    else if(nRando==14){sName="Victory VII";}
    else if(nRando==15){sName="Liberty III";}
    else if(nRando==16){sName="Liberty X";}
    }
return sName;
}

void main()
{
string sFaction = GetTag(OBJECT_SELF);
string sBase;
if (sFaction == "PL_S_ISD")
    {
    sBase = "pug_isd_1";
    }
else if (sFaction == "PL_S_MCC")
    {
    sBase = "pug_mcc_1";
    }

    //SetUpBase(sBase, 13);
string sShip = GetStringRight(GetTag(OBJECT_SELF), 3);

SetName(OBJECT_SELF, "The "+NameMyShip(sShip));

SetLocalInt(OBJECT_SELF, sShip+"_SUPPORT", 3000);
SetLocalInt(OBJECT_SELF, sShip+"_ENGINES", 2000);
SetLocalInt(OBJECT_SELF, sShip+"_WEAPONS", 2000);
SetLocalInt(OBJECT_SELF, sShip+"_SHIELDS", 2000);

SetLocalInt(GetObjectByTag(sShip+"_SUPPORT"), "BROKEN", FALSE);
SetLocalInt(GetObjectByTag(sShip+"_ENGINES"), "BROKEN", FALSE);
SetLocalInt(GetObjectByTag(sShip+"_WEAPONS"), "BROKEN", FALSE);
SetLocalInt(GetObjectByTag(sShip+"_SHIELDS"), "BROKEN", FALSE);

effect eElec = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_ELECTRICAL);
effect ePierce = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_PIERCING);
effect eFire = EffectDamageIncrease(DAMAGE_BONUS_20, DAMAGE_TYPE_FIRE);
effect eLink = EffectLinkEffects(eElec, ePierce);
eLink = EffectLinkEffects(eLink, eFire);
ApplyEffectToObject(DURATION_TYPE_PERMANENT, eLink, OBJECT_SELF);
}
