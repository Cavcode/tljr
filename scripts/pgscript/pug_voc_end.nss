#include "qx_leto_func"
#include "nwnx_creature"

void main()
{
    string sBadge = GetLocalString(GetPCSpeaker(), "SETBADGE");
    string sArmor = GetLocalString(GetPCSpeaker(), "SETARMOR");
    string sWeapon = GetLocalString(GetPCSpeaker(), "SETWEAPON");
    string sHat = GetLocalString(GetPCSpeaker(), "SETHAT");
    int nGold = GetLocalInt(GetPCSpeaker(), "SETGOLD");
    int nFaction = GetLocalInt(GetPCSpeaker(), "CHOICE");

    if (sWeapon == "84ublasterrif")
        {
        CreateItemOnObject("smallpowerpak", GetPCSpeaker(),99);
        }

    if (sWeapon == "cdefcarbine")
        {
        CreateItemOnObject("smallpowerpak", GetPCSpeaker(),99);
        }

    if (sWeapon == "sg4blastercar")
        {
        CreateItemOnObject("smallpowerpak", GetPCSpeaker(),99);
        }

    if (sWeapon == "c22flamecarbi")
        {
        CreateItemOnObject("smallpowerpak", GetPCSpeaker(),99);
        }

    if (sWeapon == "tc22blasterrifle")
        {
        CreateItemOnObject("smallpowercell", GetPCSpeaker(),99);
        }

    if (sWeapon == "dl18blaster")
        {
        CreateItemOnObject("smallpowercell", GetPCSpeaker(),99);
        }

    if (sWeapon == "scouttrooperbl")
        {
        CreateItemOnObject("smallpowercell", GetPCSpeaker(),99);
        }

    if (sWeapon == "bawe5droidbl")
        {
        CreateItemOnObject("smallpowercell", GetPCSpeaker(),99);
        }

    if (sWeapon == "dualdl18blast")
        {
        CreateItemOnObject("dualsmallpowerpa", GetPCSpeaker(),99);
        }

    if (sWeapon == "dualscouttroop")
        {
        CreateItemOnObject("dualsmallpowerpa", GetPCSpeaker(),99);
        }

    CreateItemOnObject(sWeapon, GetPCSpeaker());
    object oArmor = CreateItemOnObject(sArmor, GetPCSpeaker());
    CreateItemOnObject(sBadge, GetPCSpeaker());
    CreateItemOnObject(sHat, GetPCSpeaker());
    GiveGoldToCreature(GetPCSpeaker(), nGold);

    AssignCommand(GetPCSpeaker(), ActionEquipItem(oArmor, INVENTORY_SLOT_CHEST));

    if (sBadge == "sithsignetring")
        {
        CreateItemOnObject("stormtrooperbad", GetPCSpeaker());
        }

    if (nFaction == 1)
        {
        CreateItemOnObject("rebelallianceid", GetPCSpeaker());
        }
    if (nFaction == 2)
        {
        CreateItemOnObject("galaticempireid", GetPCSpeaker());
}
    if (nFaction == 3)
        {
        CreateItemOnObject("fringeid", GetPCSpeaker());
        }

object oOther = GetFirstPC();
object oPC = GetPCSpeaker();
string FACTION = GetTag(OBJECT_SELF);
int nCount;
/*
while (GetIsObjectValid(oOther)==TRUE)
    {
    if (GetIsObjectValid(GetItemPossessedBy(oOther, "RebelAllianceID"))==TRUE)
        {nCount=1;}
    if (GetIsObjectValid(GetItemPossessedBy(oOther, "GalaticEmpireID"))==TRUE)
        {nCount=2;}
    if (GetIsObjectValid(GetItemPossessedBy(oOther, "FringeID"))==TRUE)
        {nCount=3;}

    if (nFaction != nCount && nCount != 3 && nFaction!=3 && oOther!=oPC && GetIsDM(oOther)==FALSE)
        {
            SetPCDislike(oPC, oOther);
        }
    oOther = GetNextPC();
    }
    */
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "BountyHunterBadge"))==TRUE)
    {CreateItemOnObject("acontract", GetPCSpeaker());}
    AssignCommand(GetPCSpeaker(), ActionJumpToLocation(GetLocation(GetWaypointByTag("PUG_SPAWNDLES"))));

//Get rid of subrace skin unless gand then give one with +1 regen
// All subrace adjustments changed to use in memory char edits via nwnx_funcs
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    string sSubrace = GetSubRace(oPC);
    int iSubrace = GetSubRaceInt(sSubrace);
    int temp =0;
    switch (iSubrace){
        case 0: { break; }
        case 1: {
             //SetLocalInt(oPC, "Skill"   , SKILL_INTIMIDATE );
             //SetLocalInt(oPC, "SkillMod", 3);
             //SetLocalInt(oPC, "Save"   , SAVING_THROW_REFLEX    );
             //SetLocalInt(oPC, "SaveMod", -2                    );
             //SetLocalInt(oPC, "SaveTyp", SAVING_THROW_TYPE_ALL);
             NWNX_Creature_SetSkillRank(oPC, SKILL_INTIMIDATE, 3);
             temp = NWNX_Creature_GetBaseSavingThrow(oPC,SAVING_THROW_REFLEX);
             temp += -2;
             NWNX_Creature_SetBaseSavingThrow(oPC,SAVING_THROW_REFLEX, temp);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 2: {
             //SetLocalInt(oPC, "INT", 1);
             //SetLocalInt(oPC, "CON",-2);
             //SetLocalInt(oPC, "DEX", 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 1);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 3: {
             //SetLocalInt(oPC, "INT", 2);
             //SetLocalInt(oPC, "CON",  -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 4: {
             //SetLocalInt(oPC, "STR", 3);
             //SetLocalInt(oPC, "INT",-2);
             //SetLocalInt(oPC, "CHA",-2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_STRENGTH, 3);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 5: {
             //SetLocalInt(oPC, "STR", 1);
             //SetLocalInt(oPC, "DEX", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_STRENGTH, 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, -2);
             object oRace = CreateItemOnObject("subrace", oPC);
             AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyRegeneration(1), oRace);
             AssignCommand(oPC, ActionEquipItem(oRace, INVENTORY_SLOT_CARMOUR));
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 6: {
             //SetLocalInt(oPC, "INT", 2);
             //SetLocalInt(oPC, "CHA", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 7: {
             //SetLocalInt(oPC, "CON", 2);
             //SetLocalInt(oPC, "WIS", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 8: {
             //SetLocalInt(oPC, "DEX", 1);
             //SetLocalInt(oPC, "WIS", -1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, -1);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 9: {
             //SetLocalInt(oPC, "DEX", 1);
             //SetLocalInt(oPC, "CON", -1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -1);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 10: {
             //SetLocalInt(oPC, "DEX", -2);
             //SetLocalInt(oPC, "STR", 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_STRENGTH, 2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 11: {
             //SetLocalInt(oPC, "WIS", -2);
             //SetLocalInt(oPC, "CHA", 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, 2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 12: {
             //SetLocalInt(oPC, "WIS", -2);
             //SetLocalInt(oPC, "CHA", -2);
             //SetLocalInt(oPC, "CON", 3);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, 3);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 13: {
             //SetLocalInt(oPC, "INT", 2);
             //SetLocalInt(oPC, "CON", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 14: {
             //SetLocalInt(oPC, "DEX", 2);
             //SetLocalInt(oPC, "CON", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 15: {
             //SetLocalInt(oPC, "DEX", -2);
             //SetLocalInt(oPC, "WIS", 2);
             //SetLocalInt(oPC, "INT", 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 16: {
             //SetLocalInt(oPC, "DEX", -2);
             //SetLocalInt(oPC, "INT", 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_INTELLIGENCE, 2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 17: {
             //SetLocalInt(oPC, "DEX", 2);
             //SetLocalInt(oPC, "WIS", 2);
             //SetLocalInt(oPC, "CON", -2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_WISDOM, 2);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, -2);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 18: {
             //SetLocalInt(oPC, "CHA", -1);
             //SetLocalInt(oPC, "CON", 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, -1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CONSTITUTION, 1);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 19: {
             //SetLocalInt(oPC, "DEX", 1);
             //SetLocalInt(oPC, "CHA", -1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_DEXTERITY, 1);
             NWNX_Creature_ModifyRawAbilityScore(oPC, ABILITY_CHARISMA, -1);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }
       case 20: {
             //SetLocalInt(oPC, "Skill"   , SKILL_SPOT );
             //SetLocalInt(oPC, "SkillMod", -5);
             //SetLocalInt(oPC, "Skill2"   , SKILL_LISTEN );
             //SetLocalInt(oPC, "SkillMod2", 5);
             NWNX_Creature_SetSkillRank(oPC, SKILL_SPOT, -5);
             NWNX_Creature_SetSkillRank(oPC, SKILL_LISTEN, 5);
             SendMessageToPC(oPC,"You have chosen race" + IntToString(iSubrace));
             //SetPermaSubRace(oPC);
             break;
        }

    }

}
