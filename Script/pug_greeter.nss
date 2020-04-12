const string REBELS = "Hey you! All new recruits are to report to the Patrol Captain near the center of the base. I'd suggest you listen to him if you ever want to get off this planet!"; //FILL THESE IN BETWEEN THE " and the "
const string EMPIRE = "Attention recruit! All new arrivals must report to the Guard Captain in the Financial District, he is patrolling near the entrance to the Crimson Corridor. If you want a ship, you better listen to him!";
const string FRINGE = "Child, heed my words. The Patrol Captain is seeking assistance from the youth to cut down on the troubles we've been having and I hear they're offering a fancy new ship as a final reward!";

void main()
{
object oPC = GetLastPerceived();
int nLevel = GetHitDice(oPC);

if (GetIsObjectValid(oPC) == TRUE && nLevel <3)
    {
    if (GetTag(OBJECT_SELF) == "rebels_greeter")
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString(REBELS, TALKVOLUME_TALK));
        }
    else if (GetTag(OBJECT_SELF) == "empire_greeter")
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString(EMPIRE, TALKVOLUME_TALK));
        }
    else if (GetTag(OBJECT_SELF) == "fringe_greeter")
        {
        AssignCommand(OBJECT_SELF, ActionSpeakString(FRINGE, TALKVOLUME_TALK));
        }
    }
}
