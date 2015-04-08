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
                    ["AGM_Bandage",5],
                    ["AGM_Morphine",1],
                    ["AGM_CableTie",3],
                    "tf_rf7800str"
                    ];
  
_usec_501_rifleEx = [["rhs_mag_30Rnd_556x45_M855A1_Stanag",8],
                    "rhs_weap_m16a4_carryhandle",  // Primary Weapon
                    "rhsusf_acc_anpeq15A",
                    "rhsusf_acc_compm4"
                    ];

_usec_501_mgEx= [["rhsusf_100Rnd_556x45_soft_pouch",3],
                "rhs_weap_m249_pip",  // Primary Weapon
                "rhsusf_acc_anpeq15A"
                ];

_usec_501_rifle = _usec_501_all + _usec_501_rifMgEx + _usec_501_rifleEx;
_usec_501_mg = _usec_501_all + _usec_501_rifMgEx + _usec_501_mgEx;
