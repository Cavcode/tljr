// This script copies the character's appearance to the model's
void main()
{
    object oPC = GetPCSpeaker();
    int iSourceValue;

    // Copy Colors
    // Skin
    iSourceValue = GetColor(oPC, COLOR_CHANNEL_SKIN);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_SKIN, iSourceValue);

    // Hair
    iSourceValue = GetColor(oPC, COLOR_CHANNEL_HAIR);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_HAIR, iSourceValue);

    // Tattoo 1
    iSourceValue = GetColor(oPC, COLOR_CHANNEL_TATTOO_1);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_1, iSourceValue);

    // Tattoo 2
    iSourceValue = GetColor(oPC, COLOR_CHANNEL_TATTOO_2);
    SetColor(OBJECT_SELF, COLOR_CHANNEL_TATTOO_2, iSourceValue);

    // Copy Appearance
    // Head
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC);
    SetCreatureBodyPart(CREATURE_PART_HEAD, iSourceValue, OBJECT_SELF);

    // Racial Type
    iSourceValue = GetAppearanceType(oPC);
    SetCreatureAppearanceType(OBJECT_SELF, iSourceValue);

    // Phenotype
    iSourceValue = GetPhenoType(oPC);
    if (iSourceValue < 3) SetPhenoType(iSourceValue, OBJECT_SELF);

    // Right Bicep
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_BICEP, oPC);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_BICEP, iSourceValue, OBJECT_SELF);

    // Left Bicep
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, iSourceValue, OBJECT_SELF);

    // Right Forearm
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM, oPC);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_FOREARM, iSourceValue, OBJECT_SELF);

    // Left Forearm
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, iSourceValue, OBJECT_SELF);

    // Right Thigh
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH, oPC);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_THIGH, iSourceValue, OBJECT_SELF);

    // Left Thigh
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_THIGH, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_THIGH, iSourceValue, OBJECT_SELF);

    // Right Shin
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_RIGHT_SHIN, iSourceValue, OBJECT_SELF);

    // Left Shin
    iSourceValue = GetCreatureBodyPart(CREATURE_PART_LEFT_SHIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_SHIN, iSourceValue, OBJECT_SELF);
}
