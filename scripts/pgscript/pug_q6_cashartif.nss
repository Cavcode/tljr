void main()
{

    // Remove items from the player's inventory
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "pug_artifact");
    if(GetIsObjectValid(oItemToTake) != 0)
        {
        DestroyObject(oItemToTake);
        // Give the speaker some gold
        GiveGoldToCreature(GetPCSpeaker(), 500);

        // Give the speaker some XP
        GiveXPToCreature(GetPCSpeaker(), 100);
        }


}
