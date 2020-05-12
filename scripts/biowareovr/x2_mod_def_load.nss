//::///////////////////////////////////////////////
//:: Example XP2 OnLoad Script
//:: x2_mod_def_load
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnModuleLoad Event

    This example script demonstrates how to tweak the
    behavior of several subsystems in your module.

    For more information, please check x2_inc_switches
    which holds definitions for several variables that
    can be set on modules, creatures, doors or waypoints
    to change the default behavior of Bioware scripts.

    Warning:
    Using some of these switches may change your games
    balancing and may introduce bugs or instabilities. We
    recommend that you only use these switches if you
    know what you are doing. Consider these features
    unsupported!

    Please do NOT report any bugs you experience while
    these switches have been changed from their default
    positions.

    Make sure you visit the forums at nwn.bioware.com
    to find out more about these scripts.

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
#include "x2_inc_switches"
#include "x2_inc_restsys"
#include "pug_planets"
#include "pug_points"
#include "nwnx_system"
#include "qx_inc_db"
#include "nwnx_weapon"
#include "fky_chat_inc"
#include "nwnx_chat"
#include "nwnx_events"

void main()
{
   // Init placeholders for ODBC gateway
   //SQLInit();
   // Init placeholders for chat gateway
    //InitSpeech();

    // load boot time into the boottime variable
    //SQLExecDirect("SELECT UNIX_TIMESTAMP()");
    //if (SQLFetch() == SQL_SUCCESS)
        //SetLocalInt(GetModule(), "boottime", StringToInt(SQLGetData(1)));
    //SetLocalInt(GetModule(), "uptime", 0);
    // load uptime reset second counter into module variable
    //SetLocalInt(GetModule(), "reset_seconds", 36000); // currently set to 10 hours

    // Disable NWN/CEP Craft menu since it is buggy as hell
    SetLocalInt(GetModule(), "X2_L_DO_NOT_ALLOW_CRAFTSKILLS", TRUE);

   StartCapitalShips();
   SetTMILimit (3000000);
   // Set Various weapon options
    //SetWeaponOption(NWNX_WEAPONS_OPT_DEVCRIT_DISABLE_ALL, TRUE);
    //SetWeaponOption(NWNX_WEAPONS_OPT_DEVCRIT_MULT_BONUS, 1);
    NWNX_Weapon_SetDevastatingCriticalEventScript("les_devcrit");
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_DAGGER);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_DART);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SHURIKEN);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SHORTSWORD);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_TWOBLADEDSWORD);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SHORTSPEAR);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_QUARTERSTAFF);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_KATANA);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_RAPIER);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_CLUB, CREATURE_SIZE_SMALL);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_DAGGER, CREATURE_SIZE_SMALL);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_GREATSWORD, CREATURE_SIZE_MEDIUM);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_LONGSWORD, CREATURE_SIZE_MEDIUM);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_HALBERD, CREATURE_SIZE_LARGE);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_KATANA, CREATURE_SIZE_MEDIUM);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_QUARTERSTAFF, CREATURE_SIZE_MEDIUM);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_SCIMITAR, CREATURE_SIZE_LARGE);
    NWNX_Weapon_SetWeaponFinesseSize(BASE_ITEM_TWOBLADEDSWORD, CREATURE_SIZE_MEDIUM);

    // Subscribing to Events
    NWNX_Events_SubscribeEvent("NWNX_ON_USE_SKILL_BEFORE", "les_events");
    NWNX_Events_SubscribeEvent("NWNX_ON_INPUT_ATTACK_OBJECT_BEFORE", "les_evnt_atk");
    NWNX_Events_SubscribeEvent("NWNX_ON_USE_FEAT_BEFORE", "les_events");
    NWNX_Events_SubscribeEvent("NWNX_ON_ENTER_STEALTH_BEFORE", "les_events");
    NWNX_Events_SubscribeEvent("NWNX_ON_EXAMINE_OBJECT_BEFORE", "les_events");


    // Setup New Lightsaber Baseitems
    NWNX_Weapon_SetWeaponFinesseSize(501, CREATURE_SIZE_SMALL);
    NWNX_Weapon_SetWeaponFinesseSize(502, CREATURE_SIZE_MEDIUM);
    NWNX_Weapon_SetWeaponFinesseSize(503, CREATURE_SIZE_MEDIUM);
    //NWNX_Weapon_SetWeaponIsMonkWeapon(501);
    //NWNX_Weapon_SetWeaponIsMonkWeapon(502);
    //NWNX_Weapon_SetWeaponIsMonkWeapon(503);
    NWNX_Weapon_SetEpicWeaponDevastatingCriticalFeat(501, 1338);
    NWNX_Weapon_SetEpicWeaponDevastatingCriticalFeat(502, 1338);
    NWNX_Weapon_SetEpicWeaponDevastatingCriticalFeat(503, 1338);
    NWNX_Weapon_SetEpicWeaponFocusFeat(501, 1339);
    NWNX_Weapon_SetEpicWeaponFocusFeat(502, 1339);
    NWNX_Weapon_SetEpicWeaponFocusFeat(503, 1339);
    NWNX_Weapon_SetEpicWeaponSpecializationFeat(501, 1340);
    NWNX_Weapon_SetEpicWeaponSpecializationFeat(502, 1340);
    NWNX_Weapon_SetEpicWeaponSpecializationFeat(503, 1340);
    NWNX_Weapon_SetWeaponFocusFeat(501, 1335);
    NWNX_Weapon_SetWeaponFocusFeat(502, 1335);
    NWNX_Weapon_SetWeaponFocusFeat(503, 1335);
    //SetWeaponGreaterFocusFeat (int nBaseItem, int nFeat);
    NWNX_Weapon_SetWeaponImprovedCriticalFeat(501, 1336);
    NWNX_Weapon_SetWeaponImprovedCriticalFeat(502, 1336);
    NWNX_Weapon_SetWeaponImprovedCriticalFeat(503, 1336);
    //SetWeaponLegendaryFocusFeat (int nBaseItem, int nFeat);
    NWNX_Weapon_SetWeaponOfChoiceFeat(501, 1342);
    NWNX_Weapon_SetWeaponOfChoiceFeat(502, 1342);
    NWNX_Weapon_SetWeaponOfChoiceFeat(503, 1342);
    NWNX_Weapon_SetEpicWeaponOverwhelmingCriticalFeat(501, 1341);
    NWNX_Weapon_SetEpicWeaponOverwhelmingCriticalFeat(502, 1341);
    NWNX_Weapon_SetEpicWeaponOverwhelmingCriticalFeat(503, 1341);
    //SetWeaponPowerCriticalFeat (int nBaseItem, int nFeat);
    NWNX_Weapon_SetWeaponSpecializationFeat(501, 1337);
    NWNX_Weapon_SetWeaponSpecializationFeat(502, 1337);
    NWNX_Weapon_SetWeaponSpecializationFeat(503, 1337);
    //SetWeaponSuperiorCriticalFeat (int nBaseItem, int nFeat);

   ApplyPoints();

   //Register proper chat script
   NWNX_Chat_RegisterChatScript("mod_chat");
   SetEventScript(GetModule(),EVENT_SCRIPT_MODULE_ON_PLAYER_CHAT, "");


   if (GetGameDifficulty() ==  GAME_DIFFICULTY_CORE_RULES || GetGameDifficulty() ==  GAME_DIFFICULTY_DIFFICULT)

       // * Activating the switch below will make AOE spells hurt neutral NPCS by default
       // SetModuleSwitch (MODULE_SWITCH_AOE_HURT_NEUTRAL_NPCS, TRUE);

   // * AI: Activating the switch below will make the creaures using the WalkWaypoint function
   // * able to walk across areas
   // SetModuleSwitch (MODULE_SWITCH_ENABLE_CROSSAREA_WALKWAYPOINTS, TRUE);

   // * Spells: Activating the switch below will make the Glyph of Warding spell behave differently:
   // * The visual glyph will disappear after 6 seconds, making them impossible to spot
   // SetModuleSwitch (MODULE_SWITCH_ENABLE_INVISIBLE_GLYPH_OF_WARDING, TRUE);

   // * Craft Feats: Want 50 charges on a newly created wand? We found this unbalancing,
   // * but since it is described this way in the book, here is the switch to get it back...
   // SetModuleSwitch (MODULE_SWITCH_ENABLE_CRAFT_WAND_50_CHARGES, TRUE);

   // * Craft Feats: Use this to disable Item Creation Feats if you do not want
   // * them in your module
   // SetModuleSwitch (MODULE_SWITCH_DISABLE_ITEM_CREATION_FEATS, TRUE);

   // * Palemaster: Deathless master touch in PnP only affects creatures up to a certain size.
   // * We do not support this check for balancing reasons, but you can still activate it...
   // SetModuleSwitch (MODULE_SWITCH_SPELL_CORERULES_DMASTERTOUCH, TRUE);

   // * Epic Spellcasting: Some Epic spells feed on the liveforce of the caster. However this
   // * did not fit into NWNs spell system and was confusing, so we took it out...
   // SetModuleSwitch (MODULE_SWITCH_EPIC_SPELLS_HURT_CASTER, TRUE);

   // * Epic Spellcasting: Some Epic spells feed on the liveforce of the caster. However this
   // * did not fit into NWNs spell system and was confusing, so we took it out...
   // SetModuleSwitch (MODULE_SWITCH_RESTRICT_USE_POISON_TO_FEAT, TRUE);

    // * Spellcasting: Some people don't like caster's abusing expertise to raise their AC
    // * Uncommenting this line will drop expertise mode whenever a spell is cast by a player
    // SetModuleSwitch (MODULE_VAR_AI_STOP_EXPERTISE_ABUSE, TRUE);


    // * Item Event Scripts: The game's default event scripts allow routing of all item related events
    // * into a single file, based on the tag of that item. If an item's tag is "test", it will fire a
    // * script called "test" when an item based event (equip, unequip, acquire, unacquire, activate,...)
    // * is triggered. Check "x2_it_example.nss" for an example.
    // * This feature is disabled by default.
   SetModuleSwitch (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE);

   if (GetModuleSwitchValue (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
   {
        // * If Tagbased scripts are enabled, and you are running a Local Vault Server
        // * you should use the line below to add a layer of security to your server, preventing
        // * people to execute script you don't want them to. If you use the feature below,
        // * all called item scrips will be the prefix + the Tag of the item you want to execute, up to a
        // * maximum of 16 chars, instead of the pure tag of the object.
        // * i.e. without the line below a user activating an item with the tag "test",
        // * will result in the execution of a script called "test". If you uncomment the line below
        // * the script called will be "1_test.nss"
        // SetUserDefinedItemEventPrefix("1_");

   }

   // * This initializes Bioware's wandering monster system as used in Hordes of the Underdark
   // * You can deactivate it, making your module load faster if you do not use it.
   // * If you want to use it, make sure you set "x2_mod_def_rest" as your module's OnRest Script
   // SetModuleSwitch (MODULE_SWITCH_USE_XP2_RESTSYSTEM, TRUE);

   if (GetModuleSwitchValue(MODULE_SWITCH_USE_XP2_RESTSYSTEM) == TRUE)
   {

       // * This allows you to specify a different 2da for the wandering monster system.
       // SetWanderingMonster2DAFile("des_restsystem");

       //* Do not change this line.
       WMBuild2DACache();
   }
{
    SetCustomToken(100, "</c>"); // CLOSE tag
    SetCustomToken(101, "<cþ  >"); // red
    SetCustomToken(102, "<c þ >"); // green
    SetCustomToken(103, "<c  þ>"); // blue
    SetCustomToken(104, "<c þþ>"); // cyan
    SetCustomToken(105, "<cþ þ>"); // magenta
    SetCustomToken(106, "<cþþ >"); // yellow
    SetCustomToken(107, "<c   >"); // black
    SetCustomToken(108, "<c¥  >"); // dark red
    SetCustomToken(109, "<c ¥ >"); // dark green
    SetCustomToken(110, "<c  ¥>"); // dark blue
    SetCustomToken(111, "<c ¥¥>"); // dark cyan
    SetCustomToken(112, "<c¥ ¥>"); // dark magenta
    SetCustomToken(113, "<c¥¥ >"); // dark yellow
    SetCustomToken(114, "<c¥¥¥>"); // grey
    SetCustomToken(117, "<cŒŒŒ>"); // dark grey
    SetCustomToken(115, "<cþ¥ >"); // orange
    SetCustomToken(116, "<cþŒ >"); // dark orange
    SetCustomToken(117, "<cÚ¥#>"); // brown
    SetCustomToken(118, "<cÂ† >"); // dark brown
   }
}
