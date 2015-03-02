/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

#include "usec_501_all.sqf"

_usec_501_sqdLdrEx= [//"tf_rt1523g_sage" //Backpack
                    ];
                    
_usec_501_teamLdrEx = ["B_Kitbag_cbr" //Backpack
                      ];
                    
_usec_501_ldrEx= [//["30Rnd_65x39_caseless_mag",6],
                  //["30Rnd_65x39_caseless_mag_Tracer",2],
                  //["3Rnd_HE_Grenade_shell",3],
                  //["SmokeShellGreen",1],
                  //["SmokeShellYellow",2],
                  //["3Rnd_SmokeGreen_Grenade_shell",1],
                  //["3Rnd_SmokeRed_Grenade_shell",1],
                  //["AGM_Bandage",5],
                  //["AGM_Morphine",1],
                  //["AGM_CableTie",3],
                  //["Laserbatteries",1],
                  "tf_anprc152"
                  //"arifle_MX_GL_Black_F",  // Primary Weapon
                  //"acc_pointer_IR",
                  //"optic_Hamr",
                  //"Laserdesignator"
                  ];

_usec_501_sqdLdr = _usec_501_all + _usec_501_sqdLdrEx + _usec_501_ldrEx;
_usec_501_teamLdr = _usec_501_all + _usec_501_teamLdrEx + _usec_501_ldrEx;
