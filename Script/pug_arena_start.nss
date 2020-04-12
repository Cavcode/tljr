const int ARENA_WAVES = 7;
const string ARENA_SPAWN = "GEO_ARENA_SPAWN";

const string ARENA_CEATURE_1 = "bantha"; //reseref for the creature
const int ARENA_KILLS_1 = 15; //How many kills for this round are necessary
const int ARENA_SPAWN_1 = 2; //How many creatures there will be at one time

const string ARENA_CEATURE_2 = "rakghoul";
const int ARENA_KILLS_2 = 10;
const int ARENA_SPAWN_2 = 4;

const string ARENA_CEATURE_3 = "battledroid";
const int ARENA_KILLS_3 = 10;
const int ARENA_SPAWN_3 = 3;

const string ARENA_CEATURE_4 = "kathhound";
const int ARENA_KILLS_4 = 6;
const int ARENA_SPAWN_4 = 3;

const string ARENA_CEATURE_5 = "hornedkathhound";
const int ARENA_KILLS_5 = 1;
const int ARENA_SPAWN_5 = 1;

const string ARENA_CEATURE_6 = "sandworm";
const int ARENA_KILLS_6 = 3;
const int ARENA_SPAWN_6 = 1;

const string ARENA_CEATURE_7 = "acklay";
const int ARENA_KILLS_7 = 1;
const int ARENA_SPAWN_7 = 1;

/*  Round 1: Bantha, 10 killed, 2 at once.
    Round 2: Rakghoul, 10 killed, 4 at once.
    Round 3: B1 Battle Droid, 8 killed, 2 at once.
    Round 4: Kath Hound, 6 killed, 3 at once.
    Round 5: Horned Kath Hound, 1 killed, 1 at once.
    Round 6: Sand Worm, 3 killed, 1 at once.
    Round 7: Acklay, 1 killed, 1 at once    */

void ArenaSpawn(string sSpawn, int nKills, int nCount)
{
location lWP = GetLocation(GetWaypointByTag(ARENA_SPAWN));
SetLocalInt(GetModule(), "GEO_KILLS", nKills);
SetLocalInt(GetModule(), "GEO_SPAWNS", nCount);
SetLocalInt(GetModule(), "GEO_ROUND", GetLocalInt(GetModule(), "GEO_ROUND")+1);
int t;

for (t = 1; t < (nCount+1); t++)
    {
    CreateObject(OBJECT_TYPE_CREATURE, sSpawn, lWP, TRUE, "arena_beast");
    }
}

void main()
{
int nRound = GetLocalInt(GetModule(), "GEO_ROUND")+1;
int nLeft = GetLocalInt(GetModule(), "GEO_KILLS");
string sMsg = "Round "+IntToString(nRound)+"!";

if (GetIsObjectValid(GetObjectByTag("arena_beast")) == FALSE)
    {nLeft = 0;}
else if (GetIsObjectValid(GetObjectByTag("arena_beast")) == TRUE && GetIsDead(GetObjectByTag("arena_beast")) == TRUE)
    {nLeft = 0;}

if (nLeft > 0){sMsg = "You must complete the current round before going on.";}
else if (nRound == 1){ArenaSpawn(ARENA_CEATURE_1, ARENA_KILLS_1, ARENA_SPAWN_1);}
else if (nRound == 2){ArenaSpawn(ARENA_CEATURE_2, ARENA_KILLS_2, ARENA_SPAWN_2);}
else if (nRound == 3){ArenaSpawn(ARENA_CEATURE_3, ARENA_KILLS_3, ARENA_SPAWN_3);}
else if (nRound == 4){ArenaSpawn(ARENA_CEATURE_4, ARENA_KILLS_4, ARENA_SPAWN_4);}
else if (nRound == 5){ArenaSpawn(ARENA_CEATURE_5, ARENA_KILLS_5, ARENA_SPAWN_5);}
else if (nRound == 6){ArenaSpawn(ARENA_CEATURE_6, ARENA_KILLS_6, ARENA_SPAWN_6);}
else if (nRound == 7){ArenaSpawn(ARENA_CEATURE_7, ARENA_KILLS_7, ARENA_SPAWN_7);}
else if (nRound == 8){sMsg = "Congratulations, you have completed the Geonosis Arena!";ExecuteScript("pug_arena_quit", OBJECT_SELF);}

AssignCommand(OBJECT_SELF, ActionSpeakString(sMsg, TALKVOLUME_TALK));
}

