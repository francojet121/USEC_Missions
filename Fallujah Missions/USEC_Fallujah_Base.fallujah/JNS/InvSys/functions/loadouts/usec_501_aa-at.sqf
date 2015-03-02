/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

#include "usec_501_all.sqf"

_usec_501_lnchrEx = ["B_Kitbag_cbr", //Backpack
                    //["30Rnd_65x39_caseless_mag",8],
                    //["AGM_Bandage",5],
                    //["AGM_Morphine",1],
                    //["AGM_CableTie",3],
                    "tf_rf7800str"
                    //"arifle_MX_Black_F",  // Primary Weapon
                    //"acc_pointer_IR",
                    //"optic_Hamr",
                    //"Binocular"
                    ];

_usec_501_aaEx= [//["rhs_fim92_mag",1], // this one gets preloaded to conserve space
                //"rhs_weap_fim92",
                //["rhs_fim92_mag",2]
                ];
                
_usec_501_atEx= [//["NLAW_F",1], // this one gets preloaded to conserve space
                //"launch_NLAW_F",
                //["NLAW_F",2]
                ];

_usec_501_aa = _usec_501_all + _usec_501_lnchrEx + _usec_501_aaEx;
_usec_501_at = _usec_501_all + _usec_501_lnchrEx + _usec_501_atEx;
