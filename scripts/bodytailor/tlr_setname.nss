//::///////////////////////////////////////////////
//:: Tailoring - Set Name
//:: Copyright (c) 2003 Jake E. Fitch
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Jake E. Fitch (Milambus Mandragon)
//:: Created On: March 9, 2004
//-- bloodsong adds custon naming
//:://////////////////////////////////////////////
//::///////////////////////////////////////////////
//:: BuildLegalString Function
//::
//:://////////////////////////////////////////////
/*
   this is for creating variable names from pc/player names,
   when they keep sticking in spaces and punctuation and fancy
   extended characters and colours and all that crap.
*/
//:://////////////////////////////////////////////
//:: Created By: bloodsong
//:: with code from the NWN Eliza scripts
//:: by Tom 'Magi' Smallwood 10/23/2002
//:://////////////////////////////////////////////
// BuildLegalString(S, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE)
// string: the string you want to convert
// SKIP_PUNCTUATION: set to TRUE to strip out punctuation characters
// CONVERT_PUNCTUATION: TRUE = change punctuation to underscores
// SKIP_SPACES: set to TRUE to strip out spaces
// CONVERT_SPACES: TRUE = change to underscores
// SKIP_NUMBERS:  set to TRUE to strip out numeric characters
// CONVERT_NUMBERS: TRUE = change to underscores
// NO_STARTING_NUMBERS: TRUE = strip off leading numbers,
// this is to build a legal variable name, which can only start
// with letters or underscores
string BuildLegalString(string S,
                        int SKIP_PUNCTUATION = FALSE,
                        int CONVERT_PUNCTUATION = TRUE,
                        int SKIP_SPACES = FALSE,
                        int CONVERT_SPACES = TRUE,
                        int SKIP_NUMBERS = FALSE,
                        int CONVERT_NUMBERS = FALSE,
                        int NO_STARTING_NUMBERS = TRUE)
{
    string sResult = "";
    string sNumber = "0123456789";
    string sAlpha = "_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    string sPunct = "`~!@#$%^&*()-=+/:;'?,.<>|\";
    string sCheck = sAlpha;
//--First, build the Check String with all the characters we will "recognize"
    if(!SKIP_PUNCTUATION) //--not skipping punctuation, put that in
    {  sCheck = sCheck+sPunct; }
    if(!SKIP_SPACES)  //--not skipping spaces
    {  sCheck = sCheck+" ";  }
    if(!SKIP_NUMBERS)  //--not skipping numbers, add those
    {  sCheck = sCheck+sNumber;  }
//--Now go through our string S one character at a time...
  int x;
  string sChar;
  for(x=0;x<=GetStringLength(S)-1;x++)
  {
    sChar=GetSubString(S,x,1);
    if(FindSubString(sCheck,sChar)>=0)
    {//--we found the character in our Check
      //--find out if we're converting sChar
     if(FindSubString(sPunct, sChar) >=0 && CONVERT_PUNCTUATION)
     {  sChar = "_";  }
     if(FindSubString(sNumber, sChar) >=0 && CONVERT_NUMBERS)
     {  sChar = "_";  }
     if(sChar == " " && CONVERT_SPACES)
     {  sChar = "_";  }
      //--now add sChar to our Result string
      sResult=sResult+sChar;
    }  //--end char found
  }  //--end for loop
      sChar = GetStringLeft(sResult, 1);
      while(NO_STARTING_NUMBERS && FindSubString(sNumber, sChar) >= 0
            && GetStringLength(sResult) > 0 ) //--plus we didn't run out of characters
      {//--first char is number and we're clipping starting numbers
        sResult = GetStringRight(sResult, GetStringLength(sResult)-1);
        sChar = GetStringLeft(sResult, 1);
      }
    if(sResult == "")
    { return "___ERROR___";  }
    else
    {  return sResult;  }
}



void main()
{
    SetListening(OBJECT_SELF, FALSE);

    string sName = GetLocalString(OBJECT_SELF, "tlr_Spoken");
    sName = BuildLegalString(sName, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE);

    SetLocalString(OBJECT_SELF, "CUSTOMNAME", sName);

    if(sName == "___ERROR___")//-- setting = "" not working? delete
    {  DeleteLocalString(OBJECT_SELF, "CUSTOMNAME");  }

}
