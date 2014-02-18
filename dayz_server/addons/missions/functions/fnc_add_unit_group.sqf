private ["_unitpos","_wppos","_rndLOut","_ailoadout","_wp","_aiwep1","_aiammo1","_aiunits","_aiunit","_aispawnpos","_wpradius","_wpnum","_numunits","_levelnum","_ai_group","_xpos","_ypos"];

_aiunits    = [];
_aiunit     = objNull;
_aispawnpos = _this select 0;
_wpradius   = _this select 1;
_wpnum      = _this select 2;
_numunits   = _this select 3;
_levelnum   = _this select 4;
_ai_group   = createGroup resistance;

_xpos = _aispawnpos select 0;
_ypos = _aispawnpos select 1;

diag_log text format ["AIUNIT: Spawn initiated: Centre:%1 | Radius in m:%2 | Waypoint number:%3 | WeaponLevel:%4 | Group:%5 ",_aispawnpos,_wpradius,_wpnum,_levelnum,_ai_group];

for [{ x=1 },{ x < _numunits+1 },{ x = x + 1; }] do
{
    _unitpos = [_xpos+x,_ypos+x,0];
    
    if (_levelnum==0) then // in_sityes troops
    {
        if ((x == 1) || (x == 3) || (x == 5)) then //troop soldiers
        {
            "Bandit1_DZ" createUnit [_unitpos, _ai_group, "_aiunit=this;",1,"PRIVATE"];
            _rndLOut=floor(random 4);
            _ailoadout=
            switch (_rndLOut) do
            {
                case 0: {["M1014","8Rnd_B_Beneli_74Slug","revolver_EP1","6Rnd_45ACP"]};
                case 1: {["M1014","8Rnd_B_Beneli_Pellets","revolver_EP1","6Rnd_45ACP"]};
                case 2: {["Remington870_lamp","8Rnd_B_Beneli_74Slug","Colt1911","7Rnd_45ACP_1911"]};
                case 3: {["Remington870_lamp","8Rnd_B_Beneli_Pellets","Colt1911","7Rnd_45ACP_1911"]};
            };
        };
        if ((x == 2) || (x == 4) || (x >= 6)) then //troops snipers
        {
            "Bandit1_DZ" createUnit [_unitpos, _ai_group, "_aiunit=this;",1,"PRIVATE"];
            _rndLOut=floor(random 1);
            _ailoadout=
            switch (_rndLOut) do
            {
                case 0: {["AK_74","30Rnd_545x39_AK","Makarov","8Rnd_9x18_Makarov"]};
                //case 1: {["Huntingrifle","5x_22_LR_17_HMR","Makarov","8Rnd_9x18_Makarov"]};
                //case 2: {["M14_EP1","20Rnd_762x51_DMR","Makarov","8Rnd_9x18_Makarov"]};
            };
        };
    };
    if (_levelnum==1) then //in_military troops
    {
        if (x == 1) then //one troops comander
        {
            "Bandit1_DZ" createUnit [_unitpos, _ai_group, "_aiunit=this;",1,"LIEUTENANT"];
            _rndLOut=floor(random 1);
            _ailoadout=
            switch (_rndLOut) do
            {
                case 0: {["AK_74","30Rnd_545x39_AK","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 1: {["M16A2","30Rnd_556x45_Stanag","M9SD","15Rnd_9x19_M9SD"]};
                //case 2: {["Sa58P_EP1","30Rnd_762x39_SA58","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 3: {["Sa58V_CCO_EP1","30Rnd_762x39_SA58","M9SD","15Rnd_9x19_M9SD"]};
                //case 4: {["Sa58V_EP1","30Rnd_762x39_SA58","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 5: {["M4SPR","30Rnd_556x45_Stanag","M9SD","15Rnd_9x19_M9SD"]};
                //case 6: {["M4A1_HWS_GL_SD_Camo","30Rnd_556x45_StanagSD","MakarovSD","8Rnd_9x18_Makarov"]};
            };
        };
        if ((x == 2) || (x == 3)) then //troops sergeant
        {
            "Bandit1_DZ" createUnit [_unitpos, _ai_group, "_aiunit=this;",1,"SERGEANT"];
            _rndLOut=floor(random 1);
            _ailoadout=
            switch (_rndLOut) do
            {
                case 0: {["M16A2","30Rnd_556x45_Stanag","glock17_EP1","17Rnd_9x19_glock17"]};
                //case 1: {["RPK_74","75Rnd_545x39_RPK","M9","15Rnd_9x19_M9"]};
                //case 2: {["G36A_camo","30Rnd_556x45_G36","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 3: {["M4A1_HWS_GL_SD_Camo","30Rnd_556x45_StanagSD","MakarovSD","8Rnd_9x18_Makarov"]};
            };
        };
        if (x > 3) then //troops soldiers
        {
            "BAF_Soldier_Sniper_MTP" createUnit [_unitpos, _ai_group, "_aiunit=this;",1,"CORPORAL"];
            _rndLOut=floor(random 1);
            _ailoadout=
            switch (_rndLOut) do
            {
                case 0: {["AKS_74_kobra","30Rnd_545x39_AK","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 1: {["M24","5Rnd_762x51_M24","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 2: {["M24_des_EP1","5Rnd_762x51_M24","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 3: {["SVD","10Rnd_762x54_SVD","MakarovSD","8Rnd_9x18_Makarov"]};
                //case 4: {["AK_107_pso","30Rnd_545x39_AK","M9","15Rnd_9x19_M9"]};
            };
        };
    };
    diag_log text format ["AIUNIT: Creating BAF_Soldier_L_DDPM by %1 at %2. Result:%3 | Loadout:%4 / Num:%5",player,_unitpos,_aiunit,_ailoadout,_rndLOut];
    
    _aiunit enableAI "TARGET";
    _aiunit enableAI "AUTOTARGET";
    _aiunit enableAI "MOVE";
    _aiunit enableAI "ANIM";
    _aiunit enableAI "FSM";
    _aiunit allowDammage true;
    _aiunit setCombatMode "RED";
    _aiunit setBehaviour "COMBAT";
    
    removeAllWeapons _aiunit;
    _aiwep1 = _ailoadout select 0;
    _aiammo1 = _ailoadout select 1;
    _aiunit addWeapon _aiwep1;
    _aiunit addMagazine _aiammo1;
    _aiunit addMagazine _aiammo1;
    _aiunit removeWeapon "ItemRadio";
    _aiunit removeWeapon "ItemGPS";
    _aiunit removeWeapon "ItemMap";
    _aiunit removeWeapon "ItemWatch";
    _aiunit removeWeapon "ItemCompass";
    if (x == 1) then {
        _aiunit addMagazine "HandGrenade_West";
        _aiunit addMagazine "FoodCanBakedBeans";
        _aiunit addMagazine "ItemSodaCoke";
        _aiunit addMagazine "ItemPainkiller";
    };
    if (x == 2) then {
        _aiunit addMagazine "ItemPainkiller";
        _aiunit addMagazine "ItemMorphine";
    };
    if (x >= 3) then {
        _aiunit addMagazine "ItemBandage";
    };
    _aiunit setSkill ["aimingAccuracy",1];
    _aiunit setSkill ["aimingShake"   ,0.7];
    _aiunit setSkill ["aimingSpeed"   ,1];
    _aiunit setSkill ["endurance"     ,1];
    _aiunit setSkill ["spotDistance"  ,1];
    _aiunit setSkill ["spotTime"      ,1];
    _aiunit setSkill ["courage"       ,1];
    _aiunit setSkill ["reloadSpeed"   ,1];
    _aiunit setSkill ["commanding"    ,1];
    _aiunit setSkill ["general"       ,1];
    _aiunits set [count _aiunits,_aiunit];
};
for [{ x=1 },{ x < _wpnum },{ x = x + 1; }] do {
    _wppos = [_xpos+(x*10),_ypos+(x*10),_wpradius];
    _wp = _ai_group addWaypoint [_wppos, _wpradius];
    _wp setWaypointType "MOVE";
};
_wp = _ai_group addWaypoint [[_xpos,_ypos,0], _wpradius];
_wp setWaypointType "CYCLE";

diag_log text format ["AIUNIT: Last Waypoint %1 at %2",_wp,_wppos];

_aiunits;
