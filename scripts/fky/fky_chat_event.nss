//::////////////////////////////////////////////////////////////////////////:://
//:: SIMTools V3.0 Speech Integration & Management Tools Version 3.0        :://
//:: Created By: FunkySwerve                                                :://
//:: Created On: April 4 2006                                               :://
//:: Last Updated: March 27 2007                                            :://
//:: With Thanks To:                                                        :://
//:: Dumbo - for his amazing plugin                                         :://
//:: Virusman - for Linux versions, and for the reset plugin, and for       :://
//::    his excellent events plugin, without which this update would not    :://
//::    be possible                                                         :://
//:: Dazzle - for his script samples                                        :://
//:: Butch - for the emote wand scripts                                     :://
//:: The DMFI project - for the languages conversions and many of the emotes:://
//:: Lanessar and the players of the Myth Drannor PW - for the new languages:://
//:: The players and DMs of Higher Ground for their input and playtesting   :://
//::////////////////////////////////////////////////////////////////////////:://
//This script is only used by Linux users, to tell what conversation node was selected in the popup menus.
//The other events shown will work with the Linux version but are commented out
const int EVENT_SAVE_CHAR = 1;
const int EVENT_PICKPOCKET = 2;
const int EVENT_ATTACK = 3;
const int EVENT_USE_ITEM = 4;
const int EVENT_CONVERSATION_NODE_SELECT = 5;

#include "fky_chat_instant"

void main()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETEVENTID", "      ");
    int nEventType = StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETEVENTID"));
    WriteTimestampedLogEntry("NWNX Event fired: "+IntToString(nEventType)+", '"+GetName(OBJECT_SELF)+"'");
    object oPC, oTarget, oItem;
    switch(nEventType)
    {
        //case EVENT_PICKPOCKET:
            //oPC = OBJECT_SELF;
            //oTarget = GetLocalObject(OBJECT_SELF, "NWNX!EVENTS!TARGET");
            //WriteTimestampedLogEntry(GetName(oPC)+" tried to steal from "+GetName(oTarget));
            //break;
        //case EVENT_ATTACK:
            //oPC = OBJECT_SELF;
            //oTarget = GetLocalObject(OBJECT_SELF, "NWNX!EVENTS!TARGET");
            //WriteTimestampedLogEntry(GetName(oPC)+" attacked "+GetName(oTarget));
            //break;
        //case EVENT_USE_ITEM:
            //oPC = OBJECT_SELF;
            //oTarget = GetLocalObject(OBJECT_SELF, "NWNX!EVENTS!TARGET");
            //oItem = GetLocalObject(OBJECT_SELF, "NWNX!EVENTS!ITEM");
            //WriteTimestampedLogEntry(GetName(oPC)+" used item '"+GetName(oItem)+"' on "+GetName(oTarget));
            //AssignCommand(GetFirstPC(), SpeakString("Target: "+ GetName(oTarget) + "; Item: " +GetName(oItem)));
            /*if(d2()==1)
            {
                SetLocalString(OBJECT_SELF, "NWNX!EVENTS!BYPASS", "1");
                WriteTimestampedLogEntry("The action was cancelled");
            }*/
            //if (GetLocalInt(oItem, "FKY_CHAT_INSTANT"))
            //{
                //SetLocalString(OBJECT_SELF, "NWNX!EVENTS!BYPASS", "1");
                //AssignCommand(oPC, DoInstantUse(oPC, oTarget, oItem));
            //}
            //break;
        case EVENT_CONVERSATION_NODE_SELECT:
            oPC = OBJECT_SELF;
            oTarget = GetLocalObject(OBJECT_SELF, "NWNX!EVENTS!TARGET");
            SetLocalString(OBJECT_SELF, "NWNX!EVENTS!SELECTEDNODE", "      ");
            int nSelectedNode = StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!SELECTEDNODE"));
            //WriteTimestampedLogEntry(GetName(oPC)+" selected node #"+IntToString(nSelectedNode)+" in conversation with "+GetName(oTarget));
            //AssignCommand(oPC, SpeakString(IntToString(nSelectedNode)));
            break;
    }
}
