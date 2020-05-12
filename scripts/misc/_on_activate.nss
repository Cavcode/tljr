//
//
//
#include "zep_inc_phenos"
void main()
{
    object oItem = GetItemActivated();
    object oActivator = GetItemActivator();
    location lActivator = GetLocation(oActivator);
    string sItemTag = GetTag(oItem);
    location lTarget = GetItemActivatedTargetLocation();
    ExecuteScript("tendril_activate", OBJECT_SELF);
    //ExecuteScript(GetTag(GetItemActivated()), OBJECT_SELF);
    ExecuteScript("cr_onact", GetItemActivator());
    ExecuteScript("cr_transf_onactv", GetItemActivator());
    ExecuteScript("gsc_oai",OBJECT_SELF); //Ridable Horses
    ExecuteScript("mil_activateitem", GetItemActivator());

    if (sItemTag == "DMEncounterWidget2")
    {
        ExecuteScript("dmencounterwidge", OBJECT_SELF);
        return;
     }

    if (sItemTag == "DyeKit")
    {
        ExecuteScript("gy_dyekit", OBJECT_SELF);
        return;
        }

    if (sItemTag == "DyeKit")
    {
        ExecuteScript("dye_kit_onact", OBJECT_SELF);
        return;
    }

        if (sItemTag == "SummonHorse")
    {
        ExecuteScript("hench_pony", OBJECT_SELF);
        return;
    }

        if (sItemTag == "SummonHorse2")
    {
        ExecuteScript("hench_pony2", OBJECT_SELF);
        return;
    }

        if (sItemTag == "SummonHorse3")
    {
        ExecuteScript("hench_pony3", OBJECT_SELF);
        return;
    }

        if (sItemTag == "SummonHorse4")
    {
        ExecuteScript("hench_pony4", OBJECT_SELF);
        return;
    }

        if (sItemTag == "SummonHorse5")
    {
       /// ExecuteScript("hench_pony5t SPELL_BATTLETIDE                    = 517");
