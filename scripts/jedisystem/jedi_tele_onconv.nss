#include "jedi_functions"

object SearchPCByName(string sName);


void main()
{
    object oPC = GetLocalObject(OBJECT_SELF,TELEPATHIE_PJ);
    object oSpeaker = GetLastSpeaker();
    if(GetIsObjectValid(oPC) && oSpeaker == oPC) {
        int nMatch = GetListenPatternNumber();
        if(nMatch == PATTERN_LISTEN_TELEKINESIE) {
            int nCount = GetMatchedSubstringsCount();
            string sMessage = GetMatchedSubstring(nCount - 1);
            // recherche de la cible
            if(!GetIsObjectValid(GetLocalObject(OBJECT_SELF,TELEPATHIE_CIBLE))) {
                object oTarget = SearchPCByName(sMessage);
                if(!GetIsObjectValid(oTarget)) {
                    SendMessageToPC(oPC,"Telekinesis Failed: Target Invalid");
                } else {
                    SendMessageToPC(oPC,"You are communing with: "+GetName(oTarget) + " through the Force.");
                    SetLocalObject(OBJECT_SELF,TELEPATHIE_CIBLE,oTarget);
                }
            // envoie de message
            } else {
                object oTarget = GetLocalObject(OBJECT_SELF,TELEPATHIE_CIBLE);
                SendMessageToPC(oPC,"You have sent the following message via Telekinesis: "+sMessage);
                SendMessageToPC(oTarget,"You hear a voice in your head: "+sMessage);
            }
        }
    }
}

object SearchPCByName(string sName) {
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC)) {
        if(GetName(oPC) == sName) {
            return oPC;
        }
        oPC = GetNextPC();
    }
    return OBJECT_INVALID;
}
