// Tag-Based Item Script - Skeleton Template
//:://////////////////////////////////////////////////////////
#include "x2_inc_switches"

// This is the main function for the tag-based script.
void main()
{ switch( GetUserDefinedItemEventNumber())
   {
     case X2_ITEM_EVENT_ACTIVATE:
         { // The item's CastSpell Activate or CastSpell UniquePower was just activated.
            object     oItemUser  = GetItemActivator();
            object     oItem          = GetItemActivated();
            object     oTarget      = GetItemActivatedTarget();
            location  lTarget      = (GetIsObjectValid( oTarget) ? GetLocation( oTarget) : GetItemActivatedTargetLocation());
            if( !GetIsObjectValid( oItemUser) || !GetIsObjectValid( oItem))
            { SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
               return;
            }

            if (GetIsPC(oItemUser))
            {
                DestroyObject(oItem);
                SendMessageToAllDMs(GetPCPlayerName(oItemUser) + " somehow aqquired the item 'dismount speeder'");
            }
            else if (!GetIsDM(oItemUser))
            {
                DestroyObject(oItem);
                //If speederblaster then dismount speeder and destroy object
                if (GetTag(oItem) == "speederblaster1")
                {
                    if (GetPhenoType(oItemUser) == 22)
                    {
                    int nPheno = GetLocalInt(oItemUser, "PHENO");

                    RestoreCameraFacing();
                    SetPhenoType(nPheno, oItemUser);
                    SetLocalInt(oItemUser,"BIKE", 0);
                    effect ePolymorph = GetFirstEffect(oItemUser);
                        while (GetIsEffectValid(ePolymorph))
                        {
                            if (GetEffectType(ePolymorph) == EFFECT_TYPE_MOVEMENT_SPEED_INCREASE)
                            {
                            RemoveEffect(oItemUser, ePolymorph);
                            }
                            if (GetEffectType(ePolymorph) == EFFECT_TYPE_HASTE)
                            {
                                RemoveEffect(oItemUser, ePolymorph);
                            }
                            ePolymorph = GetNextEffect(oItemUser);
                        }
                    //SetCutsceneMode(oItemUser, FALSE);
                    //if (GetPlotFlag(oItemUser) == TRUE)
                    //{
                    //SetPlotFlag(oItemUser, FALSE);
                    //}
                    //if (GetImmortal(oItemUser) == TRUE)
                    //{
                    //SetImmortal(oItemUser, FALSE);
                    //}
                    DestroyObject(oItem, 0.1);
                    CreateObject(OBJECT_TYPE_PLACEABLE, "pug_speederbike", GetLocation(oItemUser), FALSE);
                    }
                }

            }
            else {;}

         }
         SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_END);
         return;
   }
   SetExecutedScriptReturnValue( X2_EXECUTE_SCRIPT_CONTINUE);
}

