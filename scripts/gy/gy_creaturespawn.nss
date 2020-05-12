/*
Accerak's Spawn & Cleanup System
Created by Accerak on 04/01/04
Crucible of the Crescent Shadow NWN Guild
http://www.crescentshadow.us

Don't let the length of this keep you from trying this
script system.  I'm a bit long winded (I like to explain
everything so that you can go in and edit, troubleshoot,
improve, without having to be a coder to figure out
what a section of my scripts is doing).

UPDATED AS OF 4/22/04
1.  Added ability to spawn and respawn items.  Rules for
    this are the same as for placeables, the items are
    simply spawned in using the custom ITEM SPAWN
    waypoint.
**  NOTED CHANGE:  I mention further down that putting
    in a respawn time of greater than 12 hours will
    cause whatever is being spawned to never respawn,
    This is an error!  If you put in a respawn time of
    greater than 12 hours, the item will NEVER spawn in
    the first place.

UPDATED as of 04/03/04
1.  Added Ability to respawn placeables and creatures
    immediately. (my previous script would cause multiple
    instances of a placeable or creature to appear if
    you set the respawn time to 0, now it won't)
2.  Added ability to set # of creatures to spawn at a
    waypoint.
3.  Added ability to give spawned creatures a random one-
    liner for conversations. (in case you want to generate
    a bunch of townsfolk, etc...)
4.  Added a Default "Loot Store".  When an area is cleaned,
    any items that are dropped by PC's or creatures in that
    area can be purchased here later on.  A nice way to have
    an NPC "dungeon scrounger" who peddles what others have left
    behind.
5.  Added code to automatically close and/or lock anything
    that can be.

This spawn and cleanup system doesn't use any heartbeats.
So it should significantly reduce any lag problems.
It does not have as many options as NESS, but it is much easier
to use and less resource intensive.  It is a nice alternative
for PW builders (like myself) that find NESS and many of the
other waypoint based spawn scripts too cryptic and difficult to
use because of all those options that quite frankly, I don't use
that often (and will script in if I do need them).  Enjoy.

WHERE TO PLACE SCRIPTS
Three scripts are required to be in all of your areas.  Not having
them in every area will cause problems with the tracking of the
# of pc's in an area for cleanup and for respawning.

bpw_gen_usr - in area User Defined hook
bpw_gen_onenter - in area OnEnter hook
bpw_gen_onexit - in area OnExit hook

The other files, just need to be imported.  The only other that
you need to worry about is the conversation script that I explain
below.

CREATING CREATURE SPAWNS
Select the CREATURE SPAWN waypoint from the custom waypoints.
Place it in your area.  Go into it's properties and change the
following information...
1.  WAYPOINT NAME:  must be the RESREF of the creature,
    not the tag, and it is case sensitive.
2.  in the advanced tab, under VARIABLES:
    a.  Set the RESPAWN TIME in the # of game hours you wish to
        have pass BEFORE a creature can possibly respawn.  This
        DEFAULTS AT 2 HOURS, and SHOULD NOT BE SET HIGHER THAN 12 Hours.
        If you set this to 0, your creature can respawn IMMEDIATELY
        when a PC enters the area.

    b.  Set the SPAWN ACTION: (default 0)
        SPAWN ACTION = 1:  The creature will hunt down and
        attack PC's.
        SPAWN ACTION = 2:  The creature will walk randomly.
        Any other value will cause the creature to follow the
        script in your onSpawn hook for it.  In other words,
        it'll probably just sit there unless you modified that script.
    c.  SPAWN COUNT:  Set this to however many creatures you want
        to spawn at that point.  Remember though, they will all be
        the same creature.  So don't try to spawn an entire town
        from one point (or it'll look like you just entered
        Clonesville).

CREATING PLACEABLE SPAWNS
Select the PLACEABLE SPAWN waypoint from the custom waypoints.
Place it in your area.  Go into it's properties and change the
following information...
1.  WAYPOINT NAME: must be the RESREF of the placeable, not the tag,
    and it is case sensitive.
2.  in the advanced tab, under VARIABLES:
    a.  Set the RESPAWN TIME in the # of game hours you wish
        to have pass BEFORE a creature can possibly respawn.
        This DEFAULTS AT 2 HOURS, and SHOULD NOT BE SET HIGHER
        THAN 12 Hours.  If you set this to 0, your placeable
        can respawn IMMEDIATELY.

CREATING ITEM SPAWNS
Select the ITEM SPAWN waypoint from the custom waypoints.
Place it in your area.  Go into it's properties and change the
following information...
1.  WAYPOINT NAME: must be the RESREF of the placeable, not the tag,
    and it is case sensitive.
2.  in the advanced tab, under VARIABLES:
    a.  Set the RESPAWN TIME in the # of game hours you wish
        to have pass BEFORE a creature can possibly respawn.
        This DEFAULTS AT 2 HOURS, and SHOULD NOT BE SET HIGHER
        THAN 12 Hours.  If you set this to 0, your placeable
        can respawn IMMEDIATELY.
NOTE ABOUT SPAWNS FOR STACKED ITEMS:
I haven't tried spawning a stack yet, but you should be able to
do so.  For example, if you wanted to spawn a stack of 5 gems;
1.  Edit a copy of the gem from the palette
2.  Set the stack size to whatever you wish
3.  Save it.
4.  Call up the item using the new resref and you should get
    the appropriate stacked amount of the item.
**  Creating several preset stacks of items, like gold or gems
    might be the easiest way to manage spawning in stacked items.

PLACING WAYPOINTS

1.  Creature Waypoints:  Creatures will spawn facing the same
direction as the three points of the waypoint marker.

2.  Placeable Waypoints:  Placeables will spawn facing the
same direction as the two points of the waypoint marker.

In other words, in both cases, the placeable or creature will
spawn facing in the same direction as the side of the waypoint
marker with the MOST POINTS.


RANDOM ONE-LINER CONVERSATIONS

In order to use this system, you must CREATE a creature or EDIT
a copy of one.  Quite simply, you could take any creature, and
in it's CONVERSATION box, just select the script re_cv_commoner.
You can edit this file to create your own one liners, just save
it under a different name, and apply then put that new file in
the conversation box of whatever creatures you want it to go into.
The system will pick a random one-liner for that creature to say.
That creature will always say ONLY that one-liner.

Some important points to remember if you edit the conversations...
1.  Under the Current File Tab
    a.  Be sure to check the "Stop Camera Zoom In" box
    b.  If you want to use this dialogue for creatures that
        are walking waypoints or wandering, put the script
        called bpw_walk in the Normal box and the Aborted box.
        (Great for townsfolk - it makes them continue along their
        waypoint path or keep wandering - sort of like they say
        their greeting in passing).
2.  The re_sc_dialogue# (# being 1 thru 10) scripts are required
    to fire the one liners.  You can add to them if you want, but
    don't delete them (e.g., re_sc_dialogue1 fires the one liner
    you see in the 1st node of the editor.  You could always make
    this a "hostile" remark, and add code to make the creature
    attack when he says it.  But remember, it will do that for
    EVERY conversation file you edit off the original).

The credit for the creation of the actual conversation scripts
goes to Ray Miller.  I took them from his BESIE spawn system.

THE LOOT STORE

When an area is cleaned up, all items (things you can put in your
inventory) will be either destroyed or sent to a special store.
The store I have included is empty, and only for one reason.  I
created it so that it could be used as a way for you to put a
"dungeon" or "street scrounger" in your areas.

Here are some ideas for implementing this...
You have a city made up of several areas (could be different
districts like the slums, royal, merchant, etc...)  PC's, villains,
etc... always leave things behind on the ground.  You could have
something like a shopping cart lady in the slums, who essentially
picks stuff up and sells it, or a shifty character in a different
district that does the same thing.

To use this, all you need to do is create a store, and when you
get to the part where it asks you to "choose store", go into
the custom tab / Special / Custom1, and select the store called
"lootstore".  Then finish up your store.  You can add default
items to it's inventory if you wish (the one I provide is empty).

This "shop" will then have any items that get "picked up" by the
shopkeeper IN THAT AREA ONLY, and you'll also see anything that
is sold to them by PC's (you can clean this up by adding your
own merchant cleanup script.  I suggest Merchant Clean v2.0 by
Snake - it works very well, uses only 2 scripts - one goes in the
store onopen, the other in the modules onacquire - and if you've
already got scripts in there, these integrate in very easily).
Oh, almost forgot, if you've edited the merchant to carry any
items specifically, those will be there as well.

Important things to remember about the loot stores...
1.  NEVER have more than 1 loot store per area.
2.  The TAG of the merchant object(the merchant waypoint, not
    the merchant creature) MUST be "lootstore" without the quotes
    and in all small letters.
If your loot store isn't working, it's probably one of those 2
things!


CLEANUP DETAILS

The Cleanup Scripts were completely created by
Johnnie "Nekyia" Casiano as part of his MP compatible cleanup
system.  I only modified them to fit my needs and the credit for
them is due to him.  Thanks for making a great set of scripts!

The modifications are all commented in so that you can find
them easily.  The only part that you may want to change, is the
amount of time from when a PC exits to when the area is cleaned.

The easiest way to do this is to go into your area's properties,
under the advanced tab, select variables.  Put in a new variable
called "Delay" (without the quotes), it should be of the "float"
type, and enter in the # of seconds you want.  It should look
like this...

variable    type    value
========    ====    =====
Delay       float   300.0

If you don't set this for an area, it will default to 180.0 seconds.
Here is what happens with that #.  The script gets a RANDOM # of
seconds from within the range of 0.0 to whatever the value of
Delay is.  So in most cases (where you leave it to default),
the script will get a random # of seconds between 0 and 180.0.
It'll count down those seconds, then go through all the objects in
your area, and anything that you DID NOT specifically plop down
in the toolset (except for items - which cleanup will remove)
(like creature loot bags, pc dropped items, spawned creatures
and placeables, etc...) and flag them as trash for cleaning.

Then, 30 seconds later, everything in that area, flagged as trash,
will be removed. You can set this longer or shorter, by changing
the value of "Purge" at the top of the bpw_gen_usr script.

In essence, what this all does (if you leave it at default) is
clean your area up anywhere from 30 to 210 seconds all pc's leave.
By having the cleanup happen randomly, less stress is placed on the
server resources.  The idea is that if players are going in and out
of areas all over the place, That the "random" aspect will spread
the cleanup activities out more evenly.

Some of you may be concerned with the possibility of a short
30 second cleanup time, but remember, if you leave your RESPAWN TIME
at the default of 2 game hours, just because the spawns were cleaned
up doesn't mean they'll respawn in 30 seconds!  It just means that
if the PC's left any treasure behind, it may not be there unless they
go back that quickly (and even in a fantasy world, how long would a
bag of loot last just lying around)!

Lastly, of course if ANY PC enters the area before a cleanup is
actually done, it is aborted.  So they will not see things
disappearing in front of their eyes.  It will be restarted after
they leave.

*/
