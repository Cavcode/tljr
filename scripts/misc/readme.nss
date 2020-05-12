// RiffRaff's Item Set System

// ********************************************************************************
// PURPOSE: What is an item set? An item set is a group of items that alone are weak,
//          but combined together they become very strong. Example: Let's say you are
//          a paladin and you are seeking ancient artifacts. A +2 Sword of Paladine, a
//          +2 Shield of Aegis, and a +2 Cloak of Lawfulness. If these items are used
//          alone individually, they are all +2. If you have the sword and the shield,
//          they are both +3 and if you have all 3, they are all +4 each.

// INSTALL: ***********************************************************************
// Import the rr_itemsets script into your module

// CONFIG: ************************************************************************

// 1) Choose a 2 letter designation for your item set. I chose "sa" for my "Shadow
//    Assassins" item set. It could be "aa" for "Angel Avengers" or "dd" for "Drunk
//    Dwarves". The important part is that you choose a two letter code for your
//    item set and stick with it.

// 2) Create a config file that has this two letter code as it's 4th and 5th character.
//    Examples: jj_aa, ad_aa, rr_dd (it's best to open the example
//    "rr_sa" file and "save as" your own config file)
//    *** IMPORTANT! *** Each item you make must have a tag matching the name
//    of your config file!!!

// 3) The 3rd line of the config file has this:
//    const string ITEM_SET = "sa";
//    Change it to your two letter code "aa" / "dd" / etc.

// 4) Lines 5-14 have a listing of every type of item in the set. For organizational
//    purposes, I would highly recommend following this format so you can always
//    remember what items you have in your set.

// 5) Go down to where the switch/case statements are. Here you will see a listing
//    of each possible slot available for your item set. Here you can see that I've
//    added powers to certain items in the set. This is where the meat of the system
//    is. I can't really fully explain what you need to do here because it depends
//    on which powers you want on which item with how many items the player has aquired.
//    Play around with it, it's actually pretty easy to catch on to.

//    Example: Belt that gives bonus to the hide skill.
//    AddPower(ITEM_PROPERTY_SKILL_BONUS, oPC, oItem, 1, 2, 5, 10, 15, 20, 25, 25, 25, 25, 25, 25, 25, SKILL_HIDE);
//    Explanation: With only 1 item, you get 1 skill point, with 2 you get 2 points,
//                 with three set items you get 5 skill points. With 4 set items
//                 you get 10 skill points and so on

//    Example: Regeneration Cloak.
//    AddPower(ITEM_PROPERTY_REGENERATION, oPC, oItem, 0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 0);
//    Explanation: With only 1, 2, 3, or 4 set items, you get no regen
//                 With 5 or 6 set items you get regen +1
//                 With 7 or 8 set items, you get regen +2 and so on

//    The usable functions are:
//    AddPower
//    AddPowerToPC
//    AddAuraToPC

//    You can use the functions as many times as you want, just not 2 auras on
//    one item set.

// 6) Make all of the items, just make sure their tags match up with the name of
//    the config file from step 2) You can make the items plain, or you can add
//    normal properties to them (maybe they should be useful even if not used
//    with other items of the set.)

