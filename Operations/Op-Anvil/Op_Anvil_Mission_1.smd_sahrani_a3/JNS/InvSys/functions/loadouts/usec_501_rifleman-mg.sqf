/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

#include "usec_501_all.sqf"

_usec_501_rifMgEx = ["B_Kitbag_cbr", //Backpack
                    //["AGM_Bandage",5],
                    //["AGM_Morphine",1],
                    //["AGM_CableTie",3],
                    "tf_rf7800str"
                    //"Binocular"
                    ];
  
_usec_501_rifleEx = [//["30Rnd_65x39_caseless_mag",8],
                    //"arifle_MX_Black_F",  // Primary Weapon
                    //"acc_pointer_IR",
                    //"optic_Hamr"
                    ];

_usec_501_mgEx= [//["200Rnd_65x39_cased_Box",2],
                //["200Rnd_65x39_cased_Box_Tracer",1],
                //"LMG_Mk200_F",  // Primary Weapon
                //"acc_pointer_IR",
                //"optic_Hamr"
                ];

_usec_501_rifle = _usec_501_all + _usec_501_rifMgEx + _usec_501_rifleEx;
_usec_501_mg = _usec_501_all + _usec_501_rifMgEx + _usec_501_mgEx;
