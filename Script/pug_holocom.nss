#include "nwnx_creature"
void main()
{
/*object oPC = GetItemActivator();
object oPhone = GetItemActivated();
int nHolo = GetLocalInt(oPC, "HOLOCOM_USE");
int nRequest = GetLocalInt(oPC, "HOLOCOM_REQUEST");
object oReceiver = GetLocalObject(oPC, "HOLOCOM_RECEIVER");
object oCaller = GetLocalObject(oPC, "HOLOCOM_CALLER");
object oPerson, oSender;
int nCalling = GetLocalInt(oPC, "HOLOCOM_CHOOSE_CALL");
int nCall = GetLocalInt(oCaller, "HOLOCOM_CALL");

if (/*GetMovementRate(oPC) == MOVEMENT_RATE_IMMOBILE && *///GetIsObjectValid(oReceiver) && GetTag(oPhone) == "pug_holocom")
  /*  {
    oSender = GetLocalObject(oCaller, "HOLOCOM_RECEIVER");
    SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
    DestroyObject(oReceiver);
    DestroyObject(oSender);
    SetLocalInt(oPC, "HOLOCOM_CALL", FALSE);
    SetLocalInt(oCaller, "HOLOCOM_CALL", FALSE);
    SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
    SetMovementRate (oCaller, GetLocalInt(oCaller,"SPEED"));
    SetMovementRate (oPC, GetLocalInt(oPC,"SPEED"));
    SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
    SetLocalInt(oCaller, "HOLOCOM_USE", FALSE);
    }
else if (nRequest == TRUE && nHolo == 0 && nCall == FALSE && GetTag(oPhone) == "pug_holocom")
    {
    SetLocalInt(oPC, "HOLOCOM_USE", 1);
    oReceiver = CopyObject(oPC, GetLocation(oCaller));
    oSender = CopyObject(oCaller, GetLocation(oPC));
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE_NO_SOUND ,FALSE), oSender);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE_NO_SOUND ,FALSE), oReceiver);    ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE, oSender, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    SetPlotFlag(oReceiver, TRUE);
    SetPlotFlag(oSender, TRUE);
    SetLocalObject(oPC, "HOLOCOM_RECEIVER", oReceiver);
    SetLocalObject(oCaller, "HOLOCOM_RECEIVER", oSender);
    SetLocalInt(oPC, "HOLOCOM_CALL", TRUE);
    SetLocalInt(oCaller, "HOLOCOM_CALL", TRUE);
    SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
    SetLocalObject(oPC, "HOLOCOM_CALLER", oCaller);
    SetLocalInt(oCaller,"SPEED", GetMovementRate(oCaller));
    SetLocalInt(oPC,"SPEED", GetMovementRate(oPC));
    SetMovementRate (oCaller, MOVEMENT_RATE_IMMOBILE);
    SetMovementRate (oPC, MOVEMENT_RATE_IMMOBILE);
    SetLocalInt(oPC, "HOLOCOM_USE", TRUE);
    SetLocalInt(oCaller, "HOLOCOM_USE", TRUE);
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
else
    {
    SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
    SetLocalInt(oPC, "HOLOCOM_CALL", FALSE);
    SetLocalInt(oCaller, "HOLOCOM_CALL", FALSE);
    SetLocalInt(oPC, "HOLOCOM_REQUEST", FALSE);
    SetLocalInt(oPC, "HOLOCOM_USE", FALSE);
    SetLocalInt(oCaller, "HOLOCOM_USE", FALSE);
    } */
}
