/* --------------------------------------------------------------------
  LOADOUT GUIDELINES
    
  Always put Containers (Uniform, Vest, Backpack) BEFORE items to be stored in them!
  Always put Weapons BEFORE Attachments!
  Items loaded into Containers (Uniform, Vest or Backpack) are to be put down as: ["itemClassname",numberOfItems]
  Items loaded directly into slots are to be put down as: "itemClassname"
  All items except last should need a comma at the end: ["item",number], OR "item",
  --------------------------------------------------------------------*/

_usec_411_all = ["H_HelmetCrew_B", // Headgear
                "U_B_CTRG_1", // Uniform
                "V_PlateCarrierL_CTRG", // Vest
                ["NVGoggles",1],
                ["Chemlight_Green",2],
                ["AGM_IR_Strobe_Item",1],
                ["AGM_MapTools",1],
                ["SmokeShell",2],
                ["SmokeShellGreen",2],
                ["SmokeShellBlue",2],
                ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1], // this one gets loaded, +3 below
                "ItemMap",
                "ItemGPS",
                "ItemCompass",
                "ItemWatch",
                "tf_anprc152"
                ];
                    
_usec_411_crewEx= [["Laserbatteries",1],
                  "Laserdesignator",
                  ["AGM_Bandage",5],
                  ["AGM_Morphine",1],
                  ["AGM_CableTie",2],
                  "rhs_weap_m4_carryhandle",  // Primary Weapon
                  ["rhs_mag_30Rnd_556x45_M855A1_Stanag",3], // Add after weapon to conserve space
                  "rhsusf_acc_anpeq15A",
                  "rhsusf_acc_compm4"
                  ];

_usec_411_medCrew = ["B_Carryall_mcamo",  // Backpack
                    ["AGM_Bandage",20],
                    ["AGM_Morphine",10],
                    ["AGM_Bloodbag",5],
                    ["AGM_Epipen",10]
                    ];
                    
_usec_411_repCrew = ["B_Carryall_mcamo",  // Backpack
                    ["ToolKit",1]
                    ];

_usec_411_crew = _usec_411_all + _usec_411_crewEx;
_usec_411_crewMed = _usec_411_all + _usec_411_crewEx + _usec_411_medCrew;
_usec_411_crewRep = _usec_411_all + _usec_411_crewEx + _usec_411_repCrew;
