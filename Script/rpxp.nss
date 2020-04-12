
const string ROLEPLAY_XP_COUNTER = "RPXP_Count";
const string ROLEPLAY_XP_LAST_SPEAKER = "RPXP_LastSpeaker";
const int ROLEPLAY_XP_LISTEN_PATTERN_ID = 100;
const int XP_RP_MODIFIER = 500;

//void main(){}

// Run upon entering the module.
void SetPCListening(object oPC)
{
    SetListening(oPC, TRUE);
    // Sets PC to listen for anything.
    SetListenPattern(oPC, "**", ROLEPLAY_XP_LISTEN_PATTERN_ID);
}


// Run in the nw_g0_conversat script. This is the default OnConversation script for all creatures and PCs for when no other is specified.
// Pass the result of "GetLastSpeaker()" as oPCWhoSpoke.
void HandlePCListen(object oPCWhoSpoke)
{
    if(GetListenPatternNumber()!= ROLEPLAY_XP_LISTEN_PATTERN_ID)
    {
        return;
    }
    // If either we or oPCWhoSpoke aren't a PC, abort.
    if (!(GetIsPC(oPCWhoSpoke)||GetIsPossessedFamiliar(oPCWhoSpoke))
                || !(GetIsPC(OBJECT_SELF)||GetIsPossessedFamiliar(OBJECT_SELF)))
    {
        return;
    }

    if(GetIsDM(oPCWhoSpoke)||GetIsDMPossessed(oPCWhoSpoke))
    {
        return;
    }

    // Don't hand out RP XP in OOC areas.
    if(GetStringLeft(GetName(GetArea(OBJECT_SELF)),3)=="OOC")
    {
        return;
    }

    string sSpoken=GetMatchedSubstring(0);
    {
        string sLeft=GetStringLeft(sSpoken,1);
        while(sLeft==" ")
        {
            // Remove leading whitespaces.
            sLeft=GetSubString(sSpoken, 1, -1);
        }
        if(sLeft=="@" || sLeft=="<" || sLeft=="/")
        {
            // Filter out OOC text and commands.
            return;
        }

        DeleteLocalInt(OBJECT_SELF,ROLEPLAY_XP_LAST_SPEAKER);
        // Only apply if oPCWhoSpoke was not the speaker of the last two messages.
        if(GetLocalInt(oPCWhoSpoke, ROLEPLAY_XP_LAST_SPEAKER)<2)
        {

            SetLocalInt(oPCWhoSpoke, ROLEPLAY_XP_COUNTER, GetLocalInt(oPCWhoSpoke, ROLEPLAY_XP_COUNTER) + GetStringLength(sSpoken)); //increase line count
            SetLocalInt(oPCWhoSpoke, ROLEPLAY_XP_LAST_SPEAKER, GetLocalInt(oPCWhoSpoke, ROLEPLAY_XP_LAST_SPEAKER)+5);
        }
    }
}

// Run for all online PCs once every IG hour (6 minutes on PotM)
void GiveRPXP(object oPC)
{

    object oArea=GetArea(oPC);
    if(!GetIsObjectValid(oPC))
    {
        //Could have logged off.
        return;
    }
    if(!GetIsObjectValid(oArea))
    {
        //Transitioning, retry in one round.
        DelayCommand(RoundsToSeconds(1), GiveRPXP(oPC));
    }
    if(GetLocalInt(oPC, ROLEPLAY_XP_COUNTER)>=15)
    {
        SendMessageToPC(oPC, "Progression by roleplay...");
        GiveXPToCreature(oPC, XP_RP_MODIFIER);
        SetLocalInt(oPC, ROLEPLAY_XP_COUNTER, 0);
    }
}


