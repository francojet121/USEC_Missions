/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

#include "usec_501_all.sqf"
  
_usec_501_medicEx = ["B_Kitbag_cbr", //Backpack
                    ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8],
                    ["SmokeShell",2],
                    ["SmokeShellGreen",1],
                    ["AGM_Bandage",20],
                    ["AGM_Morphine",10],
                    ["AGM_Bloodbag",2],
                    ["AGM_CableTie",2],
                    "tf_rf7800str",
                    "rhs_weap_m16a4_carryhandle",  // Primary Weapon
                    "rhsusf_acc_anpeq15A",
                    "rhsusf_acc_compm4"
                    ];
                    
_usec_501_medPlEx = [["AGM_Bloodbag",3],
                    ["AGM_Epipen",10]
                    ];

_usec_501_medic = _usec_501_all + _usec_501_medicEx;
_usec_501_medicPlt = _usec_501_medic + _usec_501_medPlEx;
