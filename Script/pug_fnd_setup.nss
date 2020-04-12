void main()
{

string sItem = GetLocalString(OBJECT_SELF, "WANTED");
string sName = GetLocalString(OBJECT_SELF, "NAME");

if (sItem == "")
    {
    int nRandom = Random(6);
    switch (nRandom)
        {
        case 0: sItem = "KathHoundTooth";
                sName = "Kath Hound Tooth";
                break;
        case 1: sItem = "RancorSkull";
                sName = "Rancor Skull";
                break;
        case 2: sItem = "IriazHide";
                sName = "Iriaz Hide";
                break;
        case 3: sItem = "HssissSkull";
                sName = "Hssiss Skull";
                break;
        case 4: sItem = "CrystalScale";
                sName = "Crystal Scale";
                break;
        case 5: sItem = "RakghoulClaw";
                sName = "Rakghoul Claw";
                break;
        case 6: sItem = "WampaHorn";
                sName = "Wampa Horn";
                break;
        default:sItem = "KathHoundTooth";
                sName = "Kath Hound Tooth";
                break;
        }
    SetLocalString(OBJECT_SELF, "WANTED", sItem);
    SetLocalString(OBJECT_SELF, "NAME", sName);
    }

SetCustomToken(213201, "I'm looking for a "+sName+". If you bring me one I will pay you well. However, I will only pay the first person to bring me it.");
}
