// Dye the skin/hair/whatever
void main()
{
    object oNPC = OBJECT_SELF;

    int iMaterialToDye = GetLocalInt(oNPC, "MaterialToDye");
    int iColorGroup = GetLocalInt(oNPC, "ColorGroup");
    int iColorToDye = GetLocalInt(oNPC, "ColorToDye");

    int iColor = (iColorGroup * 8) + iColorToDye;

    // Dye
    SetColor(oNPC, iMaterialToDye, iColor);

}
