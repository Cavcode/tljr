// Port Me NPC
//::///////////////////////
// TextAppearsWhen script for top red branch of conversation that says
// I can't send you anywhwere right now.
//::///////////////////////

// Initializes all custom tokens to blank.
int StartingConditional()
{ int nToken = 17;
  while( nToken > 0) if( GetLocalString( OBJECT_SELF, "Custom" +IntToString( 3000 +nToken--)) != "") return FALSE;
  return TRUE;
}

