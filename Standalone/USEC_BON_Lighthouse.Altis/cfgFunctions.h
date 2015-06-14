class CfgFunctions
{
	class BONYO
	{
		class gear
		{
			class setPlayerGear {};
			class loadLocker {};
			class saveLocker {};
		};
		
		class misc
		{
			class print {};
		};
		
		class money
		{
			class sellPile {};
			class withdraw {};
			class deposit {};
			class giveMoney {};
		};
		
		class specialObjects
		{
			class prepareSpecialObjects {postInit = 1;};
			class setupATM {};
			class checkBalance {};
			class setupLocker {};
			class setupSellArea {};
		};
	};
};