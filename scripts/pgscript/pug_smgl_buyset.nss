void main()
{
object oPC = GetPCSpeaker();
int nLevel = GetHitDice(oPC);
int nBuy = d3(1);
int nGood = d100(1);
string sBuyer, sPlanet, sGood;
int nPrice, nItem, xBuy, yBuy;
int ySell = GetLocalInt(OBJECT_SELF, "SMUGGLE_Y");
int xSell = GetLocalInt(OBJECT_SELF, "SMUGGLE_X");

    sBuyer = GetLocalString(OBJECT_SELF, "SMUGGLE_BUYER");
    sPlanet = GetLocalString(OBJECT_SELF, "SMUGGLE_PLANET");

    if (nLevel < 15 && nGood < 51)
        {
        sGood = "Andris";
        nItem = 1;                        //level 10 to 14
        }
    else if (nLevel < 15 && nGood > 50)
        {
        sGood = "Crash n' Burn";
        nItem = 1;
        }
    else if (nLevel > 14 && nLevel < 20) //level 15 to 19
        {
        if (nGood<21)
            {
            sGood = "Crash n' Burn";
            nItem = 1;
            }
        else if (nGood>20 && nGood < 41)
            {
            sGood = "Andris";
            nItem = 1;
            }
        else if (nGood>40 && nGood < 71)
            {
            sGood = "Ryll";
            nItem = 2;
            }
        else if (nGood>70)
            {
            sGood = "Giggledust";
            nItem = 2;
            }
        }
    else if (nLevel > 19 && nLevel < 25)   //level 20 to 24
        {
        if (nGood<6)
            {
            sGood = "Crash n' Burn";
            nItem = 1;
            }
        else if (nGood>5 && nGood<11)
            {
            sGood = "Andris";
            nItem = 1;
            }
        else if (nGood>10 && nGood<26)
            {
            sGood = "Ryll";
            nItem = 2;
            }
        else if (nGood>25 && nGood<41)
            {
            sGood = "Giggledust";
            nItem = 2;
            }
        else if (nGood>40 && nGood<71)
            {
            sGood = "Booster Blue";
            nItem = 3;
            }
        else if (nGood>70)
            {
            sGood = "Glitterstim";
            nItem = 3;
            }
        }
    else if (nLevel > 24 && nLevel < 30)   //level 25 to 29
        {
        if (nGood<6)
            {
            sGood = "Ryll";
            nItem = 2;
            }
        else if (nGood>5 && nGood<11)
            {
            sGood = "Giggledust";
            nItem = 2;
            }
        else if (nGood>10 && nGood<26)
            {
            sGood = "Booster Blue";
            nItem = 3;
            }
        else if (nGood>25 && nGood<41)
            {
            sGood = "Glitterstim";
            nItem = 3;
            }
        else if (nGood>40)
            {
            sGood = "Carsunum";
            nItem = 4;
            }
        }
    else if (nLevel > 29)   //level 30
        {
        if (nGood<6)
            {
            sGood = "Booster Blue";
            nItem = 3;
            }
        else if (nGood>5 && nGood<11)
            {
            sGood = "Glitterstim";
            nItem = 3;
            }
        else if (nGood>10 && nGood<41)
            {
            sGood = "Carsunum";
            nItem = 4;
            }
        else if (nGood>40)
            {
            sGood = "Lumni";
            nItem = 5;
            }
        }
if (sBuyer == "")
    {
    if (nBuy == 1)
        {
        sBuyer = "Jabba the Hutt's assistant, Bib Fortuna";
        sPlanet = "Tatooine"; xBuy = 5; yBuy = 5;
        }
    else if (nBuy == 2)
        {
        sBuyer = "Durga the Hutt";
        sPlanet = "Korriban"; xBuy = 8; yBuy = 1;
        }
    else if (nBuy == 3)
        {
        sBuyer = "Vekker";
        sPlanet = "Naboo"; xBuy = 4; yBuy = 5;
        }
    SetLocalString(OBJECT_SELF, "SMUGGLE_BUYER", sBuyer);
    SetLocalString(OBJECT_SELF, "SMUGGLE_PLANET", sPlanet);
    }
    nPrice = 350*(abs(xBuy - xSell) + abs(yBuy - ySell)-1)+100*nItem*nItem;

    SetLocalString(oPC, "SMUGGLE_BUYER", sBuyer);
    SetLocalString(oPC, "SMUGGLE_PLANET", sPlanet);
    SetLocalString(oPC, "SMUGGLE_GOOD", sGood);
    SetLocalInt(oPC, "SMUGGLE_ITEM", nItem);

    SetLocalString(oPC, "SMUGGLE_STOP", GetTag(OBJECT_SELF));

    ExecuteScript("pug_smgl_uncncl", oPC);

SetCustomToken(432331, "I need you to deliver a package of "+sGood+" to "+sBuyer+" on "+sPlanet+". You will receive "+IntToString(nPrice)+" upon the succesful delivery of this package. Due to its illicit nature, you may attract some unwanted company. Defend the package with your life. If you drop the package, you will probably not attract anymore attention, but the intended recipient will not be pleased and it's best not to make too many enemies.");
}
