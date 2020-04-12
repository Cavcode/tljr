///////////////////////////////////////////////////////////////////////////////
// This is a library that contains generic functions & constants for
// the entire module
///////////////////////////////////////////////////////////////////////////////

#include "x0_i0_position"

// CONSTANTS //////////////////////////////////////////////////////////////////

// Miscellaneous
const string COLORTOKEN = "                  ##################$%&'()*+,-./0123456789:;;==?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[[]^_`abcdefghijklmnopqrstuvwxyz{|}~~€‚ƒ„…†‡ˆ‰Š‹ŒŽ‘’“”•–—˜™š›œžŸ¡¡¢£¤¥¦§¨©ª«¬¬®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþþ";
const string BLASTER_BOLT_DEFLECT_TYPE_NATURAL = "BLASTER_BOLT_DEFLECT_TYPE_NATURAL";
const string BLASTER_BOLT_DEFLECT_TYPE_FEAT = "BLASTER_BOLT_DEFLECT_TYPE_FEAT";
const string BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM = "BLASTER_BOLT_DEFLECT_TYPE_COMBAT_FORM";

// Races
const int RACIAL_TYPE_DROID = RACIAL_TYPE_GNOME;
const int RACIAL_TYPE_WOOKIE = RACIAL_TYPE_HALFORC;

// Classes
const int CLASS_TYPE_ECHANI_ARTIST =       5;
const int CLASS_TYPE_SHARPSHOOTER =       29;
const int CLASS_TYPE_DREADNOUGHT =        32;
const int CLASS_TYPE_DRACLING =           37;
const int CLASS_TYPE_DEMOLITIONS_EXPERT = 44;
const int CLASS_TYPE_JEDI_GUARDIAN =      45;
const int CLASS_TYPE_JEDI_SENTINEL =      46;
const int CLASS_TYPE_JEDI_CONSULAR =      47;
const int CLASS_TYPE_SITH_MARAUDER =      48;
const int CLASS_TYPE_SITH_CONSULAR =      49;
const int CLASS_TYPE_SITH_ASSASSIN =      50;

// Feats
const int FEAT_WEAPON_FOCUS_ASSAULT_BLASTER = FEAT_WEAPON_FOCUS_LIGHT_CROSSBOW;
const int FEAT_WEAPON_FOCUS_BLASTER_RIFLE = FEAT_WEAPON_FOCUS_LONGBOW;
const int FEAT_WEAPON_FOCUS_BLASTER_PISTOL = FEAT_WEAPON_FOCUS_SHORTBOW;
const int FEAT_WEAPON_FOCUS_HEAVY_BLASTER = FEAT_WEAPON_FOCUS_HEAVY_CROSSBOW;
const int FEAT_WEAPON_FOCUS_TRANDO_VIBROBLADE = FEAT_WEAPON_FOCUS_SCIMITAR;
const int FEAT_WEAPON_FOCUS_VIBRO_AXE = FEAT_WEAPON_FOCUS_BATTLE_AXE;
const int FEAT_WEAPON_FOCUS_VIBRO_GREATAXE = FEAT_WEAPON_FOCUS_GREAT_AXE;
const int FEAT_WEAPON_FOCUS_VIBRO_HANDAXE = FEAT_WEAPON_FOCUS_HAND_AXE;
const int FEAT_WEAPON_FOCUS_VIBROBLADE = FEAT_WEAPON_FOCUS_RAPIER;
const int FEAT_WEAPON_FOCUS_VIBROCLAW = FEAT_WEAPON_FOCUS_KAMA;
const int FEAT_WEAPON_FOCUS_VIBRODAGGER = FEAT_WEAPON_FOCUS_DAGGER;
const int FEAT_WEAPON_FOCUS_VIBROKATANA = FEAT_WEAPON_FOCUS_KATANA;
const int FEAT_WEAPON_FOCUS_VIBROSTAFF = FEAT_WEAPON_FOCUS_STAFF;
const int FEAT_WEAPON_FOCUS_VIBROSWORD = FEAT_WEAPON_FOCUS_LONG_SWORD;
const int FEAT_WEAPON_FOCUS_LIGHTSABER = FEAT_WEAPON_FOCUS_SHORT_SWORD;
const int FEAT_WEAPON_FOCUS_SABERPIKE = FEAT_WEAPON_FOCUS_SPEAR;
const int FEAT_WEAPON_FOCUS_GREAT_LIGHTSABER = FEAT_WEAPON_FOCUS_GREAT_SWORD;
const int FEAT_WEAPON_FOCUS_DOUBLE_LIGHTSABER = FEAT_WEAPON_FOCUS_TWO_BLADED_SWORD;
const int FEAT_WEAPON_FOCUS_DUAL_BLASTER_PISTOL = FEAT_WEAPON_FOCUS_SLING;
const int FEAT_WEAPON_FOCUS_CHAINSAW = FEAT_WEAPON_FOCUS_SICKLE;

const int FEAT_EPIC_WEAPON_FOCUS_ASSAULT_BLASTER = FEAT_EPIC_WEAPON_FOCUS_LIGHTCROSSBOW;
const int FEAT_EPIC_WEAPON_FOCUS_BLASTER_RIFLE = FEAT_EPIC_WEAPON_FOCUS_LONGBOW;
const int FEAT_EPIC_WEAPON_FOCUS_BLASTER_PISTOL = FEAT_EPIC_WEAPON_FOCUS_SHORTBOW;
const int FEAT_EPIC_WEAPON_FOCUS_HEAVY_BLASTER = FEAT_EPIC_WEAPON_FOCUS_HEAVYCROSSBOW;
const int FEAT_EPIC_WEAPON_FOCUS_TRANDO_VIBROBLADE = FEAT_EPIC_WEAPON_FOCUS_SCIMITAR;
const int FEAT_EPIC_WEAPON_FOCUS_VIBRO_AXE = FEAT_EPIC_WEAPON_FOCUS_BATTLEAXE;
const int FEAT_EPIC_WEAPON_FOCUS_VIBRO_GREATAXE = FEAT_EPIC_WEAPON_FOCUS_GREATAXE;
const int FEAT_EPIC_WEAPON_FOCUS_VIBRO_HANDAXE = FEAT_EPIC_WEAPON_FOCUS_HANDAXE;
const int FEAT_EPIC_WEAPON_FOCUS_VIBROBLADE = FEAT_EPIC_WEAPON_FOCUS_RAPIER;
const int FEAT_EPIC_WEAPON_FOCUS_VIBROCLAW = FEAT_EPIC_WEAPON_FOCUS_KAMA;
const int FEAT_EPIC_WEAPON_FOCUS_VIBRODAGGER = FEAT_EPIC_WEAPON_FOCUS_DAGGER;
const int FEAT_EPIC_WEAPON_FOCUS_VIBROKATANA = FEAT_EPIC_WEAPON_FOCUS_KATANA;
const int FEAT_EPIC_WEAPON_FOCUS_VIBROSTAFF = FEAT_EPIC_WEAPON_FOCUS_QUARTERSTAFF;
const int FEAT_EPIC_WEAPON_FOCUS_VIBROSWORD = FEAT_EPIC_WEAPON_FOCUS_LONGSWORD;
const int FEAT_EPIC_WEAPON_FOCUS_LIGHTSABER = FEAT_EPIC_WEAPON_FOCUS_SHORTSWORD;
const int FEAT_EPIC_WEAPON_FOCUS_SABERPIKE = FEAT_EPIC_WEAPON_FOCUS_SHORTSPEAR;
const int FEAT_EPIC_WEAPON_FOCUS_GREAT_LIGHTSABER = FEAT_EPIC_WEAPON_FOCUS_GREATSWORD;
const int FEAT_EPIC_WEAPON_FOCUS_DOUBLE_LIGHTSABER = FEAT_EPIC_WEAPON_FOCUS_TWOBLADEDSWORD;
const int FEAT_EPIC_WEAPON_FOCUS_DUAL_BLASTER_PISTOL = FEAT_EPIC_WEAPON_FOCUS_SLING;
const int FEAT_EPIC_WEAPON_FOCUS_CHAINSAW = FEAT_EPIC_WEAPON_FOCUS_SICKLE;

const int FEAT_TRIGGER_HAPPY = 453;

const int FEAT_BLASTER_ACTION_SPECIAL_SHOT = 1132;
const int FEAT_BLASTER_ACTION_UNLOAD = 1133;
const int FEAT_BLASTER_ACTION_RELOAD = 1134;
const int FEAT_BLASTER_ACTIONS = 1135;
const int FEAT_DAMAGE_REDUCTION_20_5 = 1136;
const int FEAT_DAMAGE_REDUCTION_20_10 = 1137;
const int FEAT_ELITE_INSPIRING_AURA_I = 1138;
const int FEAT_ELITE_INSPIRING_AURA_II = 1139;
const int FEAT_ELITE_INSPIRING_AURA_III = 1140;
const int FEAT_EXPLOSIVES_EXPERTISE = 1141;
const int FEAT_UNSTOPPABLE = 1142;
const int FEAT_FORCE_SENSITIVITY = 1143;
const int FEAT_JEDI_PADAWAN = 1144;
const int FEAT_JEDI_KNIGHT = 1145;
const int FEAT_JEDI_MASTER = 1146;
const int FEAT_SITH_APPRENTICE = 1147;
const int FEAT_SITH_LORD = 1148;
const int FEAT_SITH_MASTER = 1149;
const int FEAT_IMPROVED_BLASTER_BOLT_DEFLECTION = 1150;
const int FEAT_SUPERIOR_BLASTER_BOLT_DEFLECTION = 1151;
const int FEAT_WEAPON_PROFICIENCY_LIGHTSABER = 1152;
const int FEAT_FORCE_FOCUS_1 = 1153;
const int FEAT_FORCE_FOCUS_2 = 1154;
const int FEAT_FORCE_FOCUS_3 = 1155;
const int FEAT_FORCE_FOCUS_4 = 1156;
const int FEAT_FORCE_PUSH_1 = 1157;
const int FEAT_FORCE_PUSH_2 = 1158;
const int FEAT_FORCE_REPULSE = 1159;

const int FEAT_FORCE_CONDITIONING_1 = 1163;
const int FEAT_FORCE_CONDITIONING_2 = 1164;
const int FEAT_FORCE_CONDITIONING_3 = 1165;
const int FEAT_FORCE_CONDITIONING_4 = 1166;
const int FEAT_LIGHTSABER_FORM_1 = 1167;
const int FEAT_LIGHTSABER_FORM_2 = 1168;
const int FEAT_LIGHTSABER_FORM_3 = 1169;
const int FEAT_LIGHTSABER_FORM_4 = 1170;
const int FEAT_LIGHTSABER_FORM_5 = 1171;
const int FEAT_LIGHTSABER_FORM_6 = 1172;
const int FEAT_LIGHTSABER_FORM_7 = 1173;
const int FEAT_FORCE_REGENERATION_1 = 1174;
const int FEAT_FORCE_REGENERATION_2 = 1175;
const int FEAT_FORCE_REGENERATION_3 = 1176;
const int FEAT_FORCE_BLINDNESS = 1177;
const int FEAT_FORCE_AFFINITY = 1178;
const int FEAT_FORCE_SYMBIOSIS = 1179;
const int FEAT_FORCE_HEAL_1 = 1180;
const int FEAT_FORCE_HEAL_2 = 1181;
const int FEAT_FORCE_HEAL_3 = 1182;
const int FEAT_SINGLE_LIGHTSABER_FOCUS = 1183;
const int FEAT_FORCE_CLOAK = 1184;

const int FEAT_FORCE_LIGHTNING_1 = 1187;
const int FEAT_FORCE_LIGHTNING_2 = 1188;
const int FEAT_FORCE_LIGHTNING_3 = 1189;
const int FEAT_FORCE_STORM = 1190;

const int FEAT_FORCE_PROTECTION_1 = 1192;
const int FEAT_FORCE_PROTECTION_2 = 1193;
const int FEAT_FORCE_PROTECTION_3 = 1194;
const int FEAT_FORCE_VIGOR_1 = 1195;
const int FEAT_FORCE_VIGOR_2 = 1196;
const int FEAT_FORCE_SUPPRESSION = 1197;
const int FEAT_FORCE_SIGHT_1 = 1198;
const int FEAT_FORCE_SIGHT_2 = 1199;
const int FEAT_FORCE_SIGHT_3 = 1200;
const int FEAT_FORCE_CORRUPTION_1 = 1201;
const int FEAT_FORCE_CORRUPTION_2 = 1202;
const int FEAT_FORCE_CORRUPTION_3 = 1203;
const int FEAT_FORCE_TELEKINESIS_1 = 1204;
const int FEAT_FORCE_TELEKINESIS_2 = 1205;
const int FEAT_FORCE_TELEKINESIS_3 = 1206;
const int FEAT_FORCE_TELEKINESIS_4 = 1207;
const int FEAT_FORCE_TELEKINESIS_DISARM = 1210;
const int FEAT_FORCE_TELEKINESIS_MOVE_OBJECT = 1211;
const int FEAT_FORCE_FURY = 1212;
const int FEAT_FORCE_HORROR_1 = 1213;
const int FEAT_FORCE_HORROR_2 = 1214;
const int FEAT_FORCE_JUMP = 1215;
const int FEAT_FORCE_PERSUADE = 1216;
const int FEAT_FORCE_PSYCHOMANCY_1 = 1217;
const int FEAT_FORCE_PSYCHOMANCY_2 = 1218;
const int FEAT_FORCE_PSYCHOMANCY_3 = 1219;

const int FEAT_FORCE_NARCOLEPSY_1 = 1223;
const int FEAT_FORCE_NARCOLEPSY_2 = 1224;
const int FEAT_FORCE_NARCOLEPSY_3 = 1225;
const int FEAT_FORCE_DISEASE_1 = 1226;
const int FEAT_FORCE_DISEASE_2 = 1227;
const int FEAT_FORCE_DISEASE_3 = 1228;
const int FEAT_FORCE_STUN_1 = 1229;
const int FEAT_FORCE_STUN_2 = 1230;
const int FEAT_FORCE_STUN_3 = 1231;
const int FEAT_FORCE_RESONANCE_1 = 1232;
const int FEAT_FORCE_RESONANCE_2 = 1233;
const int FEAT_FORCE_RESONANCE_3 = 1234;
const int FEAT_FORCE_LIGHT = 1235;
const int FEAT_JEDI_HARMONIE_FLUX_1 = 1236;
const int FEAT_JEDI_HARMONIE_FLUX_2 = 1237;
//const int FEAT_JEDI_HARMONIE_FLUX_3 = 1238;
//const int FEAT_JEDI_HARMONIE_FLUX_4 = 1239;

const int FEAT_FORCE_LIGHTSABER_LEVITATION = 1241;
const int FEAT_FORCE_FAR_SIGHT = 1242;

const int FEAT_FORCE_BODY_1 = 1244;
const int FEAT_FORCE_BODY_2 = 1245;
const int FEAT_FORCE_BODY_3 = 1246;
const int FEAT_FORCE_ABSORPTION_1 = 1247;
const int FEAT_FORCE_ABSORPTION_2 = 1248;
const int FEAT_FORCE_ABSORPTION_3 = 1249;
const int FEAT_FORCE_DRAIN_1 = 1250;
const int FEAT_FORCE_DRAIN_2 = 1251;
const int FEAT_FORCE_DRAIN_3 = 1252;
const int FEAT_FORCE_TRANCE = 1253;

const int FEAT_FORCE_REGENERATION_4 = 1259;
const int FEAT_FORCE_HEAL_4 = 1260;
const int FEAT_LIGHTSABER_FORM_8 = 1261;
const int FEAT_LIGHTSABER_FORM_9 = 1262;
const int FEAT_LIGHTSABER_FORM_10 = 1263;
const int FEAT_LIGHTSABER_FORM_11 = 1264;
const int FEAT_LIGHTSABER_FORM_MASTERY = 1265;

const int FEAT_FORCE_SAFEGUARD = 1268;
const int FEAT_FORCE_PROTECTION_4 = 1269;

const int FEAT_FORCE_CHOKE = 1271;

// Spells
const int SPELL_BLASTER_ACTION_SPECIAL_SHOT = 815;
const int SPELL_GRENADE_THERMAL = 817;
const int SPELL_GRENADE_FRAGMENTATION = 818;
const int SPELL_GRENADE_GAS = 819;
const int SPELL_GRENADE_CRYOBAN = 820;
const int SPELL_GRENADE_ION = 821;
const int SPELL_GRENADE_SONIC = 822;
const int SPELL_GRENADE_ADHESIVE = 823;
const int SPELL_GRENADE_PLASMA = 824;
const int SPELL_STEALTH_FIELD = 825;
const int SPELL_THERMAL_VISION = 827;
const int SPELL_BACTA_I = 828;
const int SPELL_BACTA_II = 829;
const int SPELL_FORCE_PUSH_1 = 830;
const int SPELL_FORCE_PUSH_2 = 831;
const int SPELL_FORCE_REPULSE = 832;
const int SPELL_BACTA_III = 833;
const int SPELL_BACTA_IV = 834;
const int SPELL_ELITE_INSPIRING_AURA_I = 835;
const int SPELL_ELITE_INSPIRING_AURA_II = 836;
const int SPELL_ELITE_INSPIRING_AURA_III = 837;
const int SPELL_UNSTOPPABLE = 838;
const int SPELL_TRIGGER_HAPPY = 839;
const int SPELL_BLASTER_ACTION_UNLOAD = 840;
const int SPELL_BLASTER_ACTION_RELOAD = 841;
const int SPELL_LIGHTSABER_FORM_1 = 842;
const int SPELL_LIGHTSABER_FORM_2 = 843;
const int SPELL_LIGHTSABER_FORM_3 = 844;
const int SPELL_LIGHTSABER_FORM_4 = 845;
const int SPELL_LIGHTSABER_FORM_5 = 846;
const int SPELL_LIGHTSABER_FORM_6 = 847;
const int SPELL_LIGHTSABER_FORM_7 = 848;
const int SPELL_FORCE_REGENERATION_1 = 849;
const int SPELL_FORCE_REGENERATION_2 = 850;
const int SPELL_FORCE_REGENERATION_3 = 851;
const int SPELL_FORCE_HEAL_1 = 852;
const int SPELL_FORCE_HEAL_2 = 853;
const int SPELL_FORCE_HEAL_3 = 854;

const int SPELL_FORCE_CLOAK = 856;

const int SPELL_FORCE_LIGHTNING_1 = 859;
const int SPELL_FORCE_LIGHTNING_2 = 860;
const int SPELL_FORCE_LIGHTNING_3 = 861;
const int SPELL_FORCE_STORM = 862;

const int SPELL_FORCE_PROTECTION_1 = 864;
const int SPELL_FORCE_PROTECTION_2 = 865;
const int SPELL_FORCE_PROTECTION_3 = 866;
const int SPELL_FORCE_VIGOR_1 = 867;
const int SPELL_FORCE_VIGOR_2 = 868;
const int SPELL_FORCE_SUPPRESSION = 869;
const int SPELL_FORCE_SIGHT_1 = 870;
const int SPELL_FORCE_SIGHT_2 = 871;
const int SPELL_FORCE_SIGHT_3 = 872;
const int SPELL_FORCE_CORRUPTION_1 = 873;
const int SPELL_FORCE_CORRUPTION_2 = 874;
const int SPELL_FORCE_CORRUPTION_3 = 875;
const int SPELL_FORCE_TELEKINESIS_1 = 876;
const int SPELL_FORCE_TELEKINESIS_2 = 877;
const int SPELL_FORCE_TELEKINESIS_3 = 878;
const int SPELL_FORCE_TELEKINESIS_4 = 879;
const int SPELL_FORCE_TELEKINESIS_DISARM = 882;
const int SPELL_FORCE_TELEKINESIS_MOVE_OBJECT = 883;
const int SPELL_JEDI_FURY = 884;
const int SPELL_FORCE_HORROR_1 = 885;
const int SPELL_FORCE_HORROR_2 = 886;
const int SPELL_JEDI_JUMP = 887;
const int SPELL_FORCE_PERSUADE = 888;
const int SPELL_JEDI_PSYCHOMANCIE_1 = 889;
const int SPELL_JEDI_PSYCHOMANCIE_2 = 890;
const int SPELL_JEDI_PSYCHOMANCIE_3 = 891;

const int SPELL_JEDI_NARCOLEPSY_1 = 895;
const int SPELL_JEDI_NARCOLEPSY_2 = 896;
const int SPELL_JEDI_NARCOLEPSY_3 = 897;
const int SPELL_JEDI_DISEASE_1 = 898;
const int SPELL_JEDI_DISEASE_2 = 899;
const int SPELL_JEDI_DISEASE_3 = 900;
const int SPELL_FORCE_STUN_1 = 901;
const int SPELL_FORCE_STUN_2 = 902;
const int SPELL_FORCE_STUN_3 = 903;
const int SPELL_FORCE_RESONANCE_1 = 904;
const int SPELL_FORCE_RESONANCE_2 = 905;
const int SPELL_FORCE_RESONANCE_3 = 906;
const int SPELL_FORCE_LIGHT = 907;
const int SPELL_FORCE_BLINDESS = 908;
const int SPELL_FORCE_LIGHTSABER_LEVITATION = 909;
const int SPELL_FORCE_FAR_SIGHT = 910;

const int SPELL_FORCE_BODY_1 = 912;
const int SPELL_FORCE_BODY_2 = 913;
const int SPELL_FORCE_BODY_3 = 914;

const int SPELL_FORCE_DRAIN_1 = 918;
const int SPELL_FORCE_DRAIN_2 = 919;
const int SPELL_FORCE_DRAIN_3 = 920;
const int SPELL_FORCE_TRANCE = 921;

const int SPELL_FORCE_REGENERATION_4 = 927;
const int SPELL_FORCE_HEAL_4 = 928;
const int SPELL_LIGHTSABER_FORM_8 = 929;
const int SPELL_LIGHTSABER_FORM_9 = 930;
const int SPELL_LIGHTSABER_FORM_10 = 931;
const int SPELL_LIGHTSABER_FORM_11 = 932;
const int SPELL_FORCE_SAFEGUARD = 933;
const int SPELL_FORCE_PROTECTION_4 = 934;
const int SPELL_FORCE_CHOKE = 935;
const int SPELL_IMPACT_BLASTER_BOLT = 936;
const int SPELL_IMPACT_BLASTER_BALLISTIC = 937;
const int SPELL_IMPACT_BLASTER_CARBONITE = 938;
const int SPELL_IMPACT_BLASTER_ION = 939;
const int SPELL_IMPACT_BLASTER_TURBOLASER = 940;
const int SPELL_IMPACT_BLASTER_SONIC = 941;
const int SPELL_IMPACT_EXPLODE_CONCUSSION = 942;
const int SPELL_IMPACT_EXPLODE_PLASMA = 943;
const int SPELL_IMPACT_EXPLODE_THERMAL = 944;
const int SPELL_IMPACT_EXPLODE_FRAG = 945;
const int SPELL_IMPACT_EXPLODE_ION = 946;
const int SPELL_IMPACT_EXPLODE_GAS = 947;
const int SPELL_IMPACT_EXPLODE_SONIC = 948;
const int SPELL_IMPACT_EXPLODE_CRYOBAN = 949;
const int SPELL_IMPACT_EXPLODE_ADHESIVE = 950;
const int SPELL_IMPACT_EXPLODE_CARBONITE = 951;
const int SPELL_IMPACT_MELEE_VIBROWEAPON = 952;
const int SPELL_IMPACT_MELEE_LIGHTSABER = 953;

const int SPELL_ROCKET = 1500;

const int SPELL_HELLFIRE_1 = 1503;
const int SPELL_HELLFIRE_2 = 1504;

// Skills
const int SKILL_SENSE = 27;
const int SKILL_CONTROL = 28;
const int SKILL_ALTERATION = 29;
const int SKILL_COMPUTER_USE = SKILL_USE_MAGIC_DEVICE;
const int SKILL_DEMOLITIONS = SKILL_SET_TRAP;
const int SKILL_DISABLE_DEVICE = SKILL_DISABLE_TRAP;
const int SKILL_SLEIGHT_OF_HAND = SKILL_PICK_POCKET;
const int SKILL_REPAIR = SKILL_CRAFT_WEAPON;
const int SKILL_ALCHEMY = SKILL_SPELLCRAFT;
const int SKILL_METALLURGY = SKILL_CRAFT_ARMOR;
const int SKILL_PILOT = SKILL_CRAFT_TRAP;
const int SKILL_HANDLE_ANIMAL = SKILL_ANIMAL_EMPATHY;

// Item properties
const int ITEM_PROPERTY_IMPACT_SCRIPT = 82;
const int ITEM_PROPERTY_AMMO_TYPE = 85;
const int ITEM_PROPERTY_RATE_OF_FIRE = 86;
const int ITEM_PROPERTY_RANGED_DAMAGE = 87;
const int ITEM_PROPERTY_BLASTER_IMPACT_SCRIPT = 88;
const int IP_CONST_AMMO_POWER_CELL = 0;
const int IP_CONST_AMMO_MAGAZINE = 1;
const int IP_CONST_RATE_OF_FIRE_SINGLE_SHOT = 0;
const int IP_CONST_RATE_OF_FIRE_SEMI_AUTOMATIC = 1;
const int IP_CONST_RATE_OF_FIRE_AUTOMATIC = 2;
const int IP_CONST_RANGED_DAMAGE_BALLISTIC = 0;
const int IP_CONST_RANGED_DAMAGE_ENERGY = 1;
const int IP_CONST_RANGED_DAMAGE_ION = 2;
const int IP_CONST_RANGED_DAMAGE_ACID = 3;
const int IP_CONST_RANGED_DAMAGE_COLD = 4;
const int IP_CONST_RANGED_DAMAGE_ELECTRIC = 5;
const int IP_CONST_RANGED_DAMAGE_FIRE = 6;
const int IP_CONST_RANGED_DAMAGE_SONIC = 7;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_BOLT = 0;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_PROJECTILE = 1;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_CARBONITE = 2;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_ION = 3;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_TURBOLASER = 4;
const int IP_CONST_IMPACT_SCRIPT_BLASTER_SONIC = 5;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_CONCUSSION = 6;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_PLASMA = 7;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_THERMAL = 8;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_FRAG = 9;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_ION = 10;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_GAS = 11;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_SONIC = 12;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_CRYOBAN = 13;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_ADHESIVE = 14;
const int IP_CONST_IMPACT_SCRIPT_EXPLODE_CARBONITE = 15;
const int IP_CONST_IMPACT_SCRIPT_MELEE_VIBROWEAPON = 16;
const int IP_CONST_IMPACT_SCRIPT_MELEE_LIGHTSABER = 17;
const int IP_CONST_CASTSPELL_ROCKET = 540;
const int IP_CONST_DAMAGETYPE_ION = IP_CONST_DAMAGETYPE_MAGICAL;
const int IP_CONST_DAMAGETYPE_LIGHTSIDE = IP_CONST_DAMAGETYPE_POSITIVE;
const int IP_CONST_DAMAGETYPE_DARKSIDE = IP_CONST_DAMAGETYPE_NEGATIVE;
const int IP_CONST_DAMAGETYPE_ENERGY = IP_CONST_DAMAGETYPE_PIERCING;
const int IP_CONST_DAMAGEBONUS_11 = 21;
const int IP_CONST_DAMAGEBONUS_12 = 22;
const int IP_CONST_DAMAGEBONUS_13 = 23;
const int IP_CONST_DAMAGEBONUS_14 = 24;
const int IP_CONST_DAMAGEBONUS_15 = 25;
const int IP_CONST_DAMAGEBONUS_16 = 26;
const int IP_CONST_DAMAGEBONUS_17 = 27;
const int IP_CONST_DAMAGEBONUS_18 = 28;
const int IP_CONST_DAMAGEBONUS_19 = 29;
const int IP_CONST_DAMAGEBONUS_20 = 30;
const int IP_CONST_FEAT_BLASTER_ACTIONS = 63;

// Animations
const int ANIMATION_LOOPING_REACH = ANIMATION_LOOPING_CUSTOM1;
const int ANIMATION_LOOPING_CROUCH = ANIMATION_LOOPING_CUSTOM2;
const int ANIMATION_LOOPING_CHOKE = ANIMATION_LOOPING_CUSTOM3;
const int ANIMATION_LOOPING_FOLD_ARMS = ANIMATION_LOOPING_CUSTOM4;
const int ANIMATION_LOOPING_SMOKE = ANIMATION_LOOPING_CUSTOM7;
const int ANIMATION_LOOPING_DRINK = ANIMATION_LOOPING_CUSTOM9;

// Base Items
const int BASE_ITEM_LIGHTSABER = BASE_ITEM_SHORTSWORD;
const int BASE_ITEM_DOUBLE_LIGHTSABER = BASE_ITEM_TWOBLADEDSWORD;
const int BASE_ITEM_GREAT_LIGHTSABER = BASE_ITEM_GREATSWORD;
const int BASE_ITEM_BLASTER_PISTOL = BASE_ITEM_SHORTBOW;
const int BASE_ITEM_BLASTER_RIFLE = BASE_ITEM_LONGBOW;
const int BASE_ITEM_ASSAULT_BLASTER = BASE_ITEM_LIGHTCROSSBOW;
const int BASE_ITEM_HEAVY_BLASTER = BASE_ITEM_HEAVYCROSSBOW;
const int BASE_ITEM_VIBROBLADE = BASE_ITEM_RAPIER;
const int BASE_ITEM_VIBROSWORD = BASE_ITEM_LONGSWORD;
const int BASE_ITEM_VIBRO_GREATAXE = BASE_ITEM_GREATAXE;
const int BASE_ITEM_TRANDO_VIBROBLADE = BASE_ITEM_SCIMITAR;
const int BASE_ITEM_VIBRODAGGER = BASE_ITEM_DAGGER;
const int BASE_ITEM_VIBROSTAFF = BASE_ITEM_QUARTERSTAFF;
const int BASE_ITEM_SABERPIKE = BASE_ITEM_SHORTSPEAR;
const int BASE_ITEM_CHAINSAW = BASE_ITEM_SICKLE;
const int BASE_ITEM_DUAL_BLASTER_PISTOL = BASE_ITEM_SLING;
const int BASE_ITEM_VIBRO_HANDAXE = BASE_ITEM_HANDAXE;
const int BASE_ITEM_VIBRO_AXE = BASE_ITEM_BATTLEAXE;
const int BASE_ITEM_VIBROKATANA = BASE_ITEM_KATANA;
const int BASE_ITEM_VIBROCLAW = BASE_ITEM_KAMA;

// Phenotypes
const int PHENO_KENSAI = 15;
const int PHENO_ASSASSIN = 16;
const int PHENO_HEAVY = 17;
const int PHENO_FENCING = 18;
const int PHENO_CRAWLING = 9;
const int PHENO_ARCANE = 19;
const int PHENO_DEMONBLADE = 20;
const int PHENO_WARRIOR = 21;
const int PHENO_TIGERFANG = 30;
const int PHENO_SUNFIST = 31;
const int PHENO_DRAGONPALM = 32;
const int PHENO_BEARCLAW = 33;

// Damage Types
const int DAMAGE_TYPE_ION = DAMAGE_TYPE_MAGICAL;
const int DAMAGE_TYPE_LIGHTSIDE = DAMAGE_TYPE_POSITIVE;
const int DAMAGE_TYPE_DARKSIDE = DAMAGE_TYPE_NEGATIVE;
const int DAMAGE_TYPE_ENERGY = DAMAGE_TYPE_PIERCING;

// Poisons
const int POISON_SITH_POISON_1 = 45;
const int POISON_SITH_POISON_2 = 46;
const int POISON_SITH_POISON_3 = 47;

// Diseases
const int DISEASE_SITH_DISEASE_1 = 17;
const int DISEASE_SITH_DISEASE_2 = 18;
const int DISEASE_SITH_DISEASE_3 = 19;

// Visual && Sound Effects
const int VFX_FNF_DIG_UP = 137;
const int VFX_FNF_HELLBALL = 464;
const int VFX_FNF_CONCUSSION_BLAST = 606;
const int VFX_IMP_BLASTER_BOLT = 607;
const int SFX_IMP_BLASTER_DEFLECT = 608;

// Rocket Types
const int ROCKET_TYPE_CONCUSSION = 1;
const int ROCKET_TYPE_MINI_CONCUSSION = 2;

// FUNCTION DECLARATIONS //////////////////////////////////////////////////////

void SpeakError(string sScript, string sError);

// Returns TRUE if oWeapon is a lightsaber or saber pike.
int IsWeaponLightsaber(object oWeapon);

// Break the caller's concentration.
// - nDamageTaken: If this is > 0 then the caller will make a concentration
//   skill check to avoid losing concentration.
void BreakConcentration(int nDamageTaken=0, int bFeedback=FALSE);

// Returns TRUE if oPC has an unbroken concentration.
int IsConcentrating(object oPC=OBJECT_SELF);

// Make the caller concentrate.
// - fDuration: The duration for which this function lasts.
//   If left at 0.0 then it will last indefinitely.
void SetIsConcentrating(float fDuration=0.0, int bFeedback=FALSE);

// Remove poison & disease from oCreature
void RemoveAilments(object oCreature);

// Remove any negative effects and decreases of any kind from oCreature
void RemoveNegativeEffects(object oCreature);

// This gets a value based on the oTarget's size (1-5)
// Normal humans are 2
int GetSizeValue(object oTarget);

// This function returns the angle of vTarget from vOrigin.
// - fFacingPoint: This is the facing point of vOrigin.
float AngleBetweenVectors(vector vTarget, vector vOrigin, float fFacingPoint);

// Returns TRUE if oSelf is facing in the direction of oObjectToCheck.
// - fView: The +- degree of view from our facing point.
int GetIsFacingObject(object oObjectToCheck, object oSelf=OBJECT_SELF, float fView=30.0);

// Return the percentile chance of oObject deflecting a blaster bolt.
float GetBlasterBoltDeflectPercentile(object oObject);

// Set the percentile chance, in decimal, of oObject deflecting a blaster bolt.
// - fPercent: If this is greater than 1.0 than it will set to 1.0.
// - sSetType: BLASTER_BOLT_DEFLECT_TYPE_*
void SetBlasterBoltDeflectPercentile(object oObject, float fPercent, string sSetType);

// Get the range of view able to deflect blaster bolts.
float GetBlasterBoltDeflectRange(object oObject);

// Set the range of view, in degrees, able to deflect blaster bolts.
// - fRange: If this is greater than 360.0 than it will set to 360.0.
// - sSetType: BLASTER_BOLT_DEFLECT_TYPE_*
void SetBlasterBoltDeflectRange(object oObject, float fRange, string sSetType);

// Get a number suffix, padded if necessary
string GetNumberSuffix(int n);

// Return a string of either Sir or Madam based on oObject's gender.
string StringSirOrMadam(object oObject);

// Create an item property that (when applied to a weapon item) causes a script
// to be fired when a successful strike is made, or (when applied to armor) is
// struck by an oppoenent.
// - nScript: IP_CONST_IMPACT_SCRIPT_*
itemproperty ItemPropertyImpactScript(int nScript);

// This function sets oPC to nLevel
void SetPCLevel(object oPC, int nLevel);

// returns a properly color-coded sText string based on specified RGB values
string ColorString(string sText, int nRed=255, int nGreen=255, int nBlue=255);

// Returns TRUE if oTarget passes a strength check..
// - nImmune: The target autowins the check if he/she has a strength modifier
//   equal to or greater than this. Set to 0 to ignore this.
int StrengthCheck(object oTarget, int nCheckAgainst=14, int nImmune=16);

// This function looks up the AC value of oItem. The object parameter must be
// armor. Returns -1 on error.
//
// Note that this function uses Get2DAString and may cause performance issues
// if used frequently.
int GetArmorType(object oItem);

// Get the adjusted attack bonus for oWeapon as dictated by weapon focus feats.
int GetModifiedAttackByFeats(object oPC, object oWeapon, int nAttack);

// FUNCTION DEFINITIONS ///////////////////////////////////////////////////////

void SpeakError(string sScript, string sError) {
    SpeakString("ERROR IN SCRIPT: " + sScript + ": " + sError, TALKVOLUME_SILENT_SHOUT);
}

int IsWeaponLightsaber(object oWeapon) {
    if (GetStringUpperCase(GetTag(oWeapon)) == "LIGHTSABER") return TRUE;
    return FALSE;
}

void BreakConcentration(int nDamageTaken=0, int bFeedback=FALSE) {
    if (nDamageTaken > 0) {
        if (GetIsSkillSuccessful(OBJECT_SELF, SKILL_CONCENTRATION, nDamageTaken)) return;
    }
    if (bFeedback) FloatingTextStringOnCreature("Concentration broken.", OBJECT_SELF, FALSE);
    DeleteLocalInt(OBJECT_SELF, "CONCENTRATING");
}

int IsConcentrating(object oPC=OBJECT_SELF) {
    return GetLocalInt(oPC, "CONCENTRATING");
}

void SetIsConcentrating(float fDuration=0.0, int bFeedback=FALSE) {
    SetLocalInt(OBJECT_SELF, "CONCENTRATING", TRUE);
    if (bFeedback) FloatingTextStringOnCreature("Concentrating...", OBJECT_SELF, FALSE);
    if (fDuration > 0.0) DelayCommand(fDuration, DeleteLocalInt(OBJECT_SELF, "CONCENTRATION"));
}

void RemoveAilments(object oCreature) {
    effect eEffect = GetFirstEffect(oCreature);
    while (GetIsEffectValid(eEffect)) {
        if (GetEffectType(eEffect) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eEffect) == EFFECT_TYPE_POISON) {
            RemoveEffect(oCreature,eEffect);
        }
        eEffect = GetNextEffect(oCreature);
    }
}

void RemoveNegativeEffects(object oCreature) {
    effect eBad = GetFirstEffect(oCreature);
    while (GetIsEffectValid(eBad)) {
        if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
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
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL) {
            RemoveEffect(oCreature, eBad);
        }
        eBad = GetNextEffect(oCreature);
    }
}

int GetSizeValue(object oTarget) {
    switch(GetCreatureSize(oTarget)) {
        case CREATURE_SIZE_TINY: return 1;
        case CREATURE_SIZE_SMALL: return 2;
        case CREATURE_SIZE_MEDIUM: return 3;
        case CREATURE_SIZE_LARGE: return 4;
        case CREATURE_SIZE_HUGE: return 5;
    }
    return 0;
}

float AngleBetweenVectors(vector vTarget, vector vOrigin, float fFacingPoint) {
    float fAngleFromFace;
    float fAngleFromOrigin = VectorToAngle(vTarget - vOrigin);
    fAngleFromOrigin = GetNormalizedDirection(fAngleFromOrigin);
    fAngleFromFace = fFacingPoint - fAngleFromOrigin;
    return fAngleFromFace;
}

int GetIsFacingObject(object oObjectToCheck, object oSelf=OBJECT_SELF, float fView=30.0) {

    if (GetArea(oObjectToCheck) != GetArea(oSelf)) return FALSE;
    if (GetDistanceBetween(oObjectToCheck, oSelf) == 0.0) return FALSE;

    float fAngleFromSelf = AngleBetweenVectors(GetPosition(oObjectToCheck),
                                               GetPosition(oSelf),
                                               GetFacing(oSelf));
    if (fAngleFromSelf > 180.0) fAngleFromSelf = 360.0 - fAngleFromSelf;

    //SpeakString("ANGLE DEGREE: " + FloatToString(fAngleFromSelf));

    if (fView >= fAngleFromSelf) {
        return TRUE;
    }
    return FALSE;
}

float GetBlasterBoltDeflectPercentile(object oObject) {
    float fPercent = GetLocalFloat(oObject, "PERCENT_"+BLASTER_BOLT_DEFLECT_TYPE_NATURAL);
    if (fPercent != 0.0) {
        fPercent += GetLocalFloat(oObject, "PERCENT_"+BLASTER_BOLT_DEFLECT_TYPE_FEAT);
        fPercent += GetLocalFloat(oObject, "PERCENT_"+BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
    }
    return fPercent;
}

void SetBlasterBoltDeflectPercentile(object oObject, float fPercent, string sSetType) {
    if (fPercent == 0.0) {
        DeleteLocalFloat(oObject, "PERCENT_"+sSetType);
    }
    else {
        if (fPercent > 1.0) fPercent = 1.0;
        SetLocalFloat(oObject, "PERCENT_"+sSetType, fPercent);
    }
}

float GetBlasterBoltDeflectRange(object oObject) {
    float fRange = GetLocalFloat(oObject, "RANGE_"+BLASTER_BOLT_DEFLECT_TYPE_NATURAL);
    if (fRange != 0.0) {
        fRange += GetLocalFloat(oObject, "RANGE_"+BLASTER_BOLT_DEFLECT_TYPE_FEAT);
        fRange += GetLocalFloat(oObject, "RANGE_"+BLASTER_BOLT_DEFLECT_TYPE_LIGHTSABER_FORM);
    }
    return fRange;
}

void SetBlasterBoltDeflectRange(object oObject, float fRange, string sSetType) {
    if (fRange == 0.0) {
        DeleteLocalFloat(oObject, "RANGE_"+sSetType);
    }
    else {
        if (fRange > 360.0) fRange = 360.0;
        SetLocalFloat(oObject, "RANGE_"+sSetType, fRange);
    }
}

string GetNumberSuffix(int n) {
    if (n < 10) {
        return "0" + IntToString(n);
    }
    return IntToString(n);
}

string StringSirOrMadam(object oObject) {
    return (GetGender(oObject) == GENDER_FEMALE) ? "Madam" : "Sir";
}

itemproperty ItemPropertyImpactScript(int nScript) {
    return ItemPropertyOnHitCastSpell(nScript, 1);
}

void SetPCLevel(object oPC, int nLevel) {
    int nXP = (nLevel * (nLevel - 1)) / 2 * 1000;
    SetXP(oPC, nXP);
}

string ColorString(string sText, int nRed=255, int nGreen=255, int nBlue=255) {
    return "<c" + GetSubString(COLORTOKEN, nRed, 1) + GetSubString(COLORTOKEN, nGreen, 1) + GetSubString(COLORTOKEN, nBlue, 1) + ">" + sText + "</c>";
}

int StrengthCheck(object oTarget, int nCheckAgainst=14, int nImmune=16) {
    int bPass;
    int nTargetStrength = GetAbilityModifier(ABILITY_STRENGTH, oTarget);
    if (nImmune != 0 && nTargetStrength >= nImmune) {
        bPass = TRUE;
    }
    else if (nTargetStrength + d20() >= nCheckAgainst + d20()) {
        bPass = TRUE;
    }
    return bPass;
}

int GetArmorType(object oItem) {
    int nRow = GetItemAppearance(oItem, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_TORSO);
    string s2da = Get2DAString("parts_chest", "ACBONUS", nRow);
    int nType = StringToInt(GetStringLeft(s2da, 1));
    return nType;
}

int GetModifiedAttackByFeats(object oPC, object oWeapon, int nAttack) {
    int nBaseItemType = GetBaseItemType(oWeapon);
    int nFocusFeat, nEpicFocusFeat;
    switch (nBaseItemType) {
        case BASE_ITEM_ASSAULT_BLASTER:     nFocusFeat = FEAT_WEAPON_FOCUS_ASSAULT_BLASTER;     nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_ASSAULT_BLASTER; break;
        case BASE_ITEM_BLASTER_PISTOL:      nFocusFeat = FEAT_WEAPON_FOCUS_BLASTER_PISTOL;      nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_BLASTER_PISTOL; break;
        case BASE_ITEM_BLASTER_RIFLE:       nFocusFeat = FEAT_WEAPON_FOCUS_BLASTER_RIFLE;       nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_BLASTER_RIFLE; break;
        case BASE_ITEM_HEAVY_BLASTER:       nFocusFeat = FEAT_WEAPON_FOCUS_HEAVY_BLASTER;       nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_HEAVY_BLASTER; break;
        case BASE_ITEM_TRANDO_VIBROBLADE:   nFocusFeat = FEAT_WEAPON_FOCUS_TRANDO_VIBROBLADE;   nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_TRANDO_VIBROBLADE; break;
        case BASE_ITEM_VIBRO_AXE:           nFocusFeat = FEAT_WEAPON_FOCUS_VIBRO_AXE;           nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBRO_AXE; break;
        case BASE_ITEM_VIBRO_GREATAXE:      nFocusFeat = FEAT_WEAPON_FOCUS_VIBRO_GREATAXE;      nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBRO_GREATAXE; break;
        case BASE_ITEM_VIBRO_HANDAXE:       nFocusFeat = FEAT_WEAPON_FOCUS_VIBRO_HANDAXE;       nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBRO_HANDAXE; break;
        case BASE_ITEM_VIBROBLADE:          nFocusFeat = FEAT_WEAPON_FOCUS_VIBROBLADE;          nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBROBLADE; break;
        case BASE_ITEM_VIBROCLAW:           nFocusFeat = FEAT_WEAPON_FOCUS_VIBROCLAW;           nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBROCLAW; break;
        case BASE_ITEM_VIBRODAGGER:         nFocusFeat = FEAT_WEAPON_FOCUS_VIBRODAGGER;         nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBRODAGGER; break;
        case BASE_ITEM_VIBROKATANA:         nFocusFeat = FEAT_WEAPON_FOCUS_VIBROKATANA;         nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBROKATANA; break;
        case BASE_ITEM_VIBROSTAFF:          nFocusFeat = FEAT_WEAPON_FOCUS_VIBROSTAFF;          nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBROSTAFF; break;
        case BASE_ITEM_VIBROSWORD:          nFocusFeat = FEAT_WEAPON_FOCUS_VIBROSWORD;          nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_VIBROSWORD; break;
        case BASE_ITEM_LIGHTSABER:          nFocusFeat = FEAT_WEAPON_FOCUS_LIGHTSABER;          nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_LIGHTSABER; break;
        case BASE_ITEM_SABERPIKE:           nFocusFeat = FEAT_WEAPON_FOCUS_SABERPIKE;           nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_SABERPIKE; break;
        case BASE_ITEM_GREAT_LIGHTSABER:    nFocusFeat = FEAT_WEAPON_FOCUS_GREAT_LIGHTSABER;    nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_GREAT_LIGHTSABER; break;
        case BASE_ITEM_DOUBLE_LIGHTSABER:   nFocusFeat = FEAT_WEAPON_FOCUS_DOUBLE_LIGHTSABER;   nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_DOUBLE_LIGHTSABER; break;
        case BASE_ITEM_DUAL_BLASTER_PISTOL: nFocusFeat = FEAT_WEAPON_FOCUS_DUAL_BLASTER_PISTOL; nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_DUAL_BLASTER_PISTOL; break;
        case BASE_ITEM_CHAINSAW:            nFocusFeat = FEAT_WEAPON_FOCUS_CHAINSAW;            nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_CHAINSAW; break;
        case BASE_ITEM_WHIP:                nFocusFeat = FEAT_WEAPON_FOCUS_WHIP;                nEpicFocusFeat = FEAT_EPIC_WEAPON_FOCUS_WHIP; break;
        default: return nAttack;
    }
    if (GetHasFeat(nEpicFocusFeat, oPC)) nAttack = 3;
    else if (GetHasFeat(nFocusFeat, oPC)) nAttack = 1;
    if (GetHasFeat(FEAT_EPIC_PROWESS, oPC)) nAttack += 1;

    return nAttack;
}

//void main() {}
