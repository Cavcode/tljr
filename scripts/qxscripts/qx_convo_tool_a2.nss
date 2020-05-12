//::///////////////////////////////////////////////
//:: FileName qx_convo_tool_a2
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 10/4/2008 3:34:52 AM
//:://////////////////////////////////////////////
const int PHENO_DUELING_FORM = 8;

void main()
{

    object oPC = GetPCSpeaker();
    int nPheno = GetPhenoType(oPC);
    int nPhenoTo;

    nPhenoTo = PHENO_DUELING_FORM;

    if (nPheno == PHENOTYPE_NORMAL)
    {
        SetPhenoType(nPhenoTo,oPC);
    }
    else
    {
        SetPhenoType(PHENOTYPE_NORMAL,oPC);
    }
}
