#include "pug_inc"
void main()
{
object oPlanet = GetFirstObjectInArea(GetArea(OBJECT_SELF));
object oPC = GetEnteringObject();
string sTag, sControl1, sControl2, sControl3;
effect eOld;

//BaseControl(sTag+"_1");
//BaseControl(sTag+"_2");
//BaseControl(sTag+"_3");

while (GetIsObjectValid(oPlanet) == TRUE)
    {
    sTag = GetTag(oPlanet);
    sControl1 = GetCampaignString("starwars", sTag+"_1_CONTROL");
    sControl2 = GetCampaignString("starwars", sTag+"_2_CONTROL");
    sControl3 = GetCampaignString("starwars", sTag+"_3_CONTROL");


    if (sControl1 == "Rebels" && sControl1 == sControl2 && sControl2 == sControl3 && GetIsPC(oPlanet)== FALSE && GetLocalInt(oPlanet, "PLANET") == TRUE)
        {
        eOld = GetFirstEffect(oPlanet);
        SetCampaignString("starwars", sTag+"_CONTROL", "Rebels");
        while (GetIsEffectValid(eOld) == TRUE)
            {
            RemoveEffect(oPlanet, eOld);
            eOld = GetNextEffect(oPlanet);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_GREEN_DARK, FALSE)), oPlanet, 6000.0);
        }
    else if (sControl1 == "Empire" && sControl1 == sControl2 && sControl2 == sControl3 && GetIsPC(oPlanet)== FALSE && GetLocalInt(oPlanet, "PLANET") == TRUE)
        {
        eOld = GetFirstEffect(oPlanet);
        SetCampaignString("starwars", sTag+"_CONTROL", "Empire");
        while (GetIsEffectValid(eOld) == TRUE)
            {
            RemoveEffect(oPlanet, eOld);
            eOld = GetNextEffect(oPlanet);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_BLUE_DARK, FALSE)), oPlanet, 6000.0);
        }
    else if (sControl1 == "Locals" && sControl1 == sControl2 && sControl2 == sControl3 && GetIsPC(oPlanet)== FALSE && GetLocalInt(oPlanet, "PLANET") == TRUE)
        {
        eOld = GetFirstEffect(oPlanet);
        SetCampaignString("starwars", sTag+"_CONTROL", "Locals");
        while (GetIsEffectValid(eOld) == TRUE)
            {
            RemoveEffect(oPlanet, eOld);
            eOld = GetNextEffect(oPlanet);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_YELLOW_DARK, FALSE)), oPlanet, 6000.0);
        }
    else if (GetIsPC(oPlanet)== FALSE && GetLocalInt(oPlanet, "PLANET") == TRUE)
        {
        eOld = GetFirstEffect(oPlanet);
        SetCampaignString("starwars", sTag+"_CONTROL", "Disputed");
        while (GetIsEffectValid(eOld) == TRUE)
            {
            RemoveEffect(oPlanet, eOld);
            eOld = GetNextEffect(oPlanet);
            }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_AURA_RED_DARK, FALSE)), oPlanet, 6000.0);
        }
    oPlanet = GetNextObjectInArea(GetArea(oPlanet));
    }

    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPC) != 50)
        {
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 50, oPC);
        }

}
