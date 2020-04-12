// search through creatures, starting with nearest
// find the nearest sitting in a chair
// #include "x0_i0_position" is required for GetChangedPosition command

#include "x0_i0_position"

// Subroutine that checks oLapTarget every 10 seconds
// if not in use it destroys it
void DestroyLap(object oLapTarget)
{
    if (!GetIsObjectValid(GetSittingCreature(oLapTarget)))
    {
        DestroyObject(oLapTarget);
    }
    else
    {
        DelayCommand(10.0, DestroyLap(oLapTarget));
    }
}


void main()
{

    object oPC = OBJECT_SELF;
    object oCreature = OBJECT_SELF;
    location lCreature;
    object oPlaceable;
    object oSitter;
    object oSitTarget;
    location lSitTarget;
    float fSitTargetFacing;
    object oSitTargetArea;
    vector vSitTarget;
    location lLapTarget;
    vector vLapTarget;
    object oLapTarget;
    float fDistance;
    object oLapCheck;
    int iCount = 0;

    // loop through creatures staring with nearest
    // check each for sitting on placeable object
    iCount = 0;
    while( oCreature != OBJECT_INVALID)
    {
        iCount = iCount + 1;
        oCreature = GetNearestCreature( CREATURE_TYPE_IS_ALIVE, TRUE, oPC, iCount);

        if( oCreature != OBJECT_INVALID)

        {
            lCreature = GetLocation( oCreature);
            oPlaceable = GetNearestObjectToLocation( OBJECT_TYPE_PLACEABLE, lCreature);
            if( oPlaceable != OBJECT_INVALID)
            {
                oSitter = GetSittingCreature( oPlaceable);
                if( oSitter != OBJECT_INVALID)
                {
                    if( GetDistanceToObject( oSitter) > 0.0 && GetDistanceToObject( oSitter) < 2.5)
                    {
                        oSitTarget = oCreature;
                        lSitTarget = lCreature;
                    }
                }
            }
        }

    }

    // SitTarget info
    fSitTargetFacing = GetFacing( oSitTarget);
    oSitTargetArea = GetArea( oSitTarget);
    vSitTarget = GetPositionFromLocation( lSitTarget);

    // LapTarget info
    fDistance = 0.2;
    vLapTarget = GetChangedPosition( vSitTarget, fDistance, fSitTargetFacing);
    fSitTargetFacing = GetNormalizedDirection( fSitTargetFacing + 90.0);
    lLapTarget = Location( oSitTargetArea, vLapTarget, fSitTargetFacing);

    // create invisible lap at lLapTarget
    oLapTarget = CreateObject( OBJECT_TYPE_PLACEABLE, "plc_invisobj", lLapTarget);

    // tell PC to sit on invisible object
    AssignCommand( oPC, ActionSit(oLapTarget));

    // give PC 10 seconds to get sitted in lap
    DelayCommand(10.0, DestroyLap(oLapTarget));

}
