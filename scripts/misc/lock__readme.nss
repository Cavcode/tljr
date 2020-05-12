//**///////////////////////////////////////////////////////////////////////////
//**
//** LOCK Spawn System v1.02 (NWN/SOU/HOTU 1.66)
//**
//**///////////////////////////////////////////////////////////////////////////
//**
//** Created by Firya'nis & Ex Tempus
//** For French Roleplay Persistent World -> Umeria, Terra Incognita
//**
//**///////////////////////////////////////////////////////////////////////////
//**
//** -------
//** UPDATES
//** -------
//**
//** 1.02 (02/27/2006)
//** -----------------
//** - Updated "lock_inc" to avoid a bug which was preventing creatures from
//**   respawning when a PC left an area and go back there. Do not forget
//**   to compile after updating this script (which is an "include" file) or
//**   it may not works !
//**
//** 1.01 (08/06/2005)
//** -----------------
//** - Updated "lock_onenter" to avoid a small bug.
//**
//** 1.00 (08/01/2005)
//** -----------------
//** - First release.
//**
//**
//** ------------
//** INTRODUCTION
//** ------------
//**
//** This is another spawn system. When we were starting our persistent world,
//** we both decided we should use a spawn/despawn system.
//**
//** We tried NESS (Neshke’s Extendable Spawning System) and it was very cool
//** and full of very useful tools but after a while, we decided to create ou
//** own system... Why ?
//**
//** We got the feeling the server was a bit laggy since we installed NESS.
//** As the NESS system is specifically using HeartBeat, it grabs a lot of
//** ressources. We wanted something else... and so, we decided to create
//** something using both onEnter and onExit events.
//**
//** After a while, things changed because we needed to spawn/despawn NPCs at
//** day/night. And this is definitely not possible doing good without using
//** the HeartBeat. That's why we created another part of the system which is
//** called "GDSL". What is that ?
//**
//** GDSL means "Gestionnaire de spawn LOCK" which is "LOCK Spawn manager"
//** in french. Basically, it is an invisible placeable with a script on its
//** heartbeat and it manages the Day/Night (de)spawns the way NESS was doing
//** it. The only difference is that when the despawn occurs (10 minutes after
//** the area is empty), the GDSL Manager placeable is destroyed too and so,
//** there is no more HeartBeat running inside the area... unless somebody
//** enters the area again ! ;-)
//**
//** LOCK has been created for the needs of our own persistent world. It only
//** contains what we had to create for our own needs. Maybe you will think
//** this is not good... nor interesting ! But we decided to post it on the
//** vault because we like to share our work and we just hope this could be
//** useful to some of you ! :-)
//**
//** -----------------------------
//** So, what can I do with LOCK ?
//** -----------------------------
//**
//** I will say the truth: You can't do with LOCK all what you can do with NESS
//** but if you just want to do basic things, do it faster with LOCK ! ;-)
//**
//** You can...
//**
//** Spawn...
//** --------
//** - Spawn any creatures/placeables/items (Day/Night)   (GDSL)
//** - Spawn any creatures/placeables/items (at any time)
//**
//** Despawn and do some area cleaning !
//** -----------------------------------
//** - Despawn any creatures/placeables/items (Day/Night) (GDSL)
//** - Despawn all creatures/placeables/items (10 mins after the area is empty)
//** - Destroy all lootbags and items dropped on the floor at the same time.
//**
//** Spawn with conditions...
//** ------------------------
//** - You can set a creature to start a random walk after the spawn.
//** - You can set a creature to sit down on the nearest chair. (Tag: Chair)
//** - You can set a creature to play an emote (like sitting on the floor).
//** - You can set a creature to start a dialog alone.
//** - You can set a new TAG to the spawned creature/placeable/item and so,
//**   if you spawn 2 (or more) identical creatures inside the same area, you
//**   can set different walkpaths for all of them ! ;-)
//**
//** Do something else related to the time.
//** --------------------------------------
//** - You can lock/unlock doors (ex: shops) at day/night. (GDSL)
//**
//**
//** ---------------------
//** Contents of the ERF :
//** ---------------------
//**
//** Scripts
//** -------
//** - lock__readme (This file)
//** - lock_gdsl_hb (Script attached to the HeartBeat of the GDSL Manager)
//** - lock_inc     (Include used on all the scripts)
//** - lock_onenter (use it on the onEnter area event !)
//** - lock_onexit  (use it on the onExit area event !)
//**
//** Waypoints
//** ---------
//** - Spawn Creature          - LOCK_ system.
//** - Spawn Creature (Day)    - GDSL_ system.
//** - Spawn Creature (Night)  - GDSL_ system.
//** - Spawn Item              - LOCK_ system.
//** - Spawn Placeable         - LOCK_ system.
//** - Spawn Placeable (Day)   - GDSL_ system.
//** - Spawn Placeable (Night) - GDSL_ system.
//** - Spawn GDSL Manager      - LOCK_ system.
//**
//** Placeables (Category: Special 1)
//** ----------
//** - GDSL Manager (invisible)
//**
//**
//** -------------------------------
//** OK... but how to use all this ?
//** -------------------------------
//**
//** You can learn how to use them by looking at the demonstration module
//** inside the toolset and by running it inside the game. Both module and
//** ERF have been created with a NWN/SOU/HOTU toolset updated to 1.66.8074...
//**
//** I hope everybody will be able to load the module or to import the .ERF
//** to their own module. If you can't use these, contact us via the nwvault
//** comments and we will try to figure out how to help you.
//**
//** So, let's go for the basic explanation...
//**
//** Basically, you just have to import the ERF. file to your module, assign
//** the "lock_onenter" script to the onEnter event and the "lock_onexit"
//** script to the onExit event of ALL the areas where spawn must occurs.
//**
//** After that, just find the waypoints and for the placeable inside the
//** custom palettes and read the comments by editing them to learn more
//** about how using them ! ;-)
//**
//** There are two areas inside the module. The first one, "LOCK v1.0", is
//** showing what you can do with the basic LOCK system. The second one, "GDSL",
//** is there to show what you can do with the "GDSL" (Day/Night) spawn. Just
//** know you can do with GDSL everything you can do with LOCK (Auto Sit Down,
//** Auto Animation, Auto Random Walk, ...) but LOCK uses less ressources
//** because there is no heartbeat script... so DON'T use GDSL system when you
//** don't need to spawn only at Day/Night ! :-)
//**
//** Enjoy !
//**
//** Firya'nis and Ex Tempus.
//** Email: firyanis@skynet.be / ex_tempus@hotmail.com
//**
//** END OF README.
//**
//**///////////////////////////////////////////////////////////////////////////
