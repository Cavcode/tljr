#include "nwnx_creature"
#include "pug_inc"
void main()
{
object oPC = GetPCSpeaker();
int nSex = GetGender(oPC);
int nVoice = GetLocalInt(oPC, "VOICE_TEST");

if (nSex == GENDER_MALE)
    {
    if (nVoice < 113 )
        {
        nVoice = 113;
        }
    else
        {
        nVoice++;

        if (nVoice > 119 && nVoice < 123)
            {
            nVoice = 123;
            }
        else if (nVoice > 126 && nVoice < 129)
            {
            nVoice = 129;
            }
        else if (nVoice > 132 && nVoice < 135)
            {
            nVoice = 135;
            }
        else if (nVoice > 135 && nVoice < 138)
            {
            nVoice = 138;
            }
        else if (nVoice > 143 && nVoice < 145)
            {
            nVoice = 145;
            }
        else if (nVoice > 148 && nVoice < 152)
            {
            nVoice = 152;
            }
        else if (nVoice > 153 && nVoice < 155)
            {
            nVoice = 155;
            }
        else if (nVoice > 156 && nVoice < 159)
            {
            nVoice = 159;
            }
        else if (nVoice > 161 && nVoice < 163)
            {
            nVoice = 163;
            }
        else if (nVoice > 165 && nVoice < 169)
            {
            nVoice = 169;
            }
        else if (nVoice > 175 && nVoice < 177)
            {
            nVoice = 177;
            }
        else if (nVoice > 179 && nVoice < 181)
            {
            nVoice = 181;
            }
        else if (nVoice > 181 && nVoice < 183)
            {
            nVoice = 183;
            }
        else if (nVoice > 187 && nVoice < 189)
            {
            nVoice = 189;
            }
        else if (nVoice > 187 && nVoice < 189)
            {
            nVoice = 189;
            }
        else if (nVoice > 196 && nVoice < 198)
            {
            nVoice = 198;
            }
        else if (nVoice > 198 && nVoice < 200)
            {
            nVoice = 200;
            }
        else if (nVoice > 202 && nVoice < 210)
            {
            nVoice = 210;
            }
        else if (nVoice > 219 && nVoice < 221)
            {
            nVoice = 221;
            }
        else if (nVoice > 224 && nVoice < 228)
            {
            nVoice = 228;
            }
        else if (nVoice > 229 && nVoice < 232)
            {
            nVoice = 232;
            }
        else if (nVoice > 232 && nVoice < 234)
            {
            nVoice = 234;
            }
        else if (nVoice > 241 && nVoice < 352)
            {
            nVoice = 352;
            }
        else if (nVoice > 352 && nVoice < 356)
            {
            nVoice = 356;
            }
        else if (nVoice > 356 && nVoice < 363)
            {
            nVoice = 363;
            }
        else if (nVoice > 367 && nVoice < 368)
            {
            nVoice = 368;
            }
        else if (nVoice > 369 && nVoice < 379)
            {
            nVoice = 379;
            }
        else if (nVoice > 380 && nVoice < 400)
            {
            nVoice = 400;
            }
        else if (nVoice > 401 && nVoice < 405)
            {
            nVoice = 405;
            }
        else if (nVoice > 406 && nVoice < 408)
            {
            nVoice = 408;
            }
        else if (nVoice > 409 && nVoice < 412)
            {
            nVoice = 412;
            }
        else if (nVoice > 413 && nVoice < 418)
            {
            nVoice = 418;
            }
        else if (nVoice > 422 && nVoice < 426)
            {
            nVoice = 426;
            }
        else if (nVoice > 426 && nVoice < 431)
            {
            nVoice = 431;
            }
        else if (nVoice > 432 && nVoice < 434)
            {
            nVoice = 434;
            }
        else if (nVoice > 434 && nVoice < 436)
            {
            nVoice = 436;
            }
        else if (nVoice > 440 && nVoice < 901)
            {
            nVoice = 901;
            }
        else if (nVoice > 903 && nVoice < 905)
            {
            nVoice = 905;
            }
        else if (nVoice > 906 && nVoice < 908)
            {
            nVoice = 908;
            }
        else if (nVoice > 915 && nVoice < 921)
            {
            nVoice = 921;
            }
        else if (nVoice > 927 && nVoice < 929)
            {
            nVoice = 929;
            }
        else if (nVoice > 929 && nVoice < 931)
            {
            nVoice = 931;
            }
        else if (nVoice > 932 && nVoice < 934)
            {
            nVoice = 934;
            }
        else if (nVoice > 938 && nVoice < 940)
            {
            nVoice = 940;
            }
        else if (nVoice > 944)
            {
            nVoice = 113;
            }
        }
    }
else if (nSex == GENDER_FEMALE)
    {
    if (nVoice < 112 )
        {
        nVoice = 112;
        }
    else
        {
        nVoice++;

        if (nVoice > 112 && nVoice < 127)
            {
            nVoice = 127;
            }
        else if (nVoice > 128 && nVoice < 133)
            {
            nVoice = 133;
            }
        else if (nVoice > 133 && nVoice < 135)
            {
            nVoice = 135;
            }
        else if (nVoice > 137 && nVoice < 144)
            {
            nVoice = 144;
            }
        else if (nVoice > 144 && nVoice < 149)
            {
            nVoice = 149;
            }
        else if (nVoice > 151 && nVoice < 154)
            {
            nVoice = 154;
            }
        else if (nVoice > 154 && nVoice < 157)
            {
            nVoice = 157;
            }
        else if (nVoice > 158 && nVoice < 162)
            {
            nVoice = 162;
            }
        else if (nVoice > 162 && nVoice < 166)
            {
            nVoice = 166;
            }
        else if (nVoice > 168 && nVoice < 176)
            {
            nVoice = 176;
            }
        else if (nVoice > 176 && nVoice < 180)
            {
            nVoice = 180;
            }
        else if (nVoice > 180 && nVoice < 188)
            {
            nVoice = 188;
            }
        else if (nVoice > 188 && nVoice < 197)
            {
            nVoice = 197;
            }
        else if (nVoice > 197 && nVoice < 199)
            {
            nVoice = 199;
            }
        else if (nVoice > 199 && nVoice < 205)
            {
            nVoice = 205;
            }
        else if (nVoice > 205 && nVoice < 220)
            {
            nVoice = 220;
            }
        else if (nVoice > 220 && nVoice < 225)
            {
            nVoice = 225;
            }
        else if (nVoice > 227 && nVoice < 230)
            {
            nVoice = 230;
            }
        else if (nVoice > 231 && nVoice < 233)
            {
            nVoice = 233;
            }
        else if (nVoice > 233 && nVoice < 242)
            {
            nVoice = 242;
            }
        else if (nVoice > 245 && nVoice < 346)
            {
            nVoice = 346;
            }
        else if (nVoice > 348 && nVoice < 350)
            {
            nVoice = 350;
            }
        else if (nVoice > 351 && nVoice < 353)
            {
            nVoice = 353;
            }
        else if (nVoice > 355 && nVoice < 357)
            {
            nVoice = 357;
            }
        else if (nVoice > 361 && nVoice < 371)
            {
            nVoice = 371;
            }
        else if (nVoice > 371 && nVoice < 381)
            {
            nVoice = 381;
            }
        else if (nVoice > 381 && nVoice < 398)
            {
            nVoice = 398;
            }
        else if (nVoice > 398 && nVoice < 410)
            {
            nVoice = 410;
            }
        else if (nVoice > 411 && nVoice < 414)
            {
            nVoice = 414;
            }
        else if (nVoice > 414 && nVoice < 417)
            {
            nVoice = 417;
            }
        else if (nVoice > 417 && nVoice < 423)
            {
            nVoice = 423;
            }
        else if (nVoice > 424 && nVoice < 429)
            {
            nVoice = 429;
            }
        else if (nVoice > 430 && nVoice < 433)
            {
            nVoice = 433;
            }
        else if (nVoice > 433 && nVoice < 444)
            {
            nVoice = 444;
            }
        else if (nVoice > 444 && nVoice < 901)
            {
            nVoice = 901;
            }
        else if (nVoice > 903 && nVoice < 905)
            {
            nVoice = 905;
            }
        else if (nVoice > 907 && nVoice < 910)
            {
            nVoice = 910;
            }
        else if (nVoice > 912 && nVoice < 914)
            {
            nVoice = 914;
            }
        else if (nVoice > 915 && nVoice < 924)
            {
            nVoice = 924;
            }
        else if (nVoice > 925 && nVoice < 928)
            {
            nVoice = 928;
            }
        else if (nVoice > 928 && nVoice < 930)
            {
            nVoice = 930;
            }
        else if (nVoice > 930 && nVoice < 934)
            {
            nVoice = 934;
            }
        else if (nVoice > 935 && nVoice < 938)
            {
            nVoice = 938;
            }
        else if (nVoice > 939 && nVoice < 942)
            {
            nVoice = 942;
            }
        else if (nVoice > 942)
            {
            nVoice = 112;
            }
        }
    }
    SetLocalInt(oPC, "VOICE_TEST", nVoice);
    NWNX_Creature_SetSoundset(oPC, nVoice);
    SetCustomToken( 3311000, "Voice Set: "+VoiceName(nVoice));
    DelayCommand(0.8, PlayVoiceChat(VOICE_CHAT_HELLO, oPC));
}

