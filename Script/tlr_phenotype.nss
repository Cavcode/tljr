// This script changes the model's phenotype to either fat or normal
void main()
{
    int iOld, iNew;

    // Phenotype
    iOld = GetPhenoType(OBJECT_SELF);
    iNew = (iOld == PHENOTYPE_NORMAL) ? PHENOTYPE_BIG : PHENOTYPE_NORMAL;
    SetPhenoType(iNew, OBJECT_SELF);
}
