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


#include "fky_chat_inc"
void main ()
{
            object oDMPC = OBJECT_SELF;
            object oDMTarget = GetLocalObject(oDMPC, "FKY_CHAT_DMSHUNT_TARGET");
            string sDMText = GetLocalString(oDMPC, "FKY_CHAT_DMSHUNT_TEXT");
            DeleteLocalObject(oDMPC, "FKY_CHAT_DMSHUNT_TARGET");
            DeleteLocalString(oDMPC, "FKY_CHAT_DMSHUNT_TEXT");
            string sSort, sKey, sUppercase, sStore, sData, sRow, sReturn;
            object oNewItem, oStorage;
            effect eEffect;
            int nText, nLang, nAppear, nColor, nRowCount;
            location lLoc;
            //this section is now handled earlier, with the other commands and channels
            /*if (GetStringLowerCase(GetStringLeft(sDMText, 3)) == "dm_")//dm-only commands using tell targeting
            {
                if (VerifyDMKey(oDMPC) || VerifyAdminKey(oDMPC))//these commands are for DMs and Admins only
                {*/
                    SetLocalString(oDMPC, "NWNX!CHAT!SUPRESS", "1");//don't want commands to show in text
                    sUppercase = GetStringRight(sDMText, GetStringLength(sDMText) - 3);
                    sDMText = GetStringLowerCase(sUppercase);  //case insensitive
                    sSort = GetStringLeft(sDMText, 1);
                    nText = FindSubString("a b c f g h i j k l p r s t u v", sSort);
                    switch (nText)       //0 2 4 6 8 1012141618202224262830
                    {
                        case -1: CommandRedirect(oDMPC, 11); break;
            /*a*/       case 0:
                        if (GetStringLeft(sDMText, 6) == "align_")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                            if (GetStringLeft(sDMText, 6) == "chaos ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    AdjustAlignment(oDMTarget, ALIGNMENT_CHAOTIC, StringToInt(sDMText));
                                    FloatingTextStringOnCreature(COLOR_RED+ ALIGN1 + GetName(oDMTarget) + " " + sDMText + ALIGN2+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 5) == "evil ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 5);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    AdjustAlignment(oDMTarget, ALIGNMENT_EVIL, StringToInt(sDMText));
                                    FloatingTextStringOnCreature(COLOR_RED+ ALIGN1 + GetName(oDMTarget) + " " + sDMText + ALIGN3+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 5) == "good ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 5);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    AdjustAlignment(oDMTarget, ALIGNMENT_GOOD, StringToInt(sDMText));
                                    FloatingTextStringOnCreature(COLOR_RED+ ALIGN1 + GetName(oDMTarget) + " " + sDMText + ALIGN4+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 4) == "law ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    AdjustAlignment(oDMTarget, ALIGNMENT_LAWFUL, StringToInt(sDMText));
                                    FloatingTextStringOnCreature(COLOR_RED+ ALIGN1 + GetName(oDMTarget) + " " + sDMText + ALIGN5+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else CommandRedirect(oDMPC, 14);
                        }
                        else if (GetStringLeft(sDMText, 2) == "al") CommandRedirect(oDMPC, 14);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*b*/       case 2:
                        if (GetStringLeft(sDMText, 3) == "ban")
                        {
                            if (sDMText == "bandm")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NOBANDM+COLOR_END, oDMPC);
                                    return;
                                }
                                SetLocalInt(oDMTarget, "FKY_CHT_BANDM", TRUE);//temp ban em
                                SendMessageToPC(oDMTarget, COLOR_RED+TEMPBANDM1+COLOR_END);//tell em
                                SendMessageToPC(oDMPC, COLOR_RED+TEMPBANGEN+ GetName(oDMTarget)+TEMPBANDM2+COLOR_END);
                            }
                            else if (sDMText == "banplayer_perm")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NOBANDM+COLOR_END, oDMPC);
                                    return;
                                }
                                sKey = GetPCPublicCDKey(oDMTarget);
                                SetLocalInt(oDMTarget, "FKY_CHT_BANPLAYER", TRUE);//temp ban em
                                if (USING_NWNX_DB) SetPersistentInt(GetModule(), "FKY_CHT_BANPLAYER"+ sKey, TRUE);//permaban em
                                else SetCampaignInt("FKY_CHT", "FKY_CHT_BANPLAYER" + sKey, TRUE);                //
                                FloatingTextStringOnCreature(COLOR_RED+PERMABAN1+COLOR_END, oDMTarget);//tell em
                                AssignCommand(GetModule(), DelayCommand(6.0, DoBoot(oDMTarget)));//boot em
                                SendMessageToPC(oDMPC, COLOR_RED+PERMABANGEN+ GetName(oDMTarget) +PERMABAN2+COLOR_END);
                            }
                            else if (sDMText == "banplayer_temp")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NOBANDM+COLOR_END, oDMPC);
                                    return;
                                }
                                SetLocalInt(oDMTarget, "FKY_CHT_BANPLAYER", TRUE);//temp ban em
                                FloatingTextStringOnCreature(COLOR_RED+TEMPBAN+COLOR_END, oDMTarget);//tell em
                                AssignCommand(GetModule(), DelayCommand(6.0, DoBoot(oDMTarget)));//boot em
                                SendMessageToPC(oDMPC, COLOR_RED+TEMPBANGEN+GetName(oDMTarget) +TEMPBAN2+COLOR_END);
                            }
                            else if (sDMText == "banshout_temp")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NOBANDM+COLOR_END, oDMPC);
                                    return;
                                }
                                SetLocalInt(oDMTarget, "FKY_CHT_BANSHOUT", TRUE);//temp ban em
                                SendMessageToPC(oDMTarget, COLOR_RED+TEMPBANSHT+COLOR_END);//tell em
                                SendMessageToPC(oDMPC, COLOR_RED+TEMPBANGEN+GetName(oDMTarget) +TEMPBANSHT2+COLOR_END);
                                if (GetLocalString(oDMTarget, "FKY_CHT_BANREASON") == "") SetLocalString(oDMTarget, "FKY_CHT_BANREASON", BANNEDBY + GetName(oDMPC));
                            }
                            else if (sDMText == "banshout_perm")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NOBANDM+COLOR_END, oDMPC);
                                    return;
                                }
                                sKey = GetPCPublicCDKey(oDMTarget);
                                SetLocalInt(oDMTarget, "FKY_CHT_BANSHOUT", TRUE);//temp ban em
                                if (GetLocalString(oDMTarget, "FKY_CHT_BANREASON") == "") SetLocalString(oDMTarget, "FKY_CHT_BANREASON", BANNEDBY + GetName(oDMPC));
                                //capture the reason they were banned and by whom
                                if (USING_NWNX_DB) SetPersistentInt(GetModule(), "FKY_CHT_BANSHOUT"+ sKey, TRUE);//permaban em
                                else SetCampaignInt("FKY_CHT", "FKY_CHT_BANSHOUT" + sKey, TRUE);                //
                                SendMessageToPC(oDMTarget, COLOR_RED+PERMBANSHT1+COLOR_END);//tell em
                                SendMessageToPC(oDMPC, COLOR_RED+PERMABANGEN+ GetName(oDMTarget) +PERMBANSHT2+COLOR_END);
                            }
                            else CommandRedirect(oDMPC, 16);
                        }
                        else if (GetStringLeft(sDMText, 2) == "ba") CommandRedirect(oDMPC, 16);
                        else if (sDMText == "boot")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if ((VerifyDMKey(oDMTarget)) || (VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                            {
                                FloatingTextStringOnCreature(COLOR_RED+NOBOOTDM+COLOR_END, oDMPC);
                                return;
                            }
                            DoBoot(oDMTarget);
                            FloatingTextStringOnCreature(COLOR_RED+BOOTED+GetName(oDMTarget)+ "!"+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 2) == "bo") CommandRedirect(oDMPC, 15);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*c*/       case 4:
                        if (GetStringLeft(sDMText, 7) == "create ")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            oNewItem = CreateItemOnObject(sDMText, oDMTarget);
                            if (GetIsObjectValid(oNewItem))
                            {
                                if (!GetIsPC(oDMTarget)) SetDroppableFlag(oNewItem, TRUE);//set to droppable so creature drops on death
                                SendMessageToPC(oDMPC, COLOR_RED+CREATE1+ GetName(oNewItem) +CREATE2+ GetName(oDMTarget) + "!"+COLOR_END);
                            }
                            else SendMessageToPC(oDMPC, COLOR_RED+CREATE3+COLOR_END);
                        }
                        else if (GetStringLeft(sDMText, 2) == "cr") CommandRedirect(oDMPC, 17);
                        else if (GetStringLeft(sDMText, 14) == "change_appear ")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 14);
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if (GetIsPC(oDMTarget))
                            {
                                nAppear = GetLocalInt(oDMTarget, "FKY_CHAT_TRUEAPPEAR");
                                if (!nAppear)//if original appearance has not been stored
                                {
                                    nAppear = GetAppearanceType(oDMTarget);
                                    if (USING_NWNX_DB)//store the original appearance so it can be restored
                                    {
                                        SetLocalInt(oDMTarget, "FKY_CHAT_TRUEAPPEAR", nAppear);
                                        SetPersistentInt(oDMTarget, "FKY_CHAT_TRUEAPPEAR", nAppear);
                                    }
                                    else if (ENABLE_LANGUAGES)
                                    {
                                        oStorage = GetItemPossessedBy(oDMTarget, TAG_OF_LANGUAGE_STORAGE_OBJECT);
                                        SetLocalInt(oDMTarget, "FKY_CHAT_TRUEAPPEAR", nAppear);
                                        SetLocalInt(oStorage, "FKY_CHAT_TRUEAPPEAR", nAppear);
                                        ExportSingleCharacter(oDMTarget);
                                    }
                                }
                            }
                            if ((VerifyDMKey(oDMTarget) || VerifyAdminKey(oDMTarget))&& (oDMTarget != oDMPC)) FloatingTextStringOnCreature(COLOR_RED+NO_DM_APPEAR+COLOR_END, oDMPC);
                            else
                            {
                                if (sDMText == "base")
                                {
                                    if (GetIsPC(oDMTarget)) SetCreatureAppearanceType(oDMTarget, nAppear);
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_BASE_NPC+COLOR_END, oDMPC);
                                }
                                else
                                {
                                    if (TestStringAgainstPattern("*n", sDMText))
                                    {
                                        SetCreatureAppearanceType(oDMTarget, StringToInt(sDMText));
                                        FloatingTextStringOnCreature(COLOR_GREEN+APP_CHANGED+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                                }
                            }
                        }
                        else if (GetStringLeft(sDMText, 2) == "ch") CommandRedirect(oDMPC, 13);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*f*/       case 6:
                        if (GetStringLeft(sDMText, 4) == "fac_")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                            sSort = GetStringLeft(sDMText, 2);
                            if (sSort == "a_")//area
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 2);
                                if (sDMText == "allally") {nText = 100; nLang = 100; nAppear = 100; nColor = 100;}//100 100 100 100
                                else if (sDMText == "allfoe") {nText = 0; nLang = 0; nAppear = 0; nColor = 0;} //0 0 0 0
                                else if (sDMText == "peace") {nText = 11; nLang = 50; nAppear = 91; nColor = 100;}  //11 50 91 100
                                else if (sDMText == "reset") {nText = 0; nLang = 50; nAppear = 91; nColor = 100;}//0 50 91 100
                                else
                                {
                                    CommandRedirect(oDMPC, 24);
                                    return;
                                }
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                oNewItem = GetArea(oDMTarget);
                                oStorage = GetFirstObjectInArea(oNewItem);
                                while (GetIsObjectValid(oStorage))
                                {
                                    if (GetObjectType(oStorage) == OBJECT_TYPE_CREATURE)
                                    {
                                        SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, nText, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, nLang, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, nAppear, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, nColor, oStorage);
                                    }
                                    oStorage = GetNextObjectInArea(oNewItem);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+FACTION_REP+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sSort == "c_")//character
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 2);
                                if (sDMText == "allally") {nText = 100; nLang = 100; nAppear = 100; nColor = 100;}//100 100 100 100
                                else if (sDMText == "allfoe") {nText = 0; nLang = 0; nAppear = 0; nColor = 0;} //0 0 0 0
                                else if (sDMText == "peace") {nText = 11; nLang = 50; nAppear = 91; nColor = 100;}  //11 50 91 100
                                else if (sDMText == "reset") {nText = 0; nLang = 50; nAppear = 91; nColor = 100;}//0 50 91 100
                                else
                                {
                                    CommandRedirect(oDMPC, 24);
                                    return;
                                }
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, nText, oDMTarget);
                                SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, nLang, oDMTarget);
                                SetStandardFactionReputation(STANDARD_FACTION_COMMONER, nAppear, oDMTarget);
                                SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, nColor, oDMTarget);
                                FloatingTextStringOnCreature(COLOR_RED+FACTION_REP+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sSort == "m_")//monsters (all in area not pc)
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 2);
                                if (sDMText == "allally") {nText = 100; nLang = 100; nAppear = 100; nColor = 100;}//100 100 100 100
                                else if (sDMText == "allfoe") {nText = 0; nLang = 0; nAppear = 0; nColor = 0;} //0 0 0 0
                                else if (sDMText == "peace") {nText = 11; nLang = 50; nAppear = 91; nColor = 100;}  //11 50 91 100
                                else if (sDMText == "reset") {nText = 0; nLang = 50; nAppear = 91; nColor = 100;}//0 50 91 100
                                else
                                {
                                    CommandRedirect(oDMPC, 24);
                                    return;
                                }
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                oNewItem = GetArea(oDMTarget);
                                oStorage = GetFirstObjectInArea(oNewItem);
                                while (GetIsObjectValid(oStorage))
                                {
                                    if ((GetObjectType(oStorage) == OBJECT_TYPE_CREATURE) && (!GetIsPC(oStorage)))
                                    {
                                        SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, nText, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, nLang, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, nAppear, oStorage);
                                        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, nColor, oStorage);
                                    }
                                    oStorage = GetNextObjectInArea(oNewItem);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+FACTION_REP+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sSort == "p_")//party
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 2);
                                if (sDMText == "allally") {nText = 100; nLang = 100; nAppear = 100; nColor = 100;}//100 100 100 100
                                else if (sDMText == "allfoe") {nText = 0; nLang = 0; nAppear = 0; nColor = 0;} //0 0 0 0
                                else if (sDMText == "peace") {nText = 11; nLang = 50; nAppear = 91; nColor = 100;}  //11 50 91 100
                                else if (sDMText == "reset") {nText = 0; nLang = 50; nAppear = 91; nColor = 100;}//0 50 91 100
                                else
                                {
                                    CommandRedirect(oDMPC, 24);
                                    return;
                                }
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                oStorage = GetFirstFactionMember(oDMTarget);
                                while (GetIsObjectValid(oStorage))
                                {
                                    SetStandardFactionReputation(STANDARD_FACTION_HOSTILE, nText, oStorage);
                                    SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, nLang, oStorage);
                                    SetStandardFactionReputation(STANDARD_FACTION_COMMONER, nAppear, oStorage);
                                    SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, nColor, oStorage);
                                    oStorage = GetNextFactionMember(oDMTarget);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+FACTION_REP+COLOR_END, oDMPC, FALSE);
                            }
                            else CommandRedirect(oDMPC, 24);
                        }
                        else if (GetStringLeft(sDMText, 2) == "fa") CommandRedirect(oDMPC, 24);
                        else if (sDMText == "freeze")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)))//these commands may not be used on dms
                            {
                                SetCommandable(FALSE, oDMTarget);
                                SendMessageToPC(oDMTarget, COLOR_RED+FREEZE1+COLOR_END);
                                SendMessageToPC(oDMPC, COLOR_RED+FREEZE2+ GetName(oDMTarget) + "!"+COLOR_END);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+FREEZE3+COLOR_END, oDMPC);
                        }
                        else if (GetStringLeft(sDMText, 2) == "fr") CommandRedirect(oDMPC, 15);
                        else if (GetStringLeft(sDMText, 2) == "fx")
                        {
                            if (GetStringLeft(sDMText, 3) == "fx ")
                            {
                                sDMText = GetStringLowerCase(GetStringRight(sDMText, GetStringLength(sDMText) - 3));
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                AssignCommand(oDMPC, DoVFX(oDMPC, sDMText, oDMTarget));//assigncommand ensures DM is creator
                            }
                            else if (GetStringLeft(sDMText, 7) == "fx_loc ")
                            {
                                lLoc =  VerifyLocation(oDMPC, sUppercase);
                                if (!GetIsObjectValid(GetAreaFromLocation(lLoc))) return;
                                sDMText = GetStringLowerCase(GetStringRight(sDMText, GetStringLength(sDMText) - 7));
                                AssignCommand(oDMPC, DoVFX(oDMPC, sDMText, oDMTarget, TRUE));//assigncommand ensures DM is creator
                            }
                            else if (sDMText == "fx_rem")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                eEffect = GetFirstEffect(oDMTarget);
                                while (GetIsEffectValid(eEffect))
                                {
                                    if (((GetEffectType(eEffect) == EFFECT_TYPE_VISUALEFFECT) || (GetEffectType(eEffect) == EFFECT_TYPE_BEAM)) && (GetEffectCreator(eEffect) == oDMPC))
                                    {
                                        DelayCommand(0.1, RemoveEffect(oDMTarget, eEffect));
                                    }
                                    eEffect = GetNextEffect(oDMTarget);
                                }
                            }
                            else if (GetStringLeft(sDMText, 8) == "fx_list_")  // dur, bea, eye, imp, com, fnf
                            {
                                sDMText = GetStringLowerCase(GetStringRight(sDMText, GetStringLength(sDMText) - 8));
                                if (sDMText == "dur" || sDMText == "bea" || sDMText == "eye" || sDMText == "imp" || sDMText == "com" || sDMText == "fnf") ListFX(oDMPC, sDMText);
                                else CommandRedirect(oDMPC, 25);
                            }
                            else CommandRedirect(oDMPC, 25);
                        }
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*g*/       case 8:
                        if (GetStringLeft(sDMText, 6) == "getban")
                        {
                            if (sDMText == "getbanlist") GetBanList(oDMPC);
                            else if (sDMText == "getbanreason")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                sKey = GetLocalString(oDMTarget, "FKY_CHT_BANREASON");
                                if (sKey == "") SendMessageToPC(oDMPC, COLOR_RED+BANREASON1+COLOR_END);
                                else SendMessageToPC(oDMPC, COLOR_RED+BANREASON2+ sKey + COLOR_END);
                            }
                            else CommandRedirect(oDMPC, 16);
                        }
                        else if (GetStringLeft(sDMText, 4) == "getb") CommandRedirect(oDMPC, 16);
                        else if (GetStringLeft(sDMText, 6) == "getvar")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                            sStore = GetStringRight(sUppercase, GetStringLength(sUppercase) - 6);
                            if (GetStringLeft(sDMText, 4) == "int ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 4);
                                nLang = FindSubString(sDMText, " ");
                                if (nLang == -1)
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    nLang = GetLocalInt(oDMTarget, sStore);
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARINT1+sStore+VARINT2+IntToString(nLang)+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 6) == "float ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 6);
                                nLang = FindSubString(sDMText, " ");
                                if (nLang == -1)
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARINT3+sStore+VARINT2+FloatToString(GetLocalFloat(oDMTarget, sStore))+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 7) == "string ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 7);
                                nLang = FindSubString(sDMText, " ");
                                if (nLang == -1)
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARINT4+sStore+VARINT2+GetLocalString(oDMTarget, sStore)+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 3) == "mod")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 3);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 3);
                                if (GetStringLeft(sDMText, 4) == "int ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 4);
                                    nLang = FindSubString(sDMText, " ");
                                    if (nLang == -1)
                                    {
                                        nLang = GetLocalInt(GetModule(), sStore);
                                        FloatingTextStringOnCreature(COLOR_GREEN+VARINT1+sStore+VARINT2+IntToString(nLang)+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                                }
                                else if (GetStringLeft(sDMText, 6) == "float ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 6);
                                    nLang = FindSubString(sDMText, " ");
                                    if (nLang == -1)
                                    {
                                        FloatingTextStringOnCreature(COLOR_GREEN+VARINT3+sStore+VARINT2+FloatToString(GetLocalFloat(GetModule(), sStore))+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                                }
                                else if (GetStringLeft(sDMText, 7) == "string ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 7);
                                    nLang = FindSubString(sDMText, " ");
                                    if (nLang == -1)
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        FloatingTextStringOnCreature(COLOR_GREEN+VARINT4+sStore+VARINT2+GetLocalString(GetModule(), sStore)+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_VAR_SPACE+COLOR_END, oDMPC);
                                }
                                else CommandRedirect(oDMPC, 22);
                            }
                            else CommandRedirect(oDMPC, 22);
                        }
                        else if (GetStringLeft(sDMText, 4) == "getv") CommandRedirect(oDMPC, 22);
                        else if (GetStringLeft(sDMText, 4) == "give")
                        {
                            if (GetStringLeft(sDMText, 7) == "givexp ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    GiveXPToCreature(oDMTarget, StringToInt(sDMText));
                                    SendMessageToPC(oDMPC, COLOR_RED+XP1+ IntToString(StringToInt(sDMText))+XP2+GetName(oDMTarget) + "!"+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 10) == "givelevel ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 10);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    nColor = StringToInt(sDMText);
                                    if (nColor == 1) sStore = XP12;
                                    else sStore = XP13;
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    GiveLevel(oDMTarget, oDMPC, nColor);
                                    SendMessageToPC(oDMPC, COLOR_RED+XP1+ IntToString(nColor)+sStore+GetName(oDMTarget) + "!"+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 12) == "givepartyxp ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 12);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    oStorage = GetFirstFactionMember(oDMTarget);
                                    while (GetIsObjectValid(oStorage))
                                    {
                                        GiveXPToCreature(oStorage, StringToInt(sDMText));
                                        oStorage = GetNextFactionMember(oDMTarget);
                                    }
                                    SendMessageToPC(oDMPC, COLOR_RED+XP1+ IntToString(StringToInt(sDMText))+XP2+GetName(oDMTarget) + XP11+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 15) == "givepartylevel ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 15);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    oStorage = GetFirstFactionMember(oDMTarget);
                                    nColor = StringToInt(sDMText);
                                    if (nColor == 1) sStore = XP12;
                                    else sStore = XP13;
                                    while (GetIsObjectValid(oStorage))
                                    {
                                        GiveLevel(oStorage, oDMPC, nColor, FALSE);//function has built-in message to each, FALSE stops it
                                        oStorage = GetNextFactionMember(oDMTarget);
                                    }
                                    SendMessageToPC(oDMPC, COLOR_RED+XP1+ IntToString(StringToInt(sDMText))+sStore+GetName(oDMTarget) + XP11+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else CommandRedirect(oDMPC, 19);
                        }
                        else if (GetStringLeft(sDMText, 2) == "gi") CommandRedirect(oDMPC, 19);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*h*/       case 10:
                        if (sDMText == "hide")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            ExploreAreaForPlayer(GetArea(oDMTarget), oDMTarget, FALSE);
                            FloatingTextStringOnCreature(COLOR_RED+EXPLORE2+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 2) == "hi") CommandRedirect(oDMPC, 20);
                        else if (sDMText == "help") ListDMHelp(oDMPC);
                        else if (GetStringLeft(sDMText, 2) == "he") CommandRedirect(oDMPC, 26);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*i*/       case 12:
                        if (GetStringLeft(sDMText, 2) == "ig")
                        {
                            if (sDMText == "ignoredm")
                            {
                                if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    SetLocalInt(oDMPC, "FKY_CHT_IGNOREDM", TRUE);//they will not receive dm messages
                                    SendMessageToPC(oDMPC, COLOR_RED+IGNORED+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (sDMText == "ignoremeta")
                            {
                                if ((DMS_HEAR_META && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    SetLocalInt(oDMPC, "FKY_CHT_IGNOREMETA", TRUE);//they will not receive dm messages
                                    SendMessageToPC(oDMPC, COLOR_RED+IGNOREM+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (sDMText == "ignoretells")
                            {
                                if ((DMS_HEAR_TELLS && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    SetLocalInt(oDMPC, "FKY_CHT_IGNORETELLS", TRUE);//they will not receive tells
                                    SendMessageToPC(oDMPC, COLOR_RED+IGNORET+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if ( ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ||
                                      ((DMS_HEAR_META && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ||
                                      ((DMS_HEAR_TELLS && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ) CommandRedirect(oDMPC, 27);
                            else CommandRedirect(oDMPC, 11);
                        }
                        else if (sDMText == "invis")
                        {
                            AssignCommand(GetModule(), DoDMInvis(oDMPC));
                            SendMessageToPC(oDMPC, COLOR_RED+INVIS+COLOR_END);
                        }
                        else if (sDMText == "invuln")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            SetPlotFlag(oDMTarget, TRUE);
                            if (oDMTarget == oDMPC) SendMessageToPC(oDMPC, COLOR_RED+INVUL1+COLOR_END);
                            else
                            {
                                SendMessageToPC(oDMPC, COLOR_RED + GetName(oDMTarget) +INVUL2+COLOR_END);
                                if (GetIsPC(oDMPC)) SendMessageToPC(oDMTarget, COLOR_RED+INVUL1+COLOR_END);
                            }
                        }
                        else if (GetStringLeft(sDMText, 2) == "in") CommandRedirect(oDMPC, 15);
                        else if (GetStringLeft(sDMText, 5) == "item_")//id, destroy
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 5);
                            if (sDMText == "id")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                oStorage = GetFirstItemInInventory(oDMTarget);
                                while (GetIsObjectValid(oStorage))
                                {
                                    SetIdentified(oStorage, TRUE);
                                    oStorage = GetNextItemInInventory(oDMTarget);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+ITEM_ID+GetName(oDMTarget)+ITEM_END+COLOR_END, oDMPC, FALSE);
                            }
                            else if (GetStringLeft(sDMText, 8) == "destroy_")
                            {
                                if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 8);
                                    if (sDMText == "all")
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        for (nAppear = 0; nAppear < 14; nAppear++)//destroy all but skin/creature weaps
                                        {
                                            oStorage = GetItemInSlot(nAppear, oDMTarget);
                                            DestroyObject(oStorage, 0.1);
                                        }
                                        oStorage = GetFirstItemInInventory(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            DestroyObject(oStorage, 0.1);
                                            oStorage = GetNextItemInInventory(oDMTarget);
                                        }
                                        FloatingTextStringOnCreature(COLOR_RED+ITEM_DESTROY+GetName(oDMTarget)+ITEM_END+COLOR_END, oDMPC, FALSE);
                                    }
                                    else if (sDMText == "equip")
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        for (nAppear = 0; nAppear < 14; nAppear++)//destroy all but skin/creature weaps
                                        {
                                            oStorage = GetItemInSlot(nAppear, oDMTarget);
                                            DestroyObject(oStorage, 0.1);
                                        }
                                        FloatingTextStringOnCreature(COLOR_RED+ITEM_DESTROY+GetName(oDMTarget)+ITEM_END3+COLOR_END, oDMPC, FALSE);
                                    }
                                    else if (sDMText == "inv")
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        oStorage = GetFirstItemInInventory(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            DestroyObject(oStorage, 0.1);
                                            oStorage = GetNextItemInInventory(oDMTarget);
                                        }
                                        FloatingTextStringOnCreature(COLOR_RED+ITEM_DESTROY+GetName(oDMTarget)+ITEM_END2+COLOR_END, oDMPC, FALSE);
                                    }
                                    else CommandRedirect(oDMPC, 17);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                            }
                            else CommandRedirect(oDMPC, 17);
                        }
                        else if (GetStringLeft(sDMText, 2) == "it") CommandRedirect(oDMPC, 17);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*j*/       case 14:
                        if (sDMText == "jump")
                        {
                                lLoc =  VerifyLocation(oDMPC, sUppercase);
                                if (!GetIsObjectValid(GetAreaFromLocation(lLoc))) return;
                                DeleteLocalLocation(oDMPC, "FKY_CHAT_LOCATION");
                                AssignCommand(oDMPC, JumpSafeToLocation(lLoc));
                        }
                        else if (GetStringLeft(sDMText, 2) == "ju") CommandRedirect(oDMPC, 18);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*k*/       case 16:
                        if (sDMText == "kill")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)))//this command may not be used on dms or admins
                            {
                                SetPlotFlag(oDMTarget, FALSE);
                                ApplyEffectToObject(0, SupernaturalEffect(EffectDeath()), oDMTarget);
                                SendMessageToPC(oDMPC, COLOR_RED + GetName(oDMTarget)+KILL1+COLOR_END);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+KILL2+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 2) == "ki") CommandRedirect(oDMPC, 15);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*l*/       case 18:
                        if (sDMText == "listcommands") ListDMCommands(oDMPC);
                        else if (GetStringLeft(sDMText, 2) == "li") CommandRedirect(oDMPC, 26);
                        else if (ENABLE_LANGUAGES && (GetStringLeft(sDMText, 6) == "learn "))
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                            nLang = GetLanguageNumber(sDMText);
                            if (nLang == -1) FloatingTextStringOnCreature(COLOR_RED+LANG1+COLOR_END, oDMPC, FALSE);
                            else
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if (USING_NWNX_DB)
                                {
                                    SetLocalInt(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang), TRUE);
                                    SetPersistentInt(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang), TRUE);
                                }
                                else
                                {
                                    oStorage = GetItemPossessedBy(oDMTarget, TAG_OF_LANGUAGE_STORAGE_OBJECT);
                                    SetLocalInt(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang), TRUE);
                                    SetLocalInt(oStorage, "FKY_CHAT_LANG"+IntToString(nLang), TRUE);
                                    ExportSingleCharacter(oDMTarget);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+LANG2+GetName(oDMTarget)+" "+GetNameOfLanguage(nLang)+"."+COLOR_END, oDMPC, FALSE);
                            }
                        }
                        else if (ENABLE_LANGUAGES && (GetStringLeft(sDMText, 2) == "le")) CommandRedirect(oDMPC, 26);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*p*/       case 20:
                        if (GetStringLowerCase(GetStringLeft(sDMText, 4)) == "port")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                            if (GetStringLowerCase(GetStringLeft(sDMText, 5)) == "party")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 5);
                                nText = FindSubString("here hell jail leader there town", sDMText);
                                switch(nText)        //0    5    10   15     22    28
                                {
                                    case -1:
                                    if (GetStringLowerCase(GetStringLeft(sDMText, 4)) == "way ")
                                    {
                                        sDMText = GetStringRight(sUppercase, GetStringLength(sUppercase) - 13);
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                        {
                                            lLoc = GetLocation(GetWaypointByTag(sDMText));
                                            oStorage = GetFirstFactionMember(oDMTarget);
                                            while (GetIsObjectValid(oStorage))
                                            {
                                                AssignCommand(oStorage, JumpSafeToLocation(lLoc));
                                                oStorage = GetNextFactionMember(oDMTarget);
                                            }
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                    else CommandRedirect(oDMPC, 18);
                                    break;
                                    case 0:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                    {
                                        oStorage = GetFirstFactionMember(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            if (oStorage != oDMPC) AssignCommand(oStorage, JumpSafeToObject(oDMPC));
                                            oStorage = GetNextFactionMember(oDMTarget);
                                        }
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 5:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                    {
                                        lLoc = GetLocation(GetWaypointByTag(LOCATION_HELL));
                                        oStorage = GetFirstFactionMember(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            AssignCommand(oStorage, JumpSafeToLocation(lLoc));
                                            oStorage = GetNextFactionMember(oDMTarget);
                                        }
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 10:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                    {
                                        lLoc = GetLocation(GetWaypointByTag(LOCATION_JAIL));
                                        oStorage = GetFirstFactionMember(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            AssignCommand(oStorage, JumpSafeToLocation(lLoc));
                                            oStorage = GetNextFactionMember(oDMTarget);
                                        }
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 15:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                    {
                                        oStorage = GetFirstFactionMember(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            if (GetFactionLeader(oDMTarget) != oStorage) AssignCommand(oStorage, JumpSafeToObject(GetFactionLeader(oDMTarget)));
                                            oStorage = GetNextFactionMember(oDMTarget);
                                        }
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 22:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    oStorage = GetFirstFactionMember(oDMPC);
                                    while (GetIsObjectValid(oStorage))
                                    {
                                        if (oDMTarget != oStorage) AssignCommand(oStorage, JumpSafeToObject(oDMTarget));
                                        oStorage = GetNextFactionMember(oDMPC);
                                    }
                                    break;
                                    case 28:
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                    {
                                        lLoc = GetLocation(GetWaypointByTag(LOCATION_TOWN));
                                        oStorage = GetFirstFactionMember(oDMTarget);
                                        while (GetIsObjectValid(oStorage))
                                        {
                                            AssignCommand(oStorage, JumpSafeToLocation(lLoc));
                                            oStorage = GetNextFactionMember(oDMTarget);
                                        }
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                }
                            }
                            else
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                nText = FindSubString("here hell jail leader there town", sDMText);
                                switch(nText)        //0    5    10   15     22    28
                                {
                                    case -1:
                                    if (GetStringLowerCase(GetStringLeft(sDMText, 4)) == "way ")
                                    {
                                        sDMText = GetStringRight(sUppercase, GetStringLength(sUppercase) - 8);
                                        if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                                        {
                                            lLoc = GetLocation(GetWaypointByTag(sDMText));
                                            AssignCommand(oDMTarget, JumpSafeToLocation(lLoc));
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                    else CommandRedirect(oDMPC, 18);
                                    break;
                                    case 0:
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC)) AssignCommand(oDMTarget, JumpSafeToObject(oDMPC));
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 5:
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC)) AssignCommand(oDMTarget, JumpSafeToLocation(GetLocation(GetWaypointByTag(LOCATION_HELL))));
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 10:
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC)) AssignCommand(oDMTarget, JumpSafeToLocation(GetLocation(GetWaypointByTag(LOCATION_JAIL))));
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 15:
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC)) AssignCommand(oDMTarget, JumpSafeToObject(GetFactionLeader(oDMTarget)));
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                    case 22: AssignCommand(oDMPC, JumpSafeToObject(oDMTarget)); break;
                                    case 28:
                                    if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC)) AssignCommand(oDMTarget, JumpSafeToLocation(GetLocation(GetWaypointByTag(LOCATION_TOWN))));
                                    else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    break;
                                }
                            }
                        }
                        else if (GetStringLeft(sDMText, 2) == "po") CommandRedirect(oDMPC, 18);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*r*/       case 22:
                        if (sDMText == "rez")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if (((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget))) || (oDMTarget == oDMPC))
                            {
                                ApplyEffectToObject(0, EffectResurrection(), oDMTarget);
                                ApplyEffectToObject(0, EffectHeal(GetMaxHitPoints(oDMTarget)- GetCurrentHitPoints(oDMTarget)), oDMTarget);
                                FloatingTextStringOnCreature(COLOR_RED + GetName(oDMTarget)+DMREZ+COLOR_END, oDMPC);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                        }
                        else if (sDMText == "reset_mod")
                        {
                            DelayCommand(1.0, SetLocalString(GetModule(), "NWNX!RESETPLUGIN!SHUTDOWN", "1"));//this line is the entire nwscriptside of the reset plugin
                        }
                        else if (GetStringLeft(sDMText, 4) == "rese") CommandRedirect(oDMPC, 20);
                        else if (sDMText == "rest")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC)) ForceRest(oDMTarget);
                            else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 3) == "res") CommandRedirect(oDMPC, 15);
                        else if (sDMText == "reveal")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            ExploreAreaForPlayer(GetArea(oDMTarget), oDMTarget, TRUE);
                            FloatingTextStringOnCreature(COLOR_RED+EXPLORE1+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 2) == "re") CommandRedirect(oDMPC, 20);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*s*/       case 24:
                        if ((GetStringLeft(sDMText, 3) == "set") && (GetSubString(sDMText, 3, 1) != "v") && (GetSubString(sDMText, 3, 1) != "t") && (GetSubString(sDMText, 3, 2) != "we"))
                        {
                            if (GetStringLeft(sDMText, 7) == "setcha ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_CHARISMA, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 7) == "setcon ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_CONSTITUTION, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 7) == "setdex ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_DEXTERITY, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 7) == "setint ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_INTELLIGENCE, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 7) == "setstr ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_STRENGTH, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 7) == "setwis ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                if (nAppear < 3) nAppear = 3;
                                                if (nAppear > 99) nAppear = 99;
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetStat(ABILITY_WISDOM, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 8) == "setfort ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 8);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetSave(SAVING_THROW_FORT, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 10) == "setreflex ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 10);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetSave(SAVING_THROW_REFLEX, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (GetStringLeft(sDMText, 8) == "setwill ")
                            {
                                if (VAULTPATH_CHAT != "")//check if vault specified, command error otherwise
                                {
                                    //check if admin only
                                    if (LETO_FOR_ADMINS_ONLY && (!VerifyAdminKey(oDMPC))) FloatingTextStringOnCreature(COLOR_RED+ADMIN_ONLY+COLOR_END, oDMPC, FALSE);
                                    else
                                    {
                                        oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                        if (!GetIsObjectValid(oDMTarget)) return;
                                        //check for prior pending leto edits
                                        if (GetLocalString(oDMTarget, "LetoScript") != "") FloatingTextStringOnCreature(COLOR_RED+PENDING_EDIT+COLOR_END, oDMPC, FALSE);
                                        else if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                                        {
                                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 8);
                                            nAppear = StringToInt(sDMText);
                                            if (TestStringAgainstPattern("*n", sDMText))
                                            {
                                                ExportSingleCharacter(oDMTarget);//export needed to ensure this .bic is the most recently edited
                                                sDMText = SetSave(SAVING_THROW_WILL, nAppear);
                                                DelayCommand(3.0, ApplyLeto(sDMText, oDMTarget));//delay to give export a chance to finish writing to the file
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMPC, FALSE);
                                                FloatingTextStringOnCreature(COLOR_RED+LETO_CONFIRM+COLOR_END, oDMTarget, FALSE);
                                            }
                                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC, FALSE);
                                        }
                                        else FloatingTextStringOnCreature(COLOR_RED+NO_OTHER_DM_TARGET+COLOR_END, oDMPC, FALSE);
                                    }
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else CommandRedirect(oDMPC, 13);
                        }
                        else if (GetStringLeft(sDMText, 8) == "settime ")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 8);
                            if (TestStringAgainstPattern("*n", sDMText))
                            {
                                SetTime(StringToInt(sDMText), 0, 0, 0);
                                FloatingTextStringOnCreature(COLOR_RED+TIME_SET+COLOR_END, oDMPC);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                        }
                        else if (GetStringLeft(sDMText, 4) == "sett") CommandRedirect(oDMPC, 21);
                        else if (GetStringLeft(sDMText, 6) == "setvar")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                            sStore = GetStringRight(sUppercase, GetStringLength(sUppercase) - 6);
                            if (GetStringLeft(sDMText, 4) == "int ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 4);               //
                                nLang = FindSubString(sDMText, " ");
                                sKey = GetStringLeft(sStore, nLang);//name of variable                      //
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));     //
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    SetLocalInt(oDMTarget, sKey, StringToInt(sStore));                      //
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 6) == "float ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 6);
                                nLang = FindSubString(sDMText, " ");
                                sKey = GetStringLeft(sStore, nLang);//name of variable
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));
                                if (TestStringAgainstPattern("*n.*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    SetLocalFloat(oDMTarget, sKey, StringToFloat(sStore));
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 7) == "string ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 7);
                                nLang = FindSubString(sDMText, " ");
                                sKey = GetStringLeft(sStore, nLang);//name of variable
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                SetLocalString(oDMTarget, sKey, sStore);
                                FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 3) == "mod")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 3);
                                sStore = GetStringRight(sStore, GetStringLength(sStore) - 3);
                                if (GetStringLeft(sDMText, 4) == "int ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 4);
                                    nLang = FindSubString(sDMText, " ");
                                    sKey = GetStringLeft(sStore, nLang);//name of variable
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));
                                    if (TestStringAgainstPattern("*n", sDMText))
                                    {
                                        SetLocalInt(GetModule(), sKey, StringToInt(sStore));
                                        FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                                }
                                else if (GetStringLeft(sDMText, 6) == "float ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 6);
                                    nLang = FindSubString(sDMText, " ");
                                    sKey = GetStringLeft(sStore, nLang);//name of variable
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));
                                    if (TestStringAgainstPattern("*n.*n", sDMText))
                                    {
                                        SetLocalFloat(GetModule(), sKey, StringToFloat(sStore));
                                        FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                                    }
                                    else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                                }
                                else if (GetStringLeft(sDMText, 7) == "string ")
                                {
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - 7);
                                    nLang = FindSubString(sDMText, " ");
                                    sKey = GetStringLeft(sStore, nLang);//name of variable
                                    sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - (nLang + 1));
                                    sStore = GetStringRight(sStore, GetStringLength(sStore) - (nLang + 1));
                                    SetLocalString(GetModule(), sKey, sStore);
                                    FloatingTextStringOnCreature(COLOR_GREEN+VARIABLE_SET+COLOR_END, oDMPC);
                                }
                                else CommandRedirect(oDMPC, 22);
                            }
                            else CommandRedirect(oDMPC, 22);
                        }
                        else if (GetStringLeft(sDMText, 4) == "setv") CommandRedirect(oDMPC, 22);
                        else if (GetStringLeft(sDMText, 11) == "setweather_")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 11);
                            if (GetStringLeft(sDMText, 2) == "a_")
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, AREA_TARGET_OK);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                oStorage = GetArea(oDMTarget);
                            }
                            else if (GetStringLeft(sDMText, 2) == "m_") oStorage = GetModule();
                            else
                            {
                                CommandRedirect(oDMPC, 21);
                                return;
                            }
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 2);
                            if (sDMText == "clear")
                            {
                                SetWeather(oStorage, WEATHER_CLEAR);
                                FloatingTextStringOnCreature(COLOR_RED+WEATHER_CHANGE+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sDMText == "rain")
                            {
                                SetWeather(oStorage, WEATHER_RAIN);
                                FloatingTextStringOnCreature(COLOR_RED+WEATHER_CHANGE+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sDMText == "reset")
                            {
                                SetWeather(oStorage, WEATHER_USE_AREA_SETTINGS);
                                FloatingTextStringOnCreature(COLOR_RED+WEATHER_CHANGE+COLOR_END, oDMPC, FALSE);
                            }
                            else if (sDMText == "snow")
                            {
                                SetWeather(oStorage, WEATHER_SNOW);
                                FloatingTextStringOnCreature(COLOR_RED+WEATHER_CHANGE+COLOR_END, oDMPC, FALSE);
                            }
                            else CommandRedirect(oDMPC, 21);
                        }
                        else if (GetStringLeft(sDMText, 4) == "setw") CommandRedirect(oDMPC, 21);
                        else if (GetStringLeft(sDMText, 6) == "spawn ")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 6);
                            nLang = FindSubString(sDMText, " ");
                            if (nLang == -1)
                            {
                                lLoc =  VerifyLocation(oDMPC, sUppercase);
                                if (!GetIsObjectValid(GetAreaFromLocation(lLoc))) return;
                                oStorage = CreateObject(OBJECT_TYPE_CREATURE, sDMText, lLoc);
                                if (GetIsObjectValid(oStorage)) FloatingTextStringOnCreature(COLOR_GREEN+SPAWNED+COLOR_END, oDMPC);
                                else FloatingTextStringOnCreature(COLOR_RED+NO_CRITTER_RESREF+COLOR_END, oDMPC);
                                DeleteLocalLocation(oDMPC, "FKY_CHAT_LOCATION");
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+NO_RESREF_SPACE+COLOR_END, oDMPC);
                        }
                        else if (GetStringLeft(sDMText, 2) == "sp") CommandRedirect(oDMPC, 23);
                        else if ((GetStringLeft(sDMText, 4) == "sql ") && VerifyAdminKey(oDMPC))
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 4);
                            sUppercase = GetStringRight(sUppercase, GetStringLength(sUppercase) - 4);
                            sStore = sUppercase;//store the string to execute later
                            if (GetStringLeft(sDMText, 7) == "select ")//if a select query we must parse the columns queried
                            {
                                if (GetStringLeft(sDMText, 8) == "select *")
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+NO_STAR+COLOR_END, oDMPC, FALSE);
                                    return;
                                }
                                else if (GetStringRight(sDMText, 1) != ";")
                                {
                                    FloatingTextStringOnCreature(COLOR_RED+REQ_SEMI+COLOR_END, oDMPC, FALSE);
                                    return;
                                }
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                sUppercase = GetStringRight(sUppercase, GetStringLength(sUppercase) - 7);
                                nText = FindSubString(sDMText, " from ");//string before from
                                if (nText == -1) FloatingTextStringOnCreature(COLOR_RED+SELECT_NO_FROM+COLOR_END, oDMPC, FALSE);
                                else
                                {
                                    sDMText = GetStringLeft(sDMText, nText);//text before the from
                                    sUppercase = GetStringLeft(sUppercase, nText);//text before the from
                                    nText = FindSubString(sUppercase, ",");//first comma
                                    nLang = 0;
                                    sKey = "";
                                    while (nText != -1)
                                    {
                                        nLang ++;//count the commas
                                        sSort = GetStringLeft(sUppercase, nText);//get the text to the left of the comma
                                        while (GetStringLeft(sSort, 1) == " ") sSort = GetStringRight(sSort, GetStringLength(sSort) - 1);//parse out left spaces
                                        while (GetStringRight(sSort, 1) == " ") sSort = GetStringLeft(sSort, GetStringLength(sSort) - 1);//parse out right spaces
                                        if (GetStringLength(sSort) < 1)
                                        {
                                            FloatingTextStringOnCreature(COLOR_RED+NO_BLANK_COLUMN+COLOR_END, oDMPC, FALSE);
                                            nLang = 1;
                                            while (GetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang)) != "")
                                            {
                                                DeleteLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang));
                                                nLang++;
                                            }
                                            return;
                                        }
                                        //else sKey += sSort + "¬" + IntToString(nLang);//store the column names without spaces, with numbers for indexed retrieval
                                        else SetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang), sSort);
                                        sUppercase = GetStringRight(sUppercase, GetStringLength(sUppercase) - (nText+1));
                                        nText = FindSubString(sUppercase, ",");//next comma
                                    }
                                    if (!nLang)//no commas, single column
                                    {
                                        sSort = sUppercase;//get the text to the left of the from
                                        while (GetStringLeft(sSort, 1) == " ") sSort = GetStringRight(sSort, GetStringLength(sSort) - 1);//parse out left spaces
                                        while (GetStringRight(sSort, 1) == " ") sSort = GetStringLeft(sSort, GetStringLength(sSort) - 1);//parse out right spaces
                                        if (GetStringLength(sSort) < 1)
                                        {
                                            FloatingTextStringOnCreature(COLOR_RED+NO_BLANK_COLUMN+COLOR_END, oDMPC, FALSE);
                                            return;
                                        }
                                        SQLExecDirect(sStore);
                                        sReturn = "";
                                        while(SQLFetch() != SQL_ERROR)
                                        {
                                            sData = SQLGetData(1);
                                            sReturn += COLOR_YELLOW + sSort + ": " + COLOR_END + COLOR_WHITE + sData + COLOR_END + NEWLINE;
                                            nLang ++;
                                        }
                                        sReturn += IntToString(nLang) + SQL_ROWS;
                                        SendMessageToPC(oDMPC, sReturn);
                                    }
                                    else
                                    {
                                        nLang ++;//count the commas
                                        sSort = sUppercase;//get last column
                                        while (GetStringLeft(sSort, 1) == " ") sSort = GetStringRight(sSort, GetStringLength(sSort) - 1);//parse out left spaces
                                        while (GetStringRight(sSort, 1) == " ") sSort = GetStringLeft(sSort, GetStringLength(sSort) - 1);//parse out right spaces
                                        if (GetStringLength(sSort) < 1)
                                        {
                                            FloatingTextStringOnCreature(COLOR_RED+NO_BLANK_COLUMN+COLOR_END, oDMPC, FALSE);
                                            nLang = 1;
                                            while (GetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang)) != "")
                                            {
                                                DeleteLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang));
                                                nLang++;
                                            }
                                            return;
                                        }
                                        //else sKey += sSort + "¬" + IntToString(nLang);//store the column names without spaces, with numbers for indexed retrieval
                                        else SetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang), sSort);
                                        //output the return
                                        SQLExecDirect(sStore);
                                        sReturn = "";
                                        nAppear = 1;
                                        nRowCount = 0;
                                        while(SQLFetch() != SQL_ERROR)
                                        {
                                            sRow = "";
                                            nColor = 0;
                                            for(nAppear = 1; nAppear <= nLang; nAppear++)//output the results on this row
                                            {
                                                nColor++;
                                                if (nColor > 6) nColor = 1;
                                                sData = SQLGetData(nAppear);
                                                if (nAppear == nLang) sRow += GetColorStringForColumn(nColor) + GetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nAppear)) + ": " + COLOR_END + COLOR_WHITE + sData + ";" + COLOR_END + NEWLINE; //last column
                                                else sRow += GetColorStringForColumn(nColor) + GetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nAppear)) + ": " + COLOR_END + COLOR_WHITE + sData + ", " + COLOR_END;//others
                                            }
                                            sReturn += sRow;
                                            nRowCount ++;
                                        }
                                        sReturn += IntToString(nRowCount) + SQL_ROWS;
                                        SendMessageToPC(oDMPC, sReturn);
                                        nLang = 1;
                                        while (GetLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang)) != "")
                                        {
                                            DeleteLocalString(oDMPC, "FKY_SQL_COLUMN_" + IntToString(nLang));
                                            nLang++;
                                        }
                                    }
                                }
                            }
                            else
                            {
                                SQLExecDirect(sStore);//if not a SELECT query then just execute
                                FloatingTextStringOnCreature(COLOR_RED+SQL_SENT+COLOR_END, oDMPC, FALSE);
                            }
                        }
                        else if (GetStringLeft(sDMText, 2) == "sq") CommandRedirect(oDMPC, 20);
                        else if (sDMText == "stealth")
                        {
                            if (GetLocalInt(oDMPC, "FKY_CHAT_DMSTEALTH"))
                            {
                                DeleteLocalInt(oDMPC, "FKY_CHAT_DMSTEALTH");
                                SendMessageToPC(oDMPC, COLOR_RED+DMSTEALTH4+COLOR_END);
                            }
                            else
                            {
                                SetLocalInt(oDMPC, "FKY_CHAT_DMSTEALTH", TRUE);
                                SendMessageToPC(oDMPC, COLOR_RED+DMSTEALTH3+COLOR_END);
                            }
                        }
                        else if (GetStringLeft(sDMText, 2) == "st") CommandRedirect(oDMPC, 26);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*t*/       case 26:
                        if (GetStringLeft(sDMText, 4) == "take")
                        {
                            if (GetStringLeft(sDMText, 7) == "takexp ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 7);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    nAppear = GetXP(oDMTarget)-StringToInt(sDMText);
                                    if (nAppear < 0) nAppear = 0;
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    SetXP(oDMTarget, nAppear);
                                    SendMessageToPC(oDMPC, COLOR_RED+XP8+ IntToString(StringToInt(sDMText))+XP9+GetName(oDMTarget) + "!"+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 10) == "takelevel ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 10);
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if (TestStringAgainstPattern("*n", sDMText)) TakeLevel(oDMTarget, oDMPC, StringToInt(sDMText));
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 12) == "takepartyxp ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 12);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    oStorage = GetFirstFactionMember(oDMTarget);
                                    while (GetIsObjectValid(oStorage))
                                    {
                                        nAppear = GetXP(oStorage)-StringToInt(sDMText);
                                        if (nAppear < 0) nAppear = 0;
                                        SetXP(oStorage, nAppear);
                                        oStorage = GetNextFactionMember(oDMTarget);
                                    }
                                    SendMessageToPC(oDMPC, COLOR_RED+XP8+ IntToString(StringToInt(sDMText))+XP9+GetName(oDMTarget) + XP11+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else if (GetStringLeft(sDMText, 15) == "takepartylevel ")
                            {
                                sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 15);
                                if (TestStringAgainstPattern("*n", sDMText))
                                {
                                    oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                    if (!GetIsObjectValid(oDMTarget)) return;
                                    oStorage = GetFirstFactionMember(oDMTarget);
                                    nColor = StringToInt(sDMText);
                                    if (nColor == 1) sStore = XP14;
                                    else sStore = XP15;
                                    while (GetIsObjectValid(oStorage))
                                    {
                                        TakeLevel(oDMTarget, oDMPC, nColor, FALSE);//function has built-in message to each, FALSE stops it
                                        oStorage = GetNextFactionMember(oDMTarget);
                                    }
                                    SendMessageToPC(oDMPC, COLOR_RED+XP8+ IntToString(StringToInt(sDMText))+sStore+GetName(oDMTarget) + XP11+COLOR_END);
                                }
                                else FloatingTextStringOnCreature(COLOR_RED+REQUIRES_NUMBER+COLOR_END, oDMPC);
                            }
                            else CommandRedirect(oDMPC, 19);
                        }
                        else if (GetStringLeft(sDMText, 2) == "ta") CommandRedirect(oDMPC, 19);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*u*/       case 28:
                        if (sDMText == "unbandm")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            DeleteLocalInt(oDMTarget, "FKY_CHT_BANDM");
                            SendMessageToPC(oDMTarget, COLOR_RED+UNBAN1+COLOR_END);
                            SendMessageToPC(oDMPC, COLOR_RED+UNBANGEN+ GetName(oDMTarget) +UNBAN2+COLOR_END);
                        }
                        else if (sDMText == "unbanshout")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            sKey = GetPCPublicCDKey(oDMTarget);
                            DeleteLocalInt(oDMTarget, "FKY_CHT_BANSHOUT");
                            DeleteLocalString(oDMTarget, "FKY_CHT_BANREASON");//delete the reason they were banned and by whom
                            if (USING_NWNX_DB) DeletePersistentVariable(GetModule(), "FKY_CHT_BANSHOUT"+ sKey);
                            else DeleteCampaignVariable("FKY_CHT", "FKY_CHT_BANSHOUT" + sKey);
                            SendMessageToPC(oDMTarget, COLOR_RED+UNBAN3+COLOR_END);
                            SendMessageToPC(oDMPC, COLOR_RED+UNBANGEN+ GetName(oDMTarget) +UNBAN4+COLOR_END);
                        }
                        else if (GetStringLeft(sDMText, 3) == "unb") CommandRedirect(oDMPC, 16);
                        else if (sDMText == "unfreeze")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if (!GetCommandable(oDMTarget)) SetCommandable(TRUE, oDMTarget);
                            if (GetIsPC(oDMTarget)) SendMessageToPC(oDMTarget, COLOR_RED+UNFREEZE1+COLOR_END);
                            SendMessageToPC(oDMPC, COLOR_RED+UNFREEZE2+ GetName(oDMTarget) + "."+COLOR_END);
                        }
                        else if (GetStringLeft(sDMText, 3) == "unf") CommandRedirect(oDMPC, 15);
                        else if (GetStringLeft(sDMText, 4) == "unig")
                        {
                            if (sDMText == "unignoredm")   //if option
                            {
                                if ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    DeleteLocalInt(oDMPC, "FKY_CHT_IGNOREDM");
                                    SendMessageToPC(oDMPC, COLOR_RED+UNIGNORED+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (sDMText == "unignoremeta")   //if option
                            {
                                if ((DMS_HEAR_META && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    DeleteLocalInt(oDMPC, "FKY_CHT_IGNOREMETA");
                                    SendMessageToPC(oDMPC, COLOR_RED+UNIGNOREM+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if (sDMText == "unignoretells")//if option
                            {
                                if ((DMS_HEAR_TELLS && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC))))
                                {
                                    DeleteLocalInt(oDMPC, "FKY_CHT_IGNORETELLS");
                                    SendMessageToPC(oDMPC, COLOR_RED+UNIGNORET+COLOR_END);
                                }
                                else CommandRedirect(oDMPC, 11);
                            }
                            else if ( ((DM_PLAYERS_HEAR_DM && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_PLAYERS_HEAR_DM && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ||
                                      ((DMS_HEAR_META && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_META && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_META && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_META && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ||
                                      ((DMS_HEAR_TELLS && VerifyDMKey(oDMPC) && GetIsDM(oDMPC)) || (DM_PLAYERS_HEAR_TELLS && VerifyDMKey(oDMPC) && (!GetIsDM(oDMPC))) || (ADMIN_DMS_HEAR_TELLS && VerifyAdminKey(oDMPC) && GetIsDM(oDMPC)) || (ADMIN_PLAYERS_HEAR_TELLS && VerifyAdminKey(oDMPC) && (!GetIsDM(oDMPC)))) ) CommandRedirect(oDMPC, 27);
                            else CommandRedirect(oDMPC, 11);
                        }
                        else if (sDMText == "uninvis")
                        {
                            AssignCommand(GetModule(), DoDMUninvis(oDMPC));
                            SendMessageToPC(oDMPC, COLOR_RED+UNINVIS+COLOR_END);
                        }
                        else if (sDMText == "uninvuln")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if ((!VerifyDMKey(oDMTarget)) && (!VerifyAdminKey(oDMTarget)) || (oDMTarget == oDMPC))
                            {
                                SetPlotFlag(oDMTarget, FALSE);
                                if (oDMTarget == oDMPC) SendMessageToPC(oDMPC, COLOR_RED+UNINVUL1+COLOR_END);
                                else
                                {
                                    SendMessageToPC(oDMPC, COLOR_RED + GetName(oDMTarget) +UNINVUL2+COLOR_END);
                                    if (GetIsPC(oDMTarget)) SendMessageToPC(oDMTarget, COLOR_RED+UNINVUL1+COLOR_END);
                                }
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+UNINVUL3+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 4) == "unin") CommandRedirect(oDMPC, 15);
                        else if (GetStringLeft(sDMText, 8) == "unlearn ")
                        {
                            sDMText = GetStringRight(sDMText, GetStringLength(sDMText) - 8);
                            nLang = GetLanguageNumber(sDMText);
                            if (nLang == -1) FloatingTextStringOnCreature(COLOR_RED+LANG1+COLOR_END, oDMPC, FALSE);
                            else
                            {
                                oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET);
                                if (!GetIsObjectValid(oDMTarget)) return;
                                if (USING_NWNX_DB)
                                {
                                    DeleteLocalInt(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang));
                                    DeletePersistentVariable(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang));
                                }
                                else
                                {
                                    oStorage = GetItemPossessedBy(oDMTarget, TAG_OF_LANGUAGE_STORAGE_OBJECT);
                                    DeleteLocalInt(oDMTarget, "FKY_CHAT_LANG"+IntToString(nLang));
                                    DeleteLocalInt(oStorage, "FKY_CHAT_LANG"+IntToString(nLang));
                                    ExportSingleCharacter(oDMTarget);
                                }
                                FloatingTextStringOnCreature(COLOR_RED+LANG3+GetNameOfLanguage(nLang)+LANG4+GetName(oDMTarget)+"."+COLOR_END, oDMPC, FALSE);
                            }
                        }
                        else if (GetStringLeft(sDMText, 3) == "unl") CommandRedirect(oDMPC, 26);
                        else CommandRedirect(oDMPC, 11);
                        break;
            /*v*/       case 30:
                        if (sDMText == "vent")
                        {
                            oDMTarget = VerifyTarget(oDMTarget, oDMPC, sUppercase, OBJECT_TARGET, FALSE, FALSE);
                            if (!GetIsObjectValid(oDMTarget)) return;
                            if (!VerifyDMKey(oDMTarget) && !VerifyAdminKey(oDMTarget))
                            {
                                SetLocalObject(oDMPC, "FKY_CHT_VENTRILO", oDMTarget);
                                FloatingTextStringOnCreature(COLOR_GREEN+VENTRILO+COLOR_END, oDMPC, FALSE);
                            }
                            else FloatingTextStringOnCreature(COLOR_RED+NO_DM_TARGET+COLOR_END, oDMPC, FALSE);
                        }
                        else if (GetStringLeft(sDMText, 3) == "unl") CommandRedirect(oDMPC, 26);
                        else CommandRedirect(oDMPC, 11);
                        break;
                    }
}
