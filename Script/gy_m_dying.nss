//::///////////////////////////////////////////////
//:: Dying Script
//:: NW_O0_DEATH.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script handles the default behavior
    that occurs when a player is dying.
    DEFAULT CAMPAIGN: player dies automatically
*/
//:://////////////////////////////////////////////
//:: Created By: Brent Knowles
//:: Created On: November 6, 2001
//:://////////////////////////////////////////////


void main()
{
/*    AssignCommand(GetLastPlayerDying(), ClearAllActions());
    AssignCommand(GetLastPlayerDying(),SpeakString( "I Dying"));
    PopUpGUIPanel(GetLastPlayerDying(),GUI_PANEL_PLAYER_DEATH);
*/
// * April 14 2002: Hiding the death part from player
    object oPlayer = GetLastPlayerDying() ;
    //ExecuteScript("getpvp",oPlayer);
    effect eDeath = EffectDeath(FALSE, FALSE);
    //DelayCommand(5.0,   ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath,oPlayer ));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath,oPlayer );
}
