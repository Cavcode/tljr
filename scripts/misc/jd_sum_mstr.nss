void main()
{
object oPC;

oPC = GetItemActivator();

if ( GetLocalString(oPC, "SUM_VARIABLE") == "" )
   {
        SendMessageToPC(oPC, "You don't have a summon set.");
        return;
    }
else
    {
string summon = GetLocalString(oPC,"SUM_VARIABLE");
effect eEffect;
eEffect = EffectSummonCreature(summon, VFX_FNF_SUMMON_MONSTER_3, 1.0);

ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oPC);

}
}
