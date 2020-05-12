/*  name : tr_savezone_on
    purpose : SetLocalVariable "restallow" to 1, allowing rest

    by Velmar
    jul/07/2002
    send comments to : whateverthathurs@web.de
*/

void main()
{
object oPC = GetEnteringObject();

if ( GetIsPC(oPC) )
    {
    SendMessageToPC(oPC,"You may rest here.");
    SetLocalInt(oPC,"restallow",1);
    }
}
