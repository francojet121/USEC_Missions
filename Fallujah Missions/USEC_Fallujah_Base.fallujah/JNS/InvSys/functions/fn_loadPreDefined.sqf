// Add gear loop
{
  // If array element IS String
  if (typeName _x == "STRING") then {
    
    // Clothing - Headgear, Uniform, Vest
    call JNS_InvSys_fnc_addClothing;
    
    // Backpack
    call JNS_InvSys_fnc_addBackpack;
    
    // Items
    call JNS_InvSys_fnc_addItems;
   
    // Weapons
    call JNS_InvSys_fnc_addWeapons;
    
    // Attachments
    call JNS_InvSys_fnc_addAttachments;
  
  
  // If array element is NOT String (eg. IS Array)
  } else {
    // Add items to Containers
    call JNS_InvSys_fnc_addItemsToContainers;
    
  };
} forEach _loadoutArray;
