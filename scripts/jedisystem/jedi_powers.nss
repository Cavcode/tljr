#include "jedi_functions"
//#include "jedi_inc"

void main()
{
    switch(GetSpellId()) {

        case SPELL_JEDI_GUERISON_1: PouvoirJediGuerison(OBJECT_SELF,1); break;

        case SPELL_JEDI_GUERISON_2: PouvoirJediGuerison(OBJECT_SELF,2); break;

        case SPELL_JEDI_GUERISON_3: PouvoirJediGuerison(OBJECT_SELF,3); break;

        case SPELL_JEDI_POUSSEE_1: PouvoirJediPoussee(OBJECT_SELF,1,GetSpellTargetObject()); break;

        case SPELL_JEDI_POUSSEE_2: PouvoirJediPoussee(OBJECT_SELF,2,GetSpellTargetObject()); break;

        case SPELL_JEDI_POUSSEE_3: PouvoirJediPoussee(OBJECT_SELF,3); break;

        case SPELL_JEDI_FORME_COMBAT_1: PouvoirJediFormeCombat(OBJECT_SELF,1); break;

        case SPELL_JEDI_FORME_COMBAT_2: PouvoirJediFormeCombat(OBJECT_SELF,2); break;

        case SPELL_JEDI_FORME_COMBAT_3: PouvoirJediFormeCombat(OBJECT_SELF,3); break;

        case SPELL_JEDI_FORME_COMBAT_4: PouvoirJediFormeCombat(OBJECT_SELF,4); break;

        case SPELL_JEDI_FORME_COMBAT_5: PouvoirJediFormeCombat(OBJECT_SELF,5); break;

        case SPELL_JEDI_FORME_COMBAT_6: PouvoirJediFormeCombat(OBJECT_SELF,6); break;

        case SPELL_JEDI_FORME_COMBAT_7: PouvoirJediFormeCombat(OBJECT_SELF,7); break;

        case SPELL_JEDI_REGENERATION_1: PouvoirJediRegeneration(OBJECT_SELF,1); break;

        case SPELL_JEDI_REGENERATION_2: PouvoirJediRegeneration(OBJECT_SELF,2); break;

        case SPELL_JEDI_REGENERATION_3: PouvoirJediRegeneration(OBJECT_SELF,3); break;

        case SPELL_JEDI_SOINS_1: PouvoirJediSoins(OBJECT_SELF,GetSpellTargetObject(),1); break;

        case SPELL_JEDI_SOINS_2: PouvoirJediSoins(OBJECT_SELF,GetSpellTargetObject(),2); break;

        case SPELL_JEDI_SOINS_3: PouvoirJediSoins(OBJECT_SELF,GetSpellTargetObject(),3); break;

        case SPELL_JEDI_DISCRETION_1: PouvoirJediDiscretion(OBJECT_SELF,1); break;

        case SPELL_JEDI_DISCRETION_2: PouvoirJediDiscretion(OBJECT_SELF,2); break;

        case SPELL_JEDI_DISCRETION_3: PouvoirJediDiscretion(OBJECT_SELF,3); break;

        case SPELL_JEDI_DISCRETION_4: PouvoirJediDiscretion(OBJECT_SELF,4); break;

        case SPELL_JEDI_FOUDRE_1: PouvoirJediFoudre(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),1); break;

        case SPELL_JEDI_FOUDRE_2: PouvoirJediFoudre(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),2); break;

        case SPELL_JEDI_FOUDRE_3: PouvoirJediFoudre(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),3); break;

        case SPELL_JEDI_FOUDRE_4: PouvoirJediFoudre(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),4); break;

        case SPELL_JEDI_CONCENTRATION: PouvoirJediConcentration(OBJECT_SELF); break;

        case SPELL_JEDI_ABSORBER_DISSIPER_1: PouvoirJediAbsorberDissiper(OBJECT_SELF,1); break;

        case SPELL_JEDI_ABSORBER_DISSIPER_2: PouvoirJediAbsorberDissiper(OBJECT_SELF,2); break;

        case SPELL_JEDI_ABSORBER_DISSIPER_3: PouvoirJediAbsorberDissiper(OBJECT_SELF,3); break;

        case SPELL_JEDI_RAPIDITE_1: PouvoirJediRapidite(OBJECT_SELF,1); break;

        case SPELL_JEDI_RAPIDITE_2: PouvoirJediRapidite(OBJECT_SELF,2); break;

        case SPELL_JEDI_RAPIDITE_3: PouvoirJediRapidite(OBJECT_SELF,3); break;

        case SPELL_JEDI_PERCEPTION_1: PouvoirJediPerception(OBJECT_SELF,1); break;

        case SPELL_JEDI_PERCEPTION_2: PouvoirJediPerception(OBJECT_SELF,2); break;

        case SPELL_JEDI_PERCEPTION_3: PouvoirJediPerception(OBJECT_SELF,3); break;

        case SPELL_JEDI_VOLONTE_1: PouvoirJediVolonte(OBJECT_SELF,1); break;

        case SPELL_JEDI_VOLONTE_2: PouvoirJediVolonte(OBJECT_SELF,2); break;

        case SPELL_JEDI_VOLONTE_3: PouvoirJediVolonte(OBJECT_SELF,3); break;

        case SPELL_JEDI_TELEKINESIE_RAMASSER: PouvoirJediTelekinesieRamasserObjet(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_TELEKINESIE_OUVRIR: PouvoirJediTelekinesieOuvrirFermerPorte(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_TELEKINESIE_DESARMER: PouvoirJediTelekinesieDesarmer(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_TELEKINESIE_DEPLACER: PouvoirJediTelekinesieDeplacer(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation()); break;

        case SPELL_JEDI_FURIE_1: PouvoirJediFurie(OBJECT_SELF,1); break;

        case SPELL_JEDI_FURIE_2: PouvoirJediFurie(OBJECT_SELF,2); break;

        case SPELL_JEDI_FURIE_3: PouvoirJediFurie(OBJECT_SELF,3); break;

        case SPELL_JEDI_SAUT: PouvoirJediSaut(OBJECT_SELF,GetSpellTargetLocation()); break;

        case SPELL_JEDI_INFLUENCER_ESPRIT: PouvoirJediInfluencerEsprit(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_PSYCHOMANCIE_1: PouvoirJediPsychomancie(OBJECT_SELF,1); break;

        case SPELL_JEDI_PSYCHOMANCIE_2: PouvoirJediPsychomancie(OBJECT_SELF,2); break;

        case SPELL_JEDI_PSYCHOMANCIE_3: PouvoirJediPsychomancie(OBJECT_SELF,3); break;

        case SPELL_JEDI_DIVINATION_CARTE: PouvoirJediDivination(OBJECT_SELF,1); break;

        case SPELL_JEDI_DIVINATION_PIEGE: PouvoirJediDivination(OBJECT_SELF,2); break;

        case SPELL_JEDI_NARCOLEPSY_1: PouvoirJediNarcolepsy(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),1); break;

        case SPELL_JEDI_NARCOLEPSY_2: PouvoirJediNarcolepsy(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),2); break;

        case SPELL_JEDI_NARCOLEPSY_3: PouvoirJediNarcolepsy(OBJECT_SELF,GetSpellTargetObject(),GetSpellTargetLocation(),3); break;

        case SPELL_JEDI_MALEDICTION_POISON: PouvoirJediPoison(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_MALEDICTION_MALADIE: PouvoirJediMaladie(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_MALEDICTION_PARALYSIE: PouvoirJediParalysie(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_FORCE_AME_1: PouvoirJediForceAme(OBJECT_SELF,1); break;

        case SPELL_JEDI_FORCE_AME_2: PouvoirJediForceAme(OBJECT_SELF,2); break;

        case SPELL_JEDI_FORCE_AME_3: PouvoirJediForceAme(OBJECT_SELF,3); break;

        case SPELL_JEDI_FORCE_AME_4: PouvoirJediForceAme(OBJECT_SELF,4); break;

        case SPELL_JEDI_SENTIR_VIE_PASSIVE_1: PouvoirJediSentirViePassive(OBJECT_SELF,1); break;

        case SPELL_JEDI_SENTIR_VIE_ACTIVE_1: PouvoirJediSentirVieActive(OBJECT_SELF,1); break;

        case SPELL_JEDI_SENTIR_VIE_PASSIVE_2: PouvoirJediSentirViePassive(OBJECT_SELF,2); break;

        case SPELL_JEDI_SENTIR_VIE_ACTIVE_2: PouvoirJediSentirVieActive(OBJECT_SELF,2); break;

        case SPELL_JEDI_SENTIR_VIE_PASSIVE_3: PouvoirJediSentirViePassive(OBJECT_SELF,3); break;

        case SPELL_JEDI_SENTIR_VIE_ACTIVE_3: PouvoirJediSentirVieActive(OBJECT_SELF,3); break;

        case SPELL_JEDI_SENTIR_FLUX: PouvoirJediSentirFlux(OBJECT_SELF,GetSpellTargetObject()); break;

        case SPELL_JEDI_ABSORPTION_VIE_1: PouvoirJediAbsorptionVie(OBJECT_SELF,GetSpellTargetObject(),1); break;

        case SPELL_JEDI_ABSORPTION_VIE_2: PouvoirJediAbsorptionVie(OBJECT_SELF,GetSpellTargetObject(),2); break;

        case SPELL_JEDI_ABSORPTION_VIE_3: PouvoirJediAbsorptionVie(OBJECT_SELF,GetSpellTargetObject(),3); break;

        case SPELL_JEDI_TRANSE_COMBAT_1: PouvoirJediTranseCombat(OBJECT_SELF,1); break;

        case SPELL_JEDI_TRANSE_COMBAT_2: PouvoirJediTranseCombat(OBJECT_SELF,2); break;

        case SPELL_JEDI_TRANSE_COMBAT_3: PouvoirJediTranseCombat(OBJECT_SELF,3); break;

        case SPELL_JEDI_TELEPATHIE: PouvoirJediTelepathie(OBJECT_SELF); break;

        case SPELL_JEDI_GUERISON_4: PouvoirJediGuerison(OBJECT_SELF,4); break;

        case SPELL_JEDI_POUSSEE_4: PouvoirJediPoussee(OBJECT_SELF,4); break;

        case SPELL_JEDI_REGENERATION_4: PouvoirJediRegeneration(OBJECT_SELF,4); break;

        case SPELL_JEDI_SOINS_4: PouvoirJediSoins(OBJECT_SELF,GetSpellTargetObject(),4); break;

        case SPELL_JEDI_FORME_COMBAT_8: PouvoirJediFormeCombat(OBJECT_SELF,8); break;

        case SPELL_JEDI_FORME_COMBAT_9: PouvoirJediFormeCombat(OBJECT_SELF,9); break;

        case SPELL_JEDI_FORME_COMBAT_10: PouvoirJediFormeCombat(OBJECT_SELF,10); break;

        case SPELL_JEDI_FORME_COMBAT_11: PouvoirJediFormeCombat(OBJECT_SELF,11); break;

        case SPELL_JEDI_RAPIDITE_4: PouvoirJediRapidite(OBJECT_SELF,4); break;

        case SPELL_JEDI_ABSORBER_DISSIPER_4: PouvoirJediAbsorberDissiper(OBJECT_SELF,4); break;

        case SPELL_JEDI_LIGHTSABER_THROW: PowerJediLightsaberThrow(OBJECT_SELF, GetSpellTargetLocation()); break;

        case SPELL_JEDI_FORCE_CHOKE: PowerJediChoke(OBJECT_SELF, GetSpellTargetObject()); break;

        case SPELL_JEDI_FORCE_WEAPON: PowerForceWeapon(OBJECT_SELF); break;

        case SPELL_JEDI_FORCE_SHIELD: PowerForceShield(OBJECT_SELF); break;

      default:;
    }
}
