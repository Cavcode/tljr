void ShootCars(object oCaster);

void main()
{
object oCaster = OBJECT_SELF; // GetObjectByTag(GetTag(OBJECT_SELF)+"_CASTER");
ShootCars(oCaster);
 //AssignCommand(OBJECT_SELF, ActionSpeakString("Activated", TALKVOLUME_TALK));
/*AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE));
DelayCommand(0.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(0.8, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(1.3, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(1.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.0, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.8, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(3.1, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(3.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.0, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.3, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(5.0, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(OBJECT_SELF)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
*/}


void ShootCars(object oCaster)
{
AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE));
DelayCommand(0.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(0.8, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(1.3, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(1.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.0, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(2.8, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(3.1, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(3.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.0, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.3, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));
DelayCommand(4.5, AssignCommand(oCaster, ActionCastSpellAtObject(753, GetWaypointByTag(GetTag(oCaster)+"_TARGET"), METAMAGIC_ANY, TRUE, PROJECTILE_PATH_TYPE_HOMING, TRUE)));


object oPC = GetFirstPC();
int nCount = 0;
while (GetIsObjectValid(oPC)==TRUE)
    {
    if (GetArea(oPC) == GetArea(oCaster))
        {
        nCount = nCount+1;
        }
    oPC = GetNextPC();
    }
if (nCount > 0)
    {
    DelayCommand(5.0, ShootCars(oCaster));
    }


}
