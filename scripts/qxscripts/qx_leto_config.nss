// This lists all of the constant ints that are to be used for LL

// This is the path to your servervault. It must be set correctly for Letoscript to work.
const string NWNPATH = "/NWN1.69/servervault/";//windows sample
const string NWNSVAULT = "/NWN1.69/servervault/";//windows sample
const string NWNLVAULT = "/NWN1.69/localvault/";//windows sample
// const string NWNPATH = "/home/funkyswerve/nwn/servervault/";//linux sample

const int PHOENIX = FALSE;//set this to true if you are using the older version of Letoscript, 3-18, rather than the newer 3-24 (other versions are 'bridge' versions with bugs)

const int DEBUG = FALSE;//set this to TRUE to enable debugging

/* This will enable the functionality to automatically reload new characters
 * once the subrace system has recognized their race and is ready to modify
 * thier stats.  It may not work on all machines because if this reloads the
 * character too quickly the Leto plugin will not have enough time to modify
 * the character file.  Sometimes adjusting the RELOAD_TIME_DELAY constant is
 * helpful. This constant is the number of seconds to delay the portal command
 * before it executes.  This will allow the client to finish loading before it
 * transitions the character The only way to know for sure is to test it.  If
 * you turn this functionality off, new players will need to log off and then
 * log back in manually the first time they create a new character.
 ******************************************************************************/
const int    ENABLE_AUTO_RELOAD = TRUE;
const float  RELOAD_TIME_DELAY = 15.0;

/* The next 3 contants are defined for use when ENABLE_AUTO_RELOAD is TRUE.
 * They are intended to specify the enought information about the server to
 * allow the client to reconnect without user intervention. These constants
 * correspond to the input variables to the NWScript function "ActivatePortal".
 * Please see the documentation in the Toolkit for an explanation of this
 * function and its input parameters. If ENABLE_AUTO_RELOAD is set to FALSE,
 * the contents of these constants does not matter.
 ******************************************************************************/
const string PORTAL_ADDRESS = "localhost";
const string PORTAL_PASSWORD = "vader";
const string PORTAL_WAYPOINT = "";

