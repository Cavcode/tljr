#include "nono_inc"
#include "common_functions"
//#include "nwnx_funcs"
//void main(){}

const string FATIGUE = "fatigue";
const string FATIGUE_RECUPERATION = "fatigue_recup";
const float TAUX_RECUPERATION_SECONDES = 30.0f;
const string FORME_COMBAT = "forme_combat";
const string FORME_PERMET_SABRE_LASER = "sl_permis";
const int SABRE_LASER_AUCUN = 0;
const int SABRE_LASER_SIMPLE = 1;
const int SABRE_LASER_GRAND = 2;
const int SABRE_LASER_SIMPLE_ET_GRAND = 3;
const int SABRE_LASER_DEUX = 4;
const int SABRE_LASER_DOUBLE = 8;
const int SABRE_LASER_TOUS = 15;
const int DC_CONCENTRATION_FATIGUE_EN_COMBAT = 30;
const int DC_CONCENTRATION_FATIGUE_HORS_COMBAT = 20;
const string TELEKINESIE_CIBLE = "telekinesie_cible";
const string PARALYSIE_CIBLE = "vador_cible";
const string TELEPATHIE_PJ = "telepathe_pj";
const string TELEPATHE_PNJ = "telepathe_pnj";
const string TELEPATHIE_CIBLE = "telepathe_cible";
const string NB_FORME_COMBAT_DESACTIVEE = "nb_forme_stop";
const string NB_TRANSE_COMBAT_DESACTIVEE = "nb_transe_stop";
const string TRANSE_COMBAT_ACTIVEE = "transe_activee";
const string NB_DIVINATION_DESACTIVEE = "nb_divination_stop";
const string DIVINATION_ACTIVEE = "divination_activee";
const string NB_SENTIR_VIE_DESACTIVEE = "nb_sentirvie_stop";
const string SENTIR_VIE_ACTIVEE = "sentirvie_activee";
const int PATTERN_LISTEN_TELEKINESIE = 2001;
const string SL_COULEUR = "sl_color";
const string SL_TYPE = "sl_type";
const int SL_COULEUR_ORANGE = 1;
const int SL_COULEUR_BLEU = 2;
const int SL_COULEUR_VERT = 3;
const int SL_COULEUR_ROUGE = 4;
const int SL_COULEUR_JAUNE = 5;
const int SL_COULEUR_VIOLET = 6;
const int SL_COULEUR_CYAN = 7;
const int SL_TYPE_SIMPLE = 1;
const int SL_TYPE_GRAND = 2;
const int SL_TYPE_DOUBLE = 3;
const int POIDS_PETIT = 15;
const int POIDS_MOYEN = 50;
const int POIDS_LOURDS = 150;


const float MULT_FATIGUE_MAITRISE_FORME_COMBAT_1 = 0.75;
const float MULT_FATIGUE_MAITRISE_FORME_COMBAT_2 = 0.5;
const float MULT_FATIGUE_MAITRISE_FORME_COMBAT_3 = 0.75;

const int BONUS_DUREE_MAITRISE_FORME_COMBAT_1 = 3;
const int BONUS_DUREE_MAITRISE_FORME_COMBAT_2 = 7;
const int BONUS_DUREE_MAITRISE_FORME_COMBAT_3 = 10;

const int MALUS_FORCE_FORME_COMBAT_1 = 1;
const int MALUS_FORCE_FORME_COMBAT_2 = 2;
const int MALUS_FORCE_FORME_COMBAT_3 = 4;
const int MALUS_FORCE_FORME_COMBAT_4 = 7;
const int MALUS_FORCE_FORME_COMBAT_5 = 7;
const int MALUS_FORCE_FORME_COMBAT_6 = 0;
const int MALUS_FORCE_FORME_COMBAT_7 = 15;
const int MALUS_FORCE_FORME_COMBAT_8 = 5;
const int MALUS_FORCE_FORME_COMBAT_9 = 2;
const int MALUS_FORCE_FORME_COMBAT_10 = 7;
const int MALUS_FORCE_FORME_COMBAT_11 = 20;

const int SABRE_LASER_FORME_COMBAT_1 = SABRE_LASER_AUCUN;
const int SABRE_LASER_FORME_COMBAT_2 = SABRE_LASER_AUCUN;
const int SABRE_LASER_FORME_COMBAT_3 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_4 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_5 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_6 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_7 = SABRE_LASER_SIMPLE_ET_GRAND;
const int SABRE_LASER_FORME_COMBAT_8 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_9 = SABRE_LASER_TOUS;
const int SABRE_LASER_FORME_COMBAT_10 = SABRE_LASER_DEUX;
const int SABRE_LASER_FORME_COMBAT_11 = SABRE_LASER_DOUBLE;

const int DIFFICULTE_GUERISON_1_CONTROLE = 8;       // ForceCure1
const int DIFFICULTE_GUERISON_2_CONTROLE = 12;      // ForceCure2
const int DIFFICULTE_GUERISON_3_CONTROLE = 16;      // ForceCure3
const int DIFFICULTE_GUERISON_4_CONTROLE = 22;      // ForceCure4
const int DIFFICULTE_POUSSEE_1_ALTERATION = 10;
const int DIFFICULTE_POUSSEE_2_ALTERATION = 14;
const int DIFFICULTE_POUSSEE_3_ALTERATION = 18;
const int DIFFICULTE_POUSSEE_4_ALTERATION = 22;
const int DIFFICULTE_FORME_COMBAT_1_CONTROLE = 8;
const int DIFFICULTE_FORME_COMBAT_1_SENS = 8;
const int DIFFICULTE_FORME_COMBAT_2_CONTROLE = 10;
const int DIFFICULTE_FORME_COMBAT_2_SENS = 10;
const int DIFFICULTE_FORME_COMBAT_3_CONTROLE = 10;
const int DIFFICULTE_FORME_COMBAT_3_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_4_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_4_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_5_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_5_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_6_CONTROLE = 15;
const int DIFFICULTE_FORME_COMBAT_6_SENS = 20;
const int DIFFICULTE_FORME_COMBAT_7_CONTROLE = 30;
const int DIFFICULTE_FORME_COMBAT_7_SENS = 30;
const int DIFFICULTE_FORME_COMBAT_8_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_8_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_9_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_9_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_10_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_10_SENS = 15;
const int DIFFICULTE_FORME_COMBAT_11_CONTROLE = 20;
const int DIFFICULTE_FORME_COMBAT_11_SENS = 20;
const int DIFFICULTE_REGENERATION_1_CONTROLE = 8;
const int DIFFICULTE_REGENERATION_2_CONTROLE = 12;
const int DIFFICULTE_REGENERATION_3_CONTROLE = 15;
const int DIFFICULTE_REGENERATION_4_CONTROLE = 20;
const int DIFFICULTE_SOINS_1_CONTROLE = 15;       // ForceHeal1
const int DIFFICULTE_SOINS_1_ALTERATION = 10;     // ForceHeal1
const int DIFFICULTE_SOINS_2_CONTROLE = 20;       // ForceHeal2
const int DIFFICULTE_SOINS_2_ALTERATION = 15;     // ForceHeal2
const int DIFFICULTE_SOINS_3_CONTROLE = 25;       // ForceHeal3
const int DIFFICULTE_SOINS_3_ALTERATION = 20;     // ForceHeal3
const int DIFFICULTE_SOINS_4_CONTROLE = 30;       // ForceHeal4
const int DIFFICULTE_SOINS_4_ALTERATION = 25;     // ForceHeal4
const int DIFFICULTE_DISCRETION_1_ALTERATION = 8;      // ForceConcealment1
const int DIFFICULTE_DISCRETION_2_ALTERATION = 15;     // ForceConcealment2
const int DIFFICULTE_DISCRETION_3_ALTERATION = 20;     // ForceConcealment3
const int DIFFICULTE_DISCRETION_4_ALTERATION = 25;     // ForceConcealment4
const int DIFFICULTE_FOUDRE_1_ALTERATION = 8;          // ForceLightning1
const int DIFFICULTE_FOUDRE_2_ALTERATION = 12;         // ForceLightning2
const int DIFFICULTE_FOUDRE_3_ALTERATION = 15;         // ForceLightning3
const int DIFFICULTE_FOUDRE_4_ALTERATION = 20;         // ForceLightning4
const int DIFFICULTE_CONCENTRATION_CONTROLE = 5;
const int DIFFICULTE_ABSORBER_DISSIPER_1_CONTROLE = 15;     // ForceAbsorbEnergy1
const int DIFFICULTE_ABSORBER_DISSIPER_2_CONTROLE = 20;     // ForceAbsorbEnergy2
const int DIFFICULTE_ABSORBER_DISSIPER_3_CONTROLE = 25;     // ForceAbsorbEnergy3
const int DIFFICULTE_ABSORBER_DISSIPER_4_CONTROLE = 30;     // ForceAbsorbEnergy4
const int DIFFICULTE_RAPIDITE_1_CONTROLE = 10;
const int DIFFICULTE_RAPIDITE_2_CONTROLE = 20;
const int DIFFICULTE_RAPIDITE_3_CONTROLE = 25;
const int DIFFICULTE_RAPIDITE_4_CONTROLE = 30;
const int DIFFICULTE_PERCEPTION_1_CONTROLE = 10;
const int DIFFICULTE_PERCEPTION_1_SENS = 10;
const int DIFFICULTE_PERCEPTION_2_CONTROLE = 15;
const int DIFFICULTE_PERCEPTION_2_SENS = 15;
const int DIFFICULTE_PERCEPTION_3_CONTROLE = 20;
const int DIFFICULTE_PERCEPTION_3_SENS = 20;
const int DIFFICULTE_VOLONTE_1_ALTERATION = 10;            // ForceSuggestion1
const int DIFFICULTE_VOLONTE_2_ALTERATION = 12;           // ForceSuggestion2
const int DIFFICULTE_VOLONTE_3_ALTERATION = 15;           // ForceSuggestion3
const int DIFFICULTE_TELEKINESIE_1_ALTERATION = 7;
const int DIFFICULTE_TELEKINESIE_2_ALTERATION = 10;
const int DIFFICULTE_TELEKINESIE_3_ALTERATION = 12;
const int DIFFICULTE_TELEKINESIE_4_ALTERATION = 20;
const int DIFFICULTE_FURIE_1_ALTERATION = 15;
const int DIFFICULTE_FURIE_2_ALTERATION = 25;
const int DIFFICULTE_FURIE_3_ALTERATION = 30;
const int DIFFICULTE_SAUT_CONTROLE = 15;       // ForceJump
const int DIFFICULTE_INFLUENCER_ESPRIT_SENS = 30;
const int DIFFICULTE_INFLUENCER_ESPRIT_ALTERATION = 30;
const int DIFFICULTE_PSYCHOMANCIE_1_CONTROLE = 10;
const int DIFFICULTE_PSYCHOMANCIE_1_SENS = 10;
const int DIFFICULTE_PSYCHOMANCIE_2_CONTROLE = 12;
const int DIFFICULTE_PSYCHOMANCIE_2_SENS = 12;
const int DIFFICULTE_PSYCHOMANCIE_3_CONTROLE = 15;
const int DIFFICULTE_PSYCHOMANCIE_3_SENS = 15;
const int DIFFICULTE_DIVINATION_SENS = 15;
const int DIFFICULTE_NARCOLEPSY_1_CONTROLE = 10;
const int DIFFICULTE_NARCOLEPSY_1_ALTERATION = 10;
const int DIFFICULTE_NARCOLEPSY_2_CONTROLE = 15;
const int DIFFICULTE_NARCOLEPSY_2_ALTERATION = 15;
const int DIFFICULTE_NARCOLEPSY_3_CONTROLE = 25;
const int DIFFICULTE_NARCOLEPSY_3_ALTERATION = 25;
const int DIFFICULTE_DISEASE_CONTROLE = 10;
const int DIFFICULTE_DISEASE_ALTERATION = 20;
const int DIFFICULTE_POISON_CONTROLE = 10;
const int DIFFICULTE_POISON_ALTERATION = 15;
const int DIFFICULTE_PARALYSIE_CONTROLE = 10;
const int DIFFICULTE_PARALYSIE_ALTERATION = 20;
const int DIFFICULTE_FORCE_AME_1_CONTROLE = 5;
const int DIFFICULTE_FORCE_AME_2_CONTROLE = 10;
const int DIFFICULTE_FORCE_AME_3_CONTROLE = 15;
const int DIFFICULTE_FORCE_AME_4_CONTROLE = 20;
const int DIFFICULTE_SENTIR_VIE_PASSIVE_1_SENS = 8;
const int DIFFICULTE_SENTIR_VIE_PASSIVE_2_SENS = 20;
const int DIFFICULTE_SENTIR_VIE_PASSIVE_3_SENS = 25;
const int DIFFICULTE_SENTIR_VIE_ACTIVE_SENS = 5;
const int DIFFICULTE_SENTIR_FLUX_SENS = 5;
const int DIFFICULTE_ABSORPTION_VIE_1_CONTROLE = 20;    // ForceDrainLife1
const int DIFFICULTE_ABSORPTION_VIE_2_CONTROLE = 25;    // ForceDrainLife2
const int DIFFICULTE_ABSORPTION_VIE_3_CONTROLE = 30;    // ForceDrainLife3
const int DIFFICULTE_TRANSE_COMBAT_1_CONTROLE = 10;
const int DIFFICULTE_TRANSE_COMBAT_2_CONTROLE = 15;
const int DIFFICULTE_TRANSE_COMBAT_3_CONTROLE = 20;
const int DIFFICULTE_TELEPATHIE_SENS = 15;
const int DIFFICULTE_TELEPATHIE_CONTROLE = 15;
const int DIFFICULTE_LIGHTSABER_THROW = 8;
const int DIFFICULTE_CHOKE = 30;
const int DIFFICULTE_FORCE_WEAPON = 8;
const int DIFFICULTE_FORCE_SHIELD = 8;

const int FATIGUE_GUERISON_1 = 1;
const int FATIGUE_GUERISON_2 = 2;
const int FATIGUE_GUERISON_3 = 3;
const int FATIGUE_GUERISON_4 = 5;
const int FATIGUE_POUSSEE_1 = 3;
const int FATIGUE_POUSSEE_2 = 5;
const int FATIGUE_POUSSEE_3 = 6;
const int FATIGUE_POUSSEE_4 = 8;
const int FATIGUE_FORME_COMBAT_1 = 2;
const int FATIGUE_FORME_COMBAT_2 = 3;
const int FATIGUE_FORME_COMBAT_3 = 5;
const int FATIGUE_FORME_COMBAT_4 = 10;
const int FATIGUE_FORME_COMBAT_5 = 10;
const int FATIGUE_FORME_COMBAT_6 = 5;
const int FATIGUE_FORME_COMBAT_7 = 15;
const int FATIGUE_FORME_COMBAT_8 = 12;
const int FATIGUE_FORME_COMBAT_9 = 8;
const int FATIGUE_FORME_COMBAT_10 = 10;
const int FATIGUE_FORME_COMBAT_11 = 15;
const int FATIGUE_REGENERATION_1 = 2;
const int FATIGUE_REGENERATION_2 = 4;
const int FATIGUE_REGENERATION_3 = 6;
const int FATIGUE_REGENERATION_4 = 8;
const int FATIGUE_SOINS_1 = 2;
const int FATIGUE_SOINS_2 = 3;
const int FATIGUE_SOINS_3 = 5;
const int FATIGUE_SOINS_4 = 8;
const int FATIGUE_DISCRETION_1 = 2;
const int FATIGUE_DISCRETION_2 = 3;
const int FATIGUE_DISCRETION_3 = 5;
const int FATIGUE_DISCRETION_4 = 8;
const int FATIGUE_FOUDRE_1 = 2;
const int FATIGUE_FOUDRE_2 = 3;
const int FATIGUE_FOUDRE_3 = 5;
const int FATIGUE_FOUDRE_4 = 10;
const int FATIGUE_CONCENTRATION = 1;
const int FATIGUE_ABSORBER_DISSIPER_1 = 3;
const int FATIGUE_ABSORBER_DISSIPER_2 = 5;
const int FATIGUE_ABSORBER_DISSIPER_3 = 6;
const int FATIGUE_ABSORBER_DISSIPER_4 = 10;
const int FATIGUE_RAPIDITE_1 = 1;
const int FATIGUE_RAPIDITE_2 = 3;
const int FATIGUE_RAPIDITE_3 = 5;
const int FATIGUE_RAPIDITE_4 = 8;
const int FATIGUE_PERCEPTION_1 = 1;
const int FATIGUE_PERCEPTION_2 = 2;
const int FATIGUE_PERCEPTION_3 = 4;
const int FATIGUE_VOLONTE_1 = 2;
const int FATIGUE_VOLONTE_2 = 3;
const int FATIGUE_VOLONTE_3 = 5;
const int FATIGUE_TELEKINESIE_1 = 1;
const int FATIGUE_TELEKINESIE_2 = 2;
const int FATIGUE_TELEKINESIE_3 = 4;
const int FATIGUE_TELEKINESIE_4 = 8;
const int FATIGUE_FURIE_1 = 10;
const int FATIGUE_FURIE_2 = 20;
const int FATIGUE_FURIE_3 = 50;
const int FATIGUE_SAUT = 3;
const int FATIGUE_INFLUENCER_ESPRIT = 5;
const int FATIGUE_PSYCHOMANCIE_1 = 1;
const int FATIGUE_PSYCHOMANCIE_2 = 2;
const int FATIGUE_PSYCHOMANCIE_3 = 3;
const int FATIGUE_DIVINATION = 5;
const int FATIGUE_NARCOLEPSY_1 = 3;
const int FATIGUE_NARCOLEPSY_2 = 5;
const int FATIGUE_NARCOLEPSY_3 = 8;
const int FATIGUE_DISEASE = 3;
const int FATIGUE_POISON = 5;
const int FATIGUE_PARALYSIE = 7;
const int FATIGUE_FORCE_AME_1 = 2;
const int FATIGUE_FORCE_AME_2 = 5;
const int FATIGUE_FORCE_AME_3 = 8;
const int FATIGUE_FORCE_AME_4 = 12;
const int FATIGUE_SENTIR_VIE_PASSIVE_1 = 1;
const int FATIGUE_SENTIR_VIE_PASSIVE_2 = 3;
const int FATIGUE_SENTIR_VIE_PASSIVE_3 = 5;
const int FATIGUE_SENTIR_VIE_ACTIVE = 1;
const int FATIGUE_SENTIR_FLUX = 1;
const int FATIGUE_ABSORPTION_VIE_1 = 3;
const int FATIGUE_ABSORPTION_VIE_2 = 6;
const int FATIGUE_ABSORPTION_VIE_3 = 9;
const int FATIGUE_TRANSE_COMBAT_1 = 1;
const int FATIGUE_TRANSE_COMBAT_2 = 3;
const int FATIGUE_TRANSE_COMBAT_3 = 5;
const int FATIGUE_TELEPATHIE = 2;
const int FATIGUE_LIGHTSABER_THROW = 2;
const int FATIGUE_CHOKE = 10;
const int FATIGUE_FORCE_WEAPON = 3;
const int FATIGUE_FORCE_SHIELD = 3;

const int VISUAL_EFFECT_FORME_COMBAT_1 = VFX_DUR_GLOW_LIGHT_YELLOW;
const int VISUAL_EFFECT_FORME_COMBAT_2 = VFX_DUR_GLOW_LIGHT_BLUE;
const int VISUAL_EFFECT_FORME_COMBAT_3 = VFX_DUR_GLOW_LIGHT_GREEN;
const int VISUAL_EFFECT_FORME_COMBAT_4 = VFX_DUR_GLOW_LIGHT_YELLOW;
const int VISUAL_EFFECT_FORME_COMBAT_5 = VFX_DUR_GLOW_LIGHT_ORANGE;
const int VISUAL_EFFECT_FORME_COMBAT_6 = VFX_DUR_GLOW_LIGHT_GREEN;
const int VISUAL_EFFECT_FORME_COMBAT_7 = VFX_DUR_GLOW_PURPLE;
const int VISUAL_EFFECT_FORME_COMBAT_8 = VFX_DUR_GLOW_YELLOW;
const int VISUAL_EFFECT_FORME_COMBAT_9 = VFX_DUR_GLOW_GREEN;
const int VISUAL_EFFECT_FORME_COMBAT_10 = VFX_DUR_GLOW_BLUE;
const int VISUAL_EFFECT_FORME_COMBAT_11 = VFX_DUR_GLOW_RED;
const int VISUAL_EFFECT_FORCE_WEAPON = VFX_DUR_GLOW_RED;

// DECLARATION
int GetFatigue(object oPC);
void SetFatigue(object oPC,int nValue);
void NoFatigue(object oPC);
// GetForceLevel
int GetNiveauForce(object oPC);
// GetIsLightside
int GetIsFluxLumineux(object oPC);
// GetIsDarkside
int GetIsFluxSombre(object oPC);
// GetForceArmorPenalty
int GetMalusForceArmure(object oPC);
// CalculateForcePowerFatigue
int CalculFatiguePouvoir(object oPC,int nFatiguePouvoir);
// CalculateLightsaberFormFatigue
int CalculFatigueForme(object oPC,int nFatigueForme);
// CalculateLightsaberFormDuration
int CalculBonusDureeForme(object oPC);
// CalculateFatigueRecuperation
float CalculRecuperation(object oPC);
// RecuperateFatigue
void Fatigue_Recuperation(object oPC);
// ActivateFatigueRecuperation
void Activation_Fatigue_Recuperation(object oPC);
// Calculate Force Power Resistance
int BonusResistancePouvoir(object oTarget,int nSkill, int nDonContrePouvoir=0, int nFatigueContrePouvoir=0);
int GetSizeValue(object oTarget);
// Force Cure
void PouvoirJediGuerison(object oPC,int nPouvoirGuerison);
// Force Push
void PouvoirJediPoussee(object oPC, int nPouvoirJediPoussee,object oTarget=OBJECT_INVALID);
location MoveLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f);
int GetSpellIdFormeCombat(int nFormeCombat);
int GetFormeSabreLaserCombat(object oPC);
void CheckFormeSabreLaserCombat(object oPC);
void DesactiverFormeCombatActive(object oPC);
// Deactivate Power
void DesactiverPouvoir(object oPC,int nSpellIdPouvoir);
void PouvoirJediFormeCombat(object oPC,int nFormeCombat);
void MaintenirFormeCombat(object oPC, int nSkillControle, int nSkillSens, int nMalusForce, int nFatigueForme, effect eEffect);
// Remove Poison Disease
void SupprimePoisonMaladie(object oCreature);
// Remove Negative Effects
void SupprimeEffetsNegatifs(object oCreature);
// Force Regeneration
void PouvoirJediRegeneration(object oPC,int nPouvoirRegeneration);
// Force Heal
void PouvoirJediSoins(object oPC,object oTarget,int nPouvoirSoins);
// Force Concealment
void PouvoirJediDiscretion(object oPC,int nPouvoirDiscretion);
// Force Lightning
void PouvoirJediFoudre(object oPC,object oTarget,location lTarget,int nPouvoirFoudre);
// Force Focus
void PouvoirJediConcentration(object oPC);
// Force Absorb Energy
void PouvoirJediAbsorberDissiper(object oPC,int nPouvoirAbsorberDissiper);
// Force Haste
void PouvoirJediRapidite(object oPC,int nPouvoirRapidite);
// Force Enhance Senses
void PouvoirJediPerception(object oPC,int nPouvoirPerception);
// Force Suggestion
void PouvoirJediVolonte(object oPC,int nPouvoirVolonte);
// Force Telekinesis - Pickup Object
void PouvoirJediTelekinesieRamasserObjet(object oPC, object oTarget);
// IsWeapon?
int EstArme(object oItem);
// Put Item in Inventory
void MettreItemDansInventaire(object oItem,object oCreature,int bEquipItem);
// Force Telekinesis - Open/Close Door
void PouvoirJediTelekinesieOuvrirFermerPorte(object oPC, object oTarget);
// Force Telekinesis - Disarm
void PouvoirJediTelekinesieDesarmer(object oPC, object oTarget);
// Move Object
void DeplacerObjet(object oObject, location locLocation);
// Force Telekinesis - Move Object
void PouvoirJediTelekinesieDeplacer(object oPC, object oTarget, location locTarget);
// GetVectorTurnAround
vector GetVectorTournerVers(object oPC, location locTarget);
// Move Placeable
void DeplacerPlacable(object oObject, location locLocation);
// Force Fury
void PouvoirJediFurie(object oPC,int nPouvoirFurie);
// Post Fury Negative Effects
void ContreCoupFurie(object oPC, float fDuration);
// Force Jump
void PouvoirJediSaut(object oPC, location locTarget);
// Force Mind Trick
void PouvoirJediInfluencerEsprit(object oPC, object oTarget);
// Force Psychomancy
void PouvoirJediPsychomancie(object oPC, int nPouvoirPsychomancie);
// Force Divination
void PouvoirJediDivination(object oPC, int nPouvoirDivination);
void Divination(object oPC, int nPouvoirDivination);
void DesactiverDivination(object oPC);
// Detect Traps
void DetectionPiege(object oPC);
// Force Narcolepsy
void PouvoirJediNarcolepsy(object oPC,object oTarget,location locTarget, int nPouvoirNarcolepsy);
// Force Curse - Disease
void PouvoirJediMaladie(object oPC,object oTarget);
// Force Curse - Poison
void PouvoirJediPoison(object oPC,object oTarget);
// Force Curse - Paralysis
void PouvoirJediParalysie(object oPC, object oTarget);
// Paralysis
void Paralysie(object oPC,object oTarget, int nSpellIdParalysie);
// Force Strengthen Mind
void PouvoirJediForceAme(object oPC, int nPouvoirForceAme);
// Force Sense Life - Passive
void PouvoirJediSentirViePassive(object oPC, int nPouvoirSentirViePassive);
// Force Sense Life - Active
void PouvoirJediSentirVieActive(object oPC,int nPouvoirSentirVieActive);
// Deactivate Sense Life - Active
void DesactiverSentirVieActive(object oPC);
// Sense Life
void SentirVie(object oPC, int nPouvoirSentirVieActive);
string GetRacialName(int nRacialType);
// Force Sense Force
void PouvoirJediSentirFlux(object oPC, object oTarget);
// Get Presence of Force Sensitive
float GetPresenceJedi(object oCreature);
// Force Drain Life
void PouvoirJediAbsorptionVie(object oPC,object oTarget, int nPouvoirAbsorptionVie);
// Force Fighting Trance
void PouvoirJediTranseCombat(object oPC,int nPouvoirTranseCombat);
// Fighting Trance
void TranseCombat(object oPC,int nPouvoirTranseCombat,effect eVisual, int bMulti);
// Deactivate Fighting Trance
void DesactiverTranseCombat(object oPC);
// Force Telepathy
void PouvoirJediTelepathie(object oPC);
// Cancel Telepathy
void StopTelepathie(object oPC);
void PowerForceWeapon(object oPC);
void PowerForceShield(object oPC);




int GetFatigue(object oPC) {
    return GetLocalInt(oPC,FATIGUE);
}

void SetFatigue(object oPC,int nValue) {
    SetLocalInt(oPC,FATIGUE,nValue);
    SendMessageToPC(oPC, "Force Fatigue: " + IntToString(nValue));
}

void NoFatigue(object oPC) {
    SetFatigue(oPC,0);
}

// GetForceLevel
int GetNiveauForce(object oPC) {

    int nForce = 0;
    int i;
    for(i=1;i<=3;i++) {

        int nClasse = GetClassByPosition(i,oPC);
        switch(nClasse) {
            case 35:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            nForce = nForce + GetLevelByClass(nClasse,oPC);break;
            default:
            ;
        }
    }
    return nForce;
}

// GetIsLightside
int GetIsFluxLumineux(object oPC) {
    if( (GetLevelByClass(45,oPC) > 0) ||
        (GetLevelByClass(46,oPC) > 0) ||
        (GetLevelByClass(47,oPC) > 0)
      ) {
        return TRUE;
    }
    return FALSE;
}

// GetIsDarkside
int GetIsFluxSombre(object oPC) {
    if( (GetLevelByClass(48,oPC) > 0) ||
        (GetLevelByClass(49,oPC) > 0) ||
        (GetLevelByClass(50,oPC) > 0)
      ) {
        return TRUE;
    }
    return FALSE;
}

int GetMalusForceArmure(object oPC) {
    int nMalus = 0;
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST,oPC);
    if(GetIsObjectValid(oItem) && GetItemACValue(oItem) > 0 ) {
        nMalus = 5 * GetArmorType(oItem);
    }
    return nMalus;
}

int CalculFatiguePouvoir(object oPC,int nFatiguePouvoir) {
    int nFatiguePC = GetFatigue(oPC);
    int nNouvelleFatigue = nFatiguePouvoir;
    if(GetHasFeat(FEAT_SYMBIOSE_FORCE)) {
        nNouvelleFatigue = nNouvelleFatigue / 2;
        //SendMessageToPC(oPC,"Symbiose");
    } else if(GetHasFeat(FEAT_AFFINITE_FORCE)) {
        nNouvelleFatigue = nNouvelleFatigue * 3 / 4;
        //SendMessageToPC(oPC,"Affinite");
    }
    if(GetHasFeat(FEAT_CONSCIENCE_FORCE)) {
        nNouvelleFatigue = nNouvelleFatigue -1;
        //SendMessageToPC(oPC,"Conscience");
    }
    int nDC = 0;
    if(GetIsInCombat(oPC)) {
        nDC = DC_CONCENTRATION_FATIGUE_EN_COMBAT;
    } else {
        nDC = DC_CONCENTRATION_FATIGUE_HORS_COMBAT;
    }
    if(GetIsSkillSuccessful(oPC,SKILL_CONCENTRATION,nDC+nFatiguePC)) {
        nNouvelleFatigue = nNouvelleFatigue/2;
    }
    if(nNouvelleFatigue <= 0) {
        nNouvelleFatigue = 1;
    }
    return nNouvelleFatigue;
}

int CalculFatigueForme(object oPC,int nFatigueForme) {
    int nFatiguePC = GetFatigue(oPC);
    int nNouvelleFatigue = nFatigueForme;
    if(GetHasFeat(FEAT_JEDI_WEAPON_ADEPT)) {
        nNouvelleFatigue = FloatToInt(IntToFloat(nNouvelleFatigue) * MULT_FATIGUE_MAITRISE_FORME_COMBAT_3);
        //SendMessageToPC(oPC,"Expert en combat");
    }
    else if(GetHasFeat(FEAT_JEDI_WEAPON_MASTER)) {
        nNouvelleFatigue = FloatToInt(IntToFloat(nNouvelleFatigue) * MULT_FATIGUE_MAITRISE_FORME_COMBAT_2);
        //SendMessageToPC(oPC,"Grand Maitre d'arme");
    }
    //else if(GetHasFeat(FEAT_MAITRISE_FORME_COMBAT_1)) {
    //    nNouvelleFatigue = FloatToInt(IntToFloat(nNouvelleFatigue) * MULT_FATIGUE_MAITRISE_FORME_COMBAT_1);
    //    //SendMessageToPC(oPC,"Maitre d'arme");
    //}
    if(nNouvelleFatigue <= 0) {
        nNouvelleFatigue = 1;
    }
    return nNouvelleFatigue;
}

int CalculBonusDureeForme(object oPC) {
    if(GetHasFeat(FEAT_JEDI_WEAPON_MASTER)) {
        return BONUS_DUREE_MAITRISE_FORME_COMBAT_3;
    }
    else if(GetHasFeat(FEAT_JEDI_WEAPON_ADEPT)) {
        return BONUS_DUREE_MAITRISE_FORME_COMBAT_2;
    }
    //else if(GetHasFeat(FEAT_MAITRISE_FORME_COMBAT_1)) {
    //    return BONUS_DUREE_MAITRISE_FORME_COMBAT_1;
    //}
    return 0;
}

float CalculRecuperation(object oPC) {
    float fRecuperation = 0.0;
    if(GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_4)) {
        fRecuperation = TAUX_RECUPERATION_SECONDES / 5;
    } else if(GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_3)) {
        fRecuperation = TAUX_RECUPERATION_SECONDES * 2 / 5;
    } else if(GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_2)) {
        fRecuperation = TAUX_RECUPERATION_SECONDES * 3 / 5;
    } else if(GetHasFeat(FEAT_JEDI_HARMONIE_FLUX_1)) {
        fRecuperation = TAUX_RECUPERATION_SECONDES * 4 / 5;
    } else {
        fRecuperation = TAUX_RECUPERATION_SECONDES;
    }

    return fRecuperation;
}

void Fatigue_Recuperation(object oPC) {
    int nFatigue = GetFatigue(oPC);
    if(nFatigue > 0) {
        SetFatigue(oPC,nFatigue-1);
        SendMessageToPC(oPC,"Fatigue reduced by 1");
        float fRecuperation = CalculRecuperation(oPC);
        DelayCommand(fRecuperation,ExecuteScript("jedi_fatig_recup",oPC));
    } else {
        SetLocalInt(oPC,FATIGUE_RECUPERATION,0);
    }
}

void Activation_Fatigue_Recuperation(object oPC) {
    int nFatigue = GetFatigue(oPC);
    if(nFatigue > 0) {
        int bRecuperationActive = GetLocalInt(oPC,FATIGUE_RECUPERATION);
        if(bRecuperationActive == 0) {
            SetLocalInt(oPC,FATIGUE_RECUPERATION,1);
            float fRecuperation = CalculRecuperation(oPC);
            DelayCommand(fRecuperation,ExecuteScript("jedi_fatig_recup",oPC));
        }
    }
}

int BonusResistancePouvoir(object oTarget,int nSkill, int nDonContrePouvoir=0, int nFatigueContrePouvoir=0) {

    int nForce = GetNiveauForce(oTarget);
    if(nForce > 0 && nDonContrePouvoir != 0 && GetHasFeat(nDonContrePouvoir)) {
        int nSkillBonus = GetSkillRank(nSkill, oTarget) / 2;
        int nFatigueResistance = CalculFatiguePouvoir(oTarget,nFatigueContrePouvoir / 2);
        int nFatigue = GetFatigue(oTarget);
        SetFatigue(oTarget,nFatigue + nFatigueResistance);
        Activation_Fatigue_Recuperation(oTarget);
        return nSkillBonus;
    }
    return 0;
}

int GetSizeValue(object oTarget) {
    switch(GetCreatureSize(oTarget)) {
        case CREATURE_SIZE_TINY : return 1;
        case CREATURE_SIZE_SMALL : return 2;
        case CREATURE_SIZE_MEDIUM : return 3;
        case CREATURE_SIZE_LARGE : return 4;
        case CREATURE_SIZE_HUGE : return 5;
        default :
    }
    return 0;
}

void PouvoirJediGuerison(object oPC,int nPouvoirGuerison) {
    int nFatigue = GetFatigue(oPC);
    int nSkillControle = 0;
    int nAmount = 0;
    int nControle = GetSkillRank(SKILL_CONTROL,oPC);
    int nConcentration = GetSkillRank(SKILL_CONCENTRATION, oPC);
    int nFatigueGuerison = 0;
    int nVisual = 0;
    int bHealPoisonMaladie = FALSE;
    int bHealEffetsNegatifs = FALSE;
    switch(nPouvoirGuerison) {
        case 1: nSkillControle = DIFFICULTE_GUERISON_1_CONTROLE; nAmount = d6(2); nFatigueGuerison = FATIGUE_GUERISON_1; nVisual = VFX_IMP_HEALING_S;break;
        case 2: nSkillControle = DIFFICULTE_GUERISON_2_CONTROLE; nAmount = d6(3)+nControle/3; nFatigueGuerison = FATIGUE_GUERISON_2; nVisual = VFX_IMP_HEALING_M;break;
        case 3: nSkillControle = DIFFICULTE_GUERISON_3_CONTROLE; nAmount = d6(4)+nControle/2; nFatigueGuerison = FATIGUE_GUERISON_3; nVisual = VFX_IMP_HEALING_L;bHealPoisonMaladie = TRUE; break;
        case 4: nSkillControle = DIFFICULTE_GUERISON_4_CONTROLE; nAmount = d6(5)+nControle; nFatigueGuerison = FATIGUE_GUERISON_4; nVisual = VFX_IMP_HEALING_L;bHealPoisonMaladie = TRUE; bHealEffetsNegatifs = TRUE; break;
        default:;
    }
    if (nPouvoirGuerison == 1)
    {
        if(GetIsSkillSuccessful(oPC,SKILL_CONCENTRATION,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            effect eHeal = EffectHeal(nAmount);
            effect eVisual = EffectVisualEffect(nVisual);
            effect eLink = EffectLinkEffects(eHeal,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPC);
        }
    }
    else
    {
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            effect eHeal = EffectHeal(nAmount);
            effect eVisual = EffectVisualEffect(nVisual);
            effect eLink = EffectLinkEffects(eHeal,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oPC);
            if(bHealPoisonMaladie) {
                SupprimePoisonMaladie(oPC);
            }
            if(bHealEffetsNegatifs) {
                SupprimeEffetsNegatifs(oPC);
            }
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueGuerison);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void PouvoirJediPoussee(object oPC, int nPouvoirJediPoussee,object oTarget=OBJECT_INVALID) {

    int nSkillAlteration = 0;
    int nFatigue = GetFatigue(oPC);
    int nAmountDice = 0;
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    float fDurationPoussee = RoundsToSeconds(1);
    int bSavingDodge = TRUE;
    int bMultiTarget = FALSE;
    float fRadius = 0.0;
    int nFatiguePoussee = 0;
    int nDCBase = 0;
    location lCurrentLocation;
    location lNewLocation;
    int iDistance = 0;
    effect ePulse = EffectVisualEffect(VFX_IMP_PULSE_WIND);
    switch(nPouvoirJediPoussee) {
        case 1: nSkillAlteration = DIFFICULTE_POUSSEE_1_ALTERATION; nDCBase = 10; nAmountDice = 1; nFatiguePoussee = FATIGUE_POUSSEE_1; iDistance = 2; break;
        case 2: nSkillAlteration = DIFFICULTE_POUSSEE_2_ALTERATION; nDCBase = 15; nAmountDice = 2; nFatiguePoussee = FATIGUE_POUSSEE_2; iDistance = 4; break;
        case 3: nSkillAlteration = DIFFICULTE_POUSSEE_3_ALTERATION; nDCBase = 10; nAmountDice = 3; bMultiTarget = TRUE; fRadius = IntToFloat(10); nFatiguePoussee = FATIGUE_POUSSEE_3; iDistance = 2; break;
        case 4: nSkillAlteration = DIFFICULTE_POUSSEE_4_ALTERATION; nDCBase = 15; nAmountDice = 5; bMultiTarget = TRUE; fRadius = IntToFloat(15); nFatiguePoussee = FATIGUE_POUSSEE_4; iDistance = 4; break;
        default:;
    }
    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
        if(!bMultiTarget) {
            int nBonusResistance = BonusResistancePouvoir(oTarget,SKILL_CONTROL,FEAT_JEDI_SAUT,FATIGUE_SAUT/2);
            if(GetIsSkillSuccessful(oPC,SKILL_ALTER,GetSizeValue(oTarget)*5+nBonusResistance+nFatigue+GetMalusForceArmure(oPC))) {

                int nDC = nDCBase + GetSkillRank(SKILL_ALTER,oPC) + nBonusResistance;
                SignalEvent(oTarget, EventSpellCastAt(oPC, GetSpellId()));
                if(!bSavingDodge || (ReflexSave(oTarget,nDC) == 0)) {
                    effect eKnock = EffectKnockdown();
                    lCurrentLocation = GetLocation(oTarget);
                    lNewLocation = MoveLocation(lCurrentLocation,GetFacing(oPC),IntToFloat(iDistance));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eKnock,oTarget,fDurationPoussee);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, ePulse, oTarget);
                    DelayCommand(0.2,AssignCommand(oTarget,ActionJumpToLocation(lNewLocation)));
                    effect eDamage = EffectDamage(d6(nAmountDice),DAMAGE_TYPE_BLUDGEONING);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget);
                }
            }
        }
        else {
            location locPC = GetLocation(oPC);
            effect eKnock = EffectKnockdown();
            oTarget = GetFirstObjectInShape(SHAPE_SPHERE,fRadius,locPC);
            while( oTarget != oPC &&
                   GetIsObjectValid(oTarget) &&
                   ( GetIsReactionTypeHostile(oTarget,oPC) ||
                     (GetIsReactionTypeNeutral(oTarget,oPC) && GetIsPC(oTarget))
                   )
                 ) {
                if(GetIsSkillSuccessful(oPC,SKILL_ALTER,GetSizeValue(oTarget)*5+nFatigue+GetMalusForceArmure(oPC))) {
                    int nDC = nDCBase + GetSkillRank(SKILL_ALTER,oPC) - BonusResistancePouvoir(oTarget,SKILL_CONTROL,FEAT_JEDI_SAUT,FATIGUE_SAUT/2);
                    SignalEvent(oTarget, EventSpellCastAt(oPC, GetSpellId()));
                    if(oTarget != oPC &&
                       ( GetIsReactionTypeHostile(oTarget,oPC) ||
                         (GetIsReactionTypeNeutral(oTarget,oPC) && GetIsPC(oTarget))
                       ) &&
                       ( !bSavingDodge ||
                         (ReflexSave(oTarget,nDC) == 0)
                       )
                      ){
                        lCurrentLocation = GetLocation(oTarget);
                        lNewLocation = MoveLocation(lCurrentLocation,GetFacing(oPC),IntToFloat(iDistance));
                        DelayCommand(0.2f,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eKnock,oTarget,fDurationPoussee));
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, ePulse, oTarget);
                        DelayCommand(0.2,AssignCommand(oTarget,ActionJumpToLocation(lNewLocation)));
                        effect eDamage = EffectDamage(d6(nAmountDice),DAMAGE_TYPE_BLUDGEONING);
                        DelayCommand(0.2f,ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget));
                    }
                    oTarget = GetNextObjectInShape(SHAPE_SPHERE,fRadius,locPC);
                }
            }
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatiguePoussee);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}

location MoveLocation(location lCurrent,float fDirection,float fDistance,float fOffFacing = 0.0,float fOffZ = 0.0f)
{
    vector vThrow = fDistance *VectorNormalize( AngleToVector(fDirection));
    vThrow.z += fOffZ;
    return Location( GetAreaFromLocation( lCurrent), GetPositionFromLocation( lCurrent) +vThrow, GetFacingFromLocation( lCurrent) + fOffFacing);
}

int GetSpellIdFormeCombat(int nFormeCombat) {
    switch(nFormeCombat) {
        case 1: return SPELL_JEDI_FORME_COMBAT_1;
        case 2: return SPELL_JEDI_FORME_COMBAT_2;
        case 3: return SPELL_JEDI_FORME_COMBAT_3;
        case 4: return SPELL_JEDI_FORME_COMBAT_4;
        case 5: return SPELL_JEDI_FORME_COMBAT_5;
        case 6: return SPELL_JEDI_FORME_COMBAT_6;
        case 7: return SPELL_JEDI_FORME_COMBAT_7;
        default:;
    }
    return 0;

}

int GetFormeSabreLaserCombat(object oPC) {
    object oArme1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
    object oArme2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND,oPC);
    if(!GetIsObjectValid(oArme1)) {
        return SABRE_LASER_AUCUN;
    }
    if(!GetIsObjectValid(oArme2)) {
        switch(GetBaseItemType(oArme1)) {
            case BASE_ITEM_LIGHTSABER: return SABRE_LASER_SIMPLE;
            case BASE_ITEM_GREATLIGHTSABER: return SABRE_LASER_GRAND;
            case BASE_ITEM_DOUBLELIGHTSABER: return SABRE_LASER_DOUBLE;
        }
    } else {
        if(GetBaseItemType(oArme1) == BASE_ITEM_LIGHTSABER) {
            if(GetBaseItemType(oArme2) == BASE_ITEM_LIGHTSABER) {
                return SABRE_LASER_DEUX;
            } else {
                return SABRE_LASER_SIMPLE;
            }
        }
    }
    return SABRE_LASER_AUCUN;
}

void CheckFormeSabreLaserCombat(object oPC) {
    int nFormeSabreLaser = GetLocalInt(oPC,FORME_PERMET_SABRE_LASER);
    if( nFormeSabreLaser != SABRE_LASER_AUCUN &&
        (nFormeSabreLaser & GetFormeSabreLaserCombat(oPC)) == 0) {
        DesactiverFormeCombatActive(oPC);
    }
}



void DesactiverFormeCombatActive(object oPC) {
    effect eEffect = GetFirstEffect(oPC);
    int bFormeCombatTrouvee = FALSE;
    while(GetIsEffectValid(eEffect)) {
        switch(GetEffectSpellId(eEffect)) {
            case SPELL_JEDI_FORME_COMBAT_1:
            case SPELL_JEDI_FORME_COMBAT_2:
            case SPELL_JEDI_FORME_COMBAT_3:
            case SPELL_JEDI_FORME_COMBAT_4:
            case SPELL_JEDI_FORME_COMBAT_5:
            case SPELL_JEDI_FORME_COMBAT_6:
            case SPELL_JEDI_FORME_COMBAT_7:
            case SPELL_JEDI_FORME_COMBAT_8:
            case SPELL_JEDI_FORME_COMBAT_9:
            case SPELL_JEDI_FORME_COMBAT_10:
            case SPELL_JEDI_FORME_COMBAT_11:
                RemoveEffect(oPC,eEffect);
                bFormeCombatTrouvee = TRUE;
            default:;
        }
        eEffect = GetNextEffect(oPC);
    }
    if(bFormeCombatTrouvee) {
        int nFormeDesactivee = GetLocalInt(oPC,NB_FORME_COMBAT_DESACTIVEE);
        SetLocalInt(oPC,NB_FORME_COMBAT_DESACTIVEE,nFormeDesactivee +1);
    }
}


void DesactiverPouvoir(object oPC,int nSpellIdPouvoir) {

    if(nSpellIdPouvoir != 0) {
        //SendMessageToPC(oPC,"recherche effect de spell id "+IntToString(nSpellIdPouvoir));
        effect ePouvoir = GetFirstEffect(oPC);
        while(GetIsEffectValid(ePouvoir)) {
            if(GetEffectSpellId(ePouvoir) == nSpellIdPouvoir) {
                RemoveEffect(oPC,ePouvoir);
                FloatingTextStringOnCreature("Power Deactivated",oPC,FALSE);
                break;
            }
            ePouvoir = GetNextEffect(oPC);
        }
    }
}

int IsPouvoirActif(object oPC,int nSpellIdPouvoir) {
    effect ePouvoir = GetFirstEffect(oPC);
    while(GetIsEffectValid(ePouvoir)) {
        //SendMessageToPC(oPC,"spell id:"+IntToString(GetEffectSpellId(ePouvoir)));
        if(GetEffectSpellId(ePouvoir) == nSpellIdPouvoir) {
            return TRUE;
        }
        ePouvoir = GetNextEffect(oPC);
    }
    return FALSE;
}

void PouvoirJediFormeCombat(object oPC,int nFormeCombat) {

    int nFatigue = GetFatigue(oPC);
    int nFormeCombatActive = GetLocalInt(oPC,FORME_COMBAT);
    int nSpellIdFormeCombat = GetSpellId();//GetSpellIdFormeCombat(nFormeCombat);
    int bFormeCombatDejaActive = IsPouvoirActif(oPC,nSpellIdFormeCombat);
    if(bFormeCombatDejaActive) {
        DesactiverFormeCombatActive(oPC);
        FloatingTextStringOnCreature("Lightsaber Form Deactivated",oPC,FALSE);
    } else {

        int nSkillControle = 0;
        int nSkillSens = 0;
        int nFatigueForme = 0;
        int nMalusForce = 0;
        int nSabreLaser = 0;
        int bLightBonusBA = FALSE;
        int bLightBonusCA = FALSE;
        int bDarkBonusBA = FALSE;
        int bDarkBonusCA = FALSE;
        switch(nFormeCombat) {
            case 1: nSkillControle = DIFFICULTE_FORME_COMBAT_1_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_1_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_1;nMalusForce = MALUS_FORCE_FORME_COMBAT_1;nSabreLaser = SABRE_LASER_FORME_COMBAT_1;break;
            case 2: nSkillControle = DIFFICULTE_FORME_COMBAT_2_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_2_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_2;nMalusForce = MALUS_FORCE_FORME_COMBAT_2;nSabreLaser = SABRE_LASER_FORME_COMBAT_2;bLightBonusBA = TRUE;bLightBonusCA = TRUE;bDarkBonusBA = TRUE;bDarkBonusCA = TRUE;break;
            case 3: nSkillControle = DIFFICULTE_FORME_COMBAT_3_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_3_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_3;nMalusForce = MALUS_FORCE_FORME_COMBAT_3;nSabreLaser = SABRE_LASER_FORME_COMBAT_3;break;
            case 4: nSkillControle = DIFFICULTE_FORME_COMBAT_4_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_4_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_4;nMalusForce = MALUS_FORCE_FORME_COMBAT_4;nSabreLaser = SABRE_LASER_FORME_COMBAT_4;bLightBonusBA = TRUE;bLightBonusCA = TRUE;break;
            case 5: nSkillControle = DIFFICULTE_FORME_COMBAT_5_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_5_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_5;nMalusForce = MALUS_FORCE_FORME_COMBAT_5;nSabreLaser = SABRE_LASER_FORME_COMBAT_5;bDarkBonusBA = TRUE;bDarkBonusCA = TRUE;break;
            case 6: nSkillControle = DIFFICULTE_FORME_COMBAT_6_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_6_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_6;nMalusForce = MALUS_FORCE_FORME_COMBAT_6;nSabreLaser = SABRE_LASER_FORME_COMBAT_6;break;
            case 7: nSkillControle = DIFFICULTE_FORME_COMBAT_7_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_7_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_7;nMalusForce = MALUS_FORCE_FORME_COMBAT_7;nSabreLaser = SABRE_LASER_FORME_COMBAT_7;bLightBonusBA = TRUE;bLightBonusCA = TRUE;break;
            case 8: nSkillControle = DIFFICULTE_FORME_COMBAT_8_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_8_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_8;nMalusForce = MALUS_FORCE_FORME_COMBAT_8;nSabreLaser = SABRE_LASER_FORME_COMBAT_8;break;
            case 9: nSkillControle = DIFFICULTE_FORME_COMBAT_9_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_9_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_9;nMalusForce = MALUS_FORCE_FORME_COMBAT_9;nSabreLaser = SABRE_LASER_FORME_COMBAT_9;break;
            case 10: nSkillControle = DIFFICULTE_FORME_COMBAT_10_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_10_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_10;nMalusForce = MALUS_FORCE_FORME_COMBAT_10;nSabreLaser = SABRE_LASER_FORME_COMBAT_10;bLightBonusBA = TRUE;bLightBonusCA = TRUE;break;
            case 11: nSkillControle = DIFFICULTE_FORME_COMBAT_11_CONTROLE; nSkillSens = DIFFICULTE_FORME_COMBAT_11_SENS;nFatigueForme = FATIGUE_FORME_COMBAT_11;nMalusForce = MALUS_FORCE_FORME_COMBAT_11;nSabreLaser = SABRE_LASER_FORME_COMBAT_11;bDarkBonusBA = TRUE;bDarkBonusCA = TRUE;break;
            default:break;
        }
        int nFormeSabreLaser = GetFormeSabreLaserCombat(oPC);
        if( (nSabreLaser != SABRE_LASER_AUCUN) &&
            ((nFormeSabreLaser & nSabreLaser) == 0)
          ){
            SendMessageToPC(oPC,"Lightsaber required to use a lightsaber form.");
        } else {

            if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
               GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))
               ) {
                DesactiverFormeCombatActive(oPC);
    //            if(bFormeCombatDejaActive) {
    //                DesactiverPouvoir(oPC,nSpellIdFormeCombat);
    //            }
                int nBonusDuration = GetAbilityModifier(ABILITY_CONSTITUTION,oPC) + GetAbilityModifier(ABILITY_WISDOM,oPC);
                if(nBonusDuration < 0) {
                    nBonusDuration = 0;
                }
                nBonusDuration = nBonusDuration + CalculBonusDureeForme(oPC);
                float fDuration = RoundsToSeconds(3+nBonusDuration);

                int nAttack,nACDeflection,nACDodge,nSkillParry,nSkillTumble;
                int nSkillConcentration,nSkillDiscipline,nAbilityStrenght,nSavingReflex;
                int nConcealment,nSpeed;
                int nACNatural;
                int nSens = GetSkillRank(SKILL_SENSE,oPC);
                int nControle = GetSkillRank(SKILL_CONTROL,oPC);
                int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
                int nTumble = GetSkillRank(SKILL_TUMBLE,oPC);
                int nDexterity = GetAbilityModifier(ABILITY_DEXTERITY,oPC);
                effect eAttack;
                effect eParry;
                effect eTumble;
                effect eConceal;
                effect eAC;
                int nVisualEffect = 0;

                switch(nFormeCombat) {
                    case 1:
                        nAttack = GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 16;
                        nSkillConcentration = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nSkillDiscipline = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nSkillParry = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_1;
                        break;
                    case 2:
                        nAttack = GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 10;
                        nACDodge = GetSkillRank(SKILL_FORCE_DEFENSE, oPC) / 10;
                        nSkillDiscipline = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nSkillParry = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nSavingReflex = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_2;
                        break;
                    case 3:
                        nAttack = -3 + GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 10;
                        nACDodge = GetSkillRank(SKILL_FORCE_DEFENSE, oPC) / 8;
                        nSkillDiscipline = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 10;
                        nSkillParry = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nConcealment = 10;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_3;
                        break;
                    case 4:
                        nAttack = GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 16;
                        nACDodge = GetSkillRank(SKILL_FORCE_DEFENSE, oPC) / 8;
                        nSkillParry = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 7;
                        nSkillTumble = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 5;
                        nConcealment = 10;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_4;
                        break;
                    case 5:
                        nAttack = GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 8;
                        nSkillParry = -10;
                        nSkillConcentration = -5;
                        nAbilityStrenght = GetSkillRank(SKILL_ENHANCE_ABILITY,oPC) / 7;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_5;
                        break;
                    case 6:
                        nACDodge = GetSkillRank(SKILL_FORCE_DEFENSE, oPC) / 10;
                        nSkillParry = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 7;
                        nSavingReflex = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 7;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_6;
                        break;
                    case 7:
                        nAttack = GetSkillRank(SKILL_FORCE_STRIKE, oPC) / 4;
                        nACDodge = GetSkillRank(SKILL_FORCE_DEFENSE, oPC) / 8;
                        nSkillConcentration = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 7;
                        nSavingReflex = GetSkillRank(SKILL_ENHANCE_SENSES,oPC) / 7;
                        nConcealment = 25;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_7;
                        break;
                    case 8:
                        nAttack = GetBaseAttackBonus(oPC) / 10 + nControle / 5 + nTumble / 5;
                        nACDodge = nSens / 4 + nTumble / 4;
                        nSkillTumble = nTumble * 3 / 10 /*30%*/ + nControle / 5;
                        nSavingReflex = nSens / 4 + nTumble / 4;
                        nConcealment = nSens / 2;
                        nSpeed = nControle;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_8;
                        break;
                    case 9:
                        nAttack = GetBaseAttackBonus(oPC) /5/*20%*/ + nSens / 10 + nControle / 10;
                        nACDeflection = nSens / 10 + nControle / 10;
                        nSkillParry = GetSkillRank(SKILL_PARRY,oPC) / 5 /*20%*/ + nSens / 10 + nControle / 10;
                        nConcealment = (nSens + nControle) / 2;
                        nSpeed = 0 - (nSens + nControle) / 2;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_9;
                        break;
                    case 10:
                        nAttack = GetBaseAttackBonus(oPC) / 5 /*20%*/ + nControle / 10 + nDexterity;
                        nACDeflection = nControle / 5 + nDexterity;
                        nSkillParry = GetSkillRank(SKILL_PARRY,oPC) / 5 /*20%*/ + nControle / 5 + nDexterity;
                        nSkillDiscipline = GetSkillRank(SKILL_DISCIPLINE,oPC) / 10 + nControle / 10 + nDexterity;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_10;
                        break;
                    case 11:
                        nAttack = GetBaseAttackBonus(oPC) * 3 / 10 /*30%*/ + nControle / 4;
                        nSkillParry = 0 - GetSkillRank(SKILL_PARRY,oPC) / 5 /*20%*/ + nControle / 5 + nDexterity;
                        nACDodge = nSens / 10 + nTumble / 10;
                        nSkillConcentration = GetSkillRank(SKILL_CONCENTRATION,oPC) / 10 + nControle / 10;
                        nAbilityStrenght = nControle / 4;
                        nSavingReflex = nSens / 10 + nTumble / 10;
                        nConcealment = nSens + nControle / 2;
                        nVisualEffect = VISUAL_EFFECT_FORME_COMBAT_11;
                        break;
                    default:break;
                }
                if(GetHasFeat(FEAT_JEDI_WEAPON_ADEPT,oPC)) {
                    //SendMessageToPC(oPC,"alignment="+IntToString(nBonusAlign));
                    if(bLightBonusBA) {
                        int nBonusAlign = (GetGoodEvilValue(oPC) - 50 )/10;
                        nAttack = nAttack + nBonusAlign;
                    }
                    if(bLightBonusCA) {
                        int nBonusAlign = (GetGoodEvilValue(oPC) - 50 )/10;
                        nACNatural = nACNatural + nBonusAlign;
                    }
                    if(bDarkBonusBA) {
                        int nBonusAlign = (60 - GetGoodEvilValue(oPC))/10;
                        nAttack = nAttack + nBonusAlign;
                    }
                    if(bDarkBonusCA) {
                        int nBonusAlign = (60 - GetGoodEvilValue(oPC))/10;
                        nACNatural = nACNatural + nBonusAlign;
                    }
                }
                if(GetHasFeat(FEAT_JEDI_WEAPON_MASTER,oPC)) {
                    if(bLightBonusBA) {
                        int nBonusAlign = (GetGoodEvilValue(oPC) - 50 )/10;
                        nAttack = nAttack + nBonusAlign;
                    }
                    if(bLightBonusCA) {
                        int nBonusAlign = (GetGoodEvilValue(oPC) - 50 )/10;
                        nACNatural = nACNatural + nBonusAlign;
                    }
                    if(bDarkBonusBA) {
                        int nBonusAlign = (60 - GetGoodEvilValue(oPC))/10;
                        nAttack = nAttack + nBonusAlign;
                    }
                    if(bDarkBonusCA) {
                        int nBonusAlign = (60 - GetGoodEvilValue(oPC))/10;
                        nACNatural = nACNatural + nBonusAlign;
                    }
                }
                effect eGlow = EffectVisualEffect(nVisualEffect);
                effect eLink = eGlow;
                if(nAttack > 0) {
                    effect eAttack = EffectAttackIncrease(nAttack);
                    eLink = EffectLinkEffects(eLink,eAttack);
                }
                if(nAttack < 0) {
                    effect eAttack = EffectAttackDecrease(0-nAttack);
                    eLink = EffectLinkEffects(eLink,eAttack);
                }
                if(nSkillConcentration > 0) {
                    effect eConcentration = EffectSkillIncrease(SKILL_CONCENTRATION,nSkillConcentration);
                    eLink = EffectLinkEffects(eLink,eConcentration);
                }
                if(nSkillDiscipline > 0) {
                    effect eDiscipline = EffectSkillIncrease(SKILL_DISCIPLINE,nSkillDiscipline);
                    eLink = EffectLinkEffects(eLink,eDiscipline);
                }
                if(nSkillParry > 0) {
                    effect eParry = EffectSkillIncrease(SKILL_PARRY,nSkillParry);
                    eLink = EffectLinkEffects(eLink,eParry);
                }
                if(nSkillParry < 0) {
                    effect eParry = EffectSkillDecrease(SKILL_PARRY,0-nSkillParry);
                    eLink = EffectLinkEffects(eLink,eParry);
                }
                if(nSkillTumble > 0) {
                    effect eTumble = EffectSkillIncrease(SKILL_TUMBLE,nSkillTumble);
                    eLink = EffectLinkEffects(eLink,eTumble);
                }
                if(nACDeflection > 0) {
                    effect eAC = EffectACIncrease(nACDeflection,AC_DEFLECTION_BONUS);
                    eLink = EffectLinkEffects(eLink,eAC);
                }
                if(nACDodge > 0) {
                    effect eAC = EffectACIncrease(nACDodge,AC_DODGE_BONUS);
                    eLink = EffectLinkEffects(eLink,eAC);
                }
                if(nACNatural > 0) {
                    effect eAC = EffectACIncrease(nACNatural,AC_NATURAL_BONUS);
                    eLink = EffectLinkEffects(eLink,eAC);
                }
                if(nACNatural < 0) {
                    effect eAC = EffectACDecrease(0-nACNatural,AC_NATURAL_BONUS);
                    eLink = EffectLinkEffects(eLink,eAC);
                }
                if(nSavingReflex > 0) {
                    effect eSavingReflex = EffectSavingThrowIncrease(SAVING_THROW_REFLEX,nSavingReflex);
                    eLink = EffectLinkEffects(eLink,eSavingReflex);
                }
                if(nConcealment > 0) {
                    effect eConcealment = EffectConcealment(nConcealment);
                    eLink = EffectLinkEffects(eLink,eConcealment);
                }
                if(nAbilityStrenght > 0) {
                    effect eAbility = EffectAbilityIncrease(ABILITY_STRENGTH,nAbilityStrenght);
                    eLink = EffectLinkEffects(eLink,eAbility);
                }
                if(nSpeed > 0) {
                    effect eSpeed = EffectMovementSpeedIncrease(nSpeed);
                    eLink = EffectLinkEffects(eLink,eSpeed);
                }
                if(nSpeed < 0) {
                    effect eSpeed = EffectMovementSpeedDecrease(0-nSpeed);
                    eLink = EffectLinkEffects(eLink,eSpeed);
                }
                if(nMalusForce > 0) {
                    effect eMalusSens = EffectSkillDecrease(SKILL_SENSE,nMalusForce);
                    effect eMalusControle = EffectSkillDecrease(SKILL_CONTROL,nMalusForce);
                    effect eMalusAlteration = EffectSkillDecrease(SKILL_ALTER,nMalusForce);
                    eLink = EffectLinkEffects(eLink,eMalusSens);
                    eLink = EffectLinkEffects(eLink,eMalusControle);
                    eLink = EffectLinkEffects(eLink,eMalusAlteration);
                }

                effect eEffect = ExtraordinaryEffect(eLink);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY/*DURATION_TYPE_PERMANENT*/,eEffect,oPC,fDuration);
                SetLocalInt(oPC,FORME_COMBAT,nFormeCombat);
                SetLocalInt(oPC,FORME_PERMET_SABRE_LASER,nSabreLaser);
                FloatingTextStringOnCreature("Forme de combat active",oPC,FALSE);
                //DelayCommand(RoundsToSeconds(5),MaintenirFormeCombat(oPC,nSkillControle,nSkillSens,nMalusForce,nFatigueForme,eEffect));
            }
            int nFatiguePouvoir = CalculFatigueForme(oPC,nFatigueForme);
            SetFatigue(oPC,nFatigue + nFatiguePouvoir);
            Activation_Fatigue_Recuperation(oPC);
        }
    }
}

void MaintenirFormeCombat(object oPC, int nSkillControle, int nSkillSens, int nMalusForce, int nFatigueForme, effect eEffect) {
    int nFormeCombatDesactivee = GetLocalInt(oPC,NB_FORME_COMBAT_DESACTIVEE);

    if(nFormeCombatDesactivee != 0) {
        SetLocalInt(oPC,NB_FORME_COMBAT_DESACTIVEE,nFormeCombatDesactivee -1);
    } else {
        DeleteLocalInt(oPC,NB_FORME_COMBAT_DESACTIVEE);
        int nFatigue = GetFatigue(oPC);
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)-nMalusForce) &&
           GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC)-nMalusForce)
          ) {
            //SendMessageToPC(oPC,"forme de combat maintenue");
            DelayCommand(RoundsToSeconds(5),MaintenirFormeCombat(oPC,nSkillControle,nSkillSens,nMalusForce,nFatigueForme,eEffect));
        } else {
            //SendMessageToPC(oPC,"forme de combat suspendue");
            RemoveEffect(oPC,eEffect);
        }
        int nFatiguePouvoir = CalculFatigueForme(oPC,nFatigueForme);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }

}

void SupprimePoisonMaladie(object oCreature) {
    effect eEffect = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEffect)) {
        if(GetEffectType(eEffect) == EFFECT_TYPE_DISEASE ||
           GetEffectType(eEffect) == EFFECT_TYPE_POISON) {
            RemoveEffect(oCreature,eEffect);
        }
        eEffect = GetNextEffect(oCreature);
    }
}

void SupprimeEffetsNegatifs(object oCreature) {
    effect eBad = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eBad))
    {
        if ( GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
             GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
             GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
             GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
             GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL
           )
            {
                RemoveEffect(oCreature, eBad);
            }
        eBad = GetNextEffect(oCreature);
    }

}

void PouvoirJediRegeneration(object oPC,int nPouvoirRegeneration) {
    int nSpellIdRegeneration = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_REGENERATION_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_REGENERATION_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_REGENERATION_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_REGENERATION_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_REGENERATION_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_REGENERATION_3);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_REGENERATION_4)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_REGENERATION_4);
    } else {
        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmount = 0;
        float fDuration = 0.0f;
        int nFatigueRegeneration = 0;
        int bHealPoisonMaladie = FALSE;
        int bImmuMort = FALSE;
        switch(nPouvoirRegeneration) {
            case 1: nSkillControle = DIFFICULTE_REGENERATION_1_CONTROLE; nAmount = GetSkillRank(SKILL_CONCENTRATION,oPC)/10;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONCENTRATION,oPC)/5); nFatigueRegeneration = FATIGUE_REGENERATION_1; break;
            case 2: nSkillControle = DIFFICULTE_REGENERATION_2_CONTROLE; nAmount = GetSkillRank(SKILL_CONTROL,oPC)/8;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatigueRegeneration = FATIGUE_REGENERATION_2; break;
            case 3: nSkillControle = DIFFICULTE_REGENERATION_3_CONTROLE; nAmount = GetSkillRank(SKILL_CONTROL,oPC)/5;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatigueRegeneration = FATIGUE_REGENERATION_3; bHealPoisonMaladie = TRUE; break;
            case 4: nSkillControle = DIFFICULTE_REGENERATION_4_CONTROLE; nAmount = GetSkillRank(SKILL_CONTROL,oPC)/2;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/2); nFatigueRegeneration = FATIGUE_REGENERATION_4; bHealPoisonMaladie = TRUE; bImmuMort = TRUE;break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            if(nAmount == 0) {
                nAmount = 1;
            }
            effect eRegenerate = EffectRegenerate(nAmount,6.0f);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eRegenerate,eVisual);
            if(bHealPoisonMaladie) {
                SupprimePoisonMaladie(oPC);
                effect eImmunityPoison = EffectImmunity(IMMUNITY_TYPE_POISON);
                effect eImmunityMaladie = EffectImmunity(IMMUNITY_TYPE_DISEASE);
                eLink = EffectLinkEffects(eLink,eImmunityPoison);
                eLink = EffectLinkEffects(eLink,eImmunityMaladie);
            }
            if(bImmuMort) {
                //effect eImmunityMort = EffectImmunity(IMMUNITY_TYPE_DEATH);
                //eLink = EffectLinkEffects(eLink,eImmunityMort);t);
                SetLocalInt(oPC, "AUTOREZ", TRUE);
                DelayCommand(fDuration, SetLocalInt(oPC, "AUTOREZ", FALSE));
            }
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueRegeneration);
            SetFatigue(oPC,nFatigue + nFatiguePouvoir);
            Activation_Fatigue_Recuperation(oPC);
        }
    }
}

void PouvoirJediSoins(object oPC,object oTarget,int nPouvoirSoins) {
    if(oPC == oTarget) {
        SendMessageToPC(oPC,"This power can only be used to heal others.");
    } else {
        int nFatigue = GetFatigue(oPC);
        int nSkillControle = 0;
        int nSkillAlteration = 0;
        int nAmount = 0;
        int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
        int nFatigueSoins = 0;
        int nVisual = 0;
        int bHealPoisonMaladie = FALSE;
        int bHealEffetsNegatifs = FALSE;
        switch(nPouvoirSoins) {
            case 1: nSkillControle = DIFFICULTE_SOINS_1_CONTROLE; nSkillAlteration = DIFFICULTE_SOINS_1_ALTERATION; nAmount = d6(1)+nAlteration / 3; nFatigueSoins = FATIGUE_SOINS_1; nVisual = VFX_IMP_HEALING_S; break;
            case 2: nSkillControle = DIFFICULTE_SOINS_2_CONTROLE; nSkillAlteration = DIFFICULTE_SOINS_2_ALTERATION; nAmount = d6(2)+nAlteration / 2; nFatigueSoins = FATIGUE_SOINS_2; nVisual = VFX_IMP_HEALING_M; break;
            case 3: nSkillControle = DIFFICULTE_SOINS_3_CONTROLE; nSkillAlteration = DIFFICULTE_SOINS_3_ALTERATION; nAmount = d6(2)+nAlteration / 2; nFatigueSoins = FATIGUE_SOINS_3; nVisual = VFX_IMP_HEALING_L; bHealPoisonMaladie = TRUE; break;
            case 4: nSkillControle = DIFFICULTE_SOINS_4_CONTROLE; nSkillAlteration = DIFFICULTE_SOINS_4_ALTERATION; nAmount = d6(2)+nAlteration; nFatigueSoins = FATIGUE_SOINS_4; nVisual = VFX_IMP_HEALING_L; bHealPoisonMaladie = TRUE; bHealEffetsNegatifs = TRUE; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
           GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
          ) {
            effect eHeal = EffectHeal(nAmount);
            effect eVisual = EffectVisualEffect(nVisual);
            effect eLink = EffectLinkEffects(eVisual,eHeal);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oTarget);
            if(bHealPoisonMaladie) {
                SupprimePoisonMaladie(oTarget);
            }
            if(bHealEffetsNegatifs) {
                SupprimeEffetsNegatifs(oTarget);
                if (d4() == 4)
                {
                    effect eResurrect = EffectResurrection();
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eResurrect, oTarget);
                }
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueSoins);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediDiscretion(object oPC,int nPouvoirDiscretion) {
    int nSpellIdDiscretion = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_DISCRETION_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_DISCRETION_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_DISCRETION_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_DISCRETION_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_DISCRETION_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_DISCRETION_3);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_DISCRETION_4)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_DISCRETION_4);
    } else {
        int nSkillAlteration = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmount = 0;
        float fDuration = 0.0f;
        int nFatigueDiscretion = 0;
        int bInvisibility = FALSE;
        int bMalusAlignment = FALSE;
        switch(nPouvoirDiscretion) {
            case 1: nSkillAlteration = DIFFICULTE_DISCRETION_1_ALTERATION; nAmount = 5;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONCENTRATION,oPC)/5); nFatigueDiscretion = FATIGUE_DISCRETION_1; break;
            case 2: nSkillAlteration = DIFFICULTE_DISCRETION_2_ALTERATION; nAmount = 10;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/4); nFatigueDiscretion = FATIGUE_DISCRETION_2; break;
            case 3: nSkillAlteration = DIFFICULTE_DISCRETION_3_ALTERATION; nAmount = 20;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/3); bMalusAlignment = TRUE; nFatigueDiscretion = FATIGUE_DISCRETION_3; break;
            case 4: nSkillAlteration = DIFFICULTE_DISCRETION_4_ALTERATION; nAmount = 30;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/2); bMalusAlignment = TRUE; nFatigueDiscretion = FATIGUE_DISCRETION_4; bInvisibility = TRUE; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
            if(bMalusAlignment) {
                //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
             }
            effect eHide = EffectSkillIncrease(SKILL_HIDE,nAmount);
            effect eMoveSilently = EffectSkillIncrease(SKILL_MOVE_SILENTLY,nAmount);
            effect eConceal = EffectConcealment(nAmount);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eHide,eMoveSilently);
            eLink = EffectLinkEffects(eLink,eVisual);
            eLink = EffectLinkEffects(eLink,eConceal);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            if(bInvisibility) {
                effect eInvisibility = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
                eEffect = ExtraordinaryEffect(eInvisibility);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueDiscretion);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediFoudre(object oPC,object oTarget,location lTarget,int nPouvoirFoudre) {

    int nFatigue = GetFatigue(oPC);
    int nSkillAlteration = 0;
    int nAmount = 0;
    int nAmountDice = 0;
    int nAmountBonus = 0;
    int nFatigueFoudre = 0;
    int nForce = GetNiveauForce(oPC);
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    float fDurationParalyse = 0.0f;
    int bMultipleTarget = FALSE;
    float fLength = 0.0;
    int nDonContrePouvoir = 0;
    int nFatigueContrePouvoir = 0;
    switch(nPouvoirFoudre) {
        case 1: nSkillAlteration = DIFFICULTE_FOUDRE_1_ALTERATION; nAmountDice = 2; nAmountBonus = nAlteration/5; nFatigueFoudre = FATIGUE_FOUDRE_1; nDonContrePouvoir = FEAT_JEDI_ABSORBER_DISSIPER_1; nFatigueContrePouvoir = FATIGUE_ABSORBER_DISSIPER_1/2; break;
        case 2: nSkillAlteration = DIFFICULTE_FOUDRE_2_ALTERATION; nAmountDice = 3; nAmountBonus = nAlteration/4; nFatigueFoudre = FATIGUE_FOUDRE_2; fDurationParalyse = RoundsToSeconds(1); nDonContrePouvoir = FEAT_JEDI_ABSORBER_DISSIPER_2; nFatigueContrePouvoir = FATIGUE_ABSORBER_DISSIPER_2/2; break;
        case 3: nSkillAlteration = DIFFICULTE_FOUDRE_3_ALTERATION; nAmountDice = 2; nAmountBonus = nAlteration/3; fLength = IntToFloat(10); nFatigueFoudre = FATIGUE_FOUDRE_3; fDurationParalyse = RoundsToSeconds(2); bMultipleTarget = TRUE; nDonContrePouvoir = FEAT_JEDI_ABSORBER_DISSIPER_3; nFatigueContrePouvoir = FATIGUE_ABSORBER_DISSIPER_3/2; break;
        case 4: nSkillAlteration = DIFFICULTE_FOUDRE_4_ALTERATION; nAmountDice = 3; nAmountBonus = nAlteration/2; fLength = IntToFloat(10); nFatigueFoudre = FATIGUE_FOUDRE_3; fDurationParalyse = RoundsToSeconds(3); bMultipleTarget = TRUE; nDonContrePouvoir = FEAT_JEDI_ABSORBER_DISSIPER_4; nFatigueContrePouvoir = FATIGUE_ABSORBER_DISSIPER_4/2; break;
        default:;
    }
    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
        //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
        effect eBeam = EffectBeam(VFX_BEAM_LIGHTNING,oPC,BODY_NODE_HAND);
        effect eParalyse = EffectParalyze();
        effect eParalyseVisual = EffectVisualEffect(VFX_DUR_PARALYZED);
        effect eLink2 = EffectLinkEffects(eParalyse,eParalyseVisual);
        effect eEffect2 = ExtraordinaryEffect(eLink2);

        if(!bMultipleTarget) {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_LIGHTNING_BOLT));
            int nAmount = d6(nAmountDice) + nAmountBonus;
            int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,nDonContrePouvoir,nFatigueContrePouvoir);
            nAmount = GetReflexAdjustedDamage(nAmount,oTarget,nAlteration-nBonus,SAVING_THROW_TYPE_ELECTRICITY);
            if(nAmount > 0) {
                effect eDamage = EffectDamage(nAmount,DAMAGE_TYPE_ELECTRICAL,DAMAGE_POWER_ENERGY);
                effect eEffect = ExtraordinaryEffect(eDamage);

                ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oTarget);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,1.0);

                if(FortitudeSave(oTarget,nAmount - nBonus,SAVING_THROW_TYPE_ELECTRICITY)) {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect2,oTarget,fDurationParalyse);
                }
            }
        } else {
            if (nPouvoirFoudre == 3)
            {
                oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE,fLength,lTarget,TRUE);
            }
            else
            {
                oTarget = GetFirstObjectInShape(SHAPE_SPHERE,fLength,lTarget,TRUE);
            }
            while(GetIsObjectValid(oTarget)) {
                if(oTarget != oPC){
                    SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_LIGHTNING_BOLT));
                    int nAmount = d6(nAmountDice) + nAmountBonus;
                    if(oTarget == oPC) {
                        //SendMessageToPC(oPC,"Je suis maso, je me cible moi meme");
                    }
                    int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,nDonContrePouvoir,nFatigueContrePouvoir);
                    nAmount = GetReflexAdjustedDamage(nAmount,oTarget,nAlteration-nBonus,SAVING_THROW_TYPE_ELECTRICITY);
                    if(nAmount > 0) {
                        effect eDamage = EffectDamage(nAmount,DAMAGE_TYPE_ELECTRICAL,DAMAGE_POWER_ENERGY);
                        effect eEffect = ExtraordinaryEffect(eDamage);

                        float fDist = GetDistanceBetween(oPC,oTarget) / 20;
                        DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oTarget));
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,1.0);
                        if(FortitudeSave(oTarget,nAmount - nBonus,SAVING_THROW_TYPE_ELECTRICITY)) {
                            DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect2,oTarget,fDurationParalyse));
                        }
                    }
                }
                if (nPouvoirFoudre == 3)
                {
                    oTarget = GetNextObjectInShape(SHAPE_SPELLCONE,fLength,lTarget,TRUE);
                }
                else
                {
                    oTarget = GetNextObjectInShape(SHAPE_SPHERE,fLength,lTarget,TRUE);
                }
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueFoudre);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediConcentration(object oPC) {
    int nSpellIdConcentration = GetSpellId();

    if(IsPouvoirActif(oPC,nSpellIdConcentration)) {
        DesactiverPouvoir(oPC,nSpellIdConcentration);
    } else {
        int nFatigue = GetFatigue(oPC);
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,DIFFICULTE_CONCENTRATION_CONTROLE+nFatigue+GetMalusForceArmure(oPC))) {
            int nAmount = 10;
            float fDuration = 9.0f;
            effect eSkill = EffectSkillIncrease(SKILL_ALL_SKILLS,nAmount);
            effect eVisual = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE);
            effect eLink = EffectLinkEffects(eSkill,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,FATIGUE_CONCENTRATION);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediAbsorberDissiper(object oPC,int nPouvoirAbsorberDissiper) {
    int nSpellIdAbsorberDissiper = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_ABSORBER_DISSIPER_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_ABSORBER_DISSIPER_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_ABSORBER_DISSIPER_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_ABSORBER_DISSIPER_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_ABSORBER_DISSIPER_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_ABSORBER_DISSIPER_3);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_ABSORBER_DISSIPER_4)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_ABSORBER_DISSIPER_4);
    } else {
        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmount = 0;
        float fDuration = 0.0f;
        int nFatigueAbsorberDissiper = 0;
        int nLimitMult = 1; // = TRUE
        switch(nPouvoirAbsorberDissiper) {
            case 1: nSkillControle = DIFFICULTE_ABSORBER_DISSIPER_1_CONTROLE; nAmount = 20;fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatigueAbsorberDissiper = FATIGUE_ABSORBER_DISSIPER_1; break;
            case 2: nSkillControle = DIFFICULTE_ABSORBER_DISSIPER_2_CONTROLE; nAmount = 40;fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatigueAbsorberDissiper = FATIGUE_ABSORBER_DISSIPER_2; break;
            case 3: nSkillControle = DIFFICULTE_ABSORBER_DISSIPER_3_CONTROLE; nAmount = 25;fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatigueAbsorberDissiper = FATIGUE_ABSORBER_DISSIPER_3; nLimitMult = 0; break;
            case 4: nSkillControle = DIFFICULTE_ABSORBER_DISSIPER_4_CONTROLE; nAmount = 50;fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/2); nFatigueAbsorberDissiper = FATIGUE_ABSORBER_DISSIPER_4; nLimitMult = 0; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            effect eCold = EffectDamageResistance(DAMAGE_TYPE_COLD,nAmount,nLimitMult * nAmount * 5 );
            effect eDivine = EffectDamageResistance(DAMAGE_TYPE_DIVINE,nAmount,nLimitMult * nAmount * 5);
            effect eElectric = EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL,nAmount,nLimitMult * nAmount * 5);
            effect eFire = EffectDamageResistance(DAMAGE_TYPE_FIRE,nAmount,nLimitMult * nAmount * 5);
            effect eMagic = EffectDamageResistance(DAMAGE_TYPE_MAGICAL,nAmount/2,nLimitMult * nAmount * 2);
            effect eNegative = EffectDamageResistance(DAMAGE_TYPE_NEGATIVE,nAmount,nLimitMult * nAmount * 5);
            effect ePositive = EffectDamageResistance(DAMAGE_TYPE_POSITIVE,nAmount,nLimitMult * nAmount * 5);
            effect eSonic = EffectDamageResistance(DAMAGE_TYPE_SONIC,nAmount,nLimitMult * nAmount * 5);
            effect eVisual = EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS);
            effect eLink = EffectLinkEffects(eCold,eDivine);
            eLink = EffectLinkEffects(eLink,eElectric);
            eLink = EffectLinkEffects(eLink,eFire);
            eLink = EffectLinkEffects(eLink,eMagic);
            eLink = EffectLinkEffects(eLink,eNegative);
            eLink = EffectLinkEffects(eLink,ePositive);
            eLink = EffectLinkEffects(eLink,eSonic);
            eLink = EffectLinkEffects(eLink,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueAbsorberDissiper);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediRapidite(object oPC,int nPouvoirRapidite) {
    int nSpellIdRapidite = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_RAPIDITE_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_RAPIDITE_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_RAPIDITE_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_RAPIDITE_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_RAPIDITE_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_RAPIDITE_3);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_RAPIDITE_4)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_RAPIDITE_4);
    } else {
        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        int nReflex = 0;
        int nSpeed = 0;
        float fDuration = 0.0f;
        int nFatigueRapidite = 0;
        int bHaste = FALSE;
        int bFreedom = FALSE;
        switch(nPouvoirRapidite) {
            case 1: nSkillControle = DIFFICULTE_RAPIDITE_1_CONTROLE; nReflex = 5; nSpeed = 50; fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatigueRapidite = FATIGUE_RAPIDITE_1; break;
            case 2: nSkillControle = DIFFICULTE_RAPIDITE_2_CONTROLE; nReflex = 10; nSpeed = 99; fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatigueRapidite = FATIGUE_RAPIDITE_2; break;
            case 3: nSkillControle = DIFFICULTE_RAPIDITE_3_CONTROLE; nReflex = 15; nSpeed = 50; bHaste = TRUE; fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatigueRapidite = FATIGUE_RAPIDITE_3; break;
            case 4: nSkillControle = DIFFICULTE_RAPIDITE_4_CONTROLE; nReflex = 15; nSpeed = 99; bHaste = TRUE; fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/2); nFatigueRapidite = FATIGUE_RAPIDITE_4; bFreedom = TRUE;break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            effect eHaste;
            effect eSpeed;
            if(bHaste) {
                eHaste = EffectHaste();
            }
            eSpeed = EffectMovementSpeedIncrease(nSpeed);
            effect eReflex = EffectSavingThrowIncrease(SAVING_THROW_REFLEX,nReflex);
            effect eLink = EffectLinkEffects(eSpeed,eReflex);
            eLink = EffectLinkEffects(eLink,eHaste);
            if(bFreedom) {
                effect eParal = EffectImmunity(IMMUNITY_TYPE_PARALYSIS);
                effect eEntangle = EffectImmunity(IMMUNITY_TYPE_ENTANGLE);
                effect eSlow = EffectImmunity(IMMUNITY_TYPE_SLOW);
                effect eMove = EffectImmunity(IMMUNITY_TYPE_MOVEMENT_SPEED_DECREASE);
                effect eVis = EffectVisualEffect(VFX_DUR_FREEDOM_OF_MOVEMENT);
                eLink = EffectLinkEffects(eLink, eParal);
                eLink = EffectLinkEffects(eLink, eEntangle);
                eLink = EffectLinkEffects(eLink, eSlow);
                eLink = EffectLinkEffects(eLink, eMove);
                eLink = EffectLinkEffects(eLink, eVis);
            }

            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            effect eVisual = EffectVisualEffect(VFX_IMP_HASTE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oPC);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueRapidite);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediPerception(object oPC,int nPouvoirPerception) {
    int nSpellIdPerception = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_PERCEPTION_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PERCEPTION_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_PERCEPTION_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PERCEPTION_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_PERCEPTION_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PERCEPTION_3);
    } else {
        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmount = 0;
        float fDuration = 0.0f;
        int nFatiguePerception = 0;
        switch(nPouvoirPerception) {
            case 1: nSkillControle = DIFFICULTE_PERCEPTION_1_CONTROLE; nAmount = GetSkillRank(SKILL_ENHANCE_SENSES,oPC)/6;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatiguePerception = FATIGUE_PERCEPTION_1; break;
            case 2: nSkillControle = DIFFICULTE_PERCEPTION_2_CONTROLE; nAmount = GetSkillRank(SKILL_ENHANCE_SENSES,oPC)/3;fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatiguePerception = FATIGUE_PERCEPTION_2; break;
            case 3: nSkillControle = DIFFICULTE_PERCEPTION_3_CONTROLE; nAmount = GetSkillRank(SKILL_ENHANCE_SENSES,oPC);fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatiguePerception = FATIGUE_PERCEPTION_3; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            effect eListen = EffectSkillIncrease(SKILL_LISTEN,nAmount);
            effect eSearch = EffectSkillIncrease(SKILL_SEARCH,nAmount);
            effect eSpot = EffectSkillIncrease(SKILL_SPOT,nAmount);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eListen,eSearch);
            eLink = EffectLinkEffects(eLink,eSpot);
            eLink = EffectLinkEffects(eLink,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatiguePerception);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediVolonte(object oPC,int nPouvoirVolonte) {
    int nSpellIdVolonte = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_VOLONTE_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_VOLONTE_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_VOLONTE_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_VOLONTE_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_VOLONTE_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_VOLONTE_3);
    } else {
        int nSkillAlteration = 0;
        int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
        float fAlteration = IntToFloat(nAlteration);
        int nFatigue = GetFatigue(oPC);
        int nAmount = 0;
        float fDuration = 0.0;
        int nFatigueVolonte = 0;
        switch(nPouvoirVolonte) {
            case 1: nSkillAlteration = DIFFICULTE_VOLONTE_1_ALTERATION; nAmount = 5;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/5); nFatigueVolonte = FATIGUE_VOLONTE_1; break;
            case 2: nSkillAlteration = DIFFICULTE_VOLONTE_2_ALTERATION; nAmount = 10;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/4); nFatigueVolonte = FATIGUE_VOLONTE_2; break;
            case 3: nSkillAlteration = DIFFICULTE_VOLONTE_3_ALTERATION; nAmount = 20;fDuration = TurnsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/3); nFatigueVolonte = FATIGUE_VOLONTE_3; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
            // bonus pour le sith
            //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
            effect eBluff = EffectSkillIncrease(SKILL_BLUFF,nAmount);
            effect eIntimidate = EffectSkillIncrease(SKILL_INTIMIDATE,nAmount);
            effect ePersuade = EffectSkillIncrease(SKILL_PERSUADE,nAmount);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eBluff,eIntimidate);
            eLink = EffectLinkEffects(eLink,ePersuade);
            eLink = EffectLinkEffects(eLink,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);

            // malus pour les victimes
            location locPC = GetLocation(oPC);
            object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,fAlteration,locPC);
            effect oWill = EffectSavingThrowDecrease(SAVING_THROW_WILL,nAmount);
            effect oPersuade2 = EffectSkillDecrease(SKILL_PERSUADE,nAmount*2);
            effect eVisual2 = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
            effect eLink2 = EffectLinkEffects(oWill,oPersuade2);
            eLink2 = EffectLinkEffects(eLink2,eVisual2);
            effect eEffect2 = ExtraordinaryEffect(eLink2);

            while(GetIsObjectValid(oTarget)) {

                if(oTarget != oPC){
                    if(!GetHasFeat(FEAT_JEDI_FORCE_AME_1) && WillSave(oTarget,nAlteration,SAVING_THROW_TYPE_MIND_SPELLS) == 0) {
                        DelayCommand(0.2f,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect2,oTarget,fDuration));
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPHERE,fAlteration,locPC);
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueVolonte);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}


void PouvoirJediTelekinesieRamasserObjet(object oPC, object oTarget) {

    int nSkillAlteration = DIFFICULTE_TELEKINESIE_1_ALTERATION;
    int nFatigueTelekinesie = FATIGUE_TELEKINESIE_1;
    int nFatigue = GetFatigue(oPC);

    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
        int nObjectType = GetObjectType(oTarget);
        object oItem = OBJECT_INVALID;
        if(nObjectType == OBJECT_TYPE_PLACEABLE && GetHasInventory(oTarget) && !GetLocked(oTarget)) {
            oItem = GetFirstItemInInventory(oTarget);
        } else if(nObjectType == OBJECT_TYPE_ITEM) {
            oItem = oTarget;
        }
        if(GetIsObjectValid(oItem)) {
            float fDuration = GetDistanceBetween(oPC,oTarget);
            if(GetWeight(oItem) < POIDS_PETIT) {
                fDuration = fDuration / 3;
            } else if (GetWeight(oItem) < POIDS_MOYEN) {
                fDuration = fDuration / 2;
            }
            AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,fDuration-0.5));
            //FloatingTextStringOnCreature("semble se concentrer... un objet commence léviter et à s'approcher de lui",oPC,FALSE);

            DelayCommand(0.2,SetCommandable(FALSE,oPC));
//            effect eParalyse = EffectCutsceneParalyze();
//            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eParalyse,oPC,dDuration);

            object oObject = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);
            int bWeapon = FALSE;
            if(!GetIsObjectValid(oObject)) {
                bWeapon = EstArme(oItem);
            }
            DelayCommand(fDuration,MettreItemDansInventaire(oItem,oPC,bWeapon));
            //DelayCommand(fDuration,FloatingTextStringOnCreature("récupère dans sa main l'objet qui lévitait",oPC,FALSE));
            DelayCommand(fDuration+0.1,ClearAllActions());
            DelayCommand(fDuration+0.1,SetCommandable(TRUE,oPC));
        } else {
            //SendMessageToPC(oPC,"no effect");
        }
    }

    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTelekinesie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


int EstArme(object oItem) {

    switch(GetBaseItemType(oItem)) {
        case BASE_ITEM_BASTARDSWORD:
        case BASE_ITEM_BATTLEAXE:
        case BASE_ITEM_CLUB:
        case BASE_ITEM_DAGGER:
        case BASE_ITEM_DART:
        case BASE_ITEM_DIREMACE:
        case BASE_ITEM_DOUBLEAXE:
        case BASE_ITEM_DWARVENWARAXE:
        case BASE_ITEM_GREATAXE:
        case BASE_ITEM_GREATSWORD:
        case BASE_ITEM_HALBERD:
        case BASE_ITEM_HANDAXE:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_HEAVYFLAIL:
        case BASE_ITEM_KAMA:
        case BASE_ITEM_KATANA:
        case BASE_ITEM_KUKRI:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_LIGHTFLAIL:
        case BASE_ITEM_LIGHTHAMMER:
        case BASE_ITEM_LIGHTMACE:
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_LONGSWORD:
        case BASE_ITEM_MAGICSTAFF:
        case BASE_ITEM_MORNINGSTAR:
        case BASE_ITEM_QUARTERSTAFF:
        case BASE_ITEM_RAPIER:
        case BASE_ITEM_SCIMITAR:
        case BASE_ITEM_SCYTHE:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_SHORTSPEAR:
        case BASE_ITEM_SHORTSWORD:
        case BASE_ITEM_SHURIKEN:
        case BASE_ITEM_SICKLE:
        case BASE_ITEM_SLING:
        case BASE_ITEM_THROWINGAXE:
        case BASE_ITEM_TRIDENT:
        case BASE_ITEM_TWOBLADEDSWORD:
        case BASE_ITEM_WARHAMMER:
        case BASE_ITEM_WHIP:    return TRUE; break;
        default:;
    }
    return FALSE;
}

void MettreItemDansInventaire(object oItem,object oCreature,int bEquipItem) {
    object oNewItem = CopyItem(oItem,oCreature,TRUE);
    if(bEquipItem) {
        AssignCommand(oCreature,ClearAllActions());
        DelayCommand(0.2,AssignCommand(oCreature,ActionEquipItem(oNewItem,INVENTORY_SLOT_RIGHTHAND)));
    }
    DestroyObject(oItem);
}



void PouvoirJediTelekinesieOuvrirFermerPorte(object oPC, object oTarget) {

    int nSkillAlteration = DIFFICULTE_TELEKINESIE_2_ALTERATION;
    int nFatigueTelekinesie = FATIGUE_TELEKINESIE_2;
    int nFatigue = GetFatigue(oPC);

    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
        int nObjectType = GetObjectType(oTarget);
        if(nObjectType == OBJECT_TYPE_DOOR) {
            float fDuration = GetDistanceBetween(oPC,oTarget)/2;
            AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,fDuration-0.5));
            DelayCommand(0.2,SetCommandable(FALSE,oPC));
            FloatingTextStringOnCreature("* semble concentre sur quelquechose *",oPC);

            if(GetIsOpen(oTarget)) {
                DelayCommand(fDuration/2,AssignCommand(oTarget,ActionCloseDoor(oTarget)));
            } else if(!GetLocked(oTarget)) {
                DelayCommand(fDuration/2,AssignCommand(oTarget,ActionOpenDoor(oTarget)));
            } else {
                SendMessageToPC(oPC,"*The door is locked*");
            }
            DelayCommand(fDuration+0.1,ClearAllActions());
            DelayCommand(fDuration+0.1,SetCommandable(TRUE,oPC));
        } else {
            //SendMessageToPC(oPC,"le pouvoir n'a produit aucun effet");
        }
    }

    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTelekinesie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void PouvoirJediTelekinesieDesarmer(object oPC, object oTarget) {

    int nSkillAlteration = DIFFICULTE_TELEKINESIE_3_ALTERATION;
    int nFatigueTelekinesie = FATIGUE_TELEKINESIE_3;
    int nFatigue = GetFatigue(oPC);
    int bDestroyObject = FALSE;

    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
        SignalEvent(oTarget, EventSpellCastAt(oPC, GetSpellId()));
        object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oTarget);
        if(!GetIsObjectValid(oItem)) {
            ///SendMessageToPC(oPC,"la cible n'avait pas d'arme");
        } else {
            if(!GetIsCreatureDisarmable(oTarget)) {
                // si la creature ne peut etre desarmee, son arme sera detruite a la place
                bDestroyObject = TRUE;
            }

            int nBonus = BonusResistancePouvoir(oTarget,SKILL_ALTER,FEAT_JEDI_TELEKINESIE_3,FATIGUE_TELEKINESIE_3/2);
            int nDC = GetSkillRank(SKILL_ALTER,oPC) - nBonus;

            if(d20() + GetAbilityModifier(ABILITY_STRENGTH,oTarget) <= nDC) {
                object oArea = GetArea(oTarget);
                vector vPosition = GetPosition(oTarget);
                float fOrientation = GetFacing(oTarget);
                fOrientation = fOrientation - 3.1415/4;
                vector vNewPos = AngleToVector(fOrientation);
                float vX = vPosition.x - vNewPos.x;
                float vY = vPosition.y - vNewPos.y;
                float vZ = vPosition.z;
                vNewPos = Vector(vX, vY, vZ);

                location locWeapon = Location(oArea, vNewPos, fOrientation);
                if(bDestroyObject) {
                    DestroyObject(oItem);
                } else {
                    DeplacerObjet(oItem,locWeapon);
                }
            }
        }

    }

    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTelekinesie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void DeplacerObjet(object oObject, location locLocation) {
    object oCopy = CopyObject(oObject,locLocation);
    if(GetIsObjectValid(oCopy)) {
        DestroyObject(oObject);
    }
}



void PouvoirJediTelekinesieDeplacer(object oPC, object oTarget, location locTarget) {

    if(GetIsObjectValid(oTarget)) {
        if(oTarget != oPC) {
            SendMessageToPC(oPC,"*You attempt to communicate with "+GetName(oTarget) + " through the Force*");
            SetLocalObject(oPC,TELEKINESIE_CIBLE,oTarget);
        } else {
            //SendMessageToPC(oPC,"Vous ne pouvez pas vous cible avec votre telekinesie");
            DeleteLocalObject(oPC,TELEKINESIE_CIBLE);
        }
        return;
    }

    object oOldTarget = GetLocalObject(oPC,TELEKINESIE_CIBLE);
    if(GetIsObjectValid(oOldTarget) && GetArea(oPC) != GetArea(oOldTarget)) {
        DeleteLocalObject(oPC,TELEKINESIE_CIBLE);
        SendMessageToPC(oPC,"Your old target ("+GetName(oOldTarget)+") is no longer valid.");
        oOldTarget = OBJECT_INVALID;
    }

    if(!GetIsObjectValid(oOldTarget)) {
        object oNewTarget = GetFirstObjectInShape(SHAPE_SPHERE,5.0,locTarget,FALSE,OBJECT_TYPE_PLACEABLE);
        while(GetIsObjectValid(oNewTarget)) {
            if(!GetPlotFlag(oNewTarget)) {
                SendMessageToPC(oPC,"*You attempt to communicate with "+GetName(oTarget) + " through the Force*");
                SetLocalObject(oPC,TELEKINESIE_CIBLE,oNewTarget);
                return;
            }
            oNewTarget = GetNextObjectInShape(SHAPE_SPHERE,5.0,locTarget,FALSE,OBJECT_TYPE_PLACEABLE);
        }
        //SendMessageToPC(oPC,"Vous n'avez pas de cible valide pour la telekinesie");
        DeleteLocalObject(oPC,TELEKINESIE_CIBLE);
        return;
    }
    if(GetDistanceBetween(oOldTarget,oPC) > IntToFloat(GetSkillRank(SKILL_ALTER,oPC))) {
        SendMessageToPC(oPC,"Your target is too far away.");
        return;
    }

    int nSkillAlteration = DIFFICULTE_TELEKINESIE_4_ALTERATION;
    int nFatigueTelekinesie = FATIGUE_TELEKINESIE_4;
    int nFatigue = GetFatigue(oPC);

    if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {

        int nDC = 0;
        int nObjectType = GetObjectType(oOldTarget);
        switch(nObjectType) {
            case OBJECT_TYPE_CREATURE:
                nDC = GetSizeValue(oTarget)*5 + BonusResistancePouvoir(oTarget,SKILL_ALTER,FEAT_JEDI_TELEKINESIE_4,FATIGUE_TELEKINESIE_4/2);
                break;
            case OBJECT_TYPE_ITEM:
                nDC = d20();
                break;
            case OBJECT_TYPE_PLACEABLE:
                nDC = d20();
                break;
            default:;
        }

        float fDuration = GetDistanceBetweenLocations(GetLocation(oOldTarget),locTarget);
        float fFacing = VectorToAngle(GetVectorTournerVers(oPC,GetLocation(oOldTarget)));
        AssignCommand(oPC,SetFacing(fFacing));
        DelayCommand(0.2,AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,1.0,fDuration)));
        DelayCommand(0.3,SetCommandable(FALSE,oPC));
        DelayCommand(fDuration/2-0.1,SetCommandable(TRUE,oPC));
        DelayCommand(fDuration/2,AssignCommand(oPC,SetFacing(VectorToAngle(GetVectorTournerVers(oPC,locTarget)))));
        DelayCommand(fDuration/2+0.1,SetCommandable(FALSE,oPC));
        FloatingTextStringOnCreature("* semble concentre sur quelquechose *",oPC);


        if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nDC)) {
            effect eFly;
            switch(nObjectType) {
                case OBJECT_TYPE_CREATURE:
                    SignalEvent(oTarget, EventSpellCastAt(oPC, GetSpellId()));
                    eFly = EffectDisappearAppear(locTarget);
                    FloatingTextStringOnCreature("* est soumis aux effets d'un pouvoir etrange *",oOldTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eFly,oOldTarget,fDuration);
                    break;
                case OBJECT_TYPE_ITEM:
                    DelayCommand(fDuration/2,DeplacerObjet(oOldTarget,locTarget));
                    break;
                case OBJECT_TYPE_PLACEABLE:
                    eFly = EffectDisappearAppear(locTarget);
                    FloatingTextStringOnCreature("* est soumis aux effets d'un pouvoir etrange *",oOldTarget);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eFly,oOldTarget,fDuration);
                    //DelayCommand(fDuration/2,DeplacerPlacable(oOldTarget,locTarget));
                    break;
                default:;
            }
        }
        DelayCommand(fDuration+0.1,ClearAllActions());
        DelayCommand(fDuration+0.1,SetCommandable(TRUE,oPC));
        DeleteLocalObject(oPC,TELEKINESIE_CIBLE);
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTelekinesie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);

}

vector GetVectorTournerVers(object oPC, location locTarget) {
    vector vPositionTarget = GetPositionFromLocation(locTarget);
    vector vPositionPC = GetPosition(oPC);
    float vX = vPositionTarget.x - vPositionPC.x;
    float vY = vPositionTarget.y - vPositionPC.y;
    float vZ = vPositionTarget.z;
    return Vector(vX,vY,vZ);
}




void DeplacerPlacable(object oObject, location locLocation) {

    object oCopy = CreateObject(GetObjectType(oObject),GetResRef(oObject),locLocation);
    if(GetHasInventory(oObject)) {
        object oItem = GetFirstItemInInventory(oObject);
        while(GetIsObjectValid(oItem)) {
            CopyItem(oItem,oCopy,TRUE);
            oItem = GetNextItemInInventory(oObject);
        }
    }

    if(GetIsObjectValid(oCopy)) {
        DestroyObject(oObject);
    }

}


void PouvoirJediFurie(object oPC,int nPouvoirFurie) {
    int nSpellIdFurie = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_FURIE_1)) {
        //SendMessageToPC(oPC,"Ce pouvoir ne peut etre desactive");
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_FURIE_2)) {
        //SendMessageToPC(oPC,"Ce pouvoir ne peut etre desactive");
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_FURIE_3)) {
        //SendMessageToPC(oPC,"Ce pouvoir ne peut etre desactive");
    } else {
        int nSkillAlteration = 0;
        int nFatigue = GetFatigue(oPC);
        int nHP = 0;
        int nAttack = 0;
        int nCA = 0;
        int nStrenght = 0;
        int bRapidite = FALSE;
        int bContreCoup = FALSE;
        float fDuration = 0.0;
        int nFatigueFurie = 0;
        int nStrike = GetSkillRank(SKILL_FORCE_STRIKE,oPC);
        int nAbility =GetSkillRank(SKILL_ENHANCE_ABILITY,oPC);
        switch(nPouvoirFurie) {
            case 1: nSkillAlteration = DIFFICULTE_FURIE_1_ALTERATION; nHP = 50 + nAbility; nAttack = GetSkillRank(SKILL_FORCE_STRIKE,oPC)/5; nCA = 5; nStrenght = nAbility/5; nFatigueFurie = FATIGUE_FURIE_1; fDuration = RoundsToSeconds(5); break;
            case 2: nSkillAlteration = DIFFICULTE_FURIE_2_ALTERATION; nHP = 100 + nAbility; nAttack = nStrike/3; nCA = 10; nStrenght = nAbility/4; nFatigueFurie = FATIGUE_FURIE_2; fDuration = RoundsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/5); break;
            case 3: nSkillAlteration = DIFFICULTE_FURIE_3_ALTERATION; nHP = 500 + nAbility; nAttack = nStrike/2; nCA = 10; nStrenght = nAbility/2; bRapidite = TRUE; bContreCoup = TRUE; nFatigueFurie = FATIGUE_FURIE_3; fDuration = RoundsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/4); break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))) {
            //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
            effect eHP = EffectTemporaryHitpoints(nHP);
            effect eAttack = EffectAttackIncrease(nAttack);
            effect eCA = EffectACDecrease(nCA,AC_DODGE_BONUS);
            effect eStrenght = EffectAbilityIncrease(ABILITY_STRENGTH,nStrenght);
            effect eLink = EffectLinkEffects(eHP,eAttack);
            eLink = EffectLinkEffects(eLink,eCA);
            eLink = EffectLinkEffects(eLink,eStrenght);
            if(bRapidite) {
                effect eRapidite = EffectHaste();
                eLink = EffectLinkEffects(eLink,eRapidite);
                effect eVisualSpeed = EffectVisualEffect(VFX_IMP_HASTE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisualSpeed,oPC);
            }
            effect eGlow = EffectVisualEffect(VFX_DUR_GLOW_RED);
            eLink = EffectLinkEffects(eLink,eGlow);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            if(bContreCoup) {
                DelayCommand(fDuration+0.1,ContreCoupFurie(oPC,fDuration * 4));
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueFurie);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void ContreCoupFurie(object oPC, float fDuration) {
    effect eAttack = EffectAttackDecrease(20);
    effect eCA = EffectACDecrease(20,AC_DODGE_BONUS);
    effect eStrenght = EffectAbilityDecrease(ABILITY_STRENGTH,10);
    effect eLenteur = EffectSlow();
    effect eGlow = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eLink = EffectLinkEffects(eAttack,eCA);
    eLink = EffectLinkEffects(eLink,eStrenght);
    eLink = EffectLinkEffects(eLink,eLenteur);
    eLink = EffectLinkEffects(eLink,eGlow);
    effect eEffect = ExtraordinaryEffect(eLink);

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);

    effect eVisualSlow = EffectVisualEffect(VFX_IMP_SLOW);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisualSlow,oPC);
}


void PouvoirJediSaut(object oPC, location locTarget) {

    int nSkillControle = DIFFICULTE_SAUT_CONTROLE;
    int nFatigueSaut = FATIGUE_SAUT;
    int nFatigue = GetFatigue(oPC);

    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
        effect eFly = EffectDisappearAppear(locTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eFly,oPC,3.0f);
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueSaut);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}

void PouvoirJediInfluencerEsprit(object oPC, object oTarget) {

    int nSkillSens = DIFFICULTE_INFLUENCER_ESPRIT_SENS;
    int nSkillAlteration = DIFFICULTE_INFLUENCER_ESPRIT_ALTERATION;
    int nFatigueInfluencerEsprit = FATIGUE_INFLUENCER_ESPRIT;
    int nFatigue = GetFatigue(oPC);

    if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC)) &&
       GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
        if(WillSave(oTarget,GetSkillRank(SKILL_ALTER,oPC),SAVING_THROW_TYPE_MIND_SPELLS) == 0) {
            AssignCommand(oTarget,ClearAllActions());
            if(GetIsPC(oTarget)) {
                SetPCLike(oTarget,oPC);
                SendMessageToPC(oTarget,"*You lose any animosity towards " + GetName(oPC) + " and accept their next few words as reality*");
            } else {
                SetIsTemporaryFriend(oPC,oTarget);
            }
            SendMessageToPC(oPC,"*You managed to influence your target. Your next words are the truth to them*");
        }
    }

    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueInfluencerEsprit);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}

void PouvoirJediPsychomancie(object oPC, int nPouvoirPsychomancie) {
    int nSpellIdPsychomancie = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_PSYCHOMANCIE_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PSYCHOMANCIE_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_PSYCHOMANCIE_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PSYCHOMANCIE_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_PSYCHOMANCIE_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_PSYCHOMANCIE_3);
    } else {
        int nSkillControle = 0;
        int nSkillSens = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmountLore = 0;
        int nAmountAppraise = 0;
        int nAmountUseMagicDevice = 0;
        float fDuration = 0.0f;
        int nFatiguePsychomancie = 0;
        int nSense = GetSkillRank(SKILL_ENHANCE_SENSES, oPC);
        switch(nPouvoirPsychomancie) {
            case 1: nSkillControle = DIFFICULTE_PSYCHOMANCIE_1_CONTROLE; nSkillSens = DIFFICULTE_PSYCHOMANCIE_1_SENS; nAmountLore = nSense/5; nAmountAppraise = nSense/5; nAmountUseMagicDevice = nSense/5; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatiguePsychomancie = FATIGUE_PSYCHOMANCIE_1; break;
            case 2: nSkillControle = DIFFICULTE_PSYCHOMANCIE_2_CONTROLE; nSkillSens = DIFFICULTE_PSYCHOMANCIE_2_SENS; nAmountLore = nSense/3; nAmountAppraise = nSense/3; nAmountUseMagicDevice = nSense/3; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatiguePsychomancie = FATIGUE_PSYCHOMANCIE_2; break;
            case 3: nSkillControle = DIFFICULTE_PSYCHOMANCIE_3_CONTROLE; nSkillSens = DIFFICULTE_PSYCHOMANCIE_3_SENS; nAmountLore = nSense; nAmountAppraise = nSense; nAmountUseMagicDevice = nSense; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatiguePsychomancie = FATIGUE_PSYCHOMANCIE_3; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
           GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))
          ) {
            effect eLore = EffectSkillIncrease(SKILL_LORE,nAmountLore);
            effect eAppraise = EffectSkillIncrease(SKILL_APPRAISE,nAmountAppraise);
            effect eUseMagicDevice = EffectSkillIncrease(SKILL_USE_MAGIC_DEVICE,nAmountUseMagicDevice);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eLore,eAppraise);
            eLink = EffectLinkEffects(eLink,eUseMagicDevice);
            eLink = EffectLinkEffects(eLink,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatiguePsychomancie);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediDivination(object oPC, int nPouvoirDivination) {

    int nDivinationActivee = GetLocalInt(oPC,DIVINATION_ACTIVEE);
    int nSpellIdDivination = GetSpellId();
    if(IsPouvoirActif(oPC,nSpellIdDivination)) {
        DesactiverPouvoir(oPC,nSpellIdDivination);
    } else if(nDivinationActivee == TRUE) {
        int nDivinationDesactivee = GetLocalInt(oPC,NB_DIVINATION_DESACTIVEE);
        SetLocalInt(oPC,NB_DIVINATION_DESACTIVEE,nDivinationDesactivee +1);
        SetLocalInt(oPC,DIVINATION_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    } else {
        SetLocalInt(oPC,DIVINATION_ACTIVEE,TRUE);
        float fDuration = RoundsToSeconds(5);
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,fDuration));
        DelayCommand(0.2,SetCommandable(FALSE,oPC));
        DelayCommand(fDuration,Divination(oPC,nPouvoirDivination));
    }
}

void Divination(object oPC, int nPouvoirDivination) {
    int nDivinationDesactivee = GetLocalInt(oPC,NB_DIVINATION_DESACTIVEE);

    if(nDivinationDesactivee != 0) {
        SetLocalInt(oPC,NB_DIVINATION_DESACTIVEE,nDivinationDesactivee -1);
    } else {
        DeleteLocalInt(oPC,NB_DIVINATION_DESACTIVEE);
        DeleteLocalInt(oPC,DIVINATION_ACTIVEE);
        SetCommandable(TRUE,oPC);

        int nSkillSens = DIFFICULTE_DIVINATION_SENS;
        int nFatigueDivination = FATIGUE_DIVINATION;
        int nFatigue = GetFatigue(oPC);

        if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))) {
            switch(nPouvoirDivination) {
                case 1:
                    ExploreAreaForPlayer(GetArea(oPC),oPC);
                    break;

                case 2:
                    DetectionPiege(oPC);
                    break;
                default:;
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueDivination);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void DesactiverDivination(object oPC) {
    int nDivinationActivee = GetLocalInt(oPC,DIVINATION_ACTIVEE);
    if(nDivinationActivee == TRUE) {
        int nDivinationDesactivee = GetLocalInt(oPC,NB_DIVINATION_DESACTIVEE);
        SetLocalInt(oPC,NB_DIVINATION_DESACTIVEE,nDivinationDesactivee +1);
        SetLocalInt(oPC,DIVINATION_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    }
}

void DetectionPiege(object oPC) {
    object oTrap = GetFirstObjectInArea(GetArea(oPC));
    while(GetIsObjectValid(oTrap)) {
        if(GetIsTrapped(oTrap)) {
            SetTrapDetectedBy(oTrap,oPC);
        }
        oTrap = GetNextObjectInArea(GetArea(oPC));
    }
}

void PouvoirJediNarcolepsy(object oPC,object oTarget,location locTarget, int nPouvoirNarcolepsy) {

    int nFatigue = GetFatigue(oPC);
    int nSkillControle = 0;
    int nSkillAlteration = 0;
    int nAmount = 0;
    int nFatigueNarcolepsy = 0;
    int nForce = GetNiveauForce(oPC);
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    float fDurationSleep = 0.0f;
    int bMultipleTarget = FALSE;
    int nDonContrePouvoir = 0;
    int nFatigueContrePouvoir = 0;
    switch(nPouvoirNarcolepsy) {
        case 1: nSkillControle = DIFFICULTE_NARCOLEPSY_1_CONTROLE; nSkillAlteration = DIFFICULTE_NARCOLEPSY_1_ALTERATION; nFatigueNarcolepsy = FATIGUE_NARCOLEPSY_1;  fDurationSleep = RoundsToSeconds(nAlteration/3); nDonContrePouvoir = FEAT_JEDI_REGENERATION_1; nFatigueContrePouvoir = FATIGUE_REGENERATION_1/2; break;
        case 2: nSkillControle = DIFFICULTE_NARCOLEPSY_2_CONTROLE; nSkillAlteration = DIFFICULTE_NARCOLEPSY_2_ALTERATION; nFatigueNarcolepsy = FATIGUE_NARCOLEPSY_2; fDurationSleep = RoundsToSeconds(nAlteration); nDonContrePouvoir = FEAT_JEDI_REGENERATION_2; nFatigueContrePouvoir = FATIGUE_REGENERATION_2/2; break;
        case 3: nSkillControle = DIFFICULTE_NARCOLEPSY_3_CONTROLE; nSkillAlteration = DIFFICULTE_NARCOLEPSY_3_ALTERATION; nFatigueNarcolepsy = FATIGUE_NARCOLEPSY_3;  fDurationSleep = RoundsToSeconds(nAlteration/2); bMultipleTarget = TRUE; nDonContrePouvoir = FEAT_JEDI_REGENERATION_3; nFatigueContrePouvoir = FATIGUE_REGENERATION_3/2; break;
        default:;
    }
    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
       GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
        //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
        effect eSleep = EffectSleep();
        effect eEffect = ExtraordinaryEffect(eSleep);
        effect eVisual = EffectVisualEffect(VFX_IMP_SLEEP);

        if(!bMultipleTarget) {
            int nBonus = BonusResistancePouvoir(oTarget,SKILL_ALTER,nDonContrePouvoir,nFatigueContrePouvoir);
            if(FortitudeSave(oTarget,nAlteration-nBonus) == 0) {
                float fDist = GetDistanceBetween(oPC,oTarget) / 20;
                DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oTarget));
                DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oTarget,fDurationSleep));
            }

        } else {
            //SendMessageToPC(oPC,"recherche cible...");

            oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE,IntToFloat(nAlteration),locTarget,TRUE);
//            SendMessageToPC(oPC,"1ere cible : "+GetName(oTarget));
            while(GetIsObjectValid(oTarget)) {
                if(oTarget != oPC &&
                   ( GetIsReactionTypeHostile(oTarget,oPC) ||
                     (GetIsReactionTypeNeutral(oTarget,oPC) && GetIsPC(oTarget))
                   )
                  ){
                    int nBonus = BonusResistancePouvoir(oTarget,SKILL_ALTER,nDonContrePouvoir,nFatigueContrePouvoir);
                    if(oTarget == oPC) {
                        //SendMessageToPC(oPC,"Je suis maso, je me cible moi meme");
                    } else if(FortitudeSave(oTarget,nAlteration-nBonus) == 0) {

                        //SendMessageToPC(oPC,GetName(oTarget) + " endormi!");
                        float fDist = GetDistanceBetween(oPC,oTarget) / 20;
                        DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oTarget));
                        DelayCommand(fDist,ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oTarget,fDurationSleep));
                    } else {
                        //SendMessageToPC(oPC,GetName(oTarget) + " non endormi!");
                    }
                }
                oTarget = GetNextObjectInShape(SHAPE_SPELLCONE,IntToFloat(nAlteration),locTarget,TRUE);
                //SendMessageToPC(oPC,"prochaine cible : "+GetName(oTarget));
            }
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueNarcolepsy);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}




void PouvoirJediMaladie(object oPC,object oTarget) {

    int nFatigue = GetFatigue(oPC);
    int nSkillControle = DIFFICULTE_DISEASE_CONTROLE;
    int nSkillAlteration = DIFFICULTE_DISEASE_ALTERATION;
    int nFatigueDisease = FATIGUE_DISEASE;
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
       GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
        //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
        int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,FEAT_JEDI_REGENERATION_1,FATIGUE_REGENERATION_1/2);
        if(FortitudeSave(oTarget,nAlteration-nBonus) == 0) {
            int nDiseaseType = 0;
            int nVisualEffect = 0;
            if(nAlteration >=35) {
                nDiseaseType = DISEASE_SITH_DISEASE_3;
                nVisualEffect = VFX_IMP_DISEASE_S;
            } else if(nAlteration >=25) {
                nDiseaseType = DISEASE_SITH_DISEASE_2;
                nVisualEffect = VFX_IMP_DISEASE_S;
            } else {
                nDiseaseType = DISEASE_SITH_DISEASE_1;
                nVisualEffect = VFX_IMP_DISEASE_S;
            }
            effect eDisease = EffectDisease(nDiseaseType);
            effect eEffect = SupernaturalEffect(eDisease);
            effect eVisual = EffectVisualEffect(nVisualEffect);

            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oTarget);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oTarget);
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueDisease);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}

void PouvoirJediPoison(object oPC,object oTarget) {

    int nFatigue = GetFatigue(oPC);
    int nSkillControle = DIFFICULTE_POISON_CONTROLE;
    int nSkillAlteration = DIFFICULTE_POISON_ALTERATION;
    int nFatiguePoison = FATIGUE_POISON;
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
       GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
        //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
        SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_POISON));
        int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,FEAT_JEDI_REGENERATION_2,FATIGUE_REGENERATION_2/2);
        if(FortitudeSave(oTarget,nAlteration-nBonus) == 0) {
            int nPoisonType = 0;
            int nVisualEffect = 0;
            if(nAlteration >=40) {
                nPoisonType = POISON_SITH_POISON_3;
                nVisualEffect = VFX_IMP_POISON_L;
            } else if(nAlteration >=30) {
                nPoisonType = POISON_SITH_POISON_2;
                nVisualEffect = VFX_IMP_POISON_S;
            } else {
                nPoisonType = POISON_SITH_POISON_1;
                nVisualEffect = VFX_IMP_POISON_S;
            }
            effect ePoison = EffectPoison(nPoisonType);
            effect eEffect = SupernaturalEffect(ePoison);
            effect eVisual = EffectVisualEffect(nVisualEffect);

            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oTarget);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oTarget);
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatiguePoison);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void PouvoirJediParalysie(object oPC, object oTarget) {
    int nSpellIdParalysie = GetSpellId();

    if(GetLocalObject(oPC,PARALYSIE_CIBLE) == oTarget) {
        SendMessageToPC(oPC,"*Power already active*");
        return;
    }
    //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
    if(oPC == oTarget) {
        if(GetIsObjectValid(GetLocalObject(oPC,PARALYSIE_CIBLE))) {
            SendMessageToPC(oPC,"*you release your target from paralysis*");
            DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        } else {
            SendMessageToPC(oPC,"*you are not paralyzing anyone currently*");
        }
        return;
    }

    int nSkillControle = DIFFICULTE_PARALYSIE_CONTROLE;
    int nSkillAlteration = DIFFICULTE_PARALYSIE_ALTERATION;
    int nFatigue = GetFatigue(oPC);
    int nFatigueParalysie = FATIGUE_PARALYSIE;

    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)) &&
       GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC))
      ) {
      SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_HOLD_MONSTER));
      SetLocalObject(oPC,PARALYSIE_CIBLE,oTarget);
      DelayCommand(2.0,Paralysie(oPC,oTarget, nSpellIdParalysie));
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueParalysie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void Paralysie(object oPC,object oTarget, int nSpellIdParalysie) {
    if(!GetIsObjectValid(oPC)) {
        return;
    }
    if(!GetIsObjectValid(oTarget)) {
        //SendMessageToPC(oPC,"votre cible n'est plus valide");
        return;
    }
    if(GetIsDead(oTarget)) {
        //SendMessageToPC(oPC,"votre cible a succombe");
        DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        return;
    }
    if(GetCurrentAction(oPC) != ACTION_INVALID) {
//        SendMessageToPC(oPC,"vous avez fait l'action "+IntToString(GetCurrentAction(oPC)));
        SendMessageToPC(oPC,"*You lost your concentration to paralyze your target*");
        DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        return;
    }
    if(GetDistanceBetween(oPC,oTarget) > 4.0) {
        SendMessageToPC(oPC,"*you are too far from your target to maintain your power*");
        DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        return;
    }

    if(GetIsDead(oPC)) {
        DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        return;
    }

    if(GetLocalObject(oPC,PARALYSIE_CIBLE) == oTarget) {
        int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,FEAT_JEDI_REGENERATION_3,FATIGUE_REGENERATION_3/2);
        int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
        if(FortitudeSave(oTarget,nAlteration-nBonus) == 0) {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_HOLD_MONSTER));
            //SendMessageToPC(oPC,"la cible n'a pas resiste");
            int nForce = GetNiveauForce(oPC);

            effect eHold = EffectCutsceneParalyze();
            effect eVisual1 = EffectVisualEffect(VFX_DUR_PARALYZE_HOLD);
            effect eVisual2 = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
            effect eLink = EffectLinkEffects(eHold,eVisual1);
            eLink = EffectLinkEffects(eLink,eVisual2);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oTarget,3.0);
            effect eDamage = ExtraordinaryEffect(EffectDamage(d6()+nAlteration / 3));
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget);

            DelayCommand(3.0,Paralysie(oPC,oTarget, nSpellIdParalysie));
        } else {
            //SendMessageToPC(oPC,"la cible a resiste");
            DeleteLocalObject(oPC,PARALYSIE_CIBLE);
        }
    }
}

void PouvoirJediForceAme(object oPC, int nPouvoirForceAme) {
    int nSpellIdForceAme = GetSpellId();

    if(IsPouvoirActif(oPC,SPELL_JEDI_FORCE_AME_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_FORCE_AME_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_FORCE_AME_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_FORCE_AME_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_FORCE_AME_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_FORCE_AME_3);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_FORCE_AME_4)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_FORCE_AME_4);
    } else {
        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmountWill = 0;
        int nAmountSpellResistance = 0;
        int bMentalImmunity = FALSE;
        float fDuration = 0.0f;
        int nFatigueForceAme = 0;
        switch(nPouvoirForceAme) {
            case 1: nSkillControle = DIFFICULTE_FORCE_AME_1_CONTROLE; nAmountWill = 5; nAmountSpellResistance = 0; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatigueForceAme = FATIGUE_FORCE_AME_1; break;
            case 2: nSkillControle = DIFFICULTE_FORCE_AME_2_CONTROLE; nAmountWill = 10; nAmountSpellResistance = 0; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatigueForceAme = FATIGUE_FORCE_AME_2; break;
            case 3: nSkillControle = DIFFICULTE_FORCE_AME_3_CONTROLE; nAmountWill = 15; nAmountSpellResistance = 0; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatigueForceAme = FATIGUE_FORCE_AME_3; break;
            case 4: nSkillControle = DIFFICULTE_FORCE_AME_4_CONTROLE; nAmountWill = 15; nAmountSpellResistance = 0; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/2); nFatigueForceAme = FATIGUE_FORCE_AME_4; bMentalImmunity = TRUE; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            nAmountSpellResistance = nAmountSpellResistance + GetSpellResistance(oPC);
            effect eWill = EffectSavingThrowIncrease(SAVING_THROW_WILL,nAmountWill);
            effect eSpellResistance = EffectSpellResistanceIncrease(nAmountSpellResistance);
            effect eVisual = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
            effect eLink = EffectLinkEffects(eWill,eSpellResistance);
            if(bMentalImmunity) {
                effect eMentalImmunity = EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS);
                eLink = EffectLinkEffects(eLink,eMentalImmunity);
            }
            eLink = EffectLinkEffects(eLink,eVisual);
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueForceAme);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediSentirViePassive(object oPC, int nPouvoirSentirViePassive) {
    int nSpellIdSentirViePassive = GetSpellId();

    if(IsPouvoirActif(oPC,nSpellIdSentirViePassive)) {
        DesactiverPouvoir(oPC,nSpellIdSentirViePassive);
    } else {
        int nSkillSens = 0;
        int nFatigue = GetFatigue(oPC);
        int nAmountDetection = 0;
        int bSeeInvisible = FALSE;
        int bTrueSeeing = FALSE;
        float fDuration = 0.0f;
        int nFatigueSentirViePassive = 0;
        switch(nPouvoirSentirViePassive) {
            case 1: nSkillSens = DIFFICULTE_SENTIR_VIE_PASSIVE_1_SENS; nAmountDetection = 10; fDuration = TurnsToSeconds(GetSkillRank(SKILL_SENSE,oPC)/5); nFatigueSentirViePassive = FATIGUE_SENTIR_VIE_PASSIVE_1; break;
            case 2: nSkillSens = DIFFICULTE_SENTIR_VIE_PASSIVE_2_SENS; nAmountDetection = 20; fDuration = TurnsToSeconds(GetSkillRank(SKILL_SENSE,oPC)/4); nFatigueSentirViePassive = FATIGUE_SENTIR_VIE_PASSIVE_2; bSeeInvisible = TRUE; break;
            case 3: nSkillSens = DIFFICULTE_SENTIR_VIE_PASSIVE_3_SENS; nAmountDetection = 30; fDuration = TurnsToSeconds(GetSkillRank(SKILL_SENSE,oPC)/3); nFatigueSentirViePassive = FATIGUE_SENTIR_VIE_PASSIVE_3; bSeeInvisible = TRUE; bTrueSeeing = TRUE; break; //bTrueSeeing = TRUE; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))) {
            effect eDetection = EffectSkillIncrease(SKILL_SPOT,nAmountDetection);
            effect eVisual = EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT);
            effect eLink = EffectLinkEffects(eDetection,eVisual);
            if(bSeeInvisible) {
                effect eSeeInvisible = EffectSeeInvisible();
                eLink = EffectLinkEffects(eLink,eSeeInvisible);
            }
            if(bTrueSeeing) {
                //effect eTrueSeeing = EffectTrueSeeing();
                effect eTrueSeeing = EffectUltravision();
                eLink = EffectLinkEffects(eLink,eTrueSeeing);
            }
            effect eEffect = ExtraordinaryEffect(eLink);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueSentirViePassive);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void PouvoirJediSentirVieActive(object oPC,int nPouvoirSentirVieActive) {
    int nSpellIdSentirVieActive = GetSpellId();

    int nSentirVieActivee = GetLocalInt(oPC,SENTIR_VIE_ACTIVEE);
    if(IsPouvoirActif(oPC,nSpellIdSentirVieActive)) {
        DesactiverPouvoir(oPC,nSpellIdSentirVieActive);
    } else if(nSentirVieActivee == TRUE) {
        int nSentirVieDesactivee = GetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE);
        SetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE,nSentirVieDesactivee +1);
        SetLocalInt(oPC,SENTIR_VIE_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    } else {
        SetLocalInt(oPC,SENTIR_VIE_ACTIVEE,TRUE);
        float fDuration = RoundsToSeconds(2);
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,fDuration));
        DelayCommand(0.2,SetCommandable(FALSE,oPC));
        DelayCommand(fDuration - 0.2,SentirVie(oPC,nPouvoirSentirVieActive));
    }
}

void DesactiverSentirVieActive(object oPC) {
    int nSentirVieActivee = GetLocalInt(oPC,SENTIR_VIE_ACTIVEE);
    if(nSentirVieActivee == TRUE) {
        int nSentirVieDesactivee = GetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE);
        SetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE,nSentirVieDesactivee +1);
        SetLocalInt(oPC,SENTIR_VIE_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    }
}

void SentirVie(object oPC, int nPouvoirSentirVieActive) {

    int nSentirVieDesactivee = GetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE);

    if(nSentirVieDesactivee != 0) {
        SetLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE,nSentirVieDesactivee -1);
    } else {
        DeleteLocalInt(oPC,NB_SENTIR_VIE_DESACTIVEE);
        DeleteLocalInt(oPC,SENTIR_VIE_ACTIVEE);
        SetCommandable(TRUE,oPC);

        int nSkillSens = DIFFICULTE_SENTIR_VIE_ACTIVE_SENS;
        int nFatigue = GetFatigue(oPC);
        int nFatigueSentirVieActive = FATIGUE_SENTIR_VIE_ACTIVE;

        if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))) {

            object oArea = GetArea(oPC);
            object oTarget = GetFirstObjectInArea(oArea);
            int bDetectedLife = FALSE;
            int nDetectedLifeCreatures = 0;
            string sDetectedLife = "";

            while(GetIsObjectValid(oTarget)) {
                if( (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE) &&
                    (oTarget != oPC) &&
                    (GetRacialType(oTarget) != RACIAL_TYPE_CONSTRUCT) &&
                    (GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
                  ) {
                    bDetectedLife = TRUE;
                    if(nPouvoirSentirVieActive == 1) {
                        break;
                    }
                    nDetectedLifeCreatures = nDetectedLifeCreatures + 1;
                    if(nPouvoirSentirVieActive == 3) {
                       if(nDetectedLifeCreatures > 1) {
                           sDetectedLife = sDetectedLife + ", ";
                       }
                       sDetectedLife = sDetectedLife + "1 " + GetRacialName(GetRacialType(oTarget));
                    }
                }
                oTarget = GetNextObjectInArea(oArea);
            }

            string sMessage = "";
            if(!bDetectedLife) {
                sMessage = "*you do not detect any nearby lifeforms*";
            } else {
                sMessage = "*nearby lifeforms detected, ";
                if(nDetectedLifeCreatures > 0) {
                    sMessage = sMessage + IntToString(nDetectedLifeCreatures) + " creatures";
                }
                if(sDetectedLife != "") {
                    sMessage = sMessage + ": " + sDetectedLife;
                }
            }
            SendMessageToPC(oPC,sMessage);
        }

        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueSentirVieActive);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

string GetRacialName(int nRacialType) {
    switch(nRacialType) {
        case RACIAL_TYPE_DWARF: return "unknown humanoid";
        case RACIAL_TYPE_ELF: return "humanoid";
        case RACIAL_TYPE_GNOME: return "unknown humanoid";
        case RACIAL_TYPE_HALFLING: return "unknown humanoid";
        case RACIAL_TYPE_HALFELF: return "unknown humanoid";
        case RACIAL_TYPE_HALFORC: return "wookiee";
        case RACIAL_TYPE_HUMAN: return "human";
        case RACIAL_TYPE_ABERRATION: return "aberration";
        case RACIAL_TYPE_ANIMAL: return "animal";
        case RACIAL_TYPE_BEAST: return "beast";
        case RACIAL_TYPE_DRAGON: return "dragon";
        case RACIAL_TYPE_HUMANOID_GOBLINOID: return "unknown humanoid";
        case RACIAL_TYPE_HUMANOID_MONSTROUS: return "unknown humanoid";
        case RACIAL_TYPE_HUMANOID_ORC: return "unknown humanoid";
        case RACIAL_TYPE_HUMANOID_REPTILIAN: return "unknown humanoid";
        case RACIAL_TYPE_ELEMENTAL: return "elemental";
        case RACIAL_TYPE_FEY: return "fee";
        case RACIAL_TYPE_GIANT: return "geant";
        case RACIAL_TYPE_MAGICAL_BEAST: return "bete magique";
        case RACIAL_TYPE_OUTSIDER: return "exterieur";
        case RACIAL_TYPE_SHAPECHANGER: return "unknown humanoid";
        case RACIAL_TYPE_VERMIN: return "vermin";
        //case RACIAL_TYPE_OGREMAGE: return "humanoide monstrueux";
        //case RACIAL_TYPE_TROLL: return "humanoide monstrueux";
        //case RACIAL_TYPE_KOBOLD: return "reptilien";
        //case RACIAL_TYPE_DROW: return "elfe";
        //case RACIAL_TYPE_MINOTAURE: return "humanoide monstrueux";
        default:;
    }
    return "";
}

void PouvoirJediSentirFlux(object oPC, object oTarget) {
    int nSpellIdSentirFlux = GetSpellId();

    if(IsPouvoirActif(oPC,nSpellIdSentirFlux)) {
        DesactiverPouvoir(oPC,nSpellIdSentirFlux);
    } else {
        int nSkillSens = DIFFICULTE_SENTIR_FLUX_SENS;
        int nFatigue = GetFatigue(oPC);
        int nFatigueSentirFlux = FATIGUE_SENTIR_FLUX;

        if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC))) {
            string sMessage = "";
            if(oPC != oTarget) {
                float fPresence = GetPresenceJedi(oTarget);
                if(!GetHasFeat(FEAT_SENSIBLE_FORCE ,oTarget) || fPresence == 0.0) {
                    sMessage = sMessage + "*The target is insensitive to the Force*";
                } else {
                    sMessage = sMessage + "*The target is sensitive to the Force,";
                    if(GetNiveauForce(oTarget) > 0 || fPresence > 0.25) {
                        sMessage = sMessage + "and seems to have an influence on the Force*";
                    } else {
                        sMessage = sMessage + "but seems to have no influence on the Force*";
                    }
                    int nSkillSum = GetSkillRank(SKILL_SENSE,oTarget,TRUE) + GetSkillRank(SKILL_CONTROL,oTarget,TRUE) + GetSkillRank(SKILL_ALTER,oTarget,TRUE) + GetSkillRank(SKILL_ENHANCE_SENSES,oTarget,TRUE) + GetSkillRank(SKILL_ENHANCE_ABILITY,oTarget,TRUE) + GetSkillRank(SKILL_FORCE_STRIKE,oTarget,TRUE) + GetSkillRank(SKILL_FORCE_DEFENSE,oTarget,TRUE);
                    nSkillSum = FloatToInt(nSkillSum * fPresence);
                    if(nSkillSum >= 90) {
                        sMessage = sMessage + "The Force is exploding from the target*";
                    } else if(nSkillSum >= 60) {
                        sMessage = sMessage + "The Force surrounds the target*";
                    } else if(nSkillSum >= 30) {
                        sMessage = sMessage + "The Force is strong in the target*";
                    } else if(nSkillSum >= 10) {
                        sMessage = sMessage + "The Force is mild in the target*";
                    } else {
                        sMessage = sMessage + "The Force is very weak in the target*";
                    }
                }

            } else {
                object oArea = GetArea(oPC);
                oTarget = GetFirstObjectInArea(oArea);
                float fFluxColor = 0.0;
                while(GetIsObjectValid(oTarget)) {
//                    SendMessageToPC(oPC, "cible:"+GetName(oTarget)+" niveau force:"+IntToString(GetNiveauForce(oTarget))+ "lumineux?" + IntToString(GetIsFluxLumineux(oPC)));
                    if( (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE) &&
                        (GetNiveauForce(oTarget) > 0)
                      ) {
                        float fPresence = GetPresenceJedi(oTarget);
                        if(GetIsFluxLumineux(oPC) == GetIsFluxLumineux(oTarget)) {
                            fFluxColor = fFluxColor + fPresence * GetNiveauForce(oTarget) / 5;
                        } else {
                            fFluxColor = fFluxColor - 2 * fPresence * (GetNiveauForce(oTarget)/5);
                        }
                    }
                oTarget = GetNextObjectInArea(oArea);
                }
                if(fFluxColor == 0.0) {
                    sMessage = sMessage + "The Force is neutral in the target*";
                } else if(fFluxColor > 0.0) {
                    sMessage = sMessage + "The Force is Light in the target*";
                } else {
                    sMessage = sMessage + "The Force is Dark in the target*";
                }
            }
            SendMessageToPC(oPC,sMessage);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueSentirFlux);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

float GetPresenceJedi(object oCreature) {
    if(IsPouvoirActif(oCreature,SPELL_JEDI_DISCRETION_4)) {
        return 0.0;
    } else if(IsPouvoirActif(oCreature,SPELL_JEDI_DISCRETION_3)) {
        return 0.25;
    } else if(IsPouvoirActif(oCreature,SPELL_JEDI_DISCRETION_2)) {
        return 0.50;
    } else if(IsPouvoirActif(oCreature,SPELL_JEDI_DISCRETION_1)) {
        return 0.75;
    }
    return 1.0;
}

void PouvoirJediAbsorptionVie(object oPC,object oTarget, int nPouvoirAbsorptionVie) {

    int nFatigue = GetFatigue(oPC);
    int nSkillControle = 0;
    int nAmountLife = 0;
    int nAmountAbility = 0;
    int nSubType = 0;
    int bStrengthDecreased = FALSE;
    int bConstitutionDecreased = FALSE;
    int bDexterityDecreased = FALSE;
    int bLevelAbsorption = FALSE;
    int nFatigueAbsorptionVie = 0;
    int nForce = GetNiveauForce(oPC);
    int nAlteration = GetSkillRank(SKILL_ALTER,oPC);
    float fDuration = 0.0f;
    int nDonContrePouvoir = 0;
    int nFatigueContrePouvoir = 0;
    int nDCBase = 0;
    switch(nPouvoirAbsorptionVie) {
        case 1: nSkillControle = DIFFICULTE_ABSORPTION_VIE_1_CONTROLE; nAmountLife = nAlteration; nAmountAbility = 2; nSubType = SUBTYPE_MAGICAL; bStrengthDecreased = TRUE; nFatigueAbsorptionVie = FATIGUE_ABSORPTION_VIE_1;  fDuration = RoundsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/4); nDonContrePouvoir = FEAT_JEDI_REGENERATION_1;nFatigueContrePouvoir = FATIGUE_REGENERATION_1;break;
        case 2: nSkillControle = DIFFICULTE_ABSORPTION_VIE_2_CONTROLE; nAmountLife = 3*nAlteration/2; nAmountAbility = 3; nSubType = SUBTYPE_EXTRAORDINARY; bStrengthDecreased = TRUE; bConstitutionDecreased = TRUE; nFatigueAbsorptionVie = FATIGUE_ABSORPTION_VIE_2;  fDuration = RoundsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/3); nDonContrePouvoir = FEAT_JEDI_REGENERATION_2;nFatigueContrePouvoir = FATIGUE_REGENERATION_2;nDCBase = 5; break;
        case 3: nSkillControle = DIFFICULTE_ABSORPTION_VIE_3_CONTROLE; nAmountLife = 2*nAlteration; nAmountAbility = 4; nSubType = SUBTYPE_SUPERNATURAL; bStrengthDecreased = TRUE; bConstitutionDecreased = TRUE; bDexterityDecreased = TRUE; bLevelAbsorption = FALSE; nFatigueAbsorptionVie = FATIGUE_ABSORPTION_VIE_3;  fDuration = RoundsToSeconds(GetSkillRank(SKILL_ALTER,oPC)/2); nDonContrePouvoir = FEAT_JEDI_REGENERATION_3;nFatigueContrePouvoir = FATIGUE_REGENERATION_3;nDCBase = 10; break;
        default:;
    }
    if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
        //SetAlignmentGoodEvil(oPC,GetAlignmentGoodEvil(oPC)-1);
        int nBonus = BonusResistancePouvoir(oTarget,SKILL_CONTROL,nDonContrePouvoir,nFatigueContrePouvoir);
        if(FortitudeSave(oTarget,nDCBase + nAlteration - nBonus) == 0) {
            SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_ENERGY_DRAIN));
            if(!GetIsImmune(oTarget,IMMUNITY_TYPE_ABILITY_DECREASE)) {
                effect eDamage = EffectDamage(nAmountLife,DAMAGE_TYPE_NEGATIVE);
                ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget);
                effect eTemporaryHitPoints = EffectTemporaryHitpoints(nAmountLife);
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eTemporaryHitPoints,oPC,fDuration);


                effect eMalusLink;
                effect eBonusLink;
                if(bStrengthDecreased) {
                    effect eStrengthDecrease = EffectAbilityDecrease(ABILITY_STRENGTH,nAmountAbility);
                    eMalusLink = eStrengthDecrease;
                    effect eStrengthIncrease = EffectAbilityIncrease(ABILITY_STRENGTH,nAmountAbility);
                    eBonusLink = eStrengthIncrease;
                }
                if(bConstitutionDecreased) {
                    effect eConstitutionDecrease = EffectAbilityDecrease(ABILITY_CONSTITUTION,nAmountAbility);
                    eMalusLink = EffectLinkEffects(eMalusLink,eConstitutionDecrease);
                    effect eConstitutionIncrease = EffectAbilityIncrease(ABILITY_CONSTITUTION,nAmountAbility);
                    eBonusLink = EffectLinkEffects(eBonusLink,eConstitutionIncrease);
                }
                if(bDexterityDecreased) {
                    effect eDexterityDecrease = EffectAbilityDecrease(ABILITY_DEXTERITY,nAmountAbility);
                    eMalusLink = EffectLinkEffects(eMalusLink,eDexterityDecrease);
                    effect eDexterityIncrease = EffectAbilityIncrease(ABILITY_DEXTERITY,nAmountAbility);
                    eBonusLink = EffectLinkEffects(eBonusLink,eDexterityIncrease);
                }
                effect eEffect;
                switch(nSubType) {
                    case SUBTYPE_MAGICAL:
                        eEffect = eMalusLink;
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oTarget,fDuration);
                        break;
                    case SUBTYPE_EXTRAORDINARY:
                        eEffect = ExtraordinaryEffect(eMalusLink);
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oTarget);
                        break;
                    case SUBTYPE_SUPERNATURAL:
                        eEffect = SupernaturalEffect(eMalusLink);
                        ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oTarget);
                        break;
                    default:;
                }
                eEffect = eBonusLink;
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);

            }
            if(bLevelAbsorption && !GetIsImmune(oTarget,IMMUNITY_TYPE_NEGATIVE_LEVEL)) {
                effect eLevelAbsorption = EffectNegativeLevel(2);
                effect eEffect = SupernaturalEffect(eLevelAbsorption);
                ApplyEffectToObject(DURATION_TYPE_PERMANENT,eEffect,oTarget);
            }
            effect eVisual = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eVisual,oTarget);
        }
    }
    int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueAbsorptionVie);
    SetFatigue(oPC,nFatigue + nFatiguePouvoir);
    Activation_Fatigue_Recuperation(oPC);
}


void PouvoirJediTranseCombat(object oPC,int nPouvoirTranseCombat) {
    int nSpellIdTranseCombat = GetSpellId();

    int nTranseActivee = GetLocalInt(oPC,TRANSE_COMBAT_ACTIVEE);
    if(IsPouvoirActif(oPC,SPELL_JEDI_TRANSE_COMBAT_1)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_TRANSE_COMBAT_1);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_TRANSE_COMBAT_2)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_TRANSE_COMBAT_2);
    } else if(IsPouvoirActif(oPC,SPELL_JEDI_TRANSE_COMBAT_3)) {
        DesactiverPouvoir(oPC,SPELL_JEDI_TRANSE_COMBAT_3);
    } else if(nTranseActivee == TRUE) {
        int nTranseDesactivee = GetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE);
        SetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE,nTranseDesactivee +1);
        SetLocalInt(oPC,TRANSE_COMBAT_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    } else {
        SetLocalInt(oPC,TRANSE_COMBAT_ACTIVEE,TRUE);
        float fDelay = RoundsToSeconds(5);
        AssignCommand(oPC,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE,1.0,fDelay));
        DelayCommand(0.2,SetCommandable(FALSE,oPC));
        int nFatigue = GetFatigue(oPC);
        int nAmountAttack = 0;
        int nAmountAC = 0;
        int nAmountParry = 0;
        float fDuration = 0.0f;
        int bMulti = FALSE;
        switch(nPouvoirTranseCombat) {
            case 1: nAmountAttack = 1; nAmountAC = 1; break;
            case 2: nAmountAttack = 3; nAmountAC = 2; nAmountParry = 5; break;
            case 3: nAmountAttack = 5; nAmountAC = 3; nAmountParry = 10; bMulti = TRUE; break;
            default:;
        }
        effect eAttack = EffectAttackIncrease(nAmountAttack);
        effect eAC = EffectACIncrease(nAmountAC,AC_DODGE_BONUS);
        effect eLink = EffectLinkEffects(eAttack,eAC);
        if(nAmountParry > 0) {
            effect eParry = EffectSkillIncrease(SKILL_PARRY,nAmountParry);
            eLink = EffectLinkEffects(eLink,eParry);
        }
        effect eVisual = EffectVisualEffect(VFX_DUR_SANCTUARY);
        eLink = EffectLinkEffects(eVisual,eLink);
        effect eEffect = ExtraordinaryEffect(eLink);
        DelayCommand(fDelay - 0.2,TranseCombat(oPC, nPouvoirTranseCombat, eEffect, bMulti));
    }
}

void TranseCombat(object oPC, int nPouvoirTranseCombat, effect eEffect, int bMulti) {
    int nTranseDesactivee = GetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE);

    if(nTranseDesactivee != 0) {
        SetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE,nTranseDesactivee -1);
    } else {
        DeleteLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE);
        DeleteLocalInt(oPC,TRANSE_COMBAT_ACTIVEE);
        SetCommandable(TRUE,oPC);

        int nSkillControle = 0;
        int nFatigue = GetFatigue(oPC);
        float fDuration = 0.0f;
        int nFatigueTranseCombat = 0;
        object oTarget;
        location lLocation;
        switch(nPouvoirTranseCombat) {
            case 1: nSkillControle = DIFFICULTE_TRANSE_COMBAT_1_CONTROLE; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/5); nFatigueTranseCombat = FATIGUE_TRANSE_COMBAT_1; break;
            case 2: nSkillControle = DIFFICULTE_TRANSE_COMBAT_2_CONTROLE; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/4); nFatigueTranseCombat = FATIGUE_TRANSE_COMBAT_2; break;
            case 3: nSkillControle = DIFFICULTE_TRANSE_COMBAT_3_CONTROLE; fDuration = TurnsToSeconds(GetSkillRank(SKILL_CONTROL,oPC)/3); nFatigueTranseCombat = FATIGUE_TRANSE_COMBAT_3; break;
            default:;
        }
        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))) {
            if (!bMulti)
            {
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
            }
            else
            {
                lLocation = GetLocation(oPC);
                oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, lLocation, TRUE);
                while (GetIsObjectValid(oTarget))
                {
                    if(GetIsFriend(oTarget))
                    {
                        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect,oPC,fDuration);
                    }
                    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 10.0, lLocation, TRUE);
                }
            }
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTranseCombat);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }

}

void DesactiverTranseCombat(object oPC){
    int nTranseActivee = GetLocalInt(oPC,TRANSE_COMBAT_ACTIVEE);
    if(nTranseActivee == TRUE) {
        int nTranseDesactivee = GetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE);
        SetLocalInt(oPC,NB_TRANSE_COMBAT_DESACTIVEE,nTranseDesactivee +1);
        SetLocalInt(oPC,TRANSE_COMBAT_ACTIVEE,FALSE);
        SetCommandable(TRUE,oPC);
        AssignCommand(oPC,ClearAllActions());
    }
}


void PouvoirJediTelepathie(object oPC) {
    int nSpellIdTelepathie = GetSpellId();

    if(IsPouvoirActif(oPC,nSpellIdTelepathie)) {
        DesactiverPouvoir(oPC,nSpellIdTelepathie);
        StopTelepathie(oPC);
    } else {
        int nSkillSens = DIFFICULTE_TELEPATHIE_SENS;
        int nSkillControle = DIFFICULTE_TELEPATHIE_CONTROLE;
        int nFatigue = GetFatigue(oPC);
        float fDuration = RoundsToSeconds(GetSkillRank(SKILL_CONTROL,oPC) / 4);
        int nFatigueTelepathie = FATIGUE_TELEPATHIE;

        if(GetIsSkillSuccessful(oPC,SKILL_SENSE,nSkillSens+nFatigue+GetMalusForceArmure(oPC)) &&
           GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC))
          ) {
            SendMessageToPC(oPC,"Type the name of the player you would like to communicate with");
            object oTelepathe = CreateObject(OBJECT_TYPE_CREATURE,"telepathy",GetLocation(oPC));
            SetLocalObject(oTelepathe,TELEPATHIE_PJ,oPC);
            SetLocalObject(oPC,TELEPATHE_PNJ,oTelepathe);
            SetListening(oTelepathe,TRUE);
            SetListenPattern(oTelepathe,"**",PATTERN_LISTEN_TELEKINESIE);
            AssignCommand(oTelepathe,ActionForceFollowObject(oPC));
            effect eInvisibility = EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,eInvisibility,oTelepathe);
            DestroyObject(oTelepathe,fDuration);
            effect eConcentration = EffectSkillDecrease(SKILL_CONCENTRATION,5);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eConcentration,oPC,fDuration);
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueTelepathie);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
}

void StopTelepathie(object oPC) {
    object oTelepathe = GetLocalObject(oPC,TELEPATHE_PNJ);
    if(GetIsObjectValid(oTelepathe)) {
        DestroyObject(oTelepathe);
    }
}

void PowerJediLightsaberThrow(object oPC, location lTarget) {
    int nSpellIdThrow = GetSpellId();
    object oTarget;
    int oItemType = GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC));
    if (oItemType == BASE_ITEM_SLING || oItemType == BASE_ITEM_LIGHTCROSSBOW || oItemType == BASE_ITEM_HEAVYCROSSBOW || oItemType == BASE_ITEM_SHORTBOW || oItemType == BASE_ITEM_LONGBOW)
    {
        SendMessageToPC(oPC, "You cannot throw the currently equipped object.");
        return;
    }

    //if (GetLocalInt(oPC, "LSTHROWING") != TRUE)
    //{
        int nSkillControle = DIFFICULTE_LIGHTSABER_THROW;
        //int nSkillAlteration = DIFFICULTE_PARALYSIE_ALTERATION;
        int nFatigue = GetFatigue(oPC);
        int nFatigueThrow = FATIGUE_LIGHTSABER_THROW;

        if(GetIsSkillSuccessful(oPC,SKILL_CONTROL,nSkillControle+nFatigue+GetMalusForceArmure(oPC)))
        {
            //location lTargetLocation = GetLocation(oTarget);
            int nControl = GetSkillRank(SKILL_CONTROL,oPC);
            float fDelay;
            int nDamage;
            //SetLocalInt(oPC, "LSTHROWING", TRUE);
            //SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_HOLD_MONSTER));
            AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM4));
            oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 8.2, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
            //Cycle through the targets within the spell shape until an invalid object is captured.
            while(GetIsObjectValid(oTarget))
            {
                SendMessageToPC(oPC, "Target is valid");
                //if (spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
                //{
                    {
                        //Fire cast spell at event for the specified target
                        //SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_CONE_OF_COLD));
                        //Get the distance between the target and caster to delay the application of effects
                        fDelay = GetDistanceBetween(OBJECT_SELF, oTarget)/10.0;
                        //Make SR check, and appropriate saving throw(s).
                        //if(!MyResistSpell(OBJECT_SELF, oTarget, fDelay) && (oTarget != OBJECT_SELF))
                        //{
                            //Detemine damage
                            nDamage = d12(4);
                            SendMessageToPC(oPC, "Base Damage is " + IntToString(nDamage));
                            //Adjust damage according to Reflex Save, Evasion or Improved Evasion
                            nDamage = GetReflexAdjustedDamage(nDamage, oTarget, nControl, SAVING_THROW_TYPE_ELECTRICITY);
                            SendMessageToPC(oPC, "Adjusted Damage is " + IntToString(nDamage));
                            // Apply effects to the currently selected target.
                            effect eCold = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
                            effect eVis = EffectVisualEffect(VFX_IMP_SONIC);
                            if(nDamage > 0)
                            {
                                SendMessageToPC(oPC, "Applying " + IntToString(nDamage) + " points of damage");
                                //Apply delayed effects
                                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eCold, oTarget));
                            }
                        //}
                    }
                //}
                //Select the next target within the spell shape.
                oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 8.2, lTarget, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
                //oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 11.0, lTargetLocation, TRUE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
            }
            //DelayCommand(15.0, SetLocalInt(oPC, "LSTHROWING", FALSE));
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueThrow);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    //}
    //else
    //{
    //    SendMessageToPC(oPC, "It is too soon to throw you saber again.");
    //}
}

// Redo to allow deactivation
void PowerJediChoke(object oPC, object oTarget)
{
    int nSpellIdThrow = GetSpellId();
    int nSkillAlteration = DIFFICULTE_CHOKE;
    int nFatigue = GetFatigue(oPC);
    int nFatigueThrow = FATIGUE_CHOKE;

    if (GetLocalInt(oPC, "LSCHOKING") != TRUE)
    {
        if(GetIsSkillSuccessful(oPC,SKILL_ALTER,nSkillAlteration+nFatigue+GetMalusForceArmure(oPC)))
        {
            int nDamage = GetSkillRank(SKILL_ALTER,oPC);
            int nDuration = GetSkillRank(SKILL_CONTROL,oPC)/8;
            effect eNeg = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
            if (nDuration > 6)
            {
                nDuration = 6;
            }
            float fDuration = RoundsToSeconds(nDuration);
            SetLocalInt(oPC, "LSCHOKING", TRUE);
            //SignalEvent(oTarget, EventSpellCastAt(oPC, SPELL_HOLD_MONSTER));
            AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM3,1.0,fDuration));
            // Assign damage
            DelayCommand(0.2,SetCommandable(FALSE,oTarget));
            DelayCommand(fDuration,SetCommandable(TRUE,oTarget));
            if (nDuration >= 1) // round 1
            {
                DelayCommand(6.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 2) // round 2
            {
                DelayCommand(12.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 3) // round 3
            {
                DelayCommand(18.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 4) // round 4
            {
                DelayCommand(24.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 5) // round 5
            {
                DelayCommand(30.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 6) // round 6
            {
                DelayCommand(36.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 7) // round 7
            {
                DelayCommand(42.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 8) // round 8
            {
                DelayCommand(48.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 9) // round 9
            {
                DelayCommand(54.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }
            if (nDuration >= 10) // round 10
            {
                DelayCommand(60.0,ApplyEffectToObject(DURATION_TYPE_INSTANT, eNeg, oTarget));
            }

            DelayCommand(fDuration, SetLocalInt(oPC, "LSCHOKING", FALSE));
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueThrow);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
    else
    {
        SendMessageToPC(oPC, "*You are already concentrating on choking someone*");
    }
}

// Redo to allow deactivation
void PowerForceWeapon(object oPC)
    {
        int nSpellIdThrow = GetSpellId();
        int nSkillStrike = DIFFICULTE_FORCE_WEAPON;
        int nControl = GetSkillRank(SKILL_CONTROL,oPC);
        int nFatigue = GetFatigue(oPC);
        int nFatigueWeapon = FATIGUE_FORCE_WEAPON;

        if(GetIsSkillSuccessful(oPC,SKILL_FORCE_STRIKE,nSkillStrike+nFatigue+GetMalusForceArmure(oPC)))
        {
            //location lTargetLocation = GetLocation(oTarget);
            float fDelay;
            int nDamage;
            effect eVis = EffectVisualEffect(VFX_IMP_PULSE_HOLY_SILENT);
            eVis = EffectLinkEffects(EffectVisualEffect(VFX_IMP_MAGBLUE),eVis);
            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL);
            int nCasterLvl = GetLevelByClass(CLASS_TYPE_SHIFTER, oPC)/3 + 1;
            float nDuration = RoundsToSeconds(GetSkillRank(SKILL_FORCE_STRIKE,oPC));

            object oMyWeapon   =  IPGetTargetedOrEquippedMeleeWeapon();

            if(GetIsObjectValid(oMyWeapon) )
            {
                SignalEvent(GetItemPossessor(oMyWeapon), EventSpellCastAt(oPC, GetSpellId(), FALSE));

                if (nDuration>0.0)
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, GetItemPossessor(oMyWeapon));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, GetItemPossessor(oMyWeapon), nDuration);
                    AddForceEffectToWeapon(oMyWeapon, nDuration,nCasterLvl);

                }
                return;
            }
            else
            {
                FloatingTextStrRefOnCreature(83615, OBJECT_SELF);
                return;
            }

        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueWeapon);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
// Redo to allow deactivation
void PowerForceShield(object oPC)
{
        int nSpellIdThrow = GetSpellId();
        int nSkillStrike = DIFFICULTE_FORCE_SHIELD;
        int nControl = GetSkillRank(SKILL_FORCE_DEFENSE,oPC);
        int nFatigue = GetFatigue(oPC);
        int nFatigueShield = FATIGUE_FORCE_SHIELD;

    if(GetLocalInt(oPC, "FORCE_SHIELD_ON") == FALSE)
    {
        if(GetIsSkillSuccessful(oPC,SKILL_FORCE_DEFENSE,nSkillStrike+nFatigue+GetMalusForceArmure(oPC)))
        {
            float fDuration = RoundsToSeconds(GetSkillRank(SKILL_FORCE_DEFENSE,oPC));
            effect eVis = EffectVisualEffect(VFX_IMP_PULSE_HOLY_SILENT);
            eVis = EffectLinkEffects(EffectVisualEffect(VFX_IMP_MAGBLUE),eVis);
            effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEUTRAL);
            int nCasterLvl =(GetLevelByClass(50, oPC) + GetLevelByClass(47, oPC) + GetLevelByClass(CLASS_TYPE_SHIFTER, oPC))/2 + 1;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY ,EffectACIncrease(nCasterLvl),oPC, fDuration);
            SetLocalInt(oPC, "FORCE_SHIELD_ON", TRUE);
            DelayCommand(fDuration, SetLocalInt(oPC, "FORCE_SHIELD_ON", FALSE));
        }
        int nFatiguePouvoir = CalculFatiguePouvoir(oPC,nFatigueShield);
        SetFatigue(oPC,nFatigue + nFatiguePouvoir);
        Activation_Fatigue_Recuperation(oPC);
    }
    else
    {
        FloatingTextStringOnCreature("Force Shield is already active",oPC );
    }
}
//for choke :       DelayCommand(10.0,AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_CUSTOM3, 1.0, 4.0)));
//void main() {}

