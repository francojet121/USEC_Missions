/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

_usec_152_allHeli= ["U_B_CTRG_1", // Uniform
                    "H_PilotHelmetHeli_B" // Headgear
                   ];

_usec_152_allFixed = ["U_B_PilotCoveralls", // Uniform
                      "H_PilotHelmetFighter_B" // Headgear
                     ];

_usec_152_all = ["V_TacVest_blk", // Vest
                //["NVGoggles",1],
                //["Chemlight_Green",2],
                //["AGM_IR_Strobe_Item",1],
                //["AGM_MapTools",1],
                //["SmokeShell",2],
                //["SmokeShellGreen",2],
                //["SmokeShellBlue",2],
                //["30Rnd_65x39_caseless_mag",1], // this one gets loaded, +3 below
                "ItemMap",
                //"ItemGPS",
                "ItemCompass",
                "ItemWatch",
                "tf_anprc152"
                ];

_usec_152_pilotEx = [//["Laserbatteries",1],  // Add first to make space  
                    //"Laserdesignator",  // ^
                    //["AGM_Bandage",5],
                    //["AGM_Morphine",1],
                    //["AGM_CableTie",2],
                    //"arifle_MXC_Black_F",  // Primary Weapon
                    //["30Rnd_65x39_caseless_mag",3], // Add after weapon to conserve space
                    //"acc_pointer_IR",
                    //"optic_Holosight"
                    ];

_usec_152_medPilot= ["B_Carryall_mcamo"  // Backpack
                    //["AGM_Bandage",20],
                    //["AGM_Morphine",10],
                    //["AGM_Bloodbag",5],
                    //["AGM_Epipen",10]
                    ];
                    
_usec_152_repPilot= ["B_Carryall_mcamo"  // Backpack
                    //["ToolKit",4]
                    ];
                    
_usec_152_fixPilot= ["B_Parachute" // Parachute
                    ];

_usec_152_pilot = _usec_152_allHeli + _usec_152_all + _usec_152_pilotEx;
_usec_152_pilotMed = _usec_152_pilot + _usec_152_medPilot;
_usec_152_pilotRep = _usec_152_pilot + _usec_152_repPilot;
_usec_152_pilotFixed = _usec_152_allFixed + _usec_152_all + _usec_152_pilotEx + _usec_152_fixPilot;
