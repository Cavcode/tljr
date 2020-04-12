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

string ConvertTroll(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "oo";
        case 1: return "g";
        case 2: return "lo";
        case 3: return "r";
        case 4: return "un";
        case 5: return "b";
        case 6: return "ag";
        case 7: return "aw";
        case 8: return "a";
        case 9: return "h";
        case 10: return "h";
        case 11: return "r";
        case 12: return "m";
        case 13: return "wa";
        case 14: return "a";
        case 15: return "ha";
        case 16: return "or";
        case 17: return "ug";
        case 18: return "ar";
        case 19: return "g";
        case 20: return "ee";
        case 21: return "m";
        case 22: return "ar";
        case 23: return "l";
        case 24: return "im";
        case 25: return "h";
        case 26: return "Oo";
        case 27: return "G";
        case 28: return "Lo";
        case 29: return "R";
        case 30: return "Un";
        case 31: return "B";
        case 32: return "Ag";
        case 33: return "Aw";
        case 34: return "A";
        case 35: return "H";
        case 36: return "H";
        case 37: return "R";
        case 38: return "M";
        case 39: return "Wa";
        case 40: return "A";
        case 41: return "Ha";
        case 42: return "Or";
        case 43: return "Ug";
        case 44: return "Ar";
        case 45: return "G";
        case 46: return "Ee";
        case 47: return "M";
        case 48: return "Ar";
        case 49: return "L";
        case 50: return "Im";
        case 51: return "H";
        default: return sLetter;
    }
    return "";
}

string ProcessTroll(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertTroll(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertThriKreen(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "'t'";
        case 1: return "cr";
        case 2: return "ch";
        case 3: return "r";
        case 4: return "'sk";
        case 5: return "sh";
        case 6: return "sk";
        case 7: return "ik";
        case 8: return "ss";
        case 9: return "rr";
        case 10: return "ck";
        case 11: return "rr";
        case 12: return "t";
        case 13: return "zz";
        case 14: return "ack";
        case 15: return "sp";
        case 16: return "kr";
        case 17: return "ix";
        case 18: return "k";
        case 19: return "p";
        case 20: return "'";
        case 21: return "v";
        case 22: return "chr";
        case 23: return "ta";
        case 24: return "w";
        case 25: return "z";
        case 26: return "'T'";
        case 27: return "Cr";
        case 28: return "Ch";
        case 29: return "R";
        case 30: return "'sk";
        case 31: return "Sh";
        case 32: return "Sk";
        case 33: return "Ik";
        case 34: return "Ss";
        case 35: return "Rr";
        case 36: return "Ck";
        case 37: return "Rr";
        case 38: return "T";
        case 39: return "Zz";
        case 40: return "Ack";
        case 41: return "Sp";
        case 42: return "Kr";
        case 43: return "Ix";
        case 44: return "K";
        case 45: return "P";
        case 46: return "'";
        case 47: return "V";
        case 48: return "Chr";
        case 49: return "Ta";
        case 50: return "W";
        case 51: return "Z";
        default: return sLetter;
    }
    return "";
}

string ProcessThriKreen(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertThriKreen(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertGrimlock(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "i";
        case 1: return "bu";
        case 2: return "c";
        case 3: return "ti";
        case 4: return "e";
        case 5: return "ch";
        case 6: return "j";
        case 7: return "";
        case 8: return "aa";
        case 9: return "t";
        case 10: return "C’k";
        case 11: return "k’";
        case 12: return "ti";
        case 13: return "K’k";
        case 14: return "eo";
        case 15: return "ch";
        case 16: return "";
        case 17: return "r";
        case 18: return "k";
        case 19: return "kk";
        case 20: return "oo";
        case 21: return "cl";
        case 22: return "q";
        case 23: return "z";
        case 24: return "e";
        case 25: return "z";
        case 26: return "I";
        case 27: return "Bu";
        case 28: return "C";
        case 29: return "Ti";
        case 30: return "E";
        case 31: return "Ch";
        case 32: return "J";
        case 33: return "";
        case 34: return "Aa";
        case 35: return "T";
        case 36: return "Ck";
        case 37: return "K’";
        case 38: return "Ti";
        case 39: return "Kk’";
        case 40: return "Eo";
        case 41: return "Ch";
        case 42: return "";
        case 43: return "R";
        case 44: return "K";
        case 45: return "Kk";
        case 46: return "Oo";
        case 47: return "Cl";
        case 48: return "Q";
        case 49: return "Z";
        case 50: return "E";
        case 51: return "Z";
        default: return sLetter;
    }
    return "";
}

string ProcessGrimlock(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertGrimlock(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertHalfOrc(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "ae";
        case 1: return "b";
        case 2: return "k";
        case 3: return "d";
        case 4: return "u";
        case 5: return "f";
        case 6: return "g";
        case 7: return "";
        case 8: return "e";
        case 9: return "g";
        case 10: return "k";
        case 11: return "l";
        case 12: return "m";
        case 13: return "n";
        case 14: return "u";
        case 15: return "b";
        case 16: return "k";
        case 17: return "r";
        case 18: return "s";
        case 19: return "d";
        case 20: return "o";
        case 21: return "f";
        case 22: return "";
        case 23: return "ks";
        case 24: return "ee";
        case 25: return "sh";
        case 26: return "AE";
        case 27: return "B";
        case 28: return "K";
        case 29: return "D";
        case 30: return "U";
        case 31: return "F";
        case 32: return "G";
        case 33: return "";
        case 34: return "E";
        case 35: return "G";
        case 36: return "K";
        case 37: return "L";
        case 38: return "M";
        case 39: return "N";
        case 40: return "U";
        case 41: return "B";
        case 42: return "K";
        case 43: return "R";
        case 44: return "S";
        case 45: return "D";
        case 46: return "O";
        case 47: return "F";
        case 48: return "";
        case 49: return "Ks";
        case 50: return "Ee";
        case 51: return "Sh";
        default: return sLetter;
    }
    return "";
}

string ProcessHalfOrc(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertHalfOrc(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertKuoToan(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "bo";
        case 2: return "ch";
        case 3: return "b";
        case 4: return "o";
        case 5: return "cr";
        case 6: return "go";
        case 7: return "u";
        case 8: return "oa";
        case 9: return "urg";
        case 10: return "cro";
        case 11: return "l";
        case 12: return "t";
        case 13: return "a";
        case 14: return "a";
        case 15: return "po";
        case 16: return "kr";
        case 17: return "ak";
        case 18: return "g";
        case 19: return "k";
        case 20: return "ou";
        case 21: return "v";
        case 22: return "b";
        case 23: return "ta";
        case 24: return "ku";
        case 25: return "z";
        case 26: return "U";
        case 27: return "Bo";
        case 28: return "Ch";
        case 29: return "B";
        case 30: return "O";
        case 31: return "Cr";
        case 32: return "Go";
        case 33: return "U";
        case 34: return "Oa";
        case 35: return "Urg";
        case 36: return "Cro";
        case 37: return "L";
        case 38: return "T";
        case 39: return "A";
        case 40: return "A";
        case 41: return "Po";
        case 42: return "Kr";
        case 43: return "Ak";
        case 44: return "G";
        case 45: return "K";
        case 46: return "Ou";
        case 47: return "V";
        case 48: return "B";
        case 49: return "Ta";
        case 50: return "Ku";
        case 51: return "Z";
        default: return sLetter;
    }
    return "";
}

string ProcessKuoToan(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertKuoToan(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertKenderspeak(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "ay";
        case 1: return "b";
        case 2: return "l";
        case 3: return "dt";
        case 4: return "i";
        case 5: return "v";
        case 6: return "j";
        case 7: return "'";
        case 8: return "ee";
        case 9: return "pt";
        case 10: return "k";
        case 11: return "h";
        case 12: return "my";
        case 13: return "ny";
        case 14: return "oo";
        case 15: return "p";
        case 16: return "k";
        case 17: return "s";
        case 18: return "r";
        case 19: return "p";
        case 20: return "ew";
        case 21: return "v";
        case 22: return "v";
        case 23: return "s";
        case 24: return "ey";
        case 25: return "k";
        case 26: return "Ay";
        case 27: return "B";
        case 28: return "L";
        case 29: return "Dt";
        case 30: return "I";
        case 31: return "V";
        case 32: return "J";
        case 33: return "";
        case 34: return "Ee";
        case 35: return "Pt";
        case 36: return "K";
        case 37: return "H";
        case 38: return "My";
        case 39: return "Ny";
        case 40: return "Oo";
        case 41: return "P";
        case 42: return "K";
        case 43: return "S";
        case 44: return "R";
        case 45: return "P";
        case 46: return "Ew";
        case 47: return "V";
        case 48: return "V";
        case 49: return "S";
        case 50: return "Ey";
        case 51: return "K";
        default: return sLetter;
    }
    return "";
}

string ProcessKenderspeak(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertKenderspeak(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertMinotaur(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "a";
        case 1: return "ai";
        case 2: return "s";
        case 3: return "h";
        case 4: return "i";
        case 5: return "t";
        case 6: return "b";
        case 7: return "f";
        case 8: return "u";
        case 9: return "r";
        case 10: return "k";
        case 11: return "ug";
        case 12: return "sh";
        case 13: return "l";
        case 14: return "gh";
        case 15: return "y";
        case 16: return "z";
        case 17: return "ra";
        case 18: return "mo";
        case 19: return "n";
        case 20: return "";
        case 21: return "un";
        case 22: return "oo";
        case 23: return "";
        case 24: return "la";
        case 25: return "dz";
        case 26: return "A";
        case 27: return "Ai";
        case 28: return "S";
        case 29: return "H";
        case 30: return "I";
        case 31: return "T";
        case 32: return "B";
        case 33: return "F";
        case 34: return "U";
        case 35: return "R";
        case 36: return "K";
        case 37: return "Ug";
        case 38: return "Sh";
        case 39: return "L";
        case 40: return "Gh";
        case 41: return "Y";
        case 42: return "Z";
        case 43: return "Ra";
        case 44: return "Mo";
        case 45: return "N";
        case 46: return "'";
        case 47: return "Un";
        case 48: return "Oo";
        case 49: return "";
        case 50: return "La";
        case 51: return "Dz";
        default: return sLetter;
    }
    return "";
}

string ProcessMinotaur(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertMinotaur(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertRakshasa(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "o";
        case 1: return "p";
        case 2: return "s";
        case 3: return "";
        case 4: return "ea";
        case 5: return "m";
        case 6: return "r'";
        case 7: return "au";
        case 8: return "ui";
        case 9: return "";
        case 10: return "g";
        case 11: return "r";
        case 12: return "h";
        case 13: return "l";
        case 14: return "a";
        case 15: return "p";
        case 16: return "";
        case 17: return "gr";
        case 18: return "w";
        case 19: return "r";
        case 20: return "ou";
        case 21: return "u";
        case 22: return "ge";
        case 23: return "rs";
        case 24: return "e";
        case 25: return "ss";
        case 26: return "O";
        case 27: return "P";
        case 28: return "S";
        case 29: return "'";
        case 30: return "Ea";
        case 31: return "M";
        case 32: return "Rr";
        case 33: return "Au";
        case 34: return "Oe";
        case 35: return "";
        case 36: return "G";
        case 37: return "R";
        case 38: return "H";
        case 39: return "L";
        case 40: return "A";
        case 41: return "P";
        case 42: return "";
        case 43: return "Gr";
        case 44: return "W";
        case 45: return "R";
        case 46: return "Ow";
        case 47: return "U";
        case 48: return "Ge";
        case 49: return "Rs";
        case 50: return "E";
        case 51: return "Ss";
        default: return sLetter;
    }
    return "";
}

string ProcessRakshasa(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertRakshasa(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertStinger(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "as";
        case 1: return "bi";
        case 2: return "";
        case 3: return "";
        case 4: return "iss";
        case 5: return "en";
        case 6: return "ga";
        case 7: return "h";
        case 8: return "iss";
        case 9: return "";
        case 10: return "ka";
        case 11: return "l";
        case 12: return "mm";
        case 13: return "nn";
        case 14: return "os";
        case 15: return "pe";
        case 16: return "ke";
        case 17: return "";
        case 18: return "ess";
        case 19: return "T";
        case 20: return "us";
        case 21: return "v";
        case 22: return "";
        case 23: return "z";
        case 24: return "yss";
        case 25: return "z";
        case 26: return "As";
        case 27: return "Bi";
        case 28: return "";
        case 29: return "";
        case 30: return "Iss";
        case 31: return "En";
        case 32: return "Ga";
        case 33: return "H";
        case 34: return "Iss";
        case 35: return "";
        case 36: return "Ka";
        case 37: return "L";
        case 38: return "Mm";
        case 39: return "Nn";
        case 40: return "Os";
        case 41: return "Pe";
        case 42: return "Ke";
        case 43: return "";
        case 44: return "Ess";
        case 45: return "TT";
        case 46: return "us";
        case 47: return "V";
        case 48: return "";
        case 49: return "Z";
        case 50: return "Yss";
        case 51: return "Z";
        default: return sLetter;
    }
    return "";
}

string ProcessStinger(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertStinger(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertLizardMan(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "sa";
        case 1: return "pr";
        case 2: return "k";
        case 3: return "st";
        case 4: return "ey";
        case 5: return "v";
        case 6: return "a";
        case 7: return "‘";
        case 8: return "i";
        case 9: return "huss";
        case 10: return "ct";
        case 11: return "d";
        case 12: return "vr";
        case 13: return "et";
        case 14: return "ee";
        case 15: return "dr";
        case 16: return "ki";
        case 17: return "rr";
        case 18: return "sz";
        case 19: return "sh";
        case 20: return "i";
        case 21: return "r";
        case 22: return "rr";
        case 23: return "";
        case 24: return "k";
        case 25: return "ss";
        case 26: return "Za";
        case 27: return "Pr";
        case 28: return "Kz";
        case 29: return "St";
        case 30: return "Hr";
        case 31: return "Vs";
        case 32: return "Asz";
        case 33: return "S";
        case 34: return "Ye";
        case 35: return "Vr";
        case 36: return "Gi’";
        case 37: return "D";
        case 38: return "Vr";
        case 39: return "Te";
        case 40: return "Sur";
        case 41: return "Dr";
        case 42: return "Ki";
        case 43: return "Rr";
        case 44: return "Sz";
        case 45: return "Ba’";
        case 46: return "Ou";
        case 47: return "Fr";
        case 48: return "Huo";
        case 49: return "";
        case 50: return "Ee’";
        case 51: return "Ss";
        default: return sLetter;
    }
    return "";
}

string ProcessLizardMan(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertLizardMan(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertIllithid(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "b";
        case 2: return "wo";
        case 3: return "ma";
        case 4: return "ga";
        case 5: return "wah";
        case 6: return "um";
        case 7: return "wa";
        case 8: return "aba";
        case 9: return "gu";
        case 10: return "bah";
        case 11: return "lo";
        case 12: return "m";
        case 13: return "ba";
        case 14: return "ub";
        case 15: return "ru";
        case 16: return "u";
        case 17: return "m";
        case 18: return "mur";
        case 19: return "g";
        case 20: return "bu";
        case 21: return "g";
        case 22: return "b";
        case 23: return "g";
        case 24: return "y";
        case 25: return "g";
        case 26: return "U";
        case 27: return "B";
        case 28: return "Wo";
        case 29: return "Ma";
        case 30: return "Ga";
        case 31: return "Wah";
        case 32: return "Um";
        case 33: return "Wa";
        case 34: return "Aba";
        case 35: return "Gu";
        case 36: return "Bah";
        case 37: return "Ol";
        case 38: return "M";
        case 39: return "Ba";
        case 40: return "Ub";
        case 41: return "Ru";
        case 42: return "U";
        case 43: return "M";
        case 44: return "Mur";
        case 45: return "G";
        case 46: return "Bu";
        case 47: return "G";
        case 48: return "B";
        case 49: return "G";
        case 50: return "Y";
        case 51: return "G";
        default: return sLetter;
    }
    return "";
}

string ProcessIllithid(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertIllithid(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertHobgoblin(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "o";
        case 1: return "l";
        case 2: return "t";
        case 3: return "da";
        case 4: return "a";
        case 5: return "v";
        case 6: return "b";
        case 7: return "r";
        case 8: return "a";
        case 9: return "f";
        case 10: return "kk";
        case 11: return "n";
        case 12: return "m";
        case 13: return "r";
        case 14: return "o";
        case 15: return "b";
        case 16: return "z";
        case 17: return "t";
        case 18: return "z";
        case 19: return "k";
        case 20: return "a";
        case 21: return "j";
        case 22: return "kka";
        case 23: return "ck";
        case 24: return "ga";
        case 25: return "ch";
        case 26: return "I";
        case 27: return "L";
        case 28: return "T";
        case 29: return "Da";
        case 30: return "A";
        case 31: return "V";
        case 32: return "B";
        case 33: return "R";
        case 34: return "Ae";
        case 35: return "F";
        case 36: return "Kr";
        case 37: return "N";
        case 38: return "M";
        case 39: return "G";
        case 40: return "O";
        case 41: return "B";
        case 42: return "Z";
        case 43: return "L";
        case 44: return "Z";
        case 45: return "K";
        case 46: return "E";
        case 47: return "J";
        case 48: return "Ch";
        case 49: return "Cho";
        case 50: return "V";
        case 51: return "Ch";
        default: return sLetter;
    }
    return "";
}

string ProcessHobgoblin(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertHobgoblin(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertDuergar(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "ao";
        case 1: return "ba";
        case 2: return "ch";
        case 3: return "ed";
        case 4: return "eo";
        case 5: return "ph";
        case 6: return "gah";
        case 7: return "oo";
        case 8: return "e";
        case 9: return "je";
        case 10: return "poo";
        case 11: return "";
        case 12: return "ke";
        case 13: return "qe";
        case 14: return "";
        case 15: return "pe";
        case 16: return "h";
        case 17: return "rag";
        case 18: return "";
        case 19: return "au";
        case 20: return "";
        case 21: return "m";
        case 22: return "u";
        case 23: return "ke";
        case 24: return "ee";
        case 25: return "op";
        case 26: return "Ao";
        case 27: return "Ba";
        case 28: return "Ch";
        case 29: return "Ed";
        case 30: return "Eo";
        case 31: return "Ph";
        case 32: return "Gah";
        case 33: return "Oo";
        case 34: return "E";
        case 35: return "Je";
        case 36: return "Poo";
        case 37: return "";
        case 38: return "Ke";
        case 39: return "Qe";
        case 40: return "";
        case 41: return "Pe";
        case 42: return "H";
        case 43: return "Rag";
        case 44: return "";
        case 45: return "Au";
        case 46: return "";
        case 47: return "M";
        case 48: return "U";
        case 49: return "Ke";
        case 50: return "Ee";
        case 51: return "Op";
        default: return sLetter;
    }
    return "";
}

string ProcessDuergar(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertDuergar(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertBugBear(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "aa";
        case 1: return "bom";
        case 2: return "hh";
        case 3: return "doh";
        case 4: return "eh";
        case 5: return "fuu";
        case 6: return "hh";
        case 7: return "hm";
        case 8: return "hh";
        case 9: return "ju";
        case 10: return "hh";
        case 11: return "loo";
        case 12: return "m";
        case 13: return "m";
        case 14: return "oo";
        case 15: return "puh";
        case 16: return "hh";
        case 17: return "rr";
        case 18: return "hh";
        case 19: return "hh";
        case 20: return "uun";
        case 21: return "hh";
        case 22: return "wah";
        case 23: return "hh";
        case 24: return "yum";
        case 25: return "hh";
        case 26: return "Hma";
        case 27: return "Hom";
        case 28: return "Hh";
        case 29: return "Hoh";
        case 30: return "Heh";
        case 31: return "Hu";
        case 32: return "Hh";
        case 33: return "Hm";
        case 34: return "Hh";
        case 35: return "Hhu";
        case 36: return "Hh";
        case 37: return "Loo";
        case 38: return "Hm";
        case 39: return "H";
        case 40: return "Hoo";
        case 41: return "Huh";
        case 42: return "Hh";
        case 43: return "Hrr";
        case 44: return "Hh";
        case 45: return "Hh";
        case 46: return "Hun";
        case 47: return "Hh";
        case 48: return "Hah";
        case 49: return "Hh";
        case 50: return "Hum";
        case 51: return "Hh";
        default: return sLetter;
    }
    return "";
}

string ProcessBugBear(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertBugBear(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertGithzerai(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "e";
        case 1: return "y";
        case 2: return "";
        case 3: return "b";
        case 4: return "i'";
        case 5: return "";
        case 6: return "d";
        case 7: return "g";
        case 8: return "o";
        case 9: return "";
        case 10: return "";
        case 11: return "h";
        case 12: return "mm";
        case 13: return "ny";
        case 14: return "a'";
        case 15: return "";
        case 16: return "l";
        case 17: return "";
        case 18: return "";
        case 19: return "";
        case 20: return "";
        case 21: return "r";
        case 22: return "";
        case 23: return "";
        case 24: return "w";
        case 25: return "";
        case 26: return "E";
        case 27: return "Y";
        case 28: return "";
        case 29: return "B";
        case 30: return "I";
        case 31: return "";
        case 32: return "D";
        case 33: return "G";
        case 34: return "O";
        case 35: return "";
        case 36: return "";
        case 37: return "H";
        case 38: return "M";
        case 39: return "N";
        case 40: return "A";
        case 41: return "";
        case 42: return "L";
        case 43: return "";
        case 44: return "";
        case 45: return "";
        case 46: return "";
        case 47: return "R";
        case 48: return "";
        case 49: return "";
        case 50: return "W";
        case 51: return "";
        default: return sLetter;
    }
    return "";
}

string ProcessGithzerai(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertGithzerai(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertKorred(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "eu";
        case 1: return "r";
        case 2: return "k";
        case 3: return "c";
        case 4: return "o";
        case 5: return "g";
        case 6: return "j";
        case 7: return "ch";
        case 8: return "ei";
        case 9: return "gu";
        case 10: return "chk";
        case 11: return "f";
        case 12: return "n";
        case 13: return "m";
        case 14: return "ue";
        case 15: return "q";
        case 16: return "k";
        case 17: return "g";
        case 18: return "z";
        case 19: return "d";
        case 20: return "i";
        case 21: return "x";
        case 22: return "u";
        case 23: return "l ";
        case 24: return "e";
        case 25: return "q";
        case 26: return "Eu";
        case 27: return "R";
        case 28: return "K";
        case 29: return "C";
        case 30: return "O";
        case 31: return "G";
        case 32: return "J";
        case 33: return "Ch";
        case 34: return "Ei";
        case 35: return "Gu";
        case 36: return "Chk";
        case 37: return "F";
        case 38: return "N";
        case 39: return "M";
        case 40: return "Ue";
        case 41: return "Q";
        case 42: return "K";
        case 43: return "G";
        case 44: return "Z";
        case 45: return "D";
        case 46: return "I";
        case 47: return "X";
        case 48: return "U";
        case 49: return "L ";
        case 50: return "E";
        case 51: return "Q";
        default: return sLetter;
    }
    return "";
}

string ProcessKorred(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertKorred(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertSahaguin(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "z";
        case 1: return "";
        case 2: return "h";
        case 3: return "e";
        case 4: return "u";
        case 5: return "'";
        case 6: return "h";
        case 7: return "'";
        case 8: return "oho'";
        case 9: return "g";
        case 10: return "k'k'";
        case 11: return "s";
        case 12: return "s";
        case 13: return "h";
        case 14: return "yfa'";
        case 15: return "-";
        case 16: return "xz";
        case 17: return "av";
        case 18: return "m";
        case 19: return "k";
        case 20: return "w";
        case 21: return "'Bha";
        case 22: return "yy";
        case 23: return "cras";
        case 24: return "ee";
        case 25: return "Mys";
        case 26: return "S";
        case 27: return "S'";
        case 28: return "Q";
        case 29: return "Ge";
        case 30: return "T";
        case 31: return "";
        case 32: return "Yi";
        case 33: return "-";
        case 34: return "Y";
        case 35: return "H'i";
        case 36: return "T";
        case 37: return "Tra";
        case 38: return "Ii";
        case 39: return "I";
        case 40: return "";
        case 41: return "";
        case 42: return "W";
        case 43: return "Hss'";
        case 44: return "M";
        case 45: return "Kh";
        case 46: return "Oo";
        case 47: return "Bh";
        case 48: return "'us";
        case 49: return "Eaya";
        case 50: return "Fhr";
        case 51: return "Wt";
        default: return sLetter;
    }
    return "";
}

string ProcessSahaguin(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertSahaguin(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertYuanTi(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "au";
        case 1: return "c";
        case 2: return "c";
        case 3: return "sp";
        case 4: return "i";
        case 5: return "ish";
        case 6: return "ash";
        case 7: return "s";
        case 8: return "ou";
        case 9: return "hi";
        case 10: return "'s";
        case 11: return "si";
        case 12: return "li";
        case 13: return "ah";
        case 14: return "a";
        case 15: return "s";
        case 16: return "l";
        case 17: return "h";
        case 18: return "ss";
        case 19: return "ti";
        case 20: return "i";
        case 21: return "v";
        case 22: return "h";
        case 23: return "ch";
        case 24: return "y";
        case 25: return "y";
        case 26: return "Au";
        case 27: return "C";
        case 28: return "C";
        case 29: return "Sp";
        case 30: return "I";
        case 31: return "Ish";
        case 32: return "Ash";
        case 33: return "S";
        case 34: return "Iss";
        case 35: return "Hi";
        case 36: return "S'";
        case 37: return "Si";
        case 38: return "Li";
        case 39: return "Ah";
        case 40: return "A";
        case 41: return "S";
        case 42: return "L";
        case 43: return "H";
        case 44: return "Ss";
        case 45: return "Ti";
        case 46: return "I";
        case 47: return "V";
        case 48: return "H";
        case 49: return "Ch";
        case 50: return "Y";
        case 51: return "Y";
        default: return sLetter;
    }
    return "";
}

string ProcessYuanTi(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertYuanTi(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertPixie(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "eg";
        case 1: return "o";
        case 2: return "s";
        case 3: return "";
        case 4: return "it";
        case 5: return "th";
        case 6: return "oo";
        case 7: return "n";
        case 8: return "e";
        case 9: return "ta";
        case 10: return "";
        case 11: return "an";
        case 12: return "a";
        case 13: return "ei";
        case 14: return "i";
        case 15: return "k";
        case 16: return "ca";
        case 17: return "t";
        case 18: return "l";
        case 19: return "m";
        case 20: return "ya";
        case 21: return "d";
        case 22: return "v";
        case 23: return "p";
        case 24: return "ni";
        case 25: return "z";
        case 26: return "Eg";
        case 27: return "O";
        case 28: return "S";
        case 29: return "'";
        case 30: return "It";
        case 31: return "Th";
        case 32: return "Oo";
        case 33: return "N";
        case 34: return "E";
        case 35: return "Ta";
        case 36: return "'";
        case 37: return "An";
        case 38: return "A";
        case 39: return "Ei";
        case 40: return "I";
        case 41: return "K";
        case 42: return "Ca";
        case 43: return "T";
        case 44: return "L";
        case 45: return "M";
        case 46: return "Ya";
        case 47: return "D";
        case 48: return "V";
        case 49: return "P";
        case 50: return "Ni";
        case 51: return "Z";
        default: return sLetter;
    }
    return "";
}

string ProcessPixie(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertPixie(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertMagic(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "m";
        case 2: return "se";
        case 3: return "p";
        case 4: return "i";
        case 5: return "";
        case 6: return "r";
        case 7: return "a";
        case 8: return "i";
        case 9: return "s";
        case 10: return "l";
        case 11: return "sh";
        case 12: return "ra";
        case 13: return "n";
        case 14: return "a";
        case 15: return "sh";
        case 16: return "is";
        case 17: return "g";
        case 18: return "es";
        case 19: return "b";
        case 20: return "oo";
        case 21: return "e";
        case 22: return "u";
        case 23: return "he";
        case 24: return "e";
        case 25: return "";
        case 26: return "U";
        case 27: return "M";
        case 28: return "Se";
        case 29: return "P";
        case 30: return "I";
        case 31: return "";
        case 32: return "R";
        case 33: return "A";
        case 34: return "I";
        case 35: return "S";
        case 36: return "L";
        case 37: return "Sh";
        case 38: return "Ra";
        case 39: return "n";
        case 40: return "A";
        case 41: return "Sh";
        case 42: return "Is";
        case 43: return "G";
        case 44: return "Es";
        case 45: return "B";
        case 46: return "Oo";
        case 47: return "E";
        case 48: return "U";
        case 49: return "He";
        case 50: return "E";
        case 51: return "";
        default: return sLetter;
    }
    return "";
}

string ProcessMagic(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertMagic(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertSirenSong(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "s";
        case 2: return "sa";
        case 3: return "ro";
        case 4: return "e";
        case 5: return "le";
        case 6: return "lo";
        case 7: return "ya";
        case 8: return "a";
        case 9: return "li";
        case 10: return "na";
        case 11: return "n";
        case 12: return "se";
        case 13: return "y";
        case 14: return "e";
        case 15: return "ze";
        case 16: return "yu";
        case 17: return "lo";
        case 18: return "la";
        case 19: return "re";
        case 20: return "i";
        case 21: return "so";
        case 22: return "sh";
        case 23: return "la";
        case 24: return "re";
        case 25: return "si";
        case 26: return "U";
        case 27: return "S";
        case 28: return "Sa";
        case 29: return "Ro";
        case 30: return "E";
        case 31: return "Le";
        case 32: return "Lo";
        case 33: return "Ya";
        case 34: return "A";
        case 35: return "Li";
        case 36: return "Na";
        case 37: return "N";
        case 38: return "Se";
        case 39: return "Y";
        case 40: return "E";
        case 41: return "Ze";
        case 42: return "Yu";
        case 43: return "Lo";
        case 44: return "La";
        case 45: return "Re";
        case 46: return "I";
        case 47: return "So";
        case 48: return "Sh";
        case 49: return "La";
        case 50: return "O";
        case 51: return "Si";
        default: return sLetter;
    }
    return "";
}

string ProcessSirenSong(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertSirenSong(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertHengeyokai(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "i";
        case 1: return "ja";
        case 2: return "ka";
        case 3: return "ta";
        case 4: return "o";
        case 5: return "xa";
        case 6: return "je";
        case 7: return "ke";
        case 8: return "u";
        case 9: return "te";
        case 10: return "xe";
        case 11: return "ji";
        case 12: return "ki";
        case 13: return "ti";
        case 14: return "a";
        case 15: return "xi";
        case 16: return " ";
        case 17: return "xo";
        case 18: return "ko";
        case 19: return "to";
        case 20: return "e";
        case 21: return "jo";
        case 22: return "ju";
        case 23: return "ku";
        case 24: return "tu";
        case 25: return "xu";
        case 26: return "I";
        case 27: return "Ja";
        case 28: return "Ka";
        case 29: return "Ta";
        case 30: return "O";
        case 31: return "Xa";
        case 32: return "Je";
        case 33: return "Ke";
        case 34: return "U";
        case 35: return "Te";
        case 36: return "Xe";
        case 37: return "Ji";
        case 38: return "KiI";
        case 39: return "Ti";
        case 40: return "A";
        case 41: return "Xi";
        case 42: return "";
        case 43: return "Xo";
        case 44: return "Ko";
        case 45: return "To";
        case 46: return "E";
        case 47: return "Jo";
        case 48: return "Ju";
        case 49: return "Ku";
        case 50: return "Tu";
        case 51: return "Xu";
        default: return sLetter;
    }
    return "";
}

string ProcessHengeyokai(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertHengeyokai(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertSvirfneblin(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "y";
        case 1: return "pa";
        case 2: return "le";
        case 3: return "ti";
        case 4: return "a";
        case 5: return "r";
        case 6: return "ka";
        case 7: return "v";
        case 8: return "e";
        case 9: return "zha";
        case 10: return "ga";
        case 11: return "ma";
        case 12: return "s";
        case 13: return "ha";
        case 14: return "u";
        case 15: return "bi";
        case 16: return "x";
        case 17: return "na";
        case 18: return "c";
        case 19: return "da";
        case 20: return "i";
        case 21: return "j";
        case 22: return "f";
        case 23: return "q";
        case 24: return "o";
        case 25: return "w";
        case 26: return "Y";
        case 27: return "Pa";
        case 28: return "Le";
        case 29: return "Ti";
        case 30: return "A";
        case 31: return "R";
        case 32: return "Ka";
        case 33: return "V";
        case 34: return "E";
        case 35: return "Zha";
        case 36: return "Ga";
        case 37: return "Ma";
        case 38: return "S";
        case 39: return "Ha";
        case 40: return "U";
        case 41: return "Bi";
        case 42: return "X";
        case 43: return "Na";
        case 44: return "C";
        case 45: return "Da";
        case 46: return "I";
        case 47: return "J";
        case 48: return "F";
        case 49: return "Q";
        case 50: return "O";
        case 51: return "W";
        default: return sLetter;
    }
    return "";
}

string ProcessSvirfneblin(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertSvirfneblin(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertHighShou(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "wa";
        case 1: return "bu";
        case 2: return "chi";
        case 3: return "do";
        case 4: return "";
        case 5: return "fi";
        case 6: return "";
        case 7: return "";
        case 8: return "wi";
        case 9: return "";
        case 10: return "";
        case 11: return "lei";
        case 12: return "mi";
        case 13: return "no";
        case 14: return "";
        case 15: return "pe";
        case 16: return "";
        case 17: return "";
        case 18: return "cho";
        case 19: return "tu";
        case 20: return "ng";
        case 21: return "on";
        case 22: return "wo";
        case 23: return "in";
        case 24: return "ya";
        case 25: return "";
        case 26: return "Wa";
        case 27: return "Bu";
        case 28: return "Chi";
        case 29: return "Do";
        case 30: return "";
        case 31: return "Fi";
        case 32: return "";
        case 33: return "";
        case 34: return "Wi";
        case 35: return "";
        case 36: return "";
        case 37: return "Lei";
        case 38: return "Mi";
        case 39: return "No";
        case 40: return "";
        case 41: return "Pe";
        case 42: return "";
        case 43: return "";
        case 44: return "Cho";
        case 45: return "Tu";
        case 46: return "Ng";
        case 47: return "On";
        case 48: return "Wo";
        case 49: return "In";
        case 50: return "Ya";
        case 51: return "";
        default: return sLetter;
    }
    return "";
}

string ProcessHighShou(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertHighShou(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ProcessPsionic(string sPhrase)
{
    return "";
}

string ConvertAverial(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "ii";
        case 1: return "q";
        case 2: return "kx";
        case 3: return "tt";
        case 4: return "ii";
        case 5: return "‘";
        case 6: return "";
        case 7: return "ll";
        case 8: return "ui";
        case 9: return "yii";
        case 10: return "‘";
        case 11: return "li";
        case 12: return "my";
        case 13: return "no";
        case 14: return "ia";
        case 15: return "piie";
        case 16: return "";
        case 17: return "‘";
        case 18: return "ii";
        case 19: return "to";
        case 20: return "uii";
        case 21: return "ti";
        case 22: return "tsi";
        case 23: return "ix";
        case 24: return "io";
        case 25: return "";
        case 26: return "Ia";
        case 27: return "Bo";
        case 28: return "Cii";
        case 29: return "Io";
        case 30: return "Iee ";
        case 31: return "Shi";
        case 32: return "Xi";
        case 33: return "A";
        case 34: return "Wi";
        case 35: return "Fi";
        case 36: return "Rx";
        case 37: return "Li";
        case 38: return "Mrr";
        case 39: return "No";
        case 40: return "Oio";
        case 41: return "Prii";
        case 42: return "";
        case 43: return "Rs";
        case 44: return "Sio";
        case 45: return "Tr";
        case 46: return "Iu";
        case 47: return "Av";
        case 48: return "Va";
        case 49: return "Ti";
        case 50: return "Ya";
        case 51: return "Ziu";
        default: return sLetter;
    }
    return "";
}

string ProcessAverial(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertAverial(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertKobold(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "";
        case 2: return "r";
        case 3: return "s";
        case 4: return "uk";
        case 5: return "y";
        case 6: return "k";
        case 7: return "r";
        case 8: return "i";
        case 9: return "t";
        case 10: return "h";
        case 11: return "x";
        case 12: return "";
        case 13: return "g";
        case 14: return "o";
        case 15: return "p";
        case 16: return "";
        case 17: return "l";
        case 18: return "n";
        case 19: return "g";
        case 20: return "u";
        case 21: return "h";
        case 22: return "a";
        case 23: return "gr";
        case 24: return "i";
        case 25: return "m";
        case 26: return "U";
        case 27: return "";
        case 28: return "R";
        case 29: return "S";
        case 30: return "U";
        case 31: return "Y";
        case 32: return "K";
        case 33: return "R";
        case 34: return "I";
        case 35: return "T";
        case 36: return "H";
        case 37: return "X";
        case 38: return "";
        case 39: return "G";
        case 40: return "O";
        case 41: return "P";
        case 42: return "";
        case 43: return "L";
        case 44: return "N";
        case 45: return "G";
        case 46: return "U";
        case 47: return "H";
        case 48: return "A";
        case 49: return "Gr";
        case 50: return "I";
        case 51: return "M";
        default: return sLetter;
    }
    return "";
}

string ProcessKobold(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertKobold(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertNecromantic(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "y";
        case 1: return "oi";
        case 2: return "ss";
        case 3: return "a";
        case 4: return "s";
        case 5: return "a";
        case 6: return "";
        case 7: return "ih";
        case 8: return "ei";
        case 9: return "ah";
        case 10: return "s";
        case 11: return "i";
        case 12: return "su";
        case 13: return "s";
        case 14: return "ai";
        case 15: return "hi";
        case 16: return "e";
        case 17: return "et";
        case 18: return "r";
        case 19: return "";
        case 20: return "th";
        case 21: return "s";
        case 22: return "t";
        case 23: return "sh";
        case 24: return "is";
        case 25: return "w";
        case 26: return "Ey";
        case 27: return "He";
        case 28: return "Se";
        case 29: return "A";
        case 30: return "I";
        case 31: return "Ef";
        case 32: return "Y";
        case 33: return "Ee";
        case 34: return "Seshi";
        case 35: return "O";
        case 36: return "R";
        case 37: return "S";
        case 38: return "T";
        case 39: return "S";
        case 40: return "H";
        case 41: return "X";
        case 42: return "Z";
        case 43: return "U";
        case 44: return "D";
        case 45: return "I";
        case 46: return "S";
        case 47: return "Q";
        case 48: return "P";
        case 49: return "We";
        case 50: return "R";
        case 51: return "D";
        default: return sLetter;
    }
    return "";
}

string ProcessNecromantic(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertNecromantic(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}

string ConvertOgre(string sLetter)
{
    if (GetStringLength(sLetter) > 1)
        sLetter = GetStringLeft(sLetter, 1);
    string sTranslate = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int iTrans = FindSubString(sTranslate, sLetter);

    switch (iTrans)
    {
        case 0: return "u";
        case 1: return "ga";
        case 2: return "me";
        case 3: return "bi";
        case 4: return "a";
        case 5: return "do";
        case 6: return "gu";
        case 7: return "ma";
        case 8: return "e";
        case 9: return "be";
        case 10: return "di";
        case 11: return "go";
        case 12: return "mu";
        case 13: return "ba";
        case 14: return "i";
        case 15: return "de";
        case 16: return "gi";
        case 17: return "mo";
        case 18: return "bu";
        case 19: return "da";
        case 20: return "o";
        case 21: return "ge";
        case 22: return "mi";
        case 23: return "bo";
        case 24: return "du";
        case 25: return "ga";
        case 26: return "U";
        case 27: return "Ga";
        case 28: return "Me";
        case 29: return "Bi";
        case 30: return "A";
        case 31: return "Do";
        case 32: return "Gu";
        case 33: return "Ma";
        case 34: return "E";
        case 35: return "Be";
        case 36: return "Di";
        case 37: return "Go";
        case 38: return "Mu";
        case 39: return "Ba";
        case 40: return "I";
        case 41: return "De";
        case 42: return "Gi";
        case 43: return "Mo";
        case 44: return "Bu";
        case 45: return "Da";
        case 46: return "O";
        case 47: return "Ge";
        case 48: return "Mi";
        case 49: return "Bo";
        case 50: return "Du";
        case 51: return "Ga";
        default: return sLetter;
    }
    return "";
}

string ProcessOgre(string sPhrase)
{
    string sOutput, sLeft;
    int iToggle;
    while (GetStringLength(sPhrase) > 0)
    {
        sLeft = GetStringLeft(sPhrase,1);
        if ((sLeft == "*") || (sLeft == "<") || (sLeft == ">")) iToggle = abs(iToggle - 1);
        if (iToggle) sOutput = sOutput + sLeft;
        else sOutput = sOutput + ConvertOgre(sLeft);
        sPhrase = GetStringRight(sPhrase, GetStringLength(sPhrase)-1);
    }
    return sOutput;
}
