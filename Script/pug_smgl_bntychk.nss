void main()
{
object oPC = GetEnteringObject();
string sBountyHunter = "none";
string sMessage, sName;
int nJabba = GetCampaignInt("starwars", "REPUTATION_Jabba", oPC);
int nDurga = GetCampaignInt("starwars", "REPUTATION_Durga", oPC);
int nVekker = GetCampaignInt("starwars", "REPUTATION_Vekke", oPC);

if (nVekker < 0)
    {
    if (abs(nVekker) >= Random(50))
        {
        sName = "Vekker";
        sBountyHunter = "bountyhunter_vekke_1";
        }
    }
if (nDurga < 0)
    {
    if (abs(nDurga) >= Random(50))
        {
        sName = "Durga the Hutt";
        sBountyHunter = "bountyhunter_durga_1";
        }
    }
if (nJabba < 0)
    {
    if (abs(nJabba) >= Random(50))
        {
        sName = "Jabba";
        sBountyHunter = "bountyhunter_jabba_1";
        }
    }
if (sName != "")
    {
    int x = d6(1);
    if (x == 1){sMessage = sName+" is displeased with you, now you will pay with your life!";}
    else if (x == 2){sMessage = GetName(oPC)+", I am going to collect the bounty that "+sName+" has placed on your head";}
    else if (x == 3){sMessage = "You are "+GetName(oPC)+", the one that "+sName+" has a bounty on! Prepare to die!";}
    else if (x == 4){sMessage = "You've messed up too many times. Now "+sName+" wants you dead and I'm the one who will make that happen!";}
    else if (x == 5){sMessage = GetName(oPC)+"! "+sName+" has sent me to kill you.";}
    else if (x == 6){sMessage = sName+" says its time for you to die!";}
    }
}
