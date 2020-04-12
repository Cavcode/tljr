#include "ooc_source"
void main()
{
    object oActivator = GetItemActivator();
    object oItem = GetItemActivated();
    string sTag = GetTag(oItem);

    if (sTag == OOC_LOUNGE_ITEM) {
        OOCLoungeActivate(oActivator, oItem);
        return; }
}
