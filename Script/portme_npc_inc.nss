// Port Me NPC
//::///////////////////////
// portme_npc_inc
//::///////////////////////
#include "x0_i0_transport"

// Return a field from a string delimited by a substring.
string GetField( string sString, int iField, string sDelimiter)
{ if( (sString == "") || (iField <= 0)) return "";

  if( sDelimiter == "") return ((iField == 1) ? sString : "");
  int iPos = FindSubString( sString, sDelimiter);
  if( iPos < 0) return sString;

  string sField = GetStringLeft( sString, iPos);
  if( iField == 1) return sField;

  sString = GetStringRight( sString, GetStringLength( sString) -(iPos +GetStringLength( sDelimiter)));
  return GetField( sString, iField -1, sDelimiter);
}


// Initializes all custom tokens to blank.
void ClearAllTokens()
{ int nToken = 17;
  while( nToken > 0)
  { SetCustomToken( 3000 +nToken, "");
    DeleteLocalString( OBJECT_SELF, "Custom" +IntToString( 3000 +nToken--));
  }
}

