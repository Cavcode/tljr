// This script copies the model's appearance to the character's
void main()
{
    object oPC = GetPCSpeaker();
    int iSourceValue;

    // Copy Colors
    // Skin
    iSourceValue = GetColor(OBJECT_SELF, COLOR_CHANNEL_SKIN);
    SetColor(oPC, COLOR_CHANNEL_SKIN, iSourceValue);

    // Hair
    iSourceValue = GetColor(OBJECT_SELF, COLOR_CHANNEL_HAIR);
    SetColor(oPC, COLOR_CHANNEL_HAIR, iSourceValue);

    // Tattoo 1
    iSourceValue = GetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_1);
    SetColor(oPC, COLOR_CHANNEL_TATTOO_1, iSourceValue);

    // Tattoo 2
    iSourceValue = GetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_2);
    SetColor(oPC, COLOR_CHANNEL_TATTOO_2, iSourceValue);

    // Copy Appearance
    // Head
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_HEAD, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_HEAD, iSourceValue, oPC);

    /*// Racial Type
    iSourceValue = GetAppearanceType(OBJECT_SELF);
    SetCreatureAppearanceType(oPC, iSourceValue);
    */
    // Phenotype
    iSourceValue = GetPhenoType(OBJECT_SELF);
    int iTargetPheno = GetPhenoType(oPC);
    if (iSourceValue < 3 && iTargetPheno < 3) SetPhenoType(iSourceValue, oPC);

    // Right Bicep
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_BICEP, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_BICEP, iSourceValue, oPC);

    // Left Bicep
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, iSourceValue, oPC);

    // Right Forearm
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM, iSourceValue, oPC);

    // Left Forearm
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, iSourceValue, oPC);

    // Right Thigh
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH, iSourceValue, oPC);

    // Left Thigh
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_THIGH, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_LEFT_THIGH, iSourceValue, oPC);

    // Right Shin
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN, iSourceValue, oPC);

    // Left Shin
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_SHIN, OBJECT_SELF);
    SetCreatureBodyPart(CREATURE_PART_LEFT_SHIN, iSourceValue, oPC);
}
