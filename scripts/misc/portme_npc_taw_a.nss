// Port Me NPC
//::///////////////////////
// TextAppearsWhen script for top red branch of conversation that says
// So where do you want to go?
//::///////////////////////
#include "portme_npc_inc"

// TextAppearsWhen script main function.
int StartingConditional()
{ ClearAllTokens();
  int bDestinationFound = FALSE;
  int nDestinationCount = GetLocalInt( OBJECT_SELF, "DestinationCount");
  while( nDestinationCount > 0)
  { string sDestination = GetLocalString( OBJECT_SELF, "Destination" +IntToString( nDestinationCount--));
    if( sDestination != "")
    { string sDescription = GetField( sDestination, 1, "@");
      string sWaypointTag = GetField( sDestination, 2, "@");
      if( (sDescription != "") && (sWaypointTag != "") && GetIsObjectValid( GetObjectByTag( sWaypointTag)))
      { SetCustomToken( 3001 +nDestinationCount, sDescription);
        SetLocalString( OBJECT_SELF, "Custom" +IntToString( 3001 +nDestinationCount), sDescription);
        bDestinationFound = TRUE;
      }
    }
  }
  return bDestinationFound;
}

