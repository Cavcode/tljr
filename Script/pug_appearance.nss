void Smoke(object oNPC);

#include "x0_i0_anims"
void main()  //Human, Zabrak, Rodian, Aqualish, Duros, Trandoshan, Twi'lek.
{
object oNPC = OBJECT_SELF;
int x = Random(10)+1;

if (x < 5) //Human
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_HUMAN);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(8));
    SetColor(oNPC, COLOR_CHANNEL_HAIR, Random(56));
    SetCreatureBodyPart(CREATURE_PART_HEAD, Random(150)+1, oNPC);
    }
else if (x == 5) //Zabrak
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_HUMAN);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(16));
    SetColor(oNPC, COLOR_CHANNEL_HAIR, Random(56));
    SetCreatureBodyPart(CREATURE_PART_HEAD, 156, oNPC);
    }
else if (x == 6) //Rodian
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_ELF);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(9)+31);
    SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, 32);
    SetCreatureBodyPart(CREATURE_PART_HEAD, 39, oNPC);
    }
else if (x == 7) //Aqualish
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_ELF);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(12)+32);
    SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, 32);
    SetCreatureBodyPart(CREATURE_PART_HEAD, 41, oNPC);
    }
else if (x == 8) //Duros
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_ELF);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(4)+48);
    SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, 45);
    SetCreatureBodyPart(CREATURE_PART_HEAD, 38, oNPC);
    }
else if (x == 9) //Trandosian
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_HUMAN);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(7)+33);
    SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, 9);
    SetCreatureBodyPart(CREATURE_PART_HEAD, 203, oNPC);
    }
else if (x == 10) //Twi'lek
    {
    SetCreatureAppearanceType(oNPC, APPEARANCE_TYPE_HUMAN);
    SetColor(oNPC, COLOR_CHANNEL_SKIN, Random(56));
    SetColor(oNPC, COLOR_CHANNEL_TATTOO_1, Random(56));
    SetColor(oNPC, COLOR_CHANNEL_HAIR, Random(56));
    SetCreatureBodyPart(CREATURE_PART_HEAD, 207, oNPC);
    }
WalkWayPoints(FALSE, 3.0);

if( GetResRef(OBJECT_SELF) == "spiceaddict" )
    {
    Smoke(OBJECT_SELF);
    }
}

void Smoke(object oNPC)
{
if (GetIsInCombat(oNPC) == FALSE)
    {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SMOKE_PUFF,FALSE), oNPC, 3.0);
    }

DelayCommand (IntToFloat(Random(3)+4), Smoke(oNPC));
}
