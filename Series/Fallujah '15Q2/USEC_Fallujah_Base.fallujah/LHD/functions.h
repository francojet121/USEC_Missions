class LHD
{
	tag = "LHD_Garage";
	class functions
	{
		file = "LHD\functions";
		class mainDisplay {
      description = "This is where we initialize all the GUI, what is visible and fetch the necessary data";
    };
    class spawnVehicleSelected {
      description = "Spawn the selected vehicle";
    }; 
    
    class displayStoredVehicle {
      description = "Display data for the selected vehicle";
    }; 
    
    class storeVehicle {
      description = "Store the selected vehicle";
    }; 
    
    class spawnVehicle {
      description = "Spawn the selected vehicle";
    }
    
    class hideAllMenus {
      description = "Hide all the various menus on the Garage GUI";
    }
    
    class hideAllStoreVehicles {
      description = "Hide store vehicles GUI";
    }

    class hideAllInventoryStatus {
      description = "Hide Garage inventory GUI";
    }
    
    class NavHomeFunction {
    };
    
    class NavActivityLogFunction {
    };
    
    class NavInventorystatusFunction {
    };
    
    class NavStoreVehicleFunction {
    };
        
    class NavBtnOver {
    };
    
    class BayOver {
    };
    
    class BaySelect{
    };
	};
};