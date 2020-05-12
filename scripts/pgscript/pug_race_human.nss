void main()
{
object oPC = GetPCSpeaker();
int nSkin = GetLocalInt(oPC, "SKIN_COLOUR");
int nHair = GetLocalInt(oPC, "HAIR_COLOUR");

if (GetAppearanceType(oPC) != APPEARANCE_TYPE_HUMAN)
    {
    SetCreatureAppearanceType(GetPCSpeaker(), APPEARANCE_TYPE_HUMAN);
    }
SetColor(oPC, COLOR_CHANNEL_HAIR, nHair);
SetColor(oPC, COLOR_CHANNEL_SKIN, nSkin);
SetCreatureBodyPart(CREATURE_PART_HEAD, GetLocalInt(oPC, "HEAD_TYPE"), oPC);
SetSubRace(oPC, "Human");
SetLocalInt(oPC, "SKIN_CHOOSE", FALSE);

if (GetIsObjectValid(GetItemPossessedBy(oPC, "subrace")))
    {
    DestroyObject(GetItemPossessedBy(oPC, "subrace"));
    }
}
