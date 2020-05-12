//**///////////////////////////////////////////////////////////////////////////
//** LOCK!NESS! v1.02 - onHeartBeat script for the GDSL placeable.
//**///////////////////////////////////////////////////////////////////////////
//**
//** What is the GDSL ?
//** ------------------
//** In fact, GDSL means "Gestionnaire de spawn LOCK". You can traduce it by
//** "LOCK spawn manager". It is an invisible placeable that we can make spawn
//** with the custom function LOCK_SpawnPlaceable() called in the onEnter.
//**
//** By setting an integer local variable to it (PLC = 1), we can make it
//** despawn like all the other creatures when the cleaning timer allows it...
//** so the HeartBeat script runs only when necessary !
//**
//** As you know, the main prefix of a classical spawn WP is "LOCK_". Well,
//** this placeable do the same job but it won't look for the "LOCK_" WPs but
//** only for the "GDSL_" WPs. They are used to spawn creatures/placeables/items
//** depending on the time IG.
//**
//** If you want to setup a spawn, you must use an integer local variable
//** on the "GDSL_" spawn waypoint. Here are the values :
//**
//** DN = 1 -> Day spawn. Do NOT despawn on the evening, nor night.
//** DN = 2 -> Night spawn. Do NOT despawn on the morning, nor day.
//** DN = 3 -> Day spawn. DO despawn on the evening or night !
//** DN = 4 -> Night spawn. DO despawn on the morning or day !
//**
//**///////////////////////////////////////////////////////////////////////////
//** Last modification: 08/01/2005
//** Created by Firya'nis & Ex Tempus.
//**///////////////////////////////////////////////////////////////////////////

#include "lock_inc"

void main()
{
    string TIME = GetLocalString(OBJECT_SELF, "LOCK_TIME");

    if (TIME == "")
    {
        if (GetIsDay() || GetIsDawn())
        {
            SetLocalString(OBJECT_SELF, "TIME", "LOCK_DAY");
            GDSL_DaySpawns();
        }
        else if (GetIsNight() || GetIsDusk())
        {
            SetLocalString(OBJECT_SELF, "TIME", "LOCK_NIGHT");
            GDSL_NightSpawns();
        }
    }
    else if (TIME == "DAY" && (GetIsNight() || GetIsDusk()) )
    {
        SetLocalString(OBJECT_SELF, "TIME", "LOCK_NIGHT");
        GDSL_NightSpawns();
    }
    else if (TIME == "NIGHT" && (GetIsDay() || GetIsDawn()) )
    {
        SetLocalString(OBJECT_SELF, "TIME", "LOCK_DAY");
        GDSL_DaySpawns();
    }
}
