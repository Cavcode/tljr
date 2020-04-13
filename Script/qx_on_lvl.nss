#include "pug_feats"

void main()
{
    object oPC = GetPCLevellingUp();

    int iLevel = GetHitDice(oPC);
    int iOldXP =GetXP(oPC);
    int iNewXP;
    int iJediGuardian = 45;
    int iJediSentinel = 46;
    int iJediConsular = 47;
    int iSithMarauder = 48;
    int iSithAssassin = 49;
    int iSithLord     = 50;
    int iWitch        = CLASS_TYPE_SHIFTER;
    int iJediLevel;
    int iSithLevel;
    int iForceLevel;
    int iWitchLevel;
    int iGender = GetGender(oPC);

    //nNewXP = (( nLevel * ( nLevel - 1 )) / 2 * 1000 ) - 1;
    object oPadawan    = GetItemPossessedBy(oPC, "JediSignetRing");
    object oJediKnight = GetItemPossessedBy(oPC, "JediKnightRobe");
    object oJediMaster = GetItemPossessedBy(oPC, "JediMasterRobe");
    object oApprentice = GetItemPossessedBy(oPC, "SithSignetRing");
    object oSithMaster = GetItemPossessedBy(oPC, "DarkJediKnightRobe");
    object oDarth      = GetItemPossessedBy(oPC, "DarkJediMasterRobe");

    iWitchLevel = GetLevelByClass(iWitch,oPC);
    iJediLevel = GetLevelByClass(iJediGuardian,oPC) + GetLevelByClass(iJediSentinel,oPC) + GetLevelByClass(iJediConsular,oPC);
    iSithLevel = GetLevelByClass(iSithMarauder,oPC) + GetLevelByClass(iSithAssassin,oPC) + GetLevelByClass(iSithLord,oPC);
    iForceLevel = iJediLevel + iSithLevel;

    // For BETA Testing, remove the line below to reapply item checks for force classes.
    //iForceLevel = 0;

    SendMessageToPC(oPC, "Total Force Level = " + IntToString(iForceLevel));
// *************** Handle Jedi/Sith class restrictions *******************//
    if (iForceLevel > 0)
    {
        SendMessageToPC(oPC, "Force Level > 0");
        if (!((oJediMaster != OBJECT_INVALID) || (oDarth != OBJECT_INVALID)))
        {
            SendMessageToPC(oPC, "PC does not have master robes");
            if(iForceLevel > 20)
            {
                SendMessageToPC(oPC, "Force Level > 20");
                SendMessageToPC( oPC, "**Level Removed ** Rank too low **DM item required**" );
                SendMessageToAllDMs ("Player: " + GetName(oPC) + ", **Level Removed-DM item required**"); // dm msg
                iNewXP = (( iLevel * ( iLevel - 1 )) / 2 * 1000 ) - 1;
                SetXP( oPC, iNewXP ); // Take the level away
                DelayCommand(2.0, SetXP( oPC, iOldXP)); // Give the level back
            }
            if (!((oJediKnight != OBJECT_INVALID) || (oSithMaster != OBJECT_INVALID)))
            {
                SendMessageToPC(oPC, "PC does not have knight robes");
                if (iForceLevel > 10)
                {
                    SendMessageToPC(oPC, "Force Level > 10");

                    SendMessageToPC( oPC, "**Level Removed ** Rank too low **DM item required**" );
                    SendMessageToAllDMs ("Player: " + GetName(oPC) + ", **Level Removed-DM item required**");
                    iNewXP = (( iLevel * ( iLevel - 1 )) / 2 * 1000 ) - 1;
                    SetXP( oPC, iNewXP ); // Take the level away
                    DelayCommand(2.0, SetXP( oPC, iOldXP)); // Give the level back
                }
                if (!((oPadawan != OBJECT_INVALID) || (oApprentice != OBJECT_INVALID)))
                {
                    SendMessageToPC(oPC, "PC does not have signet rings");
                    if (iForceLevel > 0)
                    {
                        SendMessageToPC(oPC, "Force Level > 1");
                        SendMessageToPC( oPC, "**Level Removed ** force rank too low **DM item required**" );
                        SendMessageToAllDMs ("Player: " + GetName(oPC) + ", **Level Removed-DM item required**");
                        iNewXP = (( iLevel * ( iLevel - 1 )) / 2 * 1000 ) - 1;
                        SetXP( oPC, iNewXP ); // Take the level away
                        DelayCommand(2.0, SetXP( oPC, iOldXP)); // Give the level back
                    }
                }
            }
        }
    }
//**************** End of Jedi/Sith restriction handling ******************//

//**************** Handle Dathomiri Witch restrictions ************//
if ((iGender != GENDER_FEMALE) && (iWitchLevel > 5))
{
    SendMessageToPC(oPC, "Non-females may only take up to 5 levels in the Dathomiri Witch PRC.");
    SendMessageToPC( oPC, "**Level Removed **" );
    SendMessageToAllDMs ("Player: " + GetName(oPC) + ", **Level Removed- 5 level cap for male witches exceeded**"); // dm msg
    iNewXP = (( iLevel * ( iLevel - 1 )) / 2 * 1000 ) - 1;
    SetXP( oPC, iNewXP ); // Take the level away
    DelayCommand(2.0, SetXP( oPC, iOldXP)); // Give the level back
}


//**************** End of Jedi/Sith restriction handling ******************/

//**************** Fix Miscellaneous Class Feats ******************//
int iPaladin = GetLevelByClass(CLASS_TYPE_PALADIN, oPC);
int iBlackGuard = GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC);
int iMonk = GetLevelByClass(CLASS_TYPE_MONK, oPC);
int iCleric = GetLevelByClass(CLASS_TYPE_CLERIC, oPC);
    if (iCleric >= 1)
    {
        // Remove Command Influence from Healers unless they have Officer or Elite Trooper levels.
        if (iPaladin < 1 && iBlackGuard < 1)
        {
            if (NWNX_Creature_GetKnowsFeat(oPC, FEAT_TURN_UNDEAD))
            {
                NWNX_Creature_RemoveFeat(oPC,FEAT_TURN_UNDEAD);
            }
        }
    }
    // Officer
    if (iPaladin >= 1)
    {
        // Make sure Officers get the Command Influence Feat.
        if (!NWNX_Creature_GetKnowsFeat(oPC,FEAT_TURN_UNDEAD))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_TURN_UNDEAD, iLevel);
        }
    }
    // Elite Trooper
    if (iBlackGuard >= 1)
    {
        // Make sure Elite Troopers get the Command Influence Feat.
        if (!NWNX_Creature_GetKnowsFeat(oPC, FEAT_TURN_UNDEAD))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_TURN_UNDEAD, iLevel);
        }
    }
    // Teras Kasi
    if(iMonk >= 6)
    {
        if(!NWNX_Creature_GetKnowsFeat(oPC,1332))
        {
            NWNX_Creature_AddFeatByLevel(oPC,1332, 6);
        }
    }

    // Remove Divine Grace/Health/Might/Shield/Wrath
    NWNX_Creature_RemoveFeat(oPC,FEAT_DIVINE_GRACE);
    NWNX_Creature_RemoveFeat(oPC,FEAT_DIVINE_HEALTH);
    NWNX_Creature_RemoveFeat(oPC,FEAT_DIVINE_MIGHT);
    NWNX_Creature_RemoveFeat(oPC,FEAT_DIVINE_SHIELD);
    NWNX_Creature_RemoveFeat(oPC,FEAT_DIVINE_WRATH);
    NWNX_Creature_RemoveFeat(oPC,FEAT_PRESTIGE_DARK_BLESSING);

//**************** End of Fix Miscellaneous Class Feats ******************//

//**************** Fix Proficiencies ******************************//

        if(!NWNX_Creature_GetKnowsFeat(oPC,FEAT_WEAPON_PROFICIENCY_SIMPLE))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_WEAPON_PROFICIENCY_SIMPLE, 2);
        }
        if(!NWNX_Creature_GetKnowsFeat(oPC,FEAT_WEAPON_PROFICIENCY_MARTIAL))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_WEAPON_PROFICIENCY_MARTIAL, 2);
        }
        if(!NWNX_Creature_GetKnowsFeat(oPC,FEAT_WEAPON_PROFICIENCY_CREATURE))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_WEAPON_PROFICIENCY_CREATURE, 2);
        }
        if(!NWNX_Creature_GetKnowsFeat(oPC,FEAT_ARMOR_PROFICIENCY_LIGHT))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_ARMOR_PROFICIENCY_LIGHT, 2);
        }
        if(!NWNX_Creature_GetKnowsFeat(oPC, FEAT_ARMOR_PROFICIENCY_MEDIUM))
        {
            NWNX_Creature_AddFeatByLevel(oPC,FEAT_ARMOR_PROFICIENCY_MEDIUM, 2);
        }
        if(GetLevelByClass(CLASS_TYPE_WIZARD, oPC) > 0)
        {
            if(!NWNX_Creature_GetKnowsFeat(oPC,FEAT_ARMOR_PROFICIENCY_HEAVY))
            {
                NWNX_Creature_AddFeatByLevel(oPC,FEAT_ARMOR_PROFICIENCY_HEAVY, 2);
            }
        }
    //}
//*************************************************************************//

    CheckFeats(oPC);
}
