/*
 * Author: Jonpas, Takelmeifter
 * Adds an action to scan intel with a progress bar and adds a PDA record
 */

jake_fnc_intel = {
    _intelObj = _this select 0; // Target object
    _player = _this select 1; // Caller
    _thisAction = _this select 2; // addAction ID

    [[_intelObj, _thisAction], "removeAction", true, true, true] call BIS_fnc_MP; // Fucking removeAction is not global

    _player createDiaryRecord ["PDA", ["Encrypted Correspondence", "MESSAGE IS AS FOLLOWS +++ JBZZHUWGY, HK RBNY QFHIBBU AHK OGGU KGFGJIGW IB QYBXTWG IHUS KNQQBYI LBY IAG KL ZTKKTBU BNIFTUGW TU BNY FHKI JBZZNUTJHITBU, RBN AHXG OGGU JFGHYGW LBY GUIYR IB JHZQ XTWH,H AGFTJBQIGY DTFF HYYTXG IB IYHUKQBYI RBN IB IBZBYYBDK OYGTLTUE. +++ MESSAGE END"]];
    hint "Scan added to PDA";
};

intel addAction ["Search for Intel", {
    _intelObj = _this select 0; // Target object
    _player = _this select 1; // Caller
    _thisAction = _this select 2; // addAction ID

    [10, [_intelObj, _player, _thisAction], "jake_fnc_intel", "Intel Found, Scanning..."] call AGM_Core_fnc_progressBar; 
}, nil, 6, true, true, "", "_this distance _target < 2"];
