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
#include "x2_inc_itemprop"
#include "fky_chat_const"
#include "fky_chat_config"
//Boots the PC ONLY if they are still valid, preventing crashes.
void DoBoot(object oPC);
//Returns the number of legendary levels possessed by the character. If not using the legendary level system,
//It will return 0 unless you are using the Lootable field to store data (it returns Lootable - 40, and never
//returns below a 0). If that's the case, you probably know how to configure this function to your needs.
int GetNumberOfLegendaryLevels(object oChar);

void DoCough(object oCougher)
{
    SetLocalString(oCougher, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oCougher);
    if (nGender == GENDER_MALE) AssignCommand(oCougher, PlaySound("as_pl_coughm"+IntToString(Random(7)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oCougher, PlaySound("as_pl_coughf"+IntToString(Random(7)+1)));
}

void DoOuch(object oOucher)
{
    SetLocalString(oOucher, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oOucher);
    if (nGender == GENDER_MALE) AssignCommand(oOucher, PlaySound("as_pl_paincrym"+IntToString(Random(3)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oOucher, PlaySound("as_pl_paincryf1"));
}

void DoCry(object oCrier)
{
    SetLocalString(oCrier, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oCrier);
    if (nGender == GENDER_MALE) AssignCommand(oCrier, PlaySound("as_pl_cryingm"+IntToString(Random(3)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oCrier, PlaySound("as_pl_cryingf"+IntToString(Random(3)+1)));
}

void DoGoodbye(object oLeave)
{
    SetLocalString(oLeave, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oLeave, ActionPlayAnimation(ANIMATION_FIREFORGET_BOW));
    PlayVoiceChat(VOICE_CHAT_GOODBYE, oLeave);
}

void DoLaugh2(object oLaugher)
{
    SetLocalString(oLaugher, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oLaugher);
    if (nGender == GENDER_MALE) AssignCommand(oLaugher, PlaySound("as_pl_tavlaughm"+IntToString(Random(2)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oLaugher, PlaySound("as_pl_tavlaughf1"));
    AssignCommand(oLaugher, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 5.0));
}

void DoHiccup(object oHiccuper)
{
    SetLocalString(oHiccuper, "NWNX!CHAT!SUPRESS", "1");
    string sSound;
    switch(Random(3))
    {
        case 0: sSound = "as_pl_hiccupm1";
        case 1: sSound = "as_pl_x2rghtav4";
        case 2: sSound = "as_pl_x2rghtav5";
    }
    AssignCommand(oHiccuper, PlaySound(sSound));
}

void DoBurp(object oBurper)
{
    SetLocalString(oBurper, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oBurper);
    if (nGender == GENDER_MALE) AssignCommand(oBurper, PlaySound("as_pl_x2rghtav"+IntToString(Random(3)+1)));
}

void DoBelch(object oBelcher)
{
    SetLocalString(oBelcher, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oBelcher);
    if (nGender == GENDER_MALE) AssignCommand(oBelcher, PlaySound("as_pl_belchingm"+IntToString(Random(2)+1)));
}

void DoToast(object oToaster)
{
    SetLocalString(oToaster, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oToaster);
    if (nGender == GENDER_MALE) AssignCommand(oToaster, PlaySound("as_pl_tavtoastm"+IntToString(Random(4)+1)));
}

void DoRoar(object oRoarer)
{
    SetLocalString(oRoarer, "NWNX!CHAT!SUPRESS", "1");
    string sSound;
    switch(Random(4))
    {
        case 0: sSound = "sff_summondrgn";
        case 1: sSound = "c_dragnold_bat1";
        case 2: sSound = "c_dragnyng_bat1";
        case 3: sSound = "c_catlion_bat1";
    }
    AssignCommand(oRoarer, PlaySound(sSound));
}

void DoScreech(object oScreecher)
{
    SetLocalString(oScreecher, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oScreecher, PlaySound("as_an_catscrech1"));
}

void DoMoo(object oMooer)
{
    SetLocalString(oMooer, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oMooer, PlaySound("as_an_cow"+IntToString(Random(2)+1)));
}

void DoMeow(object oMeower)
{
    SetLocalString(oMeower, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oMeower, PlaySound("as_an_catmeow"+IntToString(Random(4)+1)));
}

void DoHoot(object oHooter)
{
    SetLocalString(oHooter, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oHooter, PlaySound("as_an_owlhoot"+IntToString(Random(2)+1)));
}

void DoHowl(object oHowler)
{
    SetLocalString(oHowler, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oHowler, PlaySound("as_an_wolfhowl"+IntToString(Random(2)+1)));
}

void DoBark(object oBarker)
{
    SetLocalString(oBarker, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oBarker, PlaySound("as_an_dogbark"+IntToString(Random(4)+1)));
}

void DoSnarl(object oSnarler)
{
    SetLocalString(oSnarler, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oSnarler, PlaySound("as_an_dogbark5"));
}

void DoSpit(object oSpitter)
{
    SetLocalString(oSpitter, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oSpitter);
    if (nGender == GENDER_MALE) AssignCommand(oSpitter, PlaySound("as_pl_spittingm"+IntToString(Random(2)+1)));
}

void DoSneeze(object oSneezer)
{
    SetLocalString(oSneezer, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oSneezer);
    if (nGender == GENDER_MALE) AssignCommand(oSneezer, PlaySound("as_pl_sneezingm1"));
    else if (nGender == GENDER_FEMALE) AssignCommand(oSneezer, PlaySound("as_pl_sneezingf1"));
}

void DoScream(object oScreamer)
{
    SetLocalString(oScreamer, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oScreamer);
    if (nGender == GENDER_MALE)
    {
        if (Random(2)) AssignCommand(oScreamer, PlaySound("as_pl_x2screamm"+IntToString(Random(6)+1)));
        else AssignCommand(oScreamer, PlaySound("as_pl_screamm"+IntToString(Random(6)+1)));
    }
    else if (nGender == GENDER_FEMALE)
    {
        if (Random(2)) AssignCommand(oScreamer, PlaySound("as_pl_x2screamf"+IntToString(Random(6)+1)));
        else AssignCommand(oScreamer, PlaySound("as_pl_screamf"+IntToString(Random(6)+1)));
    }
}

void DoGroan(object oGroaner)
{
    SetLocalString(oGroaner, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oGroaner);
    if (nGender == GENDER_MALE) AssignCommand(oGroaner, PlaySound("as_pl_hangoverm1"));
    else if (nGender == GENDER_FEMALE) AssignCommand(oGroaner, PlaySound("as_pl_hangoverf1"));
}

void DoMoan(object oMoaner)
{
    SetLocalString(oMoaner, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oMoaner);
    if (nGender == GENDER_MALE) AssignCommand(oMoaner, PlaySound("as_pl_ailingm"+IntToString(Random(5)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oMoaner, PlaySound("as_pl_ailingf"+IntToString(Random(5)+1)));
}

void DoWail(object oWailer)
{
    SetLocalString(oWailer, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oWailer);
    if (nGender == GENDER_MALE) AssignCommand(oWailer, PlaySound("as_pl_wailingm"+IntToString(Random(6)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oWailer, PlaySound("as_pl_wailingf"+IntToString(Random(6)+1)));
}

void DoChant(object oChanter)
{
    SetLocalString(oChanter, "NWNX!CHAT!SUPRESS", "1");
    int nGender = GetGender(oChanter);
    if (nGender == GENDER_MALE)
    {
        int nAlign = GetAlignmentGoodEvil(oChanter);
        if (nAlign == ALIGNMENT_EVIL) AssignCommand(oChanter, PlaySound("as_pl_evilchantm"));
        else AssignCommand(oChanter, PlaySound("as_pl_chantingm"+IntToString(Random(2)+1)));
    }
    else if (nGender == GENDER_FEMALE) AssignCommand(oChanter, PlaySound("as_pl_chantingf"+IntToString(Random(2)+1)));
}

void DoYawn(object oYawner)
{
        SetLocalString(oYawner, "NWNX!CHAT!SUPRESS", "1");
        int nGender = GetGender(oYawner);
        AssignCommand(oYawner, ClearAllActions());
        if(nGender==GENDER_MALE) AssignCommand(oYawner, PlaySound("as_pl_yawningm1"));
        else if(nGender==GENDER_FEMALE) AssignCommand(oYawner, PlaySound("as_pl_yawningf1"));
        AssignCommand(oYawner, ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED));
}

void DoWhistle(object oWhistler)
{
    SetLocalString(oWhistler, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oWhistler, PlaySound("as_pl_whistle2"));
}

void DoSong(object oSinger)
{
    SetLocalString(oSinger, "NWNX!CHAT!SUPRESS", "1");
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_BARD_SONG), oSinger, 6.0f);
}

void DoGiggle(object oLaugh)
{
    SetLocalString(oLaugh, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oLaugh, PlaySound("vs_fshaldrf_haha"));
}

void DoHeadShake(object oRefuser)
{
    SetLocalString(oRefuser, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_NO, oRefuser);
    AssignCommand(oRefuser, ClearAllActions(TRUE));
    AssignCommand(oRefuser, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.25f));
    DelayCommand(0.15f, AssignCommand(oRefuser, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.25f)));
    DelayCommand(0.40f, AssignCommand(oRefuser, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.25f)));
    DelayCommand(0.65f, AssignCommand(oRefuser, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.25f)));
}

void DoLaugh(object oChuckles)
{
    SetLocalString(oChuckles, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_LAUGH, oChuckles);
    AssignCommand(oChuckles, ClearAllActions(TRUE));
    AssignCommand(oChuckles, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 1.0, 2.0));
}

void DoTired(object oSleepy)
{
    SetLocalString(oSleepy, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_REST, oSleepy);
    AssignCommand(oSleepy, ClearAllActions(TRUE));
    AssignCommand(oSleepy, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_TIRED, 1.0, 3.0));
}

void DoCheer(object oCheerer)
{
    SetLocalString(oCheerer, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_CHEER, oCheerer);
    AssignCommand(oCheerer, ClearAllActions(TRUE));
    AssignCommand(oCheerer, PlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 1.0));
}

void DoCheer2(object oCheerer)
{
    SetLocalString(oCheerer, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_CHEER, oCheerer);
    AssignCommand(oCheerer, ClearAllActions(TRUE));
    AssignCommand(oCheerer, PlayAnimation(ANIMATION_FIREFORGET_VICTORY2, 1.0));
}

void DoCheer3(object oCheerer)
{
    SetLocalString(oCheerer, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_CHEER, oCheerer);
    AssignCommand(oCheerer, ClearAllActions(TRUE));
    AssignCommand(oCheerer, PlayAnimation(ANIMATION_FIREFORGET_VICTORY3, 1.0));
}

void DoTaunt(object oTaunter)
{
    SetLocalString(oTaunter, "NWNX!CHAT!SUPRESS", "1");
    PlayVoiceChat(VOICE_CHAT_TAUNT, oTaunter);
    AssignCommand(oTaunter, ClearAllActions(TRUE));
    AssignCommand(oTaunter, PlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0));
}

//Smoking Function by Jason Robinson, taken from DMFI
location GetLocationAboveAndInFrontOf(object oPC, float fDist, float fHeight)
{
    float fDistance = -fDist;
    object oTarget = (oPC);
    object oArea = GetArea(oTarget);
    vector vPosition = GetPosition(oTarget);
    vPosition.z += fHeight;
    float fOrientation = GetFacing(oTarget);
    vector vNewPos = AngleToVector(fOrientation);
    float vZ = vPosition.z;
    float vX = vPosition.x - fDistance * vNewPos.x;
    float vY = vPosition.y - fDistance * vNewPos.y;
    fOrientation = GetFacing(oTarget);
    vX = vPosition.x - fDistance * vNewPos.x;
    vY = vPosition.y - fDistance * vNewPos.y;
    vNewPos = AngleToVector(fOrientation);
    vZ = vPosition.z;
    vNewPos = Vector(vX, vY, vZ);
    return Location(oArea, vNewPos, fOrientation);
}

//Smoking Function by Jason Robinson, taken from DMFI
void SmokePipe(object oActivator)
{
    string sEmote1 = "*puffs on a pipe*";
    string sEmote2 = "*inhales from a pipe*";
    string sEmote3 = "*pulls a mouthful of smoke from a pipe*";
    float fHeight = 1.7;
    float fDistance = 0.1;
    // Set height based on race and gender
    if (GetGender(oActivator) == GENDER_MALE)
    {
        switch (GetRacialType(oActivator))
        {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF: fHeight = 1.7; fDistance = 0.12; break;
            case RACIAL_TYPE_ELF: fHeight = 1.55; fDistance = 0.08; break;
            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING: fHeight = 1.15; fDistance = 0.12; break;
            case RACIAL_TYPE_DWARF: fHeight = 1.2; fDistance = 0.12; break;
            case RACIAL_TYPE_HALFORC: fHeight = 1.9; fDistance = 0.2; break;
        }
    }
    else
    {
        // FEMALES
        switch (GetRacialType(oActivator))
        {
            case RACIAL_TYPE_HUMAN:
            case RACIAL_TYPE_HALFELF: fHeight = 1.6; fDistance = 0.12; break;
            case RACIAL_TYPE_ELF: fHeight = 1.45; fDistance = 0.12; break;
            case RACIAL_TYPE_GNOME:
            case RACIAL_TYPE_HALFLING: fHeight = 1.1; fDistance = 0.075; break;
            case RACIAL_TYPE_DWARF: fHeight = 1.2; fDistance = 0.1; break;
            case RACIAL_TYPE_HALFORC: fHeight = 1.8; fDistance = 0.13; break;
        }
    }
    location lAboveHead = GetLocationAboveAndInFrontOf(oActivator, fDistance, fHeight);
    // emotes
    switch (d3())
    {
        case 1: AssignCommand(oActivator, ActionSpeakString(ESCAPE_STRING+sEmote1)); break;
        case 2: AssignCommand(oActivator, ActionSpeakString(ESCAPE_STRING+sEmote2)); break;
        case 3: AssignCommand(oActivator, ActionSpeakString(ESCAPE_STRING+sEmote3));break;
    }
    SetLocalString(oActivator, "NWNX!CHAT!SUPRESS", "1");//suppress speech
    // glow red
    AssignCommand(oActivator, ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_RED_5), oActivator, 0.15)));
    // wait a moment
    AssignCommand(oActivator, ActionWait(3.0));
    // puff of smoke above and in front of head
    AssignCommand(oActivator, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), lAboveHead)));
    // if female, turn head to left
    if ((GetGender(oActivator) == GENDER_FEMALE) && (GetRacialType(oActivator) != RACIAL_TYPE_DWARF))
        AssignCommand(oActivator, ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 5.0));
}

void Animation_Dance(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2));
    DelayCommand(3.0,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING, 3.0, 2.0)));
    DelayCommand(3.0,AssignCommand(oPlayer,PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(5.0,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1)));
    DelayCommand(8.5,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3)));
    DelayCommand(11.0,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 3.0, 2.0)));
    DelayCommand(14.5,AssignCommand(oPlayer,PlayVoiceChat(VOICE_CHAT_LAUGH)));
    DelayCommand(13.0,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3)));
}
void DoDance(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    if(GetLocalInt(oPlayer,"Dancefix")== TRUE)
    {
        FloatingTextStringOnCreature(COLOR_RED+SPAMFIX+COLOR_END,oPlayer);
        return;
    }
    else
    {
        SetLocalInt(oPlayer,"Dancefix",TRUE);
        DelayCommand(14.0,SetLocalInt(oPlayer,"Dancefix",FALSE));
        AssignCommand(oPlayer,ClearAllActions(TRUE));
        Animation_Dance(oPlayer);
    }
}
void DoLoopAnimation(object oPlayer, int nAnimation, float fSpeed = 1.0, float fDur = 9999.0)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer, ActionPlayAnimation(nAnimation,fSpeed,fDur));
}
void DoFireForgetAnimation(object oPlayer, int nAnimation)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer,ActionPlayAnimation(nAnimation));
}
void DoDrink(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    effect Vis = EffectVisualEffect(VFX_IMP_STUN);
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_DRINK));
    DelayCommand(2.0,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,10.0,5.0)));
    DelayCommand(2.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,Vis,oPlayer));
}
void DoDrunk(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    effect Vis = EffectVisualEffect(VFX_IMP_CONFUSION_S);
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0,9999.0));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,Vis,oPlayer);
}
void DoFakeDeath(object oPlayer)
{
   SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
   effect Vis = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
    if(GetLocalInt(oPlayer,"FakeDeath")== TRUE)
    {
        FloatingTextStringOnCreature(COLOR_RED+SPAMFIX+COLOR_END,oPlayer);
        return;
    }
    else
    {
        SetLocalInt(oPlayer,"FakeDeath",TRUE);
        DelayCommand(2.0,SetLocalInt(oPlayer,"FakeDeath",FALSE));
        AssignCommand(oPlayer, ClearAllActions(TRUE));
        AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,9999.0));
        ApplyEffectToObject(DURATION_TYPE_INSTANT,Vis,oPlayer);
        PlayVoiceChat(VOICE_CHAT_DEATH,oPlayer);
    }
}
void DoPuke(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    effect Puke1 = EffectVisualEffect(VFX_COM_CHUNK_GREEN_MEDIUM);
    effect Puke2 = EffectVisualEffect(VFX_COM_CHUNK_YELLOW_MEDIUM);
    int PukeFix;
    if(GetLocalInt(oPlayer,"PukeFix")== TRUE)
    {
        FloatingTextStringOnCreature(COLOR_RED+SPAMFIX+COLOR_END,oPlayer);
        return;
    }
    else
    {
        SetLocalInt(oPlayer,"PukeFix",TRUE);
        DelayCommand(3.0,SetLocalInt(oPlayer,"PukeFix",FALSE));
        AssignCommand(oPlayer, ClearAllActions(TRUE));
        AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_MEDITATE));
        DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,Puke1,oPlayer));
        DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,Puke2,oPlayer));
        DelayCommand(1.0,AssignCommand(oPlayer,SpeakString(VOMIT,TALKVOLUME_TALK)));
    }
}
void DoSleep(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    effect Vis = EffectVisualEffect(VFX_IMP_SLEEP);
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,9999.0));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,Vis,oPlayer);
}

void DoSnore(object oPlayer)
{
    SetLocalString(oPlayer, "NWNX!CHAT!SUPRESS", "1");
    effect Vis = EffectVisualEffect(VFX_IMP_SLEEP);
    AssignCommand(oPlayer, ClearAllActions(TRUE));
    int nGender = GetGender(oPlayer);
    if (nGender == GENDER_MALE) AssignCommand(oPlayer, PlaySound("as_pl_snoringm"+IntToString(Random(2)+1)));
    else if (nGender == GENDER_FEMALE) AssignCommand(oPlayer, PlaySound("as_pl_snoringf1"));
    AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_LOOPING_DEAD_FRONT,1.0,9999.0));
    ApplyEffectToObject(DURATION_TYPE_INSTANT,Vis,oPlayer);
}

int GetHighestItemFromArray(object oPC, int nNumberInArray)
{
    string sString, sInt, sAdd;
    int nInt, nNum;
    int nHighest = -1;
    int nArrayNum = 0;
    for (nInt = 1; nInt <= nNumberInArray; nInt++)
    {
        sInt = IntToString(nInt);
        sString = GetLocalString(oPC, "PRMember"+sInt);
        if (sString != "")
        {
            nNum = StringToInt(GetStringLeft(sString, 2));
            if (nNum > nHighest)
            {
                nHighest = nNum;
                nArrayNum = nInt;
            }
        }
    }
    return nArrayNum;
}
void RollDie(object oPlayer, int nDie)
{
    int nRoll;
    string sDie;
    switch (nDie)
    {
        case 4: nRoll = d4(); sDie = "D4"; break;
        case 6: nRoll = d6(); sDie = "D6"; break;
        case 8: nRoll = d8(); sDie = "D8"; break;
        case 10: nRoll = d10(); sDie = "D10"; break;
        case 12: nRoll = d12(); sDie = "D12"; break;
        case 20: nRoll = d20(); sDie = "D20"; break;
        case 100: nRoll = d100(); sDie = "D100"; break;
    }
    string sName = GetName(oPlayer);
    string sRoll = IntToString(nRoll);
    AssignCommand(oPlayer, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID,3.0,3.0));
    DelayCommand(2.0,AssignCommand(oPlayer, SpeakString(ESCAPE_STRING+COLOR_WHITE+sName+ROLL1+COLOR_END+COLOR_GREEN+sDie+COLOR_END+COLOR_WHITE+ROLL2+COLOR_END+COLOR_BLUE+sRoll+COLOR_END+"]")));
    if(nRoll == nDie)
    {
        DelayCommand(3.5,AssignCommand(oPlayer, SpeakString(ESCAPE_STRING+COLOR_BLUE+ROLLGOOD+COLOR_END)));
        DelayCommand(3.5,AssignCommand(oPlayer,ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1,1.0,0.0)));
        DelayCommand(3.5,PlayVoiceChat(VOICE_CHAT_CHEER,oPlayer));
    }
}
void DoPartyRoll(object oPlayer)
{
    object oLeader = GetFactionLeader(oPlayer);
    object oPartymember;
    int nRoll, nInt, nNumberItemsInArray, nNumBase, nTopRoller;
    int nCount = 0;
    string sInt, sBase, sNumBase, sLine, sRoll, sName;
    string sMessage = "";
    if (oPlayer == oLeader)//only leader can roll
    {
        oPartymember = GetFirstFactionMember(oPlayer);
        //oPartymember = GetFirstItemInInventory(oPlayer);
        while (GetIsObjectValid(oPartymember))//generate the 'array'
        {
            nCount++;//get number in party
            nRoll = Random(100);
            sRoll = IntToString(nRoll);
            if (GetStringLength(sRoll) == 1) sRoll = "0" + sRoll;//ensure that string length is consistent
            sInt = IntToString(nCount);
            SetLocalString(oPlayer, "PRMember"+sInt, sRoll+GetName(oPartymember));
            oPartymember = GetNextFactionMember(oPlayer);
            //oPartymember = GetNextItemInInventory(oPlayer);
        }
        nNumberItemsInArray = nCount;
        for (nInt = 1; nInt <= nCount; nInt++) //once through for each member of the party
        {
            //find the highest number
            nTopRoller = GetHighestItemFromArray(oPlayer, nNumberItemsInArray);
            //add it to the string along with their name
            sBase = GetLocalString(oPlayer, "PRMember"+IntToString(nTopRoller));
            nNumBase = StringToInt(GetStringLeft(sBase, 2));
            nNumBase++;//add 1 to simulate 1 to 100 roll instead of 0 to 99
            sNumBase = IntToString(nNumBase);
            sName = GetStringRight(sBase, (GetStringLength(sBase) - 2));
            //sLine = sName + " rolled a " + sNumBase + ".\n";
            sLine = COLOR_WHITE+sName+ROLL1+COLOR_END+COLOR_GREEN+"D100"+COLOR_END+COLOR_WHITE+ROLL2+COLOR_END+COLOR_BLUE+sNumBase+COLOR_END+COLOR_WHITE+"].\n";
            sMessage += sLine;
            //delete that array entry, no need to pack it
            DeleteLocalString(oPlayer, "PRMember"+IntToString(nTopRoller));
        }
        //Send the final message to the party
        AssignCommand(oPlayer, SpeakString(ESCAPE_STRING+sMessage));
        oPartymember = GetFirstFactionMember(oPlayer);
        while (GetIsObjectValid(oPartymember))
        {
            SendMessageToPC(oPartymember, sMessage);
            oPartymember = GetNextFactionMember(oPlayer);
        }
    }
}
void AddItemPropertyVisualEffect(object oPC, int nItemVisual)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    itemproperty ipAdd = ItemPropertyVisualEffect(nItemVisual);
    effect AddVfx = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    if(GetIsObjectValid(oItem))
    {
        IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_VISUALEFFECT, -1);
        IPSafeAddItemProperty(oItem,ipAdd);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,AddVfx,oPC);
        FloatingTextStringOnCreature(COLOR_RED+VISUAL+COLOR_END,oPC, FALSE);
    }
    else
    {
        FloatingTextStringOnCreature(COLOR_RED+NO_ITEM+COLOR_END,oPC, FALSE);
    }
}
void RemoveItemPropertyVisualEffect(object oPC)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    effect AddVfx = EffectVisualEffect(VFX_IMP_SUPER_HEROISM);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,AddVfx,oPC);
    IPRemoveMatchingItemProperties(oItem,ITEM_PROPERTY_VISUALEFFECT, -1);
    FloatingTextStringOnCreature(COLOR_RED+VISUAL_REMOVE+COLOR_END,oPC, FALSE);
}
void DoBoot(object oPC)
{
    if (GetIsObjectValid(oPC))
    {
        BootPC(oPC);
    }
}
int GetNumberOfLegendaryLevels(object oChar = OBJECT_SELF)
{
    int nLoot = GetLootable(oChar) - 40;
    if (nLoot < 0) nLoot = 0;
    return nLoot;
}
string Leto(string script)
{
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", script);
    return GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
}
string GetPathToBic(object PC)
{
    string VaultPath = VAULTPATH_CHAT;
    string Player = GetPCPlayerName(PC);
    string BicPath = VaultPath + Player + "/";
    return Leto("print q<" + BicPath + "> + " + "FindNewestBic q<" + BicPath + ">;");
}
void ApplyLeto(string Script, object oPC)
{
    string VaultPath = VAULTPATH_CHAT;
    string Player = GetPCPlayerName(oPC);
    //string BicPath = VaultPath + Player + "/";
    string BicFile = GetPathToBic(oPC);
    Script =
        "$RealFile = q<" + BicFile + ">;" +
        "$EditFile = $RealFile + '.utc';" +
        "FileRename $RealFile, $EditFile;" +
        "%bic = $EditFile or die;" +
        Script +
        "%bic = '>';" +
        "close %bic;" +
        "FileRename $EditFile, $RealFile;";
    PrintString("SIMTools leto edit: " + Script);
    SetLocalString(oPC, "LetoScript", Script);
    DelayCommand(3.0f, DoBoot(oPC));
}

string SetStat(int nStat, int nVal)
{
    string sReturn;
    switch (nStat)
    {
        case ABILITY_STRENGTH: sReturn = "Str"; break;
        case ABILITY_DEXTERITY: sReturn = "Dex"; break;
        case ABILITY_CONSTITUTION: sReturn = "Con"; break;
        case ABILITY_INTELLIGENCE: sReturn = "Int"; break;
        case ABILITY_WISDOM: sReturn = "Wis"; break;
        case ABILITY_CHARISMA: sReturn = "Cha"; break;
        default: return "";
    }
    return "/"+sReturn+" = "+IntToString(nVal)+";";
}

string SetSave(int nSave, int nNum)//sSave = fort, ref, or will
{
    string sLeto, sSave;
    switch (nSave)
    {
        case SAVING_THROW_FORT: sSave = "fort"; break;
        case SAVING_THROW_REFLEX: sSave = "ref"; break;
        case SAVING_THROW_WILL: sSave = "will"; break;
        default: return "";
    }
    sLeto = "/"+sSave+"bonus = "+IntToString(nNum)+";";
    return sLeto;
}
void DoDeleteBic(string file)
{
    Leto("FileDelete q<" + file + ">");
}
void DeleteBic(object oPC)
{
    string BicFile = GetPathToBic(oPC);
    DelayCommand(3.0, DoBoot(oPC));
    DelayCommand(4.0, DoDeleteBic(BicFile));
}
void SafeDeleteBic(object oPC)
{
    string BicFile = GetPathToBic(oPC);
    string sScript;
    sScript =
        "$RealFile = q<" + BicFile + ">;" +
        "$EditFile = $RealFile + '.utc';" +
        "FileRename $RealFile, $EditFile;";
    //PrintString("SIMTools leto edit safe delete: " + sScript);
    //SetLocalString(oPC, "LetoScript", sScript);
    //DelayCommand(3.0f, DoBoot(oPC));
}

void JumpSafeToLocation(location lLoc)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), OBJECT_SELF, 0.1);
    ClearAllActions(TRUE);
    JumpToLocation(lLoc);
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
void JumpSafeToObject(object oObj)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), OBJECT_SELF, 0.1);
    ClearAllActions(TRUE);
    JumpToObject(oObj);
    ActionDoCommand(SetCommandable(TRUE));
    SetCommandable(FALSE);
}
//void main(){}
