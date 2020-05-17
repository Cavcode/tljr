#include "pug_points"
#include "pug_feats"
#include "rpxp"


void main()
{
    object oPC = GetEnteringObject();
    int nCount = 0;
    location lGreet = GetLocation(GetObjectByTag("PUG_GREETER"));
    string sOwner = GetLocalString(oPC, "BIKE_OWNER");
    effect eEyeFix = EffectVisualEffect(324);
    ExecuteScript("ent_resize_chars");

    AddJournalQuestEntry("chat", 1, oPC, FALSE, FALSE, FALSE);
    SetPCListening(oPC);

   //ExecuteScript("fky_chat_clenter", oPC);



    if (GetIsObjectValid(GetItemPossessedBy(oPC, "speederblaster1"))==TRUE)
        {
        AssignCommand(oPC, ActionUnequipItem(GetItemPossessedBy(oPC, "speederblaster1")));
        SetLocalInt(oPC, "BIKE_KILL", TRUE);
        if (sOwner == GetName(oPC))
            {
            SetLocalInt(oPC, "SPEEDER_BIKE", FALSE);
            }
        }
    if (GetLocalInt(oPC, "DEAD") == TRUE)
        {
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9000, DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_TWENTY), oPC);
        }

    ExecuteScript("pug_fac_set", oPC);
    ExecuteScript("jedi_oce", oPC);
    SetLocalInt(oPC,"HENCHMAN_HAS", 0);
    CheckFeats(oPC);
    ApplyPoints();

    int nHP = GetLocalInt(GetModule(), "LEAVING_HP_"+GetName(oPC));

    //if (nHP>0)
      //  {
        //int maxHP = GetMaxHitPoints(oPC);
        //maxHP-=nHP;
        //effect shootHer = EffectDamage(maxHP, DAMAGE_TYPE_DIVINE);
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, shootHer, oPC);
        //}
    //else if (nHP<0)
       // {
        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(FALSE, FALSE), oPC);
        //}


    if (GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPC))-1 != GetCampaignInt("cmrcgld", "CMRC_RANK", oPC) && GetIsObjectValid(GetItemPossessedBy(oPC, "TraderBadge"))==TRUE && GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPC))>0 && GetCampaignInt("cmrcgld", "CMRC_RANK",oPC) > 0 )
        {
        SetCampaignInt("cmrcgld", "CMRC_RANK", GetCampaignInt("cmrcgld", "CMRC_"+GetName(oPC))-1,oPC);
        SetCampaignInt("cmrcgld", "CMRC_"+GetName(oPC), 0);
        }

    if (!GetIsDM(oPC))
    {
        int nPass = GetLocalInt(oPC,"PassedEntrance");
        if (!nPass)
        {
        AssignCommand (oPC, ActionStartConversation (oPC, "mod_entered", TRUE,FALSE));
        }
    }

    if (GetIsObjectValid(GetItemPossessedBy(oPC, "RebelAllianceID"))==TRUE)
        {nCount=nCount+1;}
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "GalaticEmpireID"))==TRUE)
        {nCount=nCount+1;}
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "FringeID"))==TRUE)
        {nCount=nCount+1;}
    if (nCount == 0 && GetIsDM(oPC) == FALSE)
        {
            if (GetXP(oPC) < 1)
            {
                object oItem = GetFirstItemInInventory(oPC);
                while (GetIsObjectValid(oItem) == TRUE)
                {
                    DestroyObject(oItem);
                    oItem = GetNextItemInInventory(oPC);
                }
                //if(GetLocalVariableCount(oPC) > 0)
                //{
                   // ClearLocalVars(oPC);
                //}
                AssignCommand(oPC, ActionJumpToLocation(lGreet));
            }
        }
    if (GetGold(oPC) > 3000000 && GetIsDM(oPC) == FALSE)
        {
        SendMessageToAllDMs(GetName(oPC)+" has logged in with "+IntToString(GetGold(oPC))+" gold.");
        WriteTimestampedLogEntry(GetName(oPC)+"("+GetPCPlayerName(oPC)+") "+IntToString(GetGold(oPC))+" gold.");
        }
}



