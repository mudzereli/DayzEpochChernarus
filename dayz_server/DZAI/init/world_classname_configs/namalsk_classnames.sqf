/*
	Namalsk Classname Configuration
	
	Last updated: 6:20 PM 1/24/2014
	
*/

private ["_modname","_newItems"];

switch (DZAI_modName) do {
	case "epoch":
	{
		#include "epoch\dayz_epoch.sqf"
	};
	case "2017":
	{
		#include "namalsk\namalsk2017.sqf"
	};
	case default 
	{
		#include "namalsk\default.sqf"
	};
};
