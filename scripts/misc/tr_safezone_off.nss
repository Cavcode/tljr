/*  name : tr_savezone_off
    purpose : SetLocalVariable "restallow" to 0,disallowing rest

    by Velmar
    jul/07/2002
    send comments to : whateverthathurs@web.de
*/

void main()
{
object oPC = GetExitingObject();

if ( GetIsPC(oPC) )
    {
    SendMessageToPC(oPC,"You may not rest now.");
    SetLocalInt(oPC,"restallow",0);
    }
}
