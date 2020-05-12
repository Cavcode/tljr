#include "qx_leto_config"


//void main(){}

//--------------------------------DECLARATIONS--------------------------------//

// This function bridges Letoscript into NWNX.
string LetoScript(string script);
// This function returns the bicfilename of the character specified.
string GetBicFileName(object oPC);
// This function finds the most recently edited .bic file in the player's folder,
// and applies whatever changes are conatained within the string of Letoscript. You must
// set the path to your servervault folder in the hgll_const_inc script for it to work.
// The easiest way to ensure that the ingame character is the most recently edited
// file is to save the character at least 3 seconds or more before calling this function.
void ApplyLetoScriptToPC(string Script, object oPC);
// This function tells Letoscript to add a stat point to the specified stat.
string AddStatPoint(string sStat, int val);
// This function tells Letoscript to add a skill point to the specified skill.
string AddSkillPoint(int iSkill);
// This function tells Letoscript to add +1 to all the character's saving throws.
string ModifySaves();
// This function tells Letoscript to add the specified number of hit points to the character.
string AddHitPoints(int nHP, int nLevel);
// This function tells Letoscript to add the specified feat to the character, treating
// it as if he had gained it on character creation (level 0). This ensures that deleveling
// the character thus will not remove the feat.
string AddFeat(int iFeat = -1);
string SetDocumentedLevel(int level = 1);
/* Sets the players subrace permanent effects and autoportals them */
void SetPermaSubRace(object oPC);
int GetSubRaceInt(string sSubrace);
void RepeatFloatingTextStringOnCreature(object Object, string String,
                                        float Delay = 3.0, int Times = -1);
void ReloadPC(object oPC);
//----------------------------------FUNCTIONS---------------------------------//

//--------------------------FUNCTIONS TAKEN FROM DAR--------------------------//
void RepeatFloatingTextStringOnCreature(object Object, string String,
                                        float Delay = 3.0, int Times = -1) {

    if(GetPCPlayerName(Object) == "") return;
    if(Times == 0) return;
    FloatingTextStringOnCreature(String, Object);
    DelayCommand(Delay, RepeatFloatingTextStringOnCreature(Object, String,
                                                           Delay , Times
                        )
    );
    if(Times) Times--;
}

void ReloadPC(object oPC)
{
    ExportSingleCharacter(oPC);
    DelayCommand(RELOAD_TIME_DELAY,
     ActivatePortal(oPC, PORTAL_ADDRESS, PORTAL_PASSWORD, PORTAL_WAYPOINT, TRUE)
    );
}

int GetSubRaceInt(string s){

       if( s == "Aqualish") {return 1;}
       else if( s == "Bith") {return 2;}
       else if( s == "Duros") {return 3;}
       else if( s == "Gamorrean") {return 4;}
       else if( s == "Gand") {return 5;}
       else if( s == "Gran") {return 6;}
       else if( s == "Gungan") {return 7;}
       else if( s == "Rodian") {return 8;}
       else if( s == "Sullustan") {return 9;}
       else if( s == "Trandoshan") {return 10;}
       else if( s == "Twi'lek") {return 11;}
       else if( s == "Quarren") {return 12;}
       else if( s == "Mon Calamari") {return 13;}
       else if( s == "Bothan") {return 14;}
       else if( s == "Cerean") {return 15;}
       else if( s == "Droid") {return 16;}
       else if( s == "Kel Dor") {return 17;}
       else if( s == "Weequay") {return 17;}
       else if( s == "Selkath") {return 19;}
       else if( s == "Miraluka") {return 20;}

       else {return 0;}

}

void SetPermaSubRace(object oPC) {
    string VaultPath = NWNPATH;
    string Player = GetPCPlayerName(oPC);
    string BicPath = VaultPath + Player + "/";
    string BicFile;
    int i, n;
    int SFeat, SWings, STail, SSize;
    string script = "";
    //string BicFile = GetLocalString(oPC, "BicFilePath");
    int istr,idex,icon,iint,iwis,icha;
    PrintString("BicFile Path: "+BicFile);

 /*   if (PHOENIX)
        {
        BicFile = BicPath + GetBicFileName(oPC)+ ".bic";
        script = "<file:open 1 <qq:"+BicFile+">>"+script+"<file:save 1 <qq:"+BicFile+">><file:close 1>";
        }
    else
        {
        script =
            "$RealFile = q<" + BicPath + "> + FindNewestBic q<" + BicPath + ">;" +
            "$EditFile = $RealFile + '.utc';" +
            "FileRename $RealFile, $EditFile;" +
            "%bic = $EditFile or die;" +
            script +
            "%bic = '>';" +
            "close %bic;" +
            "FileRename $EditFile, $RealFile;";
        }
   */
        istr = GetLocalInt(oPC, "STR");
        idex = GetLocalInt(oPC, "DEX");
        icon = GetLocalInt(oPC, "CON");
        iint = GetLocalInt(oPC, "INT");
        iwis = GetLocalInt(oPC, "WIS");
        icha = GetLocalInt(oPC, "CHA");
        // Stats:
        if (istr != 0){script += AddStatPoint("Str", istr);}
        if (idex != 0){script += AddStatPoint("Dex", idex);}
        if (icon != 0){script += AddStatPoint("Con", icon);}
        if (istr != 0){script += AddStatPoint("Int", iint);}
        if (istr != 0){script += AddStatPoint("Wis", iwis);}
        if (istr != 0){script += AddStatPoint("Cha", icha);}

        script += SetDocumentedLevel();
        script += "/Tag = qq<"+BicFile+"> unless /Tag;";

        //PrintString(script);
        //PrintString(LetoScript("%char= q!"+BicFile+"!; "
                               //+script+"%char = '>'; close %char; "));

   //SetCutsceneMode(oPC, TRUE);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectCutsceneImmobilize(),oPC,30.0);
    RepeatFloatingTextStringOnCreature(oPC, "Autorelog commencing... Applying Permanent Race Adjustments...");
    //SetLocalString(oPC,"LetoScript", script);
    ApplyLetoScriptToPC(script, oPC);
   //LetoScript(script);
    //ReloadPC(oPC);
}

string LetoScript(string script)
{
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", script);
    return GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
}


string SetDocumentedLevel(int level = 1) {
    string script = "";
    if (PHOENIX)
        {
        if(level > -1) script = "<gff:set 'Lootable' {value="+IntToString(level)+"}>";
        }
    else
        {
        if(level > -1) script = "/Lootable = "+IntToString(level)+";";
        }
    return script;
}

string GetBicFileName(object oPC)
{
    string sChar, sBicName;
    string sPCName = GetStringLowerCase(GetName(oPC));
    int i, iNameLength = GetStringLength(sPCName);

    for(i=0; i < iNameLength; i++) {
        sChar = GetSubString(sPCName, i, 1);
        if (TestStringAgainstPattern("(*a|*n|*w|'|-|_)", sChar)) {
            if (sChar != " ") sBicName += sChar;
        }
    }
    return GetStringLeft(sBicName, 16);
}

//------------------------------FUNCTIONS ADDED-------------------------------//

void ApplyLetoScriptToPC(string Script, object oPC)
{
    string VaultPath = NWNPATH;
    string Player = GetPCPlayerName(oPC);
    string BicPath = VaultPath + Player + "/";
    string BicFile;
    if (PHOENIX)
        {
        BicFile = BicPath + GetBicFileName(oPC)+ ".bic";
        Script = "<file:open 1 <qq:"+BicFile+">>"+Script+"<file:save 1 <qq:"+BicFile+">><file:close 1>";
        }
    else
        {
        Script =
            "$RealFile = q<" + BicPath + "> + FindNewestBic q<" + BicPath + ">;" +
            "$EditFile = $RealFile + '.utc';" +
            "FileRename $RealFile, $EditFile;" +
            "%bic = $EditFile or die;" +
            Script +
            "%bic = '>';" +
            "close %bic;" +
            "FileRename $EditFile, $RealFile;";
        }
    SetLocalString(oPC, "LetoScript", Script);
    //DelayCommand(3.0f, ActivatePortal(oPC, "62.167.237.11:5122", "", "",TRUE));
    //DelayCommand(3.0f, BootPC(oPC));
    //DelayCommand(3.0f, ActivatePortal(oPC, "64.137.237.115:5121", "", "", TRUE));
}

string AddStatPoint(string sStat, int val)
{
string sReturn = sStat;
string sVal = IntToString(val);

    if (PHOENIX)
        {
        return "<gff:set '"+sReturn+"' {value=(<"+sReturn+">+" +sVal + ")}>";
        }
    else
        {
        return "/"+sReturn+" = /"+sReturn+" + " +sVal + ";";
        }
}

string AddSkillPoint(int iSkill)
{
    string sSkill = IntToString(iSkill);
    if (PHOENIX)
        {
        return
            "<gff:set 'SkillList/["+sSkill+"]/Rank' {value=(<SkillList/["+sSkill+"]/Rank>+1)}>"+
            "<gff:set 'LvlStatList/[0]/SkillList/["+sSkill+"]/Rank' {value=(<SkillList/["+sSkill+"]/Rank>+1)}>";
        }
    else
        {
        return
            "/SkillList/["+sSkill+"]/Rank = /SkillList/["+sSkill+"]/Rank +1; "+
            "/LvlStatList/[0]/SkillList/["+sSkill+"]/Rank = /SkillList/["+sSkill+"]/Rank +1; ";
        }
}

string ModifySaves()
{
    string sLeto;
    if (PHOENIX)
        {
        sLeto = "<gff:set 'fortbonus' {type='byte' value=<gff:get 'fortbonus'>+1}>" +
                "<gff:set 'refbonus' {type='byte' value=<gff:get 'refbonus'>+1}>" +
                "<gff:set 'willbonus' {type='byte' value=<gff:get 'willbonus'>+1}>";
        }
    else
        {
        sLeto = "/fortbonus = /fortbonus +1; /refbonus = /refbonus +1; /willbonus = /willbonus +1; ";
        }
    return sLeto;
}

string AddHitPoints(int nHP, int nLevel)
{
int nLvlHPAddedAt;
string sLeto;
string sLvl;
string sHP = IntToString(nHP);
if (nLevel < 41)
    {
    nLvlHPAddedAt = 0;//we add the hp at a different level each level so that the 255 field limit is never reached - if it was, it would roll over, causing the loss of 255 hps
    }
else
    {
    nLvlHPAddedAt = nLevel - 40;
    }
sLvl = IntToString(nLvlHPAddedAt);
if (PHOENIX)
    {
    sLeto = "<gff:set 'HitPoints' {type='short' value=<gff:get 'HitPoints'>+" + sHP + "}>" +
            "<gff:set 'LvlStatList/["+sLvl+"]/LvlStatHitDie' {type='short' value=<gff:get 'LvlStatList/["+sLvl+"]/LvlStatHitDie'>+" + sHP + "}>" +
            "<gff:set 'MaxHitPoints' {type='short' value=<gff:get 'MaxHitPoints'>+" + sHP + "}>" +
            "<gff:set 'CurrentHitPoints' {type='short' value=<gff:get 'CurrentHitPoints'>+" + sHP + "}>" +
            "<gff:set 'PregameCurrent' {type='short' value=<gff:get 'PregameCurrent'>+" + sHP + "}>";
    }
else
    {
    sLeto = "/HitPoints = /HitPoints + " + sHP + "; ";
    sLeto += "/LvlStatList/[" + IntToString(nLvlHPAddedAt) + "]/LvlStatHitDie = /LvlStatList/[" + IntToString(nLvlHPAddedAt) + "]/LvlStatHitDie + " + sHP + "; ";
    sLeto += "/MaxHitPoints = /MaxHitPoints + " + sHP + "; ";
    sLeto += "/CurrentHitPoints = /CurrentHitPoints + " + sHP + "; ";
    sLeto += "/PregameCurrent = /PregameCurrent + " + sHP + "; ";
    }
return sLeto;
}

string AddFeat(int iFeat = -1)
{
    string sLeto;
    string sEnd;
    if(iFeat < 0) return "";
    if(iFeat > 763 && iFeat < 824)//Greater Ability Feats
        {
        if(iFeat <= 773)//CHA
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Cha' {value=(<Cha>+1)}>";
                }
            else
                {
                sLeto = "/Cha = /Cha + 1;";
                }
            }
        else if(iFeat <= 783)//CON
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Con' {value=(<Con>+1)}>";
                }
            else
                {
                sLeto = "/Con = /Con + 1;";
                }
            }
        else if(iFeat <= 793)//DEX
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Dex' {value=(<Dex>+1)}>";
                }
            else
                {
                sLeto = "/Dex = /Dex + 1;";
                }
            }
        else if(iFeat <= 803)//INT
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Int' {value=(<Int>+1)}>";
                }
            else
                {
                sLeto = "/Int = /Int + 1;";
                }
            }
        else if(iFeat <= 813)//WIS
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Wis' {value=(<Wis>+1)}>";
                }
            else
                {
                sLeto = "/Wis = /Wis + 1;";
                }
            }
        else // <= 823 STR
            {
            if (PHOENIX)
                {
                sLeto = "<gff:set 'Str' {value=(<Str>+1)}>";
                }
            else
                {
                sLeto = "/Str = /Str + 1;";
                }
            }
        }
    else
        {
        sLeto = "";
        }
    if (PHOENIX)
        {
        sEnd = "<gff:add 'FeatList/Feat' {type='word' value="+IntToString(iFeat)+"}>" +
               "<gff:add 'LvlStatList/[0]/FeatList/Feat' {type='word' value="+IntToString(iFeat)+"}>";
        }
    else
        {
        sEnd = "add /FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";" +
               "add /LvlStatList/[0]/FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";";
        }
    return sLeto + sEnd;

}
//below used to compile
/*
void main()
{

}
*/
