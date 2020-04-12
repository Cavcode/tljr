#include "pug_inc"
void main()
{
string sResRef, sTag;
int nMission = Random(2);
int nLocate = 0;
int nBase = 3;
string sLocation, sPlace, sName;
string sMsg = GetLocalString(OBJECT_SELF, "MISSION_MESSAGE");

if(GetLocalInt(OBJECT_SELF, "MISSION_ISSUED") == FALSE)
    {
    while (nBase != FALSE)
        {
        nLocate = Random(8)+1;
        if (nLocate == 1){sPlace = "bespinn"; sLocation = "Bespin"; nBase=TRUE;}
        else if (nLocate == 2){sPlace = "ceereea"; sLocation = "Cerea"; nBase=TRUE;}
        else if (nLocate == 3){sPlace = "corelia"; sLocation = "Corellia"; nBase=TRUE;}
        else if (nLocate == 4){sPlace = "iridnia"; sLocation = "Iridonia"; nBase=TRUE;}
        else if (nLocate == 5){sPlace = "naboooo"; sLocation = "Naboo"; nBase=FALSE;}
        else if (nLocate == 6){sPlace = "Tatooine"; sLocation = "Tatooine"; nBase=FALSE;}
        else if (nLocate == 7){sPlace = "NarShaddaa"; sLocation = "Nar Shaddaa"; nBase=FALSE;}
        else if (nLocate == 8){sPlace = "corulag"; sLocation = "Corulag"; nBase=TRUE;}

        if (GetFaction(GetPCSpeaker(), FALSE) == GetCampaignString("starwars", sPlace+"_CONTROL") && nLocate !=0 && nBase == TRUE)
            {
            nBase = FALSE;
            }

        }

    if (nMission <= 0)
        {
        sResRef = "negotiator";
        sName = GenerateMaleName()+" "+GenerateLastName();
        sTag = GetTag(OBJECT_SELF)+"_nego";
        sMsg = "As a matter of fact, there is an Ambassador named "+sName+" from "+sLocation+" who is requesting an audience with us on his home planet. He wishes to settle a trade deal that will benefit us all. Go to him at "+GetName(GetArea(GetWaypointByTag("DIPLO_"+sPlace)))+" and settle a deal. If you are able to negotiate a higher amount than he is offering us, I will give you a 4% cut of the difference.";
        }
    else if (nMission >= 1)
        {
        sResRef = "dpl_bntyman";
        sName = GenerateMaleName()+" "+GenerateLastName();
        sTag = GetTag(OBJECT_SELF)+"_bounty";
        sMsg = "Actually, there is. It is a simple task, but it is an important one. I hired a Bounty Hunter named "+sName+" to do some private work for me. He completed his mission, but not without some problems. Since I can not be seen meeting with a Bounty Hunter, I need you to meet with him and see if you can convince him to accept a lower price, I will be happy to award your efforts. I have arranged for him to meet you at "+GetName(GetArea(GetWaypointByTag("DIPLO_"+sPlace)))+". Go there and settle this.";
        }
    object oMan = CreateObject(OBJECT_TYPE_CREATURE, sResRef, GetLocation(GetWaypointByTag("DIPLO_"+sPlace)), FALSE, sTag);
    SetLocalString(GetPCSpeaker(), "DIPLO_MISSION", sTag);
    int y = Random(99)+1;
    if (y>49){y=y+49;}
    SetCreatureBodyPart(CREATURE_PART_HEAD, y, oMan);
    SetName(oMan, sName);
    SetLocalString(oMan, "NEGOTIATION_LOCATION", sLocation);
    SetLocalInt(OBJECT_SELF, "MISSION_ISSUED", TRUE);
    SetLocalString(OBJECT_SELF, "MISSION_MESSAGE", sMsg);
    SetLocalObject(OBJECT_SELF, "MISSION_MAN", oMan);
    }
SetCustomToken(9009334, sMsg);

}
