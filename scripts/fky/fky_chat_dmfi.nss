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
#include "fky_chat_const"
string ConvertDrow(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "il";
    case 26: return "Il";
    case 1: return "f";
    case 2: return "st";
    case 28: return "St";
    case 3: return "w";
    case 4: return "a";
    case 5: return "o";
    case 6: return "v";
    case 7: return "ir";
    case 33: return "Ir";
    case 8: return "e";
    case 9: return "vi";
    case 35: return "Vi";
    case 10: return "go";
    case 11: return "c";
    case 12: return "li";
    case 13: return "l";
    case 14: return "e";
    case 15: return "ty";
    case 41: return "Ty";
    case 16: return "r";
    case 17: return "m";
    case 18: return "la";
    case 44: return "La";
    case 19: return "an";
    case 45: return "An";
    case 20: return "y";
    case 21: return "el";
    case 47: return "El";
    case 22: return "ky";
    case 48: return "Ky";
    case 23: return "'";
    case 24: return "a";
    case 25: return "p'";
    case 27: return "F";
    case 29: return "W";
    case 30: return "A";
    case 31: return "O";
    case 32: return "V";
    case 34: return "E";
    case 36: return "Go";
    case 37: return "C";
    case 38: return "Li";
    case 39: return "L";
    case 40: return "E";
    case 42: return "R";
    case 43: return "M";
    case 46: return "Y";
    case 49: return "'";
    case 50: return "A";
    case 51: return "P'";

    default: return sLetter; } return "";
}

string ProcessDrow(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertDrow(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertLeetspeak(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "4";
    case 26: return "4";
    case 1: return "8";
    case 27: return "8";
    case 2: return "(";
    case 28: return "(";
    case 3: return "|)";
    case 29: return "|)";
    case 4: return "3";
    case 30: return "3";
    case 5: return "f";
    case 31: return "F";
    case 6: return "9";
    case 32: return "9";
    case 7: return "h";
    case 33: return "H";
    case 8: return "!";
    case 34: return "!";
    case 9: return "j";
    case 35: return "J";
    case 10: return "|<";
    case 36: return "|<";
    case 11: return "1";
    case 37: return "l";
    case 12: return "/";
    case 38: return "/";
    case 13: return "|\|";
    case 39: return "|\|";
    case 14: return "0";
    case 40: return "0";
    case 15: return "p";
    case 41: return "P";
    case 16: return "Q";
    case 42: return "Q";
    case 17: return "R";
    case 43: return "R";
    case 18: return "5";
    case 44: return "5";
    case 19: return "7";
    case 45: return "7";
    case 20: return "u";
    case 46: return "U";
    case 21: return "\/";
    case 47: return "\/";
    case 22: return "\/\/";
    case 48: return "\/\/";
    case 23: return "x";
    case 49: return "X";
    case 24: return "y";
    case 50: return "Y";
    case 25: return "2";
    case 51: return "2";
    default: return sLetter;
    }
    return "";
}//end ConvertLeetspeak

string ProcessLeetspeak(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertLeetspeak(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertInfernal(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "o";
    case 1: return "c";
    case 2: return "r";
    case 3: return "j";
    case 4: return "a";
    case 5: return "v";
    case 6: return "k";
    case 7: return "r";
    case 8: return "y";
    case 9: return "z";
    case 10: return "g";
    case 11: return "m";
    case 12: return "z";
    case 13: return "r";
    case 14: return "y";
    case 15: return "k";
    case 16: return "r";
    case 17: return "n";
    case 18: return "k";
    case 19: return "d";
    case 20: return "'";
    case 21: return "r";
    case 22: return "'";
    case 23: return "k";
    case 24: return "i";
    case 25: return "g";
    case 26: return "O";
    case 27: return "C";
    case 28: return "R";
    case 29: return "J";
    case 30: return "A";
    case 31: return "V";
    case 32: return "K";
    case 33: return "R";
    case 34: return "Y";
    case 35: return "Z";
    case 36: return "G";
    case 37: return "M";
    case 38: return "Z";
    case 39: return "R";
    case 40: return "Y";
    case 41: return "K";
    case 42: return "R";
    case 43: return "N";
    case 44: return "K";
    case 45: return "D";
    case 46: return "'";
    case 47: return "R";
    case 48: return "'";
    case 49: return "K";
    case 50: return "I";
    case 51: return "G";
    default: return sLetter;
    }
    return "";
}//end ConvertInfernal

string ProcessInfernal(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertInfernal(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertAbyssal(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 27: return "N";
    case 28: return "M";
    case 29: return "G";
    case 30: return "A";
    case 31: return "K";
    case 32: return "S";
    case 33: return "D";
    case 35: return "H";
    case 36: return "B";
    case 37: return "L";
    case 38: return "P";
    case 39: return "T";
    case 40: return "E";
    case 41: return "B";
    case 43: return "N";
    case 44: return "M";
    case 45: return "G";
    case 48: return "B";
    case 51: return "T";
    case 0: return "oo";
    case 26: return "OO";
    case 1: return "n";
    case 2: return "m";
    case 3: return "g";
    case 4: return "a";
    case 5: return "k";
    case 6: return "s";
    case 7: return "d";
    case 8: return "oo";
    case 34: return "OO";
    case 9: return "h";
    case 10: return "b";
    case 11: return "l";
    case 12: return "p";
    case 13: return "t";
    case 14: return "e";
    case 15: return "b";
    case 16: return "ch";
    case 42: return "Ch";
    case 17: return "n";
    case 18: return "m";
    case 19: return "g";
    case 20: return  "ae";
    case 46: return  "Ae";
    case 21: return  "ts";
    case 47: return  "Ts";
    case 22: return "b";
    case 23: return  "bb";
    case 49: return  "Bb";
    case 24: return  "ee";
    case 50: return  "Ee";
    case 25: return "t";
    default: return sLetter;
    }
    return "";
}//end ConvertAbyssal

string ProcessAbyssal(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertAbyssal(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertCelestial(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "a";
    case 1: return "p";
    case 2: return "v";
    case 3: return "t";
    case 4: return "el";
    case 5: return "b";
    case 6: return "w";
    case 7: return "r";
    case 8: return "i";
    case 9: return "m";
    case 10: return "x";
    case 11: return "h";
    case 12: return "s";
    case 13: return "c";
    case 14: return "u";
    case 15: return "q";
    case 16: return "d";
    case 17: return "n";
    case 18: return "l";
    case 19: return "y";
    case 20: return "o";
    case 21: return "j";
    case 22: return "f";
    case 23: return "g";
    case 24: return "z";
    case 25: return "k";
    case 26: return "A";
    case 27: return "P";
    case 28: return "V";
    case 29: return "T";
    case 30: return "El";
    case 31: return "B";
    case 32: return "W";
    case 33: return "R";
    case 34: return "I";
    case 35: return "M";
    case 36: return "X";
    case 37: return "H";
    case 38: return "S";
    case 39: return "C";
    case 40: return "U";
    case 41: return "Q";
    case 42: return "D";
    case 43: return "N";
    case 44: return "L";
    case 45: return "Y";
    case 46: return "O";
    case 47: return "J";
    case 48: return "F";
    case 49: return "G";
    case 50: return "Z";
    case 51: return "K";
    default: return sLetter;
    }
    return "";
}//end ConvertCelestial

string ProcessCelestial(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertCelestial(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertGoblin(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "u";
    case 1: return "p";
    case 2: return "";
    case 3: return "t";
    case 4: return "'";
    case 5: return "v";
    case 6: return "k";
    case 7: return "r";
    case 8: return "o";
    case 9: return "z";
    case 10: return "g";
    case 11: return "m";
    case 12: return "s";
    case 13: return "";
    case 14: return "u";
    case 15: return "b";
    case 16: return "";
    case 17: return "n";
    case 18: return "k";
    case 19: return "d";
    case 20: return "u";
    case 21: return "";
    case 22: return "'";
    case 23: return "";
    case 24: return "o";
    case 25: return "w";
    case 26: return "U";
    case 27: return "P";
    case 28: return "";
    case 29: return "T";
    case 30: return "'";
    case 31: return "V";
    case 32: return "K";
    case 33: return "R";
    case 34: return "O";
    case 35: return "Z";
    case 36: return "G";
    case 37: return "M";
    case 38: return "S";
    case 39: return "";
    case 40: return "U";
    case 41: return "B";
    case 42: return "";
    case 43: return "N";
    case 44: return "K";
    case 45: return "D";
    case 46: return "U";
    case 47: return "";
    case 48: return "'";
    case 49: return "";
    case 50: return "O";
    case 51: return "W";
    default: return sLetter;
    }
    return "";
}//end ConvertGoblin

string ProcessGoblin(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertGoblin(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertDraconic(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "e";
    case 26: return "E";
    case 1: return "po";
    case 27: return "Po";
    case 2: return "st";
    case 28: return "St";
    case 3: return "ty";
    case 29: return "Ty";
    case 4: return "i";
    case 5: return "w";
    case 6: return "k";
    case 7: return "ni";
    case 33: return "Ni";
    case 8: return "un";
    case 34: return "Un";
    case 9: return "vi";
    case 35: return "Vi";
    case 10: return "go";
    case 36: return "Go";
    case 11: return "ch";
    case 37: return "Ch";
    case 12: return "li";
    case 38: return "Li";
    case 13: return "ra";
    case 39: return "Ra";
    case 14: return "y";
    case 15: return "ba";
    case 41: return "Ba";
    case 16: return "x";
    case 17: return "hu";
    case 43: return "Hu";
    case 18: return "my";
    case 44: return "My";
    case 19: return "dr";
    case 45: return "Dr";
    case 20: return "on";
    case 46: return "On";
    case 21: return "fi";
    case 47: return "Fi";
    case 22: return "zi";
    case 48: return "Zi";
    case 23: return "qu";
    case 49: return "Qu";
    case 24: return "an";
    case 50: return "An";
    case 25: return "ji";
    case 51: return "Ji";
    case 30: return "I";
    case 31: return "W";
    case 32: return "K";
    case 40: return "Y";
    case 42: return "X";
    default: return sLetter;
    }
    return "";
}//end ConvertDraconic

string ProcessDraconic(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertDraconic(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertDwarf(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "az";
    case 26: return "Az";
    case 1: return "po";
    case 27: return "Po";
    case 2: return "zi";
    case 28: return "Zi";
    case 3: return "t";
    case 4: return "a";
    case 5: return "wa";
    case 31: return "Wa";
    case 6: return "k";
    case 7: return "'";
    case 8: return "a";
    case 9: return "dr";
    case 35: return "Dr";
    case 10: return "g";
    case 11: return "n";
    case 12: return "l";
    case 13: return "r";
    case 14: return "ur";
    case 40: return "Ur";
    case 15: return "rh";
    case 41: return "Rh";
    case 16: return "k";
    case 17: return "h";
    case 18: return "th";
    case 44: return "Th";
    case 19: return "k";
    case 20: return "'";
    case 21: return "g";
    case 22: return "zh";
    case 48: return "Zh";
    case 23: return "q";
    case 24: return "o";
    case 25: return "j";
    case 29: return "T";
    case 30: return "A";
    case 32: return "K";
    case 33: return "'";
    case 34: return "A";
    case 36: return "G";
    case 37: return "N";
    case 38: return "L";
    case 39: return "R";
    case 42: return "K";
    case 43: return "H";
    case 45: return "K";
    case 46: return "'";
    case 47: return "G";
    case 49: return "Q";
    case 50: return "O";
    case 51: return "J";
    default: return sLetter; } return "";
}//end ConvertDwarf

string ProcessDwarf(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertDwarf(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertElven(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "il";
    case 26: return "Il";
    case 1: return "f";
    case 2: return "ny";
    case 28: return "Ny";
    case 3: return "w";
    case 4: return "a";
    case 5: return "o";
    case 6: return "v";
    case 7: return "ir";
    case 33: return "Ir";
    case 8: return "e";
    case 9: return "qu";
    case 35: return "Qu";
    case 10: return "n";
    case 11: return "c";
    case 12: return "s";
    case 13: return "l";
    case 14: return "e";
    case 15: return "ty";
    case 41: return "Ty";
    case 16: return "h";
    case 17: return "m";
    case 18: return "la";
    case 44: return "La";
    case 19: return "an";
    case 45: return "An";
    case 20: return "y";
    case 21: return "el";
    case 47: return "El";
    case 22: return "am";
    case 48: return "Am";
    case 23: return "'";
    case 24: return "a";
    case 25: return "j";

    case 27: return "F";
    case 29: return "W";
    case 30: return "A";
    case 31: return "O";
    case 32: return "V";
    case 34: return "E";
    case 36: return "N";
    case 37: return "C";
    case 38: return "S";
    case 39: return "L";
    case 40: return "E";
    case 42: return "H";
    case 43: return "M";
    case 46: return "Y";
    case 49: return "'";
    case 50: return "A";
    case 51: return "J";

    default: return sLetter; } return "";
}

string ProcessElven(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertElven(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertGnome(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
//cipher based on English -> Al Baed
    case 0: return "y";
    case 1: return "p";
    case 2: return "l";
    case 3: return "t";
    case 4: return "a";
    case 5: return "v";
    case 6: return "k";
    case 7: return "r";
    case 8: return "e";
    case 9: return "z";
    case 10: return "g";
    case 11: return "m";
    case 12: return "s";
    case 13: return "h";
    case 14: return "u";
    case 15: return "b";
    case 16: return "x";
    case 17: return "n";
    case 18: return "c";
    case 19: return "d";
    case 20: return "i";
    case 21: return "j";
    case 22: return "f";
    case 23: return "q";
    case 24: return "o";
    case 25: return "w";

    case 26: return "Y";
    case 27: return "P";
    case 28: return "L";
    case 29: return "T";
    case 30: return "A";
    case 31: return "V";
    case 32: return "K";
    case 33: return "R";
    case 34: return "E";
    case 35: return "Z";
    case 36: return "G";
    case 37: return "M";
    case 38: return "S";
    case 39: return "H";
    case 40: return "U";
    case 41: return "B";
    case 42: return "X";
    case 43: return "N";
    case 44: return "C";
    case 45: return "D";
    case 46: return "I";
    case 47: return "J";
    case 48: return "F";
    case 49: return "Q";
    case 50: return "O";
    case 51: return "W";
    default: return sLetter; } return "";
}

string ProcessGnome(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertGnome(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertHalfling(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
//cipher based on Al Baed -> English
    case 0: return "e";
    case 1: return "p";
    case 2: return "s";
    case 3: return "t";
    case 4: return "i";
    case 5: return "w";
    case 6: return "k";
    case 7: return "n";
    case 8: return "u";
    case 9: return "v";
    case 10: return "g";
    case 11: return "c";
    case 12: return "l";
    case 13: return "r";
    case 14: return "y";
    case 15: return "b";
    case 16: return "x";
    case 17: return "h";
    case 18: return "m";
    case 19: return "d";
    case 20: return "o";
    case 21: return "f";
    case 22: return "z";
    case 23: return "q";
    case 24: return "a";
    case 25: return "j";

    case 26: return "E";
    case 27: return "P";
    case 28: return "S";
    case 29: return "T";
    case 30: return "I";
    case 31: return "W";
    case 32: return "K";
    case 33: return "N";
    case 34: return "U";
    case 35: return "V";
    case 36: return "G";
    case 37: return "C";
    case 38: return "L";
    case 39: return "R";
    case 40: return "Y";
    case 41: return "B";
    case 42: return "X";
    case 43: return "H";
    case 44: return "M";
    case 45: return "D";
    case 46: return "O";
    case 47: return "F";
    case 48: return "Z";
    case 49: return "Q";
    case 50: return "A";
    case 51: return "J";
    default: return sLetter; } return "";
}

string ProcessHalfling(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertHalfling(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertOrc(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "ha";
    case 26: return "Ha";
    case 1: return "p";
    case 2: return "z";
    case 3: return "t";
    case 4: return "o";
    case 5: return "";
    case 6: return "k";
    case 7: return "r";
    case 8: return "a";
    case 9: return "m";
    case 10: return "g";
    case 11: return "h";
    case 12: return "r";
    case 13: return "k";
    case 14: return "u";
    case 15: return "b";
    case 16: return "k";
    case 17: return "h";
    case 18: return "g";
    case 19: return "n";
    case 20: return "";
    case 21: return "g";
    case 22: return "r";
    case 23: return "r";
    case 24: return "'";
    case 25: return "m";
    case 27: return "P";
    case 28: return "Z";
    case 29: return "T";
    case 30: return "O";
    case 31: return "";
    case 32: return "K";
    case 33: return "R";
    case 34: return "A";
    case 35: return "M";
    case 36: return "G";
    case 37: return "H";
    case 38: return "R";
    case 39: return "K";
    case 40: return "U";
    case 41: return "B";
    case 42: return "K";
    case 43: return "H";
    case 44: return "G";
    case 45: return "N";
    case 46: return "";
    case 47: return "G";
    case 48: return "R";
    case 49: return "R";
    case 50: return "'";
    case 51: return "M";
    default: return sLetter; } return "";
}

string ProcessOrc(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertOrc(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertAnimal(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
    case 0: return "'";
    case 1: return "'";
    case 2: return "'";
    case 3: return "'";
    case 4: return "'";
    case 5: return "'";
    case 6: return "'";
    case 7: return "'";
    case 8: return "'";
    case 9: return "'";
    case 10: return "'";
    case 11: return "'";
    case 12: return "'";
    case 13: return "'";
    case 14: return "'";
    case 15: return "'";
    case 16: return "'";
    case 17: return "'";
    case 18: return "'";
    case 19: return "'";
    case 20: return "'";
    case 21: return "'";
    case 22: return "'";
    case 23: return "'";
    case 24: return "'";
    case 25: return "'";
    case 26: return "'";
    case 27: return "'";
    case 28: return "'";
    case 29: return "'";
    case 30: return "'";
    case 31: return "'";
    case 32: return "'";
    case 33: return "'";
    case 34: return "'";
    case 35: return "'";
    case 36: return "'";
    case 37: return "'";
    case 38: return "'";
    case 39: return "'";
    case 40: return "'";
    case 41: return "'";
    case 42: return "'";
    case 43: return "'";
    case 44: return "'";
    case 45: return "'";
    case 46: return "'";
    case 47: return "'";
    case 48: return "'";
    case 49: return "'";
    case 50: return "'";
    case 51: return "'";
    default: return sLetter; } return "";
}

string ProcessAnimal(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertAnimal(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ProcessCant(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);

    if (sLetter == "a" || sLetter == "A") return CANT_A;
    if (sLetter == "b" || sLetter == "B") return CANT_B;
    if (sLetter == "c" || sLetter == "C") return CANT_C;
    if (sLetter == "d" || sLetter == "D") return CANT_D;
    if (sLetter == "e" || sLetter == "E") return CANT_E;
    if (sLetter == "f" || sLetter == "F") return CANT_F;
    if (sLetter == "g" || sLetter == "G") return CANT_G;
    if (sLetter == "h" || sLetter == "H") return CANT_H;
    if (sLetter == "i" || sLetter == "I") return CANT_I;
    if (sLetter == "j" || sLetter == "J") return CANT_J;
    if (sLetter == "k" || sLetter == "K") return CANT_K;
    if (sLetter == "l" || sLetter == "L") return CANT_L;
    if (sLetter == "m" || sLetter == "M") return CANT_M;
    if (sLetter == "n" || sLetter == "N") return CANT_N;
    if (sLetter == "o" || sLetter == "O") return CANT_O;
    if (sLetter == "p" || sLetter == "P") return CANT_P;
    if (sLetter == "q" || sLetter == "Q") return CANT_Q;
    if (sLetter == "r" || sLetter == "R") return CANT_R;
    if (sLetter == "s" || sLetter == "S") return CANT_S;
    if (sLetter == "t" || sLetter == "T") return CANT_T;
    if (sLetter == "u" || sLetter == "U") return CANT_U;
    if (sLetter == "v" || sLetter == "V") return CANT_V;
    if (sLetter == "w" || sLetter == "W") return CANT_W;
    if (sLetter == "x" || sLetter == "X") return CANT_X;
    if (sLetter == "y" || sLetter == "Y") return CANT_Y;
    if (sLetter == "z" || sLetter == "Z") return CANT_Z;

    return LANG_DEFAULT;
}
//void main(){}
