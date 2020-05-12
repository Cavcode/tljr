    const int SPELL_BLADE_MASTER1 = 1563;
    const int SPELL_BLADE_MASTER2 = 1564;
    const int SPELL_BLADE_MASTER3 = 1565;
    const int SPELL_BLADE_MASTER4 = 1566;
    const int SPELL_TERAS_FORM = 1567;
    const int SPELL_ASSASSIN_FORM = 1568;
    const int SPELL_DUELING_FORM = 1569;

    const int PHENO_BLADE_MASTER1 = 7;
    const int PHENO_BLADE_MASTER2 = 8;
    const int PHENO_BLADE_MASTER3 = 5;
    const int PHENO_BLADE_MASTER4 = 6;
    const int PHENO_TERAS_FORM = 5;
    const int PHENO_ASSASSIN_FORM = 6;
    const int PHENO_DUELING_FORM = 8;

void main()
{


    int nSpell = GetSpellId();
    object oPC = OBJECT_SELF;
    int nPheno = GetPhenoType(oPC);
    int nPhenoTo;

    switch (nSpell)
    {
        case 1563: nPhenoTo = PHENO_BLADE_MASTER1; break;
        case 1564: nPhenoTo = PHENO_BLADE_MASTER2; break;
        case 1565: nPhenoTo = PHENO_BLADE_MASTER3; break;
        case 1566: nPhenoTo = PHENO_BLADE_MASTER4; break;
        case 1567: nPhenoTo = PHENO_TERAS_FORM; break;
        case 1568: nPhenoTo = PHENO_ASSASSIN_FORM; break;
        case 1569: nPhenoTo = PHENO_DUELING_FORM; break;
        default: nPhenoTo = PHENOTYPE_NORMAL; break;
    }

    if (nPheno == PHENOTYPE_NORMAL)
    {
        SetPhenoType(nPhenoTo,oPC);
    }
    else
    {
        SetPhenoType(PHENOTYPE_NORMAL,oPC);
    }
}
