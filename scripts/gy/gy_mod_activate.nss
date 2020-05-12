#include "nwnx_creature"
#include "pug_inc"
#include "x2_inc_switches"
void main()
{
    object oItem = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    object oPC = GetItemActivator();
    string sFaction;
    string sContract = GetCampaignString("starwars", "CONTRACT", oPC);
    string sSigner = GetCampaignString("starwars", "SIGNER", oPC);
    location lJump = GetItemActivatedTargetLocation();
    ExecuteScript("dmfi_activate",OBJECT_SELF);
    int nHeal;
    //ExecuteScript("ooc_on_activate",OBJECT_SELF);
    ExecuteScript("_on_activate",OBJECT_SELF);

    if (GetStringLeft(GetTag(oItem), 8) == "augment_")
    {
        ExecuteScript("qx_augment_item", OBJECT_SELF);
    }

    if (GetTag(oItem) == "pug_resurrect" && GetIsDead(oTarget)==TRUE)
        {
        nHeal = FloatToInt(GetMaxHitPoints(oTarget)*0.1)+GetSkillRank(SKILL_HEAL,oPC,FALSE);
        if (nHeal > GetMaxHitPoints(oTarget))
            {
                nHeal = GetMaxHitPoints(oTarget);
            }
        SetLocalInt(oPC, "DEAD", FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(), oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(), oTarget, 8.0);
        DelayCommand(2.0, ApplyRevivePenalty(oTarget, TRUE));
        }
    if (GetTag(oItem) == "pug_movefix" && GetIsPC(oTarget) == TRUE)
        {
        NWNX_Creature_SetMovementRate(oTarget, NWNX_CREATURE_MOVEMENT_RATE_PC);
        }
    if (GetTag(oItem) == "pug_pc_shields")
        {
        int nStr = GetLocalInt(oItem, "STRENGTH");
        effect eShield = EffectDamageReduction(5*nStr, DAMAGE_POWER_PLUS_FIVE, 50*nStr);
        effect eVis = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_BLUE);
        effect eLink = EffectLinkEffects(eVis, eShield);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, nStr*50.0);
        }
    string sHench; object oHench;
    if (GetTag(oItem) == "pug_henchsummon" && GetIsObjectValid(GetLocalObject(oPC, "HENCH"))==FALSE)
        {
        if (GetFaction(oPC, TRUE) == "Rebels"){sHench = "rebelensign";}
        else if (GetFaction(oPC, TRUE) == "Empire"){sHench = "stormtrooperrecr";}
        else if (GetFaction(oPC, TRUE) == "Fringe"){sHench = "fringehench";}
        oHench = CreateObject(OBJECT_TYPE_CREATURE, sHench, GetLocation(oPC), FALSE);
        AddHenchman(oPC, oHench);
        SetLocalObject(oPC, "HENCH", oHench);
        SetLocalObject(oHench, "LEADER", oPC);
        }
    else if (GetTag(oItem) == "pug_henchsummon" && GetIsObjectValid(GetLocalObject(oPC, "HENCH"))==TRUE)
        {
        FloatingTextStringOnCreature("You already have a henchman.", oPC, FALSE);
        AssignCommand(GetLocalObject(oPC, "HENCH"), ActionJumpToLocation(GetLocation(oPC)) );
        }
    if (GetTag(oItem) == "pug_bombset")
        {
        string sBomRef;
        if (GetLocalInt(oItem, "SIZE") == 1){sBomRef = "pug_smaldemo";}
        else {sBomRef = "pug_demopak";}
        object oBomb = CreateObject(OBJECT_TYPE_PLACEABLE, sBomRef, GetLocation(oPC), FALSE);
        object oDetn = CreateItemOnObject("pug_detonator", oPC, 1);
        SetLocalObject(oDetn, "BOMB", oBomb);
        SetLocalObject(oBomb, "BOMB_SETTER", oPC);
        SetLocalInt(oBomb, "BOMB_STR", GetSkillRank(15, oPC, FALSE));
        }
    if (GetTag(oItem) == "pug_pcdm_tool" && GetIsObjectValid(oTarget) == TRUE && GetCampaignInt("starwars", "PCDM", oPC) == TRUE)
        {
        SetLocalObject(oPC, "DM_TARGET", oTarget);
        AssignCommand(oPC, ActionStartConversation(oPC, "pug_pcdm", TRUE, FALSE));
        SetCustomToken(10109900, "What would you like to do with "+GetName(oTarget)+"? (PCDM: "+IntToString(GetCampaignInt("starwars", "PCDM", oTarget))+")");
        }
    else if (GetTag(oItem) == "pug_pcdm_tool" && GetIsObjectValid(oTarget) == TRUE && GetIsDM(oPC) == TRUE)
        {
        SetLocalObject(oPC, "DM_TARGET", oTarget);
        AssignCommand(oPC, ActionStartConversation(oPC, "pug_pcdm", TRUE, FALSE));
        SetCustomToken(10109900, "What would you like to do with "+GetName(oTarget)+"? (PCDM: "+IntToString(GetCampaignInt("starwars", "PCDM", oTarget))+")");
        }
    if (GetTag(oItem) == "pug_basecontrol")
        {
        string sArea = GetName(GetArea(oPC));
        SetCustomToken(19772, "Who would you like to give control of area "+sArea+" to?");
        AssignCommand (oPC, ActionStartConversation (oPC, "pug_basecontrol", TRUE,FALSE));
        }

    if (GetTag(oItem) == "pug_jetpack") //&& GetIsAreaInterior(GetArea(oPC))==FALSE)
        {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDisappear(1), oPC, 2.0);
        AssignCommand(oPC, ActionJumpToLocation(lJump));
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectAppear(1), oPC);
        }
    if (GetTag(oItem) == "acontract" && GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE)
        {
        SetLocalObject(oPC, "TARGET", oTarget);
        if (GetIsObjectValid(GetItemPossessedBy(oTarget, "RebelAllianceID"))==TRUE)
            {sFaction = "Rebels";
            SetCustomToken(2211221, "Ask "+GetName(oTarget)+" to sign a contract for my services to the "+sFaction);}
        if (GetIsObjectValid(GetItemPossessedBy(oTarget, "GalaticEmpireID"))==TRUE)
            {sFaction = "Empire";
            SetCustomToken(2211221, "Ask "+GetName(oTarget)+" to sign a contract for my services to the "+sFaction);}
        if (GetIsObjectValid(GetItemPossessedBy(oTarget, "GalaticEmpireID"))!=TRUE && GetIsObjectValid(GetItemPossessedBy(oTarget, "RebelAllianceID"))!=TRUE)
            {SetCustomToken(2211221, GetName(oTarget)+" is unable to sign a contract with you");}
        if (sContract == "")
            {
            SetCustomToken(2211220, "You currently have no contracts");
            }
        else if (sContract != "")
            {
            SetCustomToken(2211220, "You currently have a contract with the "+sContract+" signed by "+sSigner);
            }

        SetCustomToken(2211222, "Cancel my current contract with the "+sContract);
        AssignCommand (oPC, ActionStartConversation (oPC, "pug_contract", TRUE,FALSE));
        }

    if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
    {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

    }

//for setting off bombs
if (GetTag(oItem) == "pug_detonator")
    {
    object oDetn = GetItemActivated();
    object oBomb = GetLocalObject(oDetn, "BOMB");

    if (GetTag(GetArea(oPC)) == GetTag(GetArea(oBomb)) && GetTag(oDetn) == "pug_detonator" && GetLocalInt(oBomb, "EXPLODED") == FALSE)
        {
        SetLocalInt(oBomb, "EXPLODED", TRUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oBomb);
        DestroyObject(oDetn);
        }
    else if (GetTag(GetArea(oPC)) != GetTag(GetArea(oBomb)) && GetTag(oDetn) == "pug_detonator")
        {
        FloatingTextStringOnCreature("You must be in the same area as the bomb to detonate it", oPC, FALSE);
        }
    else
        {
        DestroyObject(oDetn);
        }
    }

//for speeder bikes (moved to tag-based script pug_speeder -Quix)

//for holocoms
if (GetTag(oItem) == "pug_holocom")
    {
    object oPhone = GetItemActivated();
    int nHolo = GetLocalInt(oPC, "HOLOCOM_USE");
    int nRequest = GetLocalInt(oPC, "HOLOCOM_REQUEST");
    object oReceiver = GetLocalObject(oPC, "HOLOCOM_RECEIVER");
    object oCaller = GetLocalObject(oPC, "HOLOCOM_CALLER");
    object oPerson, oSender;
    int nCalling = GetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL");
    int nCall = GetLocalInt(oCaller, "HOLOCOM_CALL");

    if (GetIsObjectValid(oReceiver)==TRUE && GetTag(oPhone) == "pug_holocom")
        {
        oSender = GetLocalObject(oCaller, "HOLOCOM_RECEIVER");
        SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
        DestroyObject(oReceiver);
        DestroyObject(oSender);
        SetLocalInt(oPC, "HOLOCOM_CALL", FALSE);
        SetLocalInt(oCaller, "HOLOCOM_CALL", FALSE);
        SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
        //SetMovementRate (oCaller, GetLocalInt(oCaller,"SPEED"));
        //SetMovementRate (oPC, GetLocalInt(oPC,"SPEED"));
        SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
        SetLocalInt(oCaller, "HOLOCOM_USE", FALSE);
        }
    else if (nRequest == TRUE  && GetIsObjectValid(oReceiver)==FALSE && GetTag(oPhone) == "pug_holocom")
        {
        SetLocalInt(oPC, "HOLOCOM_CALL", TRUE);
        SetLocalInt(oCaller, "HOLOCOM_CALL", TRUE);
        SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
        SetLocalObject(oPC, "HOLOCOM_CALLER", oCaller);
        SetLocalObject(oCaller, "HOLOCOM_CALLER", oPC);
        //SetLocalInt(oCaller,"SPEED", GetMovementRate(oCaller));
        //SetLocalInt(oPC,"SPEED", GetMovementRate(oPC));
        //SetMovementRate (oCaller, MOVEMENT_RATE_IMMOBILE);
        //SetMovementRate (oPC, MOVEMENT_RATE_IMMOBILE);
        SetLocalInt(oPC, "HOLOCOM_USE", TRUE);
        SetLocalInt(oCaller, "HOLOCOM_USE", TRUE);
        oReceiver = CopyObject(oPC, GetLocation(oCaller));
        oSender = CopyObject(oCaller, GetLocation(oPC));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE_NO_SOUND ,FALSE), oSender);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE_NO_SOUND ,FALSE), oReceiver);    ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE, oSender, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
        SetPlotFlag(oReceiver, TRUE);
        SetPlotFlag(oSender, TRUE);
        SetLocalObject(oPC, "HOLOCOM_RECEIVER", oReceiver);
        SetLocalObject(oCaller, "HOLOCOM_RECEIVER", oSender);
        }

    else if (nRequest == FALSE && GetTag(oPhone) == "pug_holocom")
        {
        FloatingTextStringOnCreature("Please speak out the number of the person you wish to communicate with on this list", oPC, FALSE);
        oPerson = GetFirstPC();
        int nCount =1;
        while (GetIsObjectValid(oPerson) == TRUE)
            {
            if(GetIsObjectValid(GetItemPossessedBy(oPerson, "pug_holocom"))==TRUE && oPerson != oPC)
                {
                SetLocalObject(oPC, "HOLOCOM_CALL_"+IntToString(nCount), oPerson);
                SendMessageToPC(oPC, IntToString(nCount)+") "+GetName(oPerson));
                SetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL", TRUE);
                nCount=nCount+1;
                }
            oPerson = GetNextPC();
            }
        SetLocalInt(oPC, "HOLOCOM_MAX", nCount);
        }
    else if(GetTag(oPhone) == "pug_holocom")
        {
        SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
        SetLocalInt(oPC, "HOLOCOM_CALL", FALSE);
        SetLocalInt(oCaller, "HOLOCOM_CALL", FALSE);
        SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
        SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
        SetLocalInt(oCaller, "HOLOCOM_USE", FALSE);
        }
    }
//Setting up placeable turrets
    if (GetTag(oItem) == "pug_turretkit")
        {
        string sTrtRef = "pug_turret";
        //int nBuild = GetSkillRank(28, oPC, FALSE);
        if (GetIsSkillSuccessful(oPC, 28, 20))
            {
            object oTurret = CreateObject(OBJECT_TYPE_CREATURE, sTrtRef, GetLocation(oPC), FALSE);
            string sFac = GetFaction(oPC, TRUE); object oFac;
            if (sFac == "Fringe")
                {oFac = GetObjectByTag("faction_fringe");}
            else if (sFac == "Rebels")
                {oFac = GetObjectByTag("faction_rebels");}
            else if (sFac == "Empire")
                {oFac = GetObjectByTag("faction_empire");}
            ChangeFaction(oTurret, oFac);
            // Next line may need factions looked at. - Cam
            object oTrap = CreateTrapAtLocation(TRAP_BASE_TYPE_MINOR_SPIKE, GetLocation(oPC), 2.0, "TURRET_TRAP", 4, "qx_turret_disarm", "qx_turret_trig");
            SetTrapOneShot(oTrap, FALSE);
            SetLocalObject(oTrap, "TURRET", oTurret);
            }
        else
            {FloatingTextStringOnCreature("Fail", oPC, FALSE);}
        }

//Using Tracer
if (GetTag(oItem) == "pug_tracer")
    {
    object oTraced = GetLocalObject(oPC, "TRACED");
    if (GetIsObjectValid(oTraced) && oTarget == oPC)
        {
        FloatingTextStringOnCreature(GetName(oTraced)+"'s location is "+GetName(GetArea(oTraced)), oPC, FALSE);
        }
    else if (GetIsObjectValid(oTraced)==FALSE && oTarget != oPC && GetIsObjectValid(oTarget) == TRUE)
        {
        SetLocalObject(oPC, "TRACED", oTarget);
        FloatingTextStringOnCreature(GetName(oTarget)+" is being traced.", oPC, FALSE);
        DelayCommand(360.0, ClearObjectVariableOnTimer(oPC, "TRACED"));
        }
    else
        {
        FloatingTextStringOnCreature("Tracer not deployed.", oPC, FALSE);
        }
    }

//Using droids
if (GetTag(oItem) == "pug_makebanker")
    {
    CreateObject(OBJECT_TYPE_CREATURE, "pug_bankdroid", GetLocation(oPC), FALSE);
    }
if (GetTag(oItem) == "pug_makescrap")
    {
    CreateObject(OBJECT_TYPE_CREATURE, "pug_scrapdroid", GetLocation(oPC), FALSE);
    CreateObject(OBJECT_TYPE_STORE, "buy_destroyer", GetLocation(oPC), FALSE);
    }

//Milking Banthas
if (GetTag(oItem) == "pug_q1_bucket" && GetResRef(oTarget)=="bantha")
    {
    CreateItemOnObject("pug_q1_fullbucke", oPC, 1);
    DestroyObject(oItem);
    }
else if (GetTag(oItem) == "pug_q1_bucket" && GetResRef(oTarget)!="bantha")
    {
    FloatingTextStringOnCreature("This bucket is for milking a bantha", oPC, FALSE);
    }

if (GetTag(oItem) == "pug_faccomm")
    {
    string sFac = GetFaction(oPC, FALSE);
    if (sFac == "Empire" || sFac=="Rebels")
        {
        SetLocalInt(oPC, "FAC_COMM", TRUE);
        string sBroadcast = "Broadcasting to: ";
        object oOther = GetFirstPC();
        while (GetIsObjectValid(oOther))
            {
            if (GetFaction(oPC,FALSE) == GetFaction(oOther, FALSE) )
            {sBroadcast+=", "+GetName(oOther);}
            oOther = GetNextPC();
            }
        SetCustomToken(333901, sBroadcast);
        }
    else {FloatingTextStringOnCreature("Only a member of the Empire or the Rebels can use this device", oPC, FALSE);}
    AssignCommand(oPC, ActionStartConversation(oPC, "pug_factioncom", TRUE, FALSE));
    }
}

