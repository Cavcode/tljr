
void DestroyRockets(object oPC, int nCount);

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{

/*
  Spellcast Hook Code
  Added 2003-06-20 by Georg
  If you want to make changes to all spells,
  check x2_inc_spellhook.nss to find out more

*/



    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }

// End of Spell Cast Hook
    object oCaster = OBJECT_SELF;
    int nLevel = GetLevelByClass(44, oCaster); // Get BountyHunter Levels
    int nCount = GetNumItems(oCaster, "wristrocket1");

    // Set number of dmg dice
    if (nLevel >= 20)
    {
        nLevel = 6;
    }
    else if (nLevel >= 16)
    {
        nLevel = 5;
    }
    else if (nLevel >= 12)
    {
        nLevel = 4;
    }
    else if (nLevel >= 8)
    {
        nLevel = 3;
    }
    else if (nLevel >= 4)
    {
        nLevel = 2;
    }
    else
    {
        nLevel = 1;
    }

    SendMessageToPC(oCaster, "total Missiles: " + IntToString(nCount));

    if (nCount <= 0)
    {
        SendMessageToPC(oCaster, "Your wrist launcher clicks and you realize it's not loaded");
    }
    else if (nCount >= 15)
    {
        SendMessageToPC(oCaster, "actual fired Missiles: " + IntToString(nCount));
        nCount = 15;
        DoMissileStorm(nLevel, nCount, SPELL_ISAACS_LESSER_MISSILE_STORM);
        DestroyRockets(oCaster,nCount);
    }
    else
    {
        SendMessageToPC(oCaster, "actual fired Missiles: " + IntToString(nCount));
        DoMissileStorm(nLevel, nCount, SPELL_ISAACS_LESSER_MISSILE_STORM);
        DestroyRockets(oCaster,nCount);
    }

}

void DestroyRockets(object oPC, int nCount)
{
    int x = 0;
    object oRocket = GetFirstItemInInventory(oPC);

    while (x < nCount)
    {
        if (GetTag(oRocket) == "wristrocket1")
        {
            SendMessageToPC(oPC, "x: " + IntToString(x));
            DestroyObject(oRocket);
            x += 1;
        }
        oRocket = GetNextItemInInventory(oPC);
        //oRocket =  GetItemPossessedBy(oPC, "wristrocket1");
    }
}
