/*
	Napf Classname Configuration
	
	Last updated: 9:08 PM 1/23/2014
	
*/

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case "unleashed":
	{
		#include "napf\dayz_unleashed.sqf"
	};
	case default 
	{
		#include "napf\default.sqf"
	};
};

 
