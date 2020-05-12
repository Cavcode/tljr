#include "x0_i0_anims"
//#include "x0_i0_walkway"
#include "x0_i0_treasure"

void CheckClothes(object oCiv);

void main()
{
int x = Random(8)+1;
int y = Random(99)+1;
if (y>49){y=y+49;}
object oCiv = OBJECT_SELF;

if (GetRacialType(OBJECT_SELF) == RACIAL_TYPE_HUMAN)
    {
    string sClothes = "basicclothing"+IntToString(x);

    if (GetStringLeft(GetName(GetArea(OBJECT_SELF)), 8) == "Tatooine")
        {
        x = Random(14)+1;
        if (x < 9)
            {
            sClothes = "basicclothing"+IntToString(x);
            }
        else if (x > 8)
            {
            sClothes = "tatooinerobes"+IntToString(x-8);
            }
        }

    object oItem;
    if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST ,OBJECT_SELF)) == FALSE)
        {
        oItem = CreateItemOnObject(sClothes, OBJECT_SELF, 1, "civ_shirt");
        SetDroppableFlag(oItem, FALSE);
        //DelayCommand(2.0, AssignCommand(OBJECT_SELF, ActionEquipItem(GetItemPossessedBy(OBJECT_SELF, "civ_shirt"), INVENTORY_SLOT_CHEST)));
        DelayCommand(50.0, AssignCommand(OBJECT_SELF, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST)));
        }
    if (GetStringLeft(GetTag(OBJECT_SELF), 13) == "civilian_head")
        {
        SetCreatureBodyPart(CREATURE_PART_HEAD, StringToInt(GetStringRight(GetStringLeft(GetTag(OBJECT_SELF),17),3)), OBJECT_SELF);
        }
    else
        {
        SetCreatureBodyPart(CREATURE_PART_HEAD, y, OBJECT_SELF);
        }

    DelayCommand(55.0, AssignCommand(OBJECT_SELF, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST)));
    }
    if (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST, oCiv)) == FALSE && GetIsDead(oCiv) == FALSE && GetImmortal(oCiv) == FALSE && GetPlotFlag(oCiv)==FALSE && GetStringLeft(GetTag(oCiv), 3) == "civ")
        {
        //DelayCommand(60.0, CheckClothes(OBJECT_SELF));
        }
if (GetStringRight(GetTag(OBJECT_SELF), 6) == "wander")
    {DelayCommand(80.0, ActionRandomWalk());}
else if (GetStringRight(GetTag(OBJECT_SELF), 6) == "sitter")
    {
    object oChair = GetNearestObjectByTag("Sit", OBJECT_SELF);
    DelayCommand(80.0, AssignCommand(OBJECT_SELF, ActionSit(oChair)));
    //AssignCommand(OBJECT_SELF, ActionSit(GetObjectByTag("sitonme")));
    }
else {DelayCommand(80.0, WalkWayPoints(FALSE, 3.0));}

//SetAILevel(oCiv, AI_LEVEL_VERY_LOW);
SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);
}


void CheckClothes(object oCiv)
{
int x = Random(8)+1;
int nStop = 0;
object oItem = GetFirstItemInInventory(oCiv);
string sClothes = "basicclothing"+IntToString(x);
int bExit = FALSE;

if (GetIsObjectValid(oItem) == FALSE)
    {
    oItem = CreateItemOnObject(sClothes, oCiv, 1, "civ_shirt");
    }
while (GetIsObjectValid(oItem) == TRUE && !bExit)
    {
        if (GetBaseItemType(oItem) == BASE_ITEM_ARMOR)
        {
            DelayCommand(60.0,AssignCommand(oCiv, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST)));
            bExit = TRUE;
            SetDroppableFlag(oItem, FALSE);
        }
        oItem = GetNextItemInInventory(oCiv);
    }

/*while (GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST, oCiv)) == FALSE && GetIsDead(oCiv) == FALSE && GetImmortal(oCiv) == FALSE && GetPlotFlag(oCiv)==FALSE && GetStringLeft(GetTag(oCiv), 3) == "civ")
    {
    if(GetIsObjectValid(GetItemPossessedBy(oCiv, "civ_shirt"))==FALSE)
        {
        x = Random(4)+2;
        CreateItemOnObject("basicclothing"+IntToString(x), oCiv, 1, "civ_shirt");
        }
    oItem = GetItemPossessedBy(oCiv, "civ_shirt");
    SetDroppableFlag(oItem, FALSE);
    AssignCommand(oCiv, ActionEquipItem(oItem, INVENTORY_SLOT_CHEST));
    nStop++;
    if (nStop == 5 && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_CHEST, oCiv))==FALSE)
        {
        //AssignCommand(oCiv, ActionEquipItem(CreateItemOnObject("basicclothing"+IntToString(x), oCiv, 1, "civ_shirt"), INVENTORY_SLOT_CHEST));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9000, DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_TWENTY), oCiv);
        }
    }*/
}
