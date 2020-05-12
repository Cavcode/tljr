int StartingConditional()
{

int nPheno = GetPhenoType(GetPCSpeaker());

if (nPheno == 9)
    {return FALSE;}
if (nPheno == 22)
    {return FALSE;}
else
    {return TRUE;}
}
