#include "aps_include"

//create new PC in database
void DB_LogNewPC(object oPC);

//is PC really a DM?
int DB_GetIsDM(object oPC);

//is PC banned?
int DB_GetIsBanned(object oPC);

//ban a PC
void DB_BanPC(object oPC);

//get module uptime in text
string GetUptimeText(int nUptime,int nResetSeconds);

//enter a playervote into the database
//  Reserved subjects: "RESET", "BANPLAYER"
// Returns TRUE if successful or FALSE if unsuccessful
int EnterPlayerVote(object oPC, string sSubject, string sVote);

//delay the automatic server reset by nDelay seconds
void DelayReset(int nDelay);

//queries the voting table in the database
//  if >= nCount players have voted to delay the reset then it will be delayed for 20 minutes.
void CheckReset(int nCount);


void DB_LogNewPC(object oPC)
{
    string sTable = "players";
    string sPlayer = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);
    int iExpiration = 0;

    if (GetIsPC(oPC))
    {
        sPlayer = SQLEncodeSpecialChars(sPlayer);
        sCDKey = SQLEncodeSpecialChars(sCDKey);
    }
    else
    {
        sPlayer = "~";
        sCDKey = sCDKey;
    }

    string sSQL = "SELECT playername FROM " + sTable + " WHERE playername='" + sPlayer +
        "' AND cdkey='" + sCDKey + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() != SQL_SUCCESS)
    {
        SendMessageToPC(oPC, "Welcome to Rise of the Rebellion");
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + " (playername,cdkey,expire) VALUES" +
            "('" + sPlayer + "','" + sCDKey + "'," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
}

int DB_GetIsDM(object oPC)
{
    string sTable = "players";
    string sPlayer = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);

    sPlayer = SQLEncodeSpecialChars(sPlayer);
    sCDKey = SQLEncodeSpecialChars(sCDKey);



    string sSQL = "SELECT max(isdm) FROM " + sTable + " WHERE cdkey='" + sCDKey + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        return StringToInt(SQLDecodeSpecialChars(SQLGetData(1)));
    else
    {
        return 0;
    }
}

int DB_GetIsBanned(object oPC)
{
    string sTable = "players";
    string sPlayer = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);

    sPlayer = SQLEncodeSpecialChars(sPlayer);
    sCDKey = SQLEncodeSpecialChars(sCDKey);


    string sSQL = "SELECT max(isbanned) FROM " + sTable + " WHERE cdkey='" + sCDKey + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
        return StringToInt(SQLDecodeSpecialChars(SQLGetData(1)));
    else
    {
        return 0;
    }
}

void DB_BanPC(object oPC)
{
    string sTable = "players";
    string sPlayer = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);
    int iExpiration = 0;

    sPlayer = SQLEncodeSpecialChars(sPlayer);
    sCDKey = SQLEncodeSpecialChars(sCDKey);


if(GetIsPC(oPC) && !GetIsDM(oPC))
{
    string sSQL = "SELECT playername FROM " + sTable + " WHERE playername='" + sPlayer +
        "' AND cdkey='" + sCDKey + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists
        sSQL = "UPDATE " + sTable + " SET isbanned=" + IntToString(1) +
            ",expire=" + IntToString(iExpiration) + " WHERE playername='" + sPlayer +
            "' AND cdkey='" + sCDKey + "'";
        SQLExecDirect(sSQL);
    }
    else
    {
        // row doesn't exist
        sSQL = "INSERT INTO " + sTable + "(playername,cdkey,isbanned,expire) VALUES " +
            "('" + sPlayer + "','" + sCDKey + "'," + IntToString(1) + "," + IntToString(iExpiration) + ")";
        SQLExecDirect(sSQL);
    }
    WriteTimestampedLogEntry("Player: " + sPlayer + ", has been banned from the server.");
    SendMessageToPC(oPC, "Goodbye Meatbag!!!");
    SendMessageToPC(oPC, "You have been banned from the server.");
    SendMessageToAllDMs("Player: " + sPlayer + ", has been banned from the server.");
    DelayCommand(5.0, BootPC(oPC));
}
}

string GetUptimeText(int nUptime, int nResetSeconds)
{
        string sMessage;
        //calculate uptime vars
            int nUpDays, nUpHours, nUpMinutes, nUpSeconds;
            int nResetDays, nResetHours, nResetMinutes, nResetOriginalSeconds;

            nResetSeconds = nResetSeconds - nUptime;
            nResetOriginalSeconds = nResetSeconds;

            nUpDays = nUptime / 86400;
            if (nUpDays > 0)
            {
                nUptime = nUptime - nUpDays * 86400;
            }
            else
            {
                nUpDays = 0;
            }
            nUpHours = nUptime / 3600;
            if (nUpHours > 0)
            {
                nUptime = nUptime - nUpHours *3600;
            }
            else
            {
                nUpHours = 0;
            }
            nUpMinutes = nUptime / 60;

        //calculate reset time vars
            nResetDays = nResetSeconds / 86400;
            if (nResetDays > 0)
            {
                nResetSeconds = nResetSeconds - nResetDays * 86400;
            }
            else
            {
                nResetDays = 0;
            }
            nResetHours = nResetSeconds / 3600;
            if (nResetHours > 0)
            {
                nResetSeconds = nResetSeconds - nResetHours *3600;
            }
            else
            {
                nResetHours = 0;
            }
            nResetMinutes = nResetSeconds / 60;

            sMessage =  "The server has been up for " + IntToString(nUpDays) + " days, " +
                        IntToString(nUpHours) + " hours, and " + IntToString(nUpMinutes) + " minutes.\n" +
                        "RESET in " + IntToString(nResetDays) + " days, " +
                        IntToString(nResetHours) + " hours, and " + IntToString(nResetMinutes) + " minutes.";

            if (nResetOriginalSeconds <= 900) //if 15 minutes or less until reset
            {
                sMessage = sMessage + "\n\n" + "say !delayreset to vote for a Delayed Server Restart.";
            }
            return sMessage;
}

int EnterPlayerVote(object oPC, string sSubject, string sVote)
{
    string sTable = "voting";
    string sPlayer = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);

    string sSQL = "SELECT result FROM " + sTable + " WHERE playername='" + sPlayer +
        "' AND cdkey='" + sCDKey + "' AND subject='" + sSubject + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists, player cannot vote again, sSubject could be placed in if blocks to check for or do additional things...
        return FALSE;
    }
    else
    {
        // row doesn't exist, insert vote
        sSQL = "INSERT INTO " + sTable + "(playername,cdkey,subject,result) VALUES " +
            "('" + sPlayer + "','" + sCDKey + "','" + sSubject + "','" + sVote + "')";
        SQLExecDirect(sSQL);
        CheckReset(2); // 2 Player votes required to delay the reset.
        return TRUE;
    }
}

void DelayReset(int nDelay)
{
    int nResetTime = GetLocalInt(GetModule(), "reset_seconds");
    SetLocalInt(GetModule(), "reset_seconds", nResetTime + nDelay);
}

void CheckReset(int nCount)
{
    string sTable = "voting";
    string sSubject = "DELAYRESET";
    int nRecordCount;

    string sSQL = "SELECT count(result) FROM " + sTable + " WHERE  subject='" + sSubject + "'";
    SQLExecDirect(sSQL);

    if (SQLFetch() == SQL_SUCCESS)
    {
        // row exists, get count
        nRecordCount = StringToInt(SQLGetData(1));

        if (nRecordCount >= nCount)
        {
            sSQL = "DELETE FROM " + sTable + " WHERE subject='" + sSubject + "'";
            SQLExecDirect(sSQL); //Clear voting table for DELAYRESET subject.
            DelayReset(1200); //Delay reset for 1200 seconds = 20 minutes
        }
    }
}

/*
void main()
{

}
*/

