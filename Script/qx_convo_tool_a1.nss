//::///////////////////////////////////////////////
//:: FileName qx_convo_tool_a1
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:34:52 AM
//:://////////////////////////////////////////////
const int PHENO_TERAS_FORM = 5;

void main()
{

    object oPC = GetPCSpeaker();
    int nPheno = GetPhenoType(oPC);
    int nPhenoTo;

    nPhenoTo = PHENO_TERAS_FORM;

    if (nPheno == PHENOTYPE_NORMAL)
    {
        SetPhenoType(nPhenoTo,oPC);
    }
    else
    {
        SetPhenoType(PHENOTYPE_NORMAL,oPC);
    }
}
