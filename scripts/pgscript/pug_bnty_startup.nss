#include "pug_inc"
void main()
{
CreateBountyTarget(OBJECT_SELF, 10);
DelayCommand(2.0, CreateBountyTarget(OBJECT_SELF, 16));
DelayCommand(4.0, CreateBountyTarget(OBJECT_SELF, 22));
DelayCommand(6.0, CreateBountyTarget(OBJECT_SELF, 28));
DelayCommand(8.0, CreateBountyTarget(OBJECT_SELF, 34));
/*CreateBountyTarget(OBJECT_SELF, 16);
CreateBountyTarget(OBJECT_SELF, 22);
CreateBountyTarget(OBJECT_SELF, 28);
CreateBountyTarget(OBJECT_SELF, 34);   */

SetCreatureBodyPart(CREATURE_PART_HEAD, 207, OBJECT_SELF);
}
