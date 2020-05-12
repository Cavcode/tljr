////////////////////////////////////////////////////////////////////////////////
//Date and Time Functions
//
//inc_datetime
//
//Scripted By Warspawn
//warspawn@cox.net
//
//These functions are great to use with Due Dates, Birthdays, Timed by Cycle
//Feel free to modify, use, copy, distribute this any way you like.
//If you make this better please let me know!
//If you use this and love it please let me know!
//If you have any problems, I'll try to help. Just email me.
////////////////////////////////////////////////////////////////////////////////

string GetCurrentDate()//generates MM/DD/YYYY string of current date
{
    string sResult;

    sResult = IntToString(GetCalendarMonth()) + "/" + IntToString(GetCalendarDay()) + "/" + IntToString(GetCalendarYear());
    return sResult;
}

string GetDateString(int iDay = 1, int iMonth = 1, int iYear = 1)//generates a string MM/DD/YYYY out of given dates
{
    string sResult;

    sResult = IntToString(iMonth) + "/" + IntToString(iDay) + "/" + IntToString(iYear);
    return sResult;
}

//usage: iDay = ParseDateString("9/7/1977", "day");
int ParseDateString(string sDateString, string sOption)//option = day, month, year
{
    string sTemp1;
    int iResult, iSlash1, iSlash2, iIndex, iStrLength;

    iSlash1 = 0;
    iSlash2 = 0;
    iStrLength = GetStringLength(sDateString);
    for(iIndex = 0; iIndex <= (iStrLength - 1); iIndex++)//get position of slashes
    {
        sTemp1 = GetSubString(sDateString, iIndex, 1);
        if(sTemp1 == "/")
        {
            if(iSlash1 == 0)
            {
                iSlash1 = iIndex;
            }
            else if (iSlash2 == 0)
            {
                iSlash2 = iIndex;
            }
        }
    }
    if(sOption == "month")
    {
        sTemp1 = GetStringLeft(sDateString, iSlash1);
        iResult = StringToInt(sTemp1);
    }
    else if(sOption == "day")
    {
        sTemp1 = GetSubString(sDateString, iSlash1 + 1, (iSlash2 - iSlash1) -1);
        iResult = StringToInt(sTemp1);
    }
    else if(sOption == "year")
    {
        sTemp1 = GetSubString(sDateString, iSlash2 + 1, (iStrLength - 1) - iSlash2);
        iResult = StringToInt(sTemp1);
    }
    else
        return -1;//invalid option

    return iResult;
}

//usage: iNumOfDaysElapsed = GetDateDifference("1/14/1352", "9/7/1977", "days");
//uses NWN calendar settings for # of days in month (28)
//note: sDate1 MUST BE <= SDate2
//i.e. GetDateDifference("1/14/1356", "1/14/1355", "months") will result in BADNESS!
//
int GetDateDifference(string sDate1, string sDate2, string sOption)//option = "days", "months", "years"
{
    int iTempDay1, iTempMonth1, iTempYear1;
    int iTempDay2, iTempMonth2, iTempYear2;
    int iResult;
    int iYears, iDays, iMonths;

    iTempDay1 = ParseDateString(sDate1, "day");
    iTempMonth1 = ParseDateString(sDate1, "month");
    iTempYear1 = ParseDateString(sDate1, "year");
    iTempDay2 = ParseDateString(sDate2, "day");
    iTempMonth2 = ParseDateString(sDate2, "month");
    iTempYear2 = ParseDateString(sDate2, "year");

    if(iTempYear2 == iTempYear1)//same year
    {
        iYears = 0;
        if(iTempMonth2 == iTempMonth1)//same year and same month
        {
            iMonths = 0;
            iDays = iTempDay2 - iTempDay1;
        }
        else //same year and different month
        {
            if(iTempDay2 == iTempDay1)//same year, different month, same day
            {
                iMonths = iTempMonth2 - iTempMonth1;
                iDays = iMonths * 28;
            }
            else //same year, diff month, diff day
            {
                if(iTempDay2 >= iTempDay1)//different month at least one month
                {
                    iMonths = iTempMonth2 - iTempMonth1;
                    iDays = (iTempDay2 - iTempDay1) + (iMonths * 28);
                }
                else //different month, at least one month, ending in incomplete month
                {
                    iMonths = (iTempMonth2 - iTempMonth1) - 1;
                    iDays = (28 * iMonths) + (28 - (iTempDay1 - 1)) + (28 - ((28 - iTempDay2) + 1));
                }
            }
        }
    }

    if(iTempYear2 > iTempYear1)//not same year
    {
        if(iTempMonth2 == iTempMonth1)//diff year, same month
        {
            if(iTempDay2 == iTempDay1)//diff year, same month, same day
            {
                iYears = iTempYear2 - iTempYear1;
                iMonths = 12 * iYears;
                iDays = 28 * iMonths;
            }
            else //diff year, same month, diff day
            {
                if(iTempDay2 > iTempDay1)//diff year, same month, at least one year
                {
                    iYears = iTempYear2 - iTempYear1;
                    iMonths = 12 * iYears;
                    iDays = (28 * iMonths) + (iTempDay2 - iTempDay1);
                }
                else //diff year, same month, one less year
                {
                    iYears = (iTempYear2 - iTempYear1) -1;
                    iMonths = (12 * iYears) + 11;
                    iDays = (28 * iMonths) + (28 + (iTempDay2 - iTempDay1));
                }
            }
        }
        else //diff year, diff month
        {
            if(iTempMonth2 > iTempMonth1)//diff year, diff month, at least one year, extra months
            {
                if(iTempDay2 == iTempDay1)//diff year, diff month, same day
                {
                    iYears = iTempYear2 - iTempYear1;
                    iMonths = (12 * iYears) + (iTempMonth2 - iTempMonth1);
                    iDays = 28 * iMonths;
                }
                else //diff year, diff month, diff day
                {
                    if(iTempDay2 > iTempDay1)//diff year, diff month, extra days
                    {
                        iYears = iTempYear2 - iTempYear1;
                        iMonths = (12 * iYears) + (iTempMonth2 - iTempMonth1);
                        iDays = (28 * iMonths) + (iTempDay2 - iTempDay1);
                    }
                    else //diff year, diff month, fewer days
                    {
                        iYears = iTempYear2 - iTempYear1;
                        iMonths = (12 * iYears) + (iTempMonth2 - iTempMonth1);
                        iDays =(28 * iMonths) + (28 + (iTempDay2 - iTempDay1));
                    }
                }
            }
            else //diff year, diff month, one year less (fewer months)
            {
                if(iTempDay2 == iTempDay1)//diff year, less months, same day
                {
                    iYears = (iTempYear2 - iTempYear1) -1;
                    iMonths = (12 * iYears) - (iTempMonth2 - iTempMonth1);
                    iDays = 28 * iMonths;
                }
                else //diff year, fewer months, diff day
                {
                    if(iTempDay2 > iTempDay1)//diff year, fewer months, extra days
                    {
                        iYears = (iTempYear2 - iTempYear1) -1;
                        iMonths = (12 * iYears) - (iTempMonth2 - iTempMonth1);
                        iDays = (28 * iMonths) + (iTempDay2 - iTempDay1);
                    }
                    else //diff year, fewer months, less days
                    {
                        iYears = (iTempYear2 - iTempYear1) -1;
                        iMonths = (12 * iYears) - (iTempMonth2 - iTempMonth1);
                        iDays =(28 * iMonths) + (28 + (iTempDay2 - iTempDay1));
                    }
                }
            }
        }
    }

    if(iTempYear2 < iTempYear1)
        return -1;//badness insues

    if(sOption == "days")
    {
        return iDays;
    }
    else if(sOption == "months")
    {
        return iMonths;
    }
    else if(sOption == "years")
    {
        return iYears;
    }
    else
        return -1; //invalid option
}

//usage: sDueDate = GetFutureDate(GetCurrentDate(), 7, 1, 0);
//this will return a string 1 week and 1 month later
string GetFutureDate(string sStartDate, int iIncDay = 0, int iIncMonth = 0, int iIncYear = 0)
{
    string sResult;
    int iIndex, iRolloverBuffer;
    int iStartDay, iStartMonth, iStartYear;
    int iEndDay, iEndMonth, iEndYear;

    iStartDay = ParseDateString(sStartDate, "day");
    iStartMonth = ParseDateString(sStartDate, "month");
    iStartYear = ParseDateString(sStartDate, "year");

    iEndYear = iStartYear + iIncYear;
    iEndMonth = iStartMonth + iIncMonth;
    iEndDay = iStartDay + iIncDay;
    if((iStartDay + iIncDay) > 28) //rollover days and months
    {
        iRolloverBuffer = iEndDay - 28;
        iIndex = 1;
        while (iRolloverBuffer >= 28)
        {
            iRolloverBuffer = iRolloverBuffer - 28;
            iIndex++;
        }
        iEndDay = iRolloverBuffer;
        iEndMonth = iEndMonth + iIndex;
    }
    if(iEndMonth > 12) //rollover months and years
    {
        iRolloverBuffer = iEndMonth - 12;
        iIndex = 1;
        while (iRolloverBuffer >= 12)
        {
            iRolloverBuffer = iRolloverBuffer - 12;
            iIndex++;
        }
        iEndMonth = iRolloverBuffer;
        iEndYear = iEndYear + iIndex;
    }

    sResult = IntToString(iEndMonth) + "/" + IntToString(iEndDay) + "/" + IntToString(iEndYear);

    return sResult;
}

//usage: sBDay = GetPastDate(GetCurrentDate(), 0, 0, 50);
//this will return a string 50 years earlier
string GetPastDate(string sStartDate, int iIncDay = 0, int iIncMonth = 0, int iIncYear = 0)
{
    string sResult;
    int iIndex, iRolloverBuffer;
    int iStartDay, iStartMonth, iStartYear;
    int iEndDay, iEndMonth, iEndYear;

    iStartDay = ParseDateString(sStartDate, "day");
    iStartMonth = ParseDateString(sStartDate, "month");
    iStartYear = ParseDateString(sStartDate, "year");

    iEndYear = iStartYear - iIncYear;
    iEndMonth = iStartMonth - iIncMonth;
    iEndDay = iStartDay - iIncDay;
    if(iEndDay < 1) //rollover days and months
    {
        iRolloverBuffer = iEndDay + 28;
        iIndex = 1;
        while (iRolloverBuffer <= 1)
        {
            iRolloverBuffer = iRolloverBuffer + 28;
            iIndex++;
        }
        iEndDay = iRolloverBuffer;
        iEndMonth = iEndMonth - iIndex;
    }
    if(iEndMonth < 1) //rollover months and years
    {
        iRolloverBuffer = iEndMonth + 12;
        iIndex = 1;
        while (iRolloverBuffer <= 1)
        {
            iRolloverBuffer = iRolloverBuffer + 12;
            iIndex++;
        }
        iEndMonth = iRolloverBuffer;
        iEndYear = iEndYear - iIndex;
    }

    sResult = IntToString(iEndMonth) + "/" + IntToString(iEndDay) + "/" + IntToString(iEndYear);

    return sResult;
}

//purpose: test if sDate1 is > sDate2
int CompareDates(string sDate1, string sDate2)
{
    int iResult;
    int iTempDay1, iTempMonth1, iTempYear1;
    int iTempDay2, iTempMonth2, iTempYear2;

    iTempDay1 = ParseDateString(sDate1, "day");
    iTempMonth1 = ParseDateString(sDate1, "month");
    iTempYear1 = ParseDateString(sDate1, "year");
    iTempDay2 = ParseDateString(sDate2, "day");
    iTempMonth2 = ParseDateString(sDate2, "month");
    iTempYear2 = ParseDateString(sDate2, "year");

    if(iTempYear1 == iTempYear2) //same year
    {
        if(iTempMonth1 == iTempMonth2) //same month
        {
            if(iTempDay1 > iTempDay2) //same year and month, just check day
                iResult = TRUE;
            else
                iResult = FALSE;
        }
        else
        {
            if(iTempMonth1 > iTempMonth2)//same year, if month is bigger date is >
                iResult = TRUE;
            else
                iResult = FALSE;
        }
    }
    else
    {
        if(iTempYear1 > iTempYear2)//if the year is bigger, day and month don't matter
            iResult = TRUE;
        else
            iResult = FALSE;
    }

    return iResult;
}
