void AttackTime(object oPC);

void main()
{
object oPC = OBJECT_SELF;
float fTimer = IntToFloat(Random(120));

DelayCommand(90.0+fTimer, AttackTime(oPC));
}

void AttackTime(object oPC)
{
    object oItem = GetFirstItemInInventory(oPC);
    int nUnderAttack = GetLocalInt(oPC, "SMUGGLE_UNDERATTACK");
    string sEnemy;
    while (GetStringLeft(GetTag(oItem), 6) != "spice_" && GetIsObjectValid(oItem)==TRUE)
        {
        oItem = GetNextItemInInventory(oPC);
        }
    if (GetIsObjectValid(oItem)==TRUE && nUnderAttack != TRUE)
        {
        FloatingTextStringOnCreature("You have been ambushed for the package you are carrying", oPC, FALSE);
        effect ePoly = GetFirstEffect(oPC);
        while (GetIsEffectValid(ePoly) == TRUE && GetEffectType(ePoly) != EFFECT_TYPE_POLYMORPH)
            {
            ePoly = GetNextEffect(oPC);
            }
        int nItem = StringToInt(GetStringRight(GetStringLeft(GetTag(oItem), 13), 1));
        if (GetEffectType(ePoly) == EFFECT_TYPE_POLYMORPH)
            {//ship
            /*if (nItem == 2) {sEnemy = "regularpirate";}
            else if (nItem == 3) {sEnemy = "strongpirate";}
            else if (nItem == 4) {sEnemy = "veteranpirate";}
            else if (nItem == 5) {*/sEnemy = "acepirate";/*}
            else {sEnemy = "rookiepirate";}                */
            }
        else
            {//guy
            if (nItem == 2) {sEnemy = "regularrival";}
            else if (nItem == 3) {sEnemy = "veteranrival";}
            else if (nItem == 4) {sEnemy = "strongrival";}
            else if (nItem == 5) {sEnemy = "masterrival";}
            else {sEnemy = "rookierival";}
            }
        object oAttacker = CreateObject(OBJECT_TYPE_CREATURE, sEnemy, GetLocation(oPC), TRUE);
        SetLocalObject(oAttacker, "ATTACK_TARGET", oPC);
        AssignCommand(oAttacker, ActionAttack(oPC, FALSE));
        }
    if (GetIsObjectValid(oItem)==TRUE && GetStringLeft(GetTag(oItem), 6) == "spice_")
        {
        float fTimer = IntToFloat(Random(90));
        DelayCommand(250.0+fTimer, AttackTime(oPC));
        }
}
