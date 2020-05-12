void CalculatePoints(string sPlanet);

void ApplyPoints()
{
CalculatePoints("rhenvar");
CalculatePoints("corelia");
CalculatePoints("ceereea");
CalculatePoints("iridnia");
CalculatePoints("bespinn");
CalculatePoints("corulag");
}
//void main(){}
void CalculatePoints(string sPlanet)
{
    string sControl = GetCampaignString("starwars", sPlanet+"_CONTROL");
    string sControl1 = GetCampaignString("starwars", sPlanet+"_1_CONTROL");
    string sControl2 = GetCampaignString("starwars", sPlanet+"_2_CONTROL");
    string sControl3 = GetCampaignString("starwars", sPlanet+"_3_CONTROL");
    int nRebelPoints = 0;//GetCampaignInt("starwars", "POINTS_Rebels");
    int nEmpirePoints = 0;//GetCampaignInt("starwars", "POINTS_Empire");
    int nStartHour = GetCampaignInt("starwars", "POINTS_HOUR_"+sPlanet);
    int nStartDay = GetCampaignInt("starwars", "POINTS_DAY_"+sPlanet);
    int nStartMonth = GetCampaignInt("starwars", "POINTS_MONTH_"+sPlanet);
    int nHour = GetTimeHour();
    int nDay = GetCalendarDay();
    int nMonth = GetCalendarMonth();
    int nTime = (nHour-nStartHour) +  ((nDay-nStartDay) + (nMonth-nStartMonth)*28)*24;
    int nBonus = nTime/3;

    /*if (nHour == 0 && nDay == 1 && nMonth ==1)
        {
        SetCampaignInt("starwars", "POINTS_HOUR_"+sPlanet, nHour);
        SetCampaignInt("starwars", "POINTS_DAY_"+sPlanet, nDay);
        SetCampaignInt("starwars", "POINTS_MONTH_"+sPlanet, nMonth);
        }

    else */if (nBonus > 0)
        {
        if (sControl == "Rebels")
            {
            nRebelPoints= nRebelPoints+nBonus;
            }
        else if (sControl == "Empire")
            {
            nEmpirePoints= nEmpirePoints+nBonus;
            }
        if (sControl1 == "Rebels")
            {
            nRebelPoints= nRebelPoints+nBonus;
            }
        else if (sControl1 == "Empire")
            {
            nEmpirePoints= nEmpirePoints+nBonus;
            }
        if (sControl2 == "Rebels")
            {
            nRebelPoints= nRebelPoints+nBonus;
            }
        else if (sControl2 == "Empire")
            {
            nEmpirePoints= nEmpirePoints+nBonus;
            }
        if (sControl3 == "Rebels")
            {
            nRebelPoints= nRebelPoints+nBonus;
            }
        else if (sControl3 == "Empire")
            {
            nEmpirePoints= nEmpirePoints+nBonus;
            }
        int nRPoints = GetCampaignInt("swpcpoints", "POINTS_Rebels");
        int nEPoints = GetCampaignInt("swpcpoints", "POINTS_Empire");
        SetCampaignInt("swpcpoints", "POINTS_Rebels", nRebelPoints + nRPoints);
        SetCampaignInt("swpcpoints", "POINTS_Empire", nEmpirePoints + nEPoints);
        SetCampaignInt("swpcpoints", "POINTS_PLANET_Rebels", GetCampaignInt("starwars", "POINTS_PLANET_Rebels") + nRPoints);
        SetCampaignInt("swpcpoints", "POINTS_PLANET_Empire", GetCampaignInt("starwars", "POINTS_PLANET_Empire") + nEPoints);
        SetCampaignInt("swpcpoints", "POINTS_HOUR_"+sPlanet, nHour);
        SetCampaignInt("swpcpoints", "POINTS_DAY_"+sPlanet, nDay);
        SetCampaignInt("swpcpoints", "POINTS_MONTH_"+sPlanet, nMonth);
        }
}


//string sBoard should be POINTS for total, POINTS_PLANET for planet points or POINTS_KILL for kill points
void TestLeaderPoints(object oPC, string sBoard)
{
int nRank = 1; int nType;
int nPoints = GetCampaignInt("swpcpoints", "PC_POINTS",oPC);
int nPointsPlanet = GetCampaignInt("swpcpoints", "PC_POINTS_PLANET", oPC);
int nPointsKill = GetCampaignInt("swpcpoints", "PC_POINTS_KILL", oPC);

if (sBoard == "POINTS"){nType = 1;}
if (sBoard == "POINTS_PLANET"){nType = 2;}
if (sBoard == "POINTS_KILL"){nType = 3;}

string sLeader, sLeader2, sLeader3, sLeader4, sLeader5;
int nLeaderTotal, nLeaderPlanet, nLeaderKill;
int nLeaderTotal2, nLeaderPlanet2, nLeaderKill2;
int nLeaderTotal3, nLeaderPlanet3, nLeaderKill3;
int nLeaderTotal4, nLeaderPlanet4, nLeaderKill4;
int nLeaderTotal5, nLeaderPlanet5, nLeaderKill5;

    sLeader = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1");
    nLeaderTotal = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1");
    nLeaderPlanet = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1");
    nLeaderKill = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1");

    sLeader2 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2");
    nLeaderTotal2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2");
    nLeaderPlanet2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2");
    nLeaderKill2 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2");

    sLeader3 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3");
    nLeaderTotal3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3");
    nLeaderPlanet3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3");
    nLeaderKill3 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3");

    sLeader4 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4");
    nLeaderTotal4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4");
    nLeaderPlanet4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4");
    nLeaderKill4 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4");

    sLeader5 = GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5");
    nLeaderTotal5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5");
    nLeaderPlanet5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5");
    nLeaderKill5 = GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5");


    if (nType = 1 && nPoints > nLeaderTotal)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1", nPointsKill);
        }
    else if (nType = 2 && nPointsPlanet > nLeaderPlanet)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1", nPointsKill);
        }
    else if (nType = 3 && nPointsKill > nLeaderKill)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_1", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_1", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_1", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_1", nPointsKill);
        }

    if (nType = 1 && nPoints < nLeaderTotal && nPoints > nLeaderTotal2)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", nPointsKill);
        }
    else if (nType = 2 && nPointsPlanet < nLeaderPlanet && nPointsPlanet > nLeaderPlanet2)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", nPointsKill);
        }
    else if (nType = 3 && nPointsKill < nLeaderKill && nPointsKill > nLeaderKill2)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_2", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_2", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_2", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_2", nPointsKill);
        }

    if (nType = 1 && nPoints < nLeaderTotal2 && nPoints > nLeaderTotal3)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", nPointsKill);
        }
    else if (nType = 2 && nPointsPlanet < nLeaderPlanet2 && nPointsPlanet > nLeaderPlanet3)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", nPointsKill);
        }
    else if (nType = 3 && nPointsKill < nLeaderKill2 && nPointsKill > nLeaderKill3)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_3", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_3", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_3", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_3", nPointsKill);
        }

    if (nType = 1 && nPoints < nLeaderTotal3 && nPoints > nLeaderTotal4)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }
    else if (nType = 2 && nPointsPlanet < nLeaderPlanet3 && nPointsPlanet > nLeaderPlanet4)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }
    else if (nType = 3 && nPointsKill < nLeaderKill3 && nPointsKill > nLeaderKill4)
        {
        if (GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4") != GetName(oPC))
            {
            SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_5", GetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4"));
            SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_5", GetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4"));
            }

        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }

    if (nType = 1 && nPoints < nLeaderTotal4 && nPoints > nLeaderTotal5)
        {
        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }
    else if (nType = 2 && nPointsPlanet < nLeaderPlanet4 && nPointsPlanet > nLeaderPlanet5)
        {
        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }
    else if (nType = 3 && nPointsKill < nLeaderKill4 && nPointsKill > nLeaderKill5)
        {
        SetCampaignString("swpcpoints", sBoard+"_RANK_NAME_4", GetName(oPC));
        SetCampaignInt("swpcpoints", sBoard+"_RANK_TOTAL_4", nPoints);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_PLANET_4", nPointsPlanet);
        SetCampaignInt("swpcpoints", sBoard+"_RANK_KILL_4", nPointsKill);
        }
}


void UpdatePointsScore(object oPC)
{
TestLeaderPoints(oPC, "POINTS");
TestLeaderPoints(oPC, "POINTS_PLANET");
TestLeaderPoints(oPC, "POINTS_KILL");
}
