// This is the universal open store script. It's special in that all you have
// to do is make sure that everything is stored in the palette because it
// automatically spawns the store directly from the palette onto the NPC
// merchant and stays there until server reset. No more placing down stores
// in the toolset next to the NPC merchant and juggling with multiple
// areas, making sure that each one is up to date. Updating a store is
// reduced to simply making changes in the palette. Also, this script will allow
// for merchant NPCs to handle their store inventory nomatter what area they
// are moved to.
////////////////////////////////////////////////////////////////////////////////

#include "nw_i0_plot"

void main() {

    // Variable declaration
    object oStore;
    string sStoreTag = "WEAPONS_N_ARMOR";
    string sStoreResRef = "weapons_n_armor";
    string sNPCTag = GetTag(OBJECT_SELF);

    // Match up the right store specs to the merchant.

    if (sNPCTag == "EGAN") { // Egan at Egan's restaurant in Theed
        sStoreTag = "EGANS_ARMS";
        sStoreResRef = "egans_arms";
    }
    else if (sNPCTag == "KRIO" || // Krio, the blackmarket guy on Coruscant
             sNPCTag == "ANCH_DELDOR" || // Deldor at Anchorhead
             sNPCTag == "NAR_BARQ") { // Barq the gran on Nar Shaddaa
        sStoreTag = "BLACK_MARKET";
        sStoreResRef = "black_market";
    }
    else if (sNPCTag == "SER_SHELE_AYLOWS") { // Shele Aylows at the Serenno Shopping Complex
        sStoreTag = "GUN_STORE";
        sStoreResRef = "gun_store";
    }
    else if (sNPCTag == "GUNGA_BELEDI_BINKS") { // Beledi Binks in Otoh Gunga Plaza
        sStoreTag = "SWORD_STORE";
        sStoreResRef = "sword_store";
    }
    else if (sNPCTag == "SER_MERTO_SANE") { // Merto Sane the chiss at Serenno Shopping Complex
        sStoreTag = "SWORD_STORE";
        sStoreResRef = "sword_store";
    }
    else if (sNPCTag == "SER_TRASK") { // Trask the trandoshan at Serenno Shopping Complex
        sStoreTag = "ARMOR_STORE";
        sStoreResRef = "armor_store";
    }
    else if (sNPCTag == "SER_ROLO_BLAKE") { // Rolo Blake the old guy at Serenno Shopping Complex
        sStoreTag = "JEWELRY_STORE";
        sStoreResRef = "jewelry_store";
    }
    else if (sNPCTag == "SER_TOMAR_SMITH") { // Tomar Smith at Serenno Shopping Complex
        sStoreTag = "BOOTS_N_BELTS";
        sStoreResRef = "boots_n_belts";
    }
    else if (sNPCTag == "Rebel_Spply_Sgnt") { // Rebel Shop in Echo Base
        sStoreTag = "REBEL_STORE";
        sStoreResRef = "rebel_store";
    }
    else if (sNPCTag == "NW_OLDWOMAN69") { // Epic Shop
        sStoreTag = "z_shp_epc001";
        sStoreResRef = "z_shp_epc001";
    }
    else if (sNPCTag == "LOMONGSRE" || // lomong bespin
             sNPCTag == "Rik") {  // rik smugglers den
        sStoreTag = "Smuggled_Goods";
        sStoreResRef = "smuggled_goods";
    }
    else if (sNPCTag == "Sparks0192" || // Sparks
             sNPCTag == "TLJ_STRMGL1R") { // Cor impy merch lady
        sStoreTag = "impstore1";
        sStoreResRef = "impstore1";
    }

    // If the store doesn't exist, then create it.
    oStore = GetObjectByTag(sStoreTag);
    if (oStore == OBJECT_INVALID) {
        oStore = CreateObject(OBJECT_TYPE_STORE, sStoreResRef, GetLocation(OBJECT_SELF));
    }
    // Open the store
    {
    }
        OpenStore(oStore, GetPCSpeaker());
}
