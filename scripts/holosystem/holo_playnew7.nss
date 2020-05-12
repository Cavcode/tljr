void PlayMessage(string CHANNEL, string sChoice, location lSpawn )
{
    string sHolo = GetCampaignString("starwars", "HOLOGRAM_"+CHANNEL+"_"+sChoice);
    object oHolo = RetrieveCampaignObject("starwars", "HOLOGRAM_"+sHolo, lSpawn);
    string sMsg = GetCampaignString("starwars", "HOLONET_"+CHANNEL+"_"+sChoice);

        SetLocalObject(OBJECT_SELF, "HOLOGRAM", oHolo);
        ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE, oHolo, METAMAGIC_QUICKEN, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);

        SetPlotFlag(oHolo, TRUE);
        ChangeToStandardFaction(oHolo, STANDARD_FACTION_COMMONER);

        DelayCommand(0.3, AssignCommand(oHolo, ActionSpeakString(sMsg, TALKVOLUME_TALK)));
        AssignCommand(oHolo, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL));

        DelayCommand(12.0, DestroyObject(oHolo));
}

void main()
{
    int nChoice = 7; //Change this based on what number message you are opening

    string sChoice = IntToString(nChoice);
    string CHANNEL = GetLocalString(OBJECT_SELF, "CHANNEL");
    location lSpawn = GetLocation(GetNearestObjectByTag("HOLO_VIEW"));
    int nInUse = GetLocalInt(OBJECT_SELF, "INUSE");

    if (nInUse == FALSE)
        {
            PlayMessage(CHANNEL, sChoice, lSpawn);
        }
}
