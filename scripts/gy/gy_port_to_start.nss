//Ontransistion click,  takes to one of 3 locations based on id

#include "gy_base_inc"

// jumps pc to first object with tag sTag
void JumpPlayer(object oPC,string sTag);


void main()
{
    object oPC = GetClickingObject();
     ExecuteScript("pug_fac_set",oPC);
     if (HasItem(oPC,sEmpireSithIDTag))
    {
        JumpPlayer(oPC,sSithStartTag);
    }
    else if (HasItem(oPC,sEmpireStormtrooperIDTag))
    {
        JumpPlayer(oPC,sStormtrooperStartTag);
    }
    else if (HasItem(oPC,sFringeTraderIDTag))
    {
        JumpPlayer(oPC,sTraderStartTag);
    }
    else if (HasItem(oPC,sFringeBountyHunterIDTag))
    {
        JumpPlayer(oPC,sBountyHunterStartTag);
    }
    else if (HasItem(oPC,sRebelSoldierIDTag))
    {
        JumpPlayer(oPC,sRebelStartTag);
    }
   // else if (HasItem(oPC,sFringeTraderIDTag))
    //{
    //    JumpPlayer(oPC,sTraderStartTag);
    //}
    else if (HasItem(oPC,sFringeIDTag))
    {
        JumpPlayer(oPC,sSpacerStartTag);
    }
    else if (HasItem(oPC,sEmpireCivilianIDTag))
    {
        JumpPlayer(oPC,sCivilianStartTag);
    }
    else
    {
     FloatingTextStringOnCreature(sNoJumpIDfound,oPC);
     AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("PUG_GREETER"))));
    }
}

void JumpPlayer(object oPC,string sTag)
{
    object oJumpTo = GetObjectByTag(sTag);
    location lLoc = GetLocation(oJumpTo);
    AssignCommand (oPC, JumpToLocation (lLoc));
}
