class JNS_InvSys {
  tag = "JNS_InvSys";
  class functions {
    file = "JNS\InvSys\functions";
    class removeAll {
      description = "Removes all gear.";
    };
    class addClothing {
      description = "Adds Uniform and Vest.";
    };
    class addBackpack {
      description = "Adds Backpack.";
    };
    class addItemsToContainers {
      description = "Adds items to Uniform, Vest and Backpack in that order.";
    };
    class addItems {
      description = "Adds Items (GPS, Map, Radio, Compass...).";
    };
    class addWeapons {
      description = "Adds Weapons.";
    };
    class addAttachments {
      description = "Adds Attachments to weapons.";
    };
    class loadPreDefined {
      description = "Loads Pre-Defined Loadout.";
    };
    class isObject {
      description = "Checks if the script is ran on object or player and assigns proper variables";
    };
    class init {
      description = "Initializes the object with JNS Inventory System";
    };
    class putIntoBox {
      description = "Puts Pre-Defined Loadout Items into the Object";
    };
    class addToBox {
      description = "Adds all items to the Object";
    };
  };
};
