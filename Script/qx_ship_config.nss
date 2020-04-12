///////// RotR Ship System
///////// by: Quix
//////////////// CONSTANTS ////////////////
#include "nwnx_creature"
#include "qx_ship_stat_inc"
//void main(){}
    // MODULE DEBUG FLAG !!! DO NOT CHANGE !!!
const string DEBUG = "DEBUG_ON";

    // MODULE VARIABLES !!! DO NOT CHANGE !!!
const string LMOD_SHIP_AREA     = "SHIP_AREA";
const string LMOD_SHIP_OBJECT   = "SHIP_OBJECT";
const string LMOD_SHIP_LOCATION = "SHIP_LOCATION";
const string LMOD_SHIP_TYPE     = VAR_SHIP_TYPE;

    // Ship Interior Area ResRefs
const string SHIP_RESREF_E_WING      = "INVALID";
const string SHIP_RESREF_A_WING      = "INVALID";
const string SHIP_RESREF_B_WING      = "INVALID";
const string SHIP_RESREF_TIE_I       = "INVALID";
const string SHIP_RESREF_TIE_F       = "INVALID";
const string SHIP_RESREF_TIE_B       = "INVALID";
const string SHIP_RESREF_FIRESPRAY   = "INVALID";
const string SHIP_RESREF_NABOO_F     = "INVALID";
const string SHIP_RESREF_Y_WING      = "INVALID";
const string SHIP_RESREF_X_WING      = "INVALID";
const string SHIP_RESREF_LAMBDA      = "INVALID";
const string SHIP_RESREF_YT2400      = "INVALID";
const string SHIP_RESREF_ISD1        = "INVALID";
const string SHIP_RESREF_MON_CRUISE  = "INVALID";
const string SHIP_RESREF_TARTAN_CR   = "INVALID";
const string SHIP_RESREF_DEATHSTAR   = "INVALID";

    // Ship Creature ResRefs
const string CREATURE_RESREF_E_WING      = "INVALID";
const string CREATURE_RESREF_A_WING      = "INVALID";
const string CREATURE_RESREF_B_WING      = "INVALID";
const string CREATURE_RESREF_TIE_I       = "INVALID";
const string CREATURE_RESREF_TIE_F       = "INVALID";
const string CREATURE_RESREF_TIE_B       = "INVALID";
const string CREATURE_RESREF_FIRESPRAY   = "INVALID";
const string CREATURE_RESREF_NABOO_F     = "INVALID";
const string CREATURE_RESREF_Y_WING      = "INVALID";
const string CREATURE_RESREF_X_WING      = "INVALID";
const string CREATURE_RESREF_LAMBDA      = "INVALID";
const string CREATURE_RESREF_YT2400      = "INVALID";
const string CREATURE_RESREF_ISD1        = "INVALID";
const string CREATURE_RESREF_MON_CRUISE  = "INVALID";
const string CREATURE_RESREF_TARTAN_CR   = "INVALID";
const string CREATURE_RESREF_DEATHSTAR   = "INVALID";

    // Ship Polymorph Types
const int SHIP_TYPE_E_WING      = 320;
const int SHIP_TYPE_A_WING      = 321;
const int SHIP_TYPE_B_WING      = 322;
const int SHIP_TYPE_TIE_I       = 323;
const int SHIP_TYPE_TIE_F       = 324;
const int SHIP_TYPE_TIE_B       = 325;
const int SHIP_TYPE_FIRESPRAY   = 326;
const int SHIP_TYPE_NABOO_F     = 327;
const int SHIP_TYPE_Y_WING      = 328;
const int SHIP_TYPE_X_WING      = 329;
const int SHIP_TYPE_LAMBDA      = 330;
const int SHIP_TYPE_YT2400      = 331;
const int SHIP_TYPE_ISD1        = 333;
const int SHIP_TYPE_MON_CRUISE  = 334;
const int SHIP_TYPE_TARTAN_CR   = 335;
const int SHIP_TYPE_DEATHSTAR   = 336;
    // Vehicle Polymorph Types
const int VEHICLE_TYPE_ATST     = 332;


