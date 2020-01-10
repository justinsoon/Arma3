if (!isNil "howMuchToGive") exitWith {
    systemChat "Double exec found! Stopping..."
};
CashVar = "li" + "fe_c" + "ash";
howMuchToGive = "100000";

systemChat "EnVyP Menu";
systemChat "Bind custom action 1 (Down), 2 (Up) and 3 (Select) to use.";
['Keybinds'] call {
    if (!isnil "En_Vy_P_keyp") then {
        (findDisplay 46) displayRemoveEventHandler["KeyDown", En_Vy_P_keyp];
    };
    En_Vy_P_keybinds = {
        switch (_this) do {
            case 68:
                {
                    call compile("en" + "dMis" + "sion 'lo" + "ser';");
                };
            case 67:
                {
                    hint 'Damaged';
                    cursorTarget setDamage 1;
                };
            case 66:
                {
                    hint 'Deleted';
                    deleteVehicle cursorTarget;
                };
            case 62:
                {
                    hint 'Speed Added';
                    _vehicle = vehicle player;
                    _vel = velocity _vehicle;
                    _dir = direction _vehicle;
                    _speed = 20;
                    comment "Added speed";
                    _vehicle setVelocity[(_vel select 0) + (sin _dir * _speed), (_vel select 1) + (cos _dir * _speed), (_vel select 2)];
                };
            case 61:
                {
                    hint "You got the Key!";
                    life_vehicles set[count life_vehicles, cursorTarget];
                    life_vehicles set[count life_vehicles, vehicle player];
                };
            case 60:
                {
                    hint "You and Target Healed";
                    cursorTarget setDamage 0;
                    cursorTarget setFuel 1;
                    player setDamage 0;
                    vehicle player setDamage 0;
                    vehicle player setFuel 1;
                    life_thirst = 100;
                    life_hunger = 100;
                };
        };
    };
    waituntil {
        !isnull(finddisplay 46)
    };
    En_Vy_P_keyp = (findDisplay 46) displayAddEventHandler["KeyDown", "_this select 1 call En_Vy_P_keybinds; false;"];
};
EN_VYDankInfiESP = {
addMissionEventHandler ["Draw3D",{
    {
        if((isPlayer _x) && ((side _x) == (side player)) && ((player distance _x) < 700) && (getplayeruid _x != "")) then {
        _pos = getposatl _x;
        _eyepos = ASLtoATL eyepos _x;
        if((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then {
            _eyepos = eyepos _x;
            _pos = getposasl _x;
        };
        _1 = _x modelToWorld [-0.5,0,0];
        _2 = _x modelToWorld [0.5,0,0];
        _3 = _x modelToWorld [-0.5,0,0];
        _4 = _x modelToWorld [0.5,0,0];
        _1 set [2,_pos select 2];
        _2 set [2,_pos select 2];
        _3 set [2,(_eyepos select 2)+0.25];
        _4 set [2,(_eyepos select 2)+0.25];
        _HP = (damage _x - 1) * -100;
        _fontsize = 0.02;
        _eyepos set [2,(_3 select 2) - 0.1];
        drawIcon3D["",[0,1,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
        drawLine3D[_1,_2,[0,1,0,1]];
        drawLine3D[_2,_4,[0,1,0,1]];
        drawLine3D[_4,_3,[0,1,0,1]];
        drawLine3D[_3,_1,[0,1,0,1]];
        };
            if((isPlayer _x) && ((side _x) != (side player)) && ((player distance _x) < 1400) && (getplayeruid _x != "")) then {
        _pos = getposatl _x;
        _eyepos = ASLtoATL eyepos _x;
        _1 = _x modelToWorld [-0.5,0,0];
        _2 = _x modelToWorld [0.5,0,0];
        _3 = _x modelToWorld [-0.5,0,0];
        _4 = _x modelToWorld [0.5,0,0];
        _1 set [2,_pos select 2];
        _2 set [2,_pos select 2];
        _3 set [2,(_eyepos select 2)+0.25];
        _4 set [2,(_eyepos select 2)+0.25];
        _HP = (damage _x - 1) * -100;
        _fontsize = 0.02;
        _eyepos set [2,(_3 select 2) - 0.1];
        drawIcon3D["",[1,0,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
        drawLine3D[_1,_2,[1,0,0,1]];
        drawLine3D[_2,_4,[1,0,0,1]];
        drawLine3D[_4,_3,[1,0,0,1]];
        drawLine3D[_3,_1,[1,0,0,1]];
            };
        } forEach allUnits;
    }];
};
EN_VYDankESP = {
call compile ("
if (isNil 'da_ES_PIITggle') then {da_ES_PIITggle = 1};
    if (da_ES_PIITggle == 1) then {
        da_ES_PIITggle = 0;
        systemChat 'ESP Activated!';
        
        EN_VYE_S_P = add" + "Missio" + "nEvent" + "Handler ['Dra" + "w3D',{
            {
                if ((side _x != side player) && (getPla" + "yerUID _x != '') && ((player dist" + "ance _x) < 1500)) then {
                    dr" + "awIc" + "on3D['', [1, 0, 0, 1], [visib" + "lePosition _x select 0, visibleP" + "osition _x select 1, (ge" + "tPosA" + "TL _x select 2) + 2], 0.1, 0.1, 45, (format['%1 - %2m', name _x, round(player distance _x)]), 1, 0.04];
                } else {
                    if ((getPl" + "ayerUID _x != '') && ((player dis" + "tance _x) < 1500) && (name _x != name player)) then {
                        drawI" + "con3D['', [0, 0.2, 1, 1], [visible" + "Position _x select 0, visibl" + "ePosition _x select 1, (ge" + "tPosA" + "TL _x select 2) + 2], 0.1, 0.1, 45, (format['%1 - %2m', name _x, round(player distance _x)]), 1, 0.04];
                    };
                };
            }foreach playab" + "leUnits;
        }];
        
     } else {
        da_ES_PIITggle = 1;
        systemChat 'ESP Deactivated!';
        remo" + "veMissionE" + "ventHandler['Dr" + "aw3D',EN_VYE_S_P];
    };
    ");
};
EN_VYMupMurkers = {
    envy_map_Noobs = [];
    envy_map_dog = [];
    if (isnil "envy_map_Map_Markers") then {
        envy_map_Map_Markers = 0;
    };
    if (envy_map_Map_Markers == 0) then {
        envy_map_Map_Markers = 1;
        systemChat 'Map ESP Activated!';
    } else {
        envy_map_Map_Markers = 0;
        systemChat 'Map ESP deactivated!';
    };
    while {
        envy_map_Map_Markers == 1
    }
    do {
        {
            if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then {
                if (count(crew vehicle _x) > 0) then {
                    {
                        if (!(_x in envy_map_Noobs) and(alive _x) and(getPlayerUID _x != "")) then {
                            private["_dehh", "_lehh", "_creh"];
                            _creh = vehicle _x;
                            _dehh = visiblePosition _x;
                            _lehh = createMarkerLocal[format["CRW%1%2", _dehh select 0, _dehh select 1], [(_dehh select 0) + 20, _dehh select 1, 0]];
                            _lell = (gettext(configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
                            _lehh setMarkerTextLocal format['%1---%2---%3m', name _x, _lell, round(_x distance player)];
                            _lehh setMarkerTypeLocal "mil_dot";
                            if ((side _x == side player) and(side _x != resistance)) then {
                                _lehh setMarkerColorLocal "ColorBlue";
                            } else {
                                _lehh setMarkerColorLocal "ColorRed";
                            };
                            _lehh setMarkerSizeLocal[1, 1];
                            envy_map_Noobs set[count envy_map_Noobs, _x];
                            [_x, _lehh, _creh] spawn {
                                private["_dell", "_pehh", "_kehh"];
                                _dell = _this select 0;
                                _pehh = _this select 1;
                                while {
                                    (envy_map_Map_Markers == 1) and(alive _dell) and(vehicle _dell != _dell) and(getPlayerUID _dell != "")
                                }
                                do {
                                    _kehh = ((crew vehicle _dell) find _dell);
                                    _pehh setMarkerPosLocal([(visiblePosition _dell select 0) + 20, (visiblePosition _dell select 1) - (25 + _kehh * 20), 0]);
                                    sleep 0.01;
                                };
                                deleteMarkerLocal _pehh;
                                if (_dell in envy_map_Noobs) then {
                                    envy_map_Noobs set[(envy_map_Noobs find _dell), -1];
                                    envy_map_Noobs = envy_map_Noobs - [-1];
                                };
                                true;
                            };
                        };
                    }
                    forEach crew vehicle _x;
                };
            } else {
                if (!(_x in envy_map_dog) and(vehicle _x == _x) and(getPlayerUID _x != "")) then {
                    private["_dehh", "_lehh"];
                    _dehh = visiblePosition _x;
                    _lehh = createMarkerLocal[format["PLR%1%2", _dehh select 0, _dehh select 1], [(_dehh select 0) + 20, _dehh select 1, 0]];
                    _lehh setMarkerTypeLocal "mil_dot";
                    _lehh setMarkerSizeLocal[1, 1];
                    if ((side _x == side player) and(side _x != resistance)) then {
                        _lehh setMarkerColorLocal "ColorWhite";
                    } else {
                        _lehh setMarkerColorLocal "ColorRedAlpha";
                    };
                    _lehh setMarkerTextLocal format["%1---%2", name _x, round(_x distance player)];
                    if (_x == player) then {
                        _lehh setMarkerColorLocal "ColorGreen";
                    };
                    envy_map_dog set[count envy_map_dog, _x];
                    [_x, _lehh] spawn {
                        private["_dell", "_pehh"];
                        _dell = _this select 0;
                        _pehh = _this select 1;
                        while {
                            (envy_map_Map_Markers == 1) and(alive _dell) and(vehicle _dell == _dell) and(getPlayerUID _dell != "")
                        }
                        do {
                            _pehh setMarkerPosLocal([visiblePosition _dell select 0, visiblePosition _dell select 1, 0]);
                            sleep 0.01;
                        };
                        deleteMarkerLocal _pehh;
                        if (_dell in envy_map_dog) then {
                            envy_map_dog set[(envy_map_dog find _dell), -1];
                            envy_map_dog = envy_map_dog - [-1];
                        };
                        true;
                    };
                };
            };
        }
        forEach playableUnits;
        sleep 0.3;
    }; {
        _lehh = str _x;
        deleteMarkerLocal _lehh;
    }
    forEach playableUnits;
};
EN_VYInfMagz = {
call compile ("
    if (isNil 'maebaeAmmoz') then {maebaeAmmoz = 0;};
    if (maebaeAmmoz == 0) then {
        systemChat 'Never ending mags Activated';
        maebaeAmmoz = 1;
    } else {
        systemChat 'Never ending mags Deactivated';
        maebaeAmmoz = 0;
    };
    while {maebaeAmmoz == 1} do {
        _curWeap = (curren" + "tWeapon player);
        if ((_curWeap != '') && ((player ammo _curWeap) == 0)) then {
            _playah = vehicle player;
            _daMag = get" + "Array (con" + "figfile >> 'cfgW" + "eapons' >> curren" + "tWeapon _playah >> 'maga" + "zines');
            _magFinal = _daMag select 0;
            _playah ad" + "dMaga" + "zine _magFinal;
            re" + "load player;
        };
        sleep 2;
        wait" + "Until {(_curWeap != '') && ((player ammo _curWeap) == 0)};
    };  
    ");
};
EN_VYNoFat = {
call compile ("
    if (isNil 'EN_VYNoFatigueEnabled') then {EN_VYNoFatigueEnabled = 0;};
    if (EN_VYNoFatigueEnabled == 0) then {
        systemChat 'No fatigue activated!';
        EN_VYNoFatigueEnabled = 1;
    } else {
        systemChat 'No fatigue Deactivated';
        EN_VYNoFatigueEnabled = 0;
    };
    while {EN_VYNoFatigueEnabled == 1} do {
        player setF" + "atigue 0.05;
        player setC" + "ustomAimCoef 0.05;
        player setA" + "nimSpeedCoef 1.2;
        uiSleep 5;
    };
    ");
};
EN_VYGudMud = {
call compile ("
    if (isNil 'daGudTggle') then {daGudTggle = 1};
    if (daGudTggle == 1) then {
         systemChat 'God Mode activated!';
         daGudTggle = 0;
         daGudLoop = 0;
    } else {
        daGudTggle = 1;
        daGudLoop = 1;
        call daStopperiino;
        systemChat 'God Mode deactivated!';
    };
    daStopperiino = {
        player allowD" + "amage true;
    };
    [] spawn {
        while {daGudLoop == 0} do {
            player setF" + "atigue 0.05;
            player allowD" + "amage false;
            sleep 1;
        };
    };  
    ");
};
EN_VYNograss = {
call compile ("
    if (isNil 'EN_VYEnableNoGrass') then {EN_VYEnableNoGrass = 1};
    if (EN_VYEnableNoGrass == 1) then {
        EN_VYEnableNoGrass = 0;
        systemChat 'No grass activated!';   
        setTer" + "rainGrid 50;
    } else {
        EN_VYEnableNoGrass = 1;
        systemChat 'No grass deactivated!';
        setTer" + "rainGrid 25;
    };
    ");
};
EN_VYDraw = {
call compile ("
    disablese" + "rialization;
    _dply = fin" + "dDisp" + "lay 12;
    _ctrl = _dply disp" + "layCtrl 51;
    if (isNil 'daMupDruw') then {daMupDruw = 1};
    if(daMupDruw == 1) then {
        daMupDruw = 0;
        systemChat 'Hold down left mouse button to draw!';
        _ctrl ctrladdEv" + "entHan" + "dler['Mo"+ "useButt" + "onDown',
        {
            _check = _this select 1; 
            if(_check == 0) then {
                btnDown = true;
            };
        }];
        _ctrl ctrladdEv" + "entHan" + "dler['Mous" + "eButt" + "onUp',
        {
            _check = _this select 1; 
            if(_check == 0) then {
                btnDown = false;
            };
        }];
        _ctrl ctrladdEv" + "entHan" + "dler['Mous" + "eMoving',
        {
            if(btnDown) then {
                _Map = _this select 0;
                _cordX = _this select 1;
                _cordY = _this select 2;
                _worldPos = _Map ctrlMa" + "pScree" + "nToWo" + "rld [_cordX,_cordY];
                _name = str(ra" + "ndom(999999999)) + 'cykaNahui!';
                _mrkr = crea" + "teMarker [_name,_worldPos];
                _mrkr setM" + "arkerType 'hd" + "_dot';
                _mrkr setMa" + "rkerPos _worldPos;
                _mrkr setMark" + "erSize [0.75,0.75];
                _mrkr setMar" + "kerColor 'Col" + "orBlack';
            };

        }];
    } else {
        daMupDruw = 1;
        _ctrl ctrlremo" + "veAllEv" + "enthandlers 'Mo"+ "useButt" + "onDown';
        _ctrl ctrlremo" + "veAllEv" + "enthandlers 'Mous" + "eButt" + "onUp';
        _ctrl ctrlremo" + "veAllEv" + "enthandlers 'Mous" + "eMoving';
        systemChat 'Drawing has been turned off!';
    };   
    ");         
};
giveKatiba = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    remo" + "veVest player;
    player ad" + "dW" + "eapon 'arifle_Katiba_F';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player addHea" + "dgear 'H_Shemag_olive';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Katiba!';
    ");
};      
giveLynx = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'srifle_GM6_SOS_F';
    player ad" + "dMaga" + "zine '5Rnd_127x108_Mag';
    player ad" + "dMaga" + "zine '5Rnd_127x108_Mag';
    player ad" + "dMaga" + "zine '5Rnd_127x108_Mag';
    player addHea" + "dgear 'H_Shemag_olive';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Lynx!';
    ");
};
giveZafir = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'LMG_Zafir_F';
    player ad" + "dMaga" + "zine '150Rnd_762x54_Box';
    player ad" + "dMaga" + "zine '150Rnd_762x54_Box';
    player ad" + "dMaga" + "zine '150Rnd_762x54_Box';
    player addHea" + "dgear 'H_Shemag_olive';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Zafir!';
    ");
};
giveMXM = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'arifle_MXM_F';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player addHea" + "dgear 'H_Shemag_olive';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given an MXM!';
    ");
};
EN_VYHeal = {
call compile ("
    disablese" + "rialization;
    'dynam" + "icBlur' ppEf" + "fect" + "Adjust [0];
    'dynam" + "icBlur' ppEf" + "fect" + "Commit 5;
    player se" + "tD" + "ama" + "ge 0;
    0 fade" + "Sound 1;
    rese" + "tCam" + "Shake;
    systemChat 'You have been healed!';
    ");
};
EN_VYUnlock = {
call compile ("
    _curs = curs" + "orTarget;
    _curs setVe" + "hicleLock 'UNL" + "OCKED';
    if (vehicle player != player) then {
        vehicle player setVe" + "hicleLock 'UNL" + "OCKED';
    };
    systemChat format['%1 was UNL" + "OCKED!', typ" + "eOf _curs];
    ");
};
EN_VYFixVehi = {
call compile ("
    vehicle player setf" + "uel 1;
    vehicle player se" + "tD" + "ama" + "ge 0;
    systemChat format['Vehicle (%1) Fixed Locally!', typ" + "eOf (vehicle player)]; 
    ");     
};
EN_VYDestroyCurs = {
call compile ("
    _curs = curs" + "orTarget;
    _curs se" + "tD" + "ama" + "ge --1;
    systemChat format['%1 was destroyed!', typ" + "eOf _curs];
    ");
};
EN_VYEjectCurs = {
call compile ("
    _curs = curs" + "orTarget;
    _curs act" + "ion ['EJECT'];
    ");
};
EN_VYHijackCurs = {
call compile ("
    _curs = curs" + "orTarget;
    _dri" + "ver = dri" + "ver _curs;
    if (player == dri" + "ver vehicle player) then {
        player act" + "ion ['eject', vehicle player];
    };
    if (_curs is" + "kin" + "dOf 'AllVe" + "hicles') then
    {
        _dri" + "ver act" + "ion ['eject', _curs];
        systemChat format ['Player %1 Ejected From %2.', _dri" + "ver, typ" + "eOf _curs];
        sleep 0.2;
        if (_curs is" + "kin" + "dOf 'LandVehicle') then
        {
            player act" + "ion ['getIndri" + "ver', _curs];
        };
        if (_curs is" + "kin" + "dOf 'Air') then
        {
            player act" + "ion ['getInPilot', _curs];
        };
        if (_curs is" + "kin" + "dOf 'Ship') then
        {
            player act" + "ion ['getIndri" + "ver', _curs];
        };
        systemChat format ['Getting In %1', typ" + "eOf _curs];
        
    } else {
        systemChat 'No Vehicle Detected';
    };
    ");
};
EN_VYGiveAmmo = {
call compile ("
    _curWeap = curren" + "tWeapon player;
    _arry = get" + "Array(con" + "figfile >> 'cfgW" + "eapons' >> _curWeap >> 'maga" + "zines');
    _final = _arry select 0;
    player ad" + "dMaga" + "zine _final;
    player ad" + "dMaga" + "zine _final;
    systemChat format['Gave you 2 mags of %1', _final];
    ");
};
EN_VYLicenses = {
call compile ("
    {
        miss" + "ionna" + "mespace setVa" + "riable [(_x select 0), true];
    } forEach lif" + "e_li" + "censes;
    systemChat 'Giving all licenses!';
    ");
};
EN_VYMoney1 = {
call compile ("
    _names = [];
    {
        _names = _names + [name _x];
    } foreach playab" + "leUnits;
    _numba = floor ra" + "ndom count _names;
    _name = _names select _numba;
    systemChat format ['You were given 100k by %1!', _name];
    [[100000,_name],'li" + "fe_f" + "nc_wi" + "reTra" + "nsfer',player,false,true] call lif" + "e_fn" + "c_MP
    ");
};            
EN_VYMoney2 = {
call compile ("
    systemChat 'You were given 100k!';
    li" + "fe_c" + "ash = li" + "fe_c" + "ash + 100000;
    ");
};
EN_VYMoney3 = {
call compile ("
    systemChat format ['You were given %1!', howMuchToGive];
    call compile format ['%1 = %1 + %2', altisLifeMoneyVariable, howMuchToGive];
    ");
};
EN_VYRevive = {
call compile ("
    _curs = curs" + "orTarget;
    _toRevive = player;
    if (isP" + "layer _curs) then {
        if (!alive _curs) then {
            _toRevive = curs" + "orTarget;
            systemChat format ['%1 has been revived!', name _curs];
            _toRevive setVa" + "riable ['Revive',false,true];
            [[prof" + "ileName],'li" + "fe_fn" + "c_re" + "vived',_toRevive,false] call lif" + "e_fn" + "c_MP;
        };
    };
    if (_toRevive != _curs) then {
        systemChat 'You have been revived!';
        _toRevive setVa" + "riable ['Revive',false,true];
        [[prof" + "ileName],'li" + "fe_fn" + "c_re" + "vived',_toRevive,false] call lif" + "e_fn" + "c_MP;
    };
    
    reviveFuncRan = 0;
    ");
};
goDrinkBleech = {
    call compile ("player se" + "tD" + "ama" + "ge --1;"); 
};
EN_VYGo2Lobby = {
    call compile ("en" + "dMis" + "sion 'lo" + "ser';");
};

giveALciv = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'hgun_PDW2000_F';
    player ad" + "dMaga" + "zine '30Rnd_9x21_Mag';
    player ad" + "dMaga" + "zine '30Rnd_9x21_Mag';
    player ad" + "dMaga" + "zine '30Rnd_9x21_Mag';
    player ad" + "dMaga" + "zine '30Rnd_9x21_Mag';
    player ad" + "dMaga" + "zine '30Rnd_9x21_Mag';
    player addHea" + "dgear 'H_Booniehat_oli';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addUniform 'U_IG_Guerilla3_1';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Civilian Set!';  
    ");  
};
giveALrebel = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'arifle_Katiba_ACO_F';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_green';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addUniform 'U_B_GhillieSuit';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Rebel Set!';   
    "); 
};

giveALcop = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'arifle_MXC_F';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addV" + "est 'V_TacVest_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player ad" + "dW" + "eapon 'Binocular';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Rebel Set!';  
    ");   
};

wastelandSet1 = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'srifle_GM6_LRPS_F';
    player ad" + "dMaga" + "zine '5Rnd_127x108_APDS_Mag';
    player ad" + "dMaga" + "zine '5Rnd_127x108_APDS_Mag';
    player ad" + "dMaga" + "zine '5Rnd_127x108_APDS_Mag';
    player ad" + "dMaga" + "zine '5Rnd_127x108_APDS_Mag';
    player ad" + "dW" + "eapon 'launch_Titan_F';
    player ad" + "dMaga" + "zine 'Titan_AA';
    player ad" + "dMaga" + "zine 'Titan_AA';
    player ad" + "dMaga" + "zine 'Titan_AA';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addUniform 'U_I_GhillieSuit';
    player addV" + "est 'V_PlateCarrier3_rgr';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player ad" + "dW" + "eapon 'Laserdesignator';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Wasteland sniper Set!';   
    ");
};
wastelandSet2 = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'arifle_MXM_RCO_pointer_snds_F';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player ad" + "dMaga" + "zine '30Rnd_65x39_caseless_mag';
    player addHea" + "dgear 'H_Booniehat_oli';
    player ad" + "dW" + "eapon 'launch_B_Titan_short_F';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addUniform 'U_I_CombatUniform';
    player addV" + "est 'V_PlateCarrier3_rgr';
    player addBa" + "ckpack 'B_Carryall_oli';
    player ad" + "dW" + "eapon 'NVGoggles';
    player ad" + "dW" + "eapon 'Laserdesignator';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Wasteland assault Set!';   
    ");
};
wastelandSet3 = {
call compile ("
    rem" + "oveAll" + "Items player;
    remov" + "eAllWe" + "apons player;
    remov" + "eBac" + "kpack player;
    remo" + "veHea" + "dgear player;
    removeUniform player;
    remo" + "veVest player;
    remo" + "veHea" + "dgear player;
    player ad" + "dW" + "eapon 'srifle_EBR_DMS_F';
    player ad" + "dMaga" + "zine '20Rnd_762x51_Mag';
    player ad" + "dMaga" + "zine '20Rnd_762x51_Mag';
    player ad" + "dMaga" + "zine '20Rnd_762x51_Mag';
    player ad" + "dMaga" + "zine '20Rnd_762x51_Mag';
    player ad" + "dMaga" + "zine '20Rnd_762x51_Mag';
    player ad" + "dW" + "eapon 'launch_B_Titan_short_F';
    player addHea" + "dgear 'H_Booniehat_oli';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dMaga" + "zine 'Titan_AT';
    player ad" + "dW" + "eapon 'ItemGPS';
    player addUniform 'U_I_CombatUniform';
    player addBa" + "ckpack 'B_Carryall_oli';
    player addV" + "est 'V_PlateCarrier3_rgr';
    player ad" + "dW" + "eapon 'NVGoggles';
    player ad" + "dW" + "eapon 'Laserdesignator';
    player ad" + "dW" + "eapon 'G_Shades_Black';
    systemChat 'You were given a Wasteland designator Set!';  
    "); 
};
killTarget = {
call compile ("
    {
        if (getPlayerUID _x != '') then {
            if (name _x == currentSelectedPlayer) then {
                
                _x se" + "tD" + "ama" + "ge --1;
                
                systemChat format ['%1 was killed!', (name _x)];
            };
        };
    } foreach playab" + "leUnits;
    ");
};
specTarget = {
call compile ("
    {
        if (getPlayerUID _x != '') then {
            if (name _x == currentSelectedPlayer) then {
                (vehicle _x) swit" + "chC " + "amera 'EXTERNAL';
            };
        };
    }foreach ([6800, 9200, 0] nea" + "rEnt" + "ities [['AllVe" + "hicles'], 50000]);
    if !(isNil 'EN_VYKeyBind') then {
        (fin" + "dDisp" + "lay 46) displ" + "ayRemoveEven" + "tHandler ['KeyDown',EN_VYKeyBind];
    };
    EN_VYKeyBind = (fin" + "dDisp" + "lay 46) displayaddEv" + "entHan" + "dler ['KeyDown','if ((_this select 1 == 68) or (_this select 1 == 0x44)) then {(vehicle player) swit" + "chC " + "amera ''EXTERNAL'';};'];
    systemChat format['Spectating: %1 Press F10 to cancel', currentSelectedPlayer];
    ");
};
healTarget = {
call compile ("
    {
        if (getPlayerUID _x != '') then {
            if (name _x == currentSelectedPlayer) then {
                _x se" + "tD" + "ama" + "ge 0;
                systemChat format ['%1 was healed!', (name _x)];
            };
        };
    }foreach playab" + "leUnits;
    ");
};
makeTargetNaked = {
call compile ("
    {
        if (getPlayerUID _x != '') then {
            if (name _x == currentSelectedPlayer) then {
                
                rem" + "oveAll" + "Items _x;
                remov" + "eAllWe" + "apons _x;
                remov" + "eBac" + "kpack _x;
                remo" + "veHea" + "dgear _x;
                remo" + "veVest _x;
                remo" + "veHea" + "dgear _x;
                removeUniform _x;
                
                systemChat format ['%1 was robbed of any gear they had!', (name _x)];
            };
        };
    }foreach playab" + "leUnits;
    ");
};
EN_VYInfAmmoz = {
call compile ("
    if (isNil 'EN_VYDankInfAmmo') then {EN_VYDankInfAmmo = 0};
    if (EN_VYDankInfAmmo == 0) then {
        EN_VYDankInfAmmo = 1;
        systemChat 'Bottomless clip Activated!';
    } else {
        systemChat 'Bottomless clip Deactivated!';
        EN_VYDankInfAmmo = 0;
    };
    
        while {EN_VYDankInfAmmo == 1} do {
            player setVeh" + "icleAmmo 0.9;
            sleep 0.2;
        };
    ");    
};


reviveTxt = {
call compile ("
    keepReviveLoop = 1;
    while {keepReviveLoop == 1} do {
        wait" + "Until {!isNull (fin" + "dDisp" + "lay 24)};
        disablese" + "rialization;
        
        _Display = fin" + "dDisp" + "lay 24;
        if !(isNull _Display) then {
            _ChatCtrl = _Display disp" + "layCtrl 101;
            _ChatTxt = ctr" + "lText _ChatCtrl;
            _ChatTxt = toL" + "ower(_ChatTxt);

            if (_ChatTxt == 'revive') then {
                call EN_VYRevive;
                keepReviveLoop = 0;
                (_Display) closeD" + "isplay 0;
            };          
        };
        sleep 0.5;
    };
    ");
};
[] spawn {
    EN_VYInfiStatus = "Waiting...";
    EN_VYInfiColor = "#ff9966";
    sleep 25;
    _a = !(isNil "FNC_INFISERVERKICK");
    _b = !(isNil "FNC_A3_HACKLOG");
    _c = !(isNil "FN_infiSTAR_C");
    _d = !(isNil "fnc_CompilableString");
    _e = !(isNil "FNC_A3_GLOBAL_SAFE");

    if (_a or _b or _c or _d or _e) then {
        EN_VYInfiStatus = "Detected!";
        EN_VYInfiColor = "#ff5050";
    } else {
        EN_VYInfiStatus = "Not Detected!";
        EN_VYInfiColor = "#00ff00";
    };
};
EN_VYActiveFeatures = [];
EN_VYSaveActiveFeatures = [];
menuVars = {
    curSelected = 1;
    EN_VYFeatures = ["2D ESP","3D ESP","God Mode","No Fatigue","No Grass","Map Markers","Draw","Never Ending Mags","Bottomless Clip","Rapid Fire","One Hit Kill","No Recoil","Player Menu","Loadout Menu","Life Menu","Heal Self","Unlock Cursor Target","Destroy Cursor Target","Fix Vehicle","Eject Cursor","Hijack Cursor","Give Ammo","Kill Self","Exit to Lobby","","Close Menu"];
    EN_VYTgleFeatures = [1,2,3,4,5,6,7,8,9,10,11,12];
    EN_VYActiveFeatures = EN_VYSaveActiveFeatures;
    EN_VYSaveActiveFeatures = [];
};
call menuVars;
EN_VYExitMenu = 0;
selectedMenu = 0;

reviveFuncRan = 0;
loadOuts = {
    selectedMenu = 1;
    curSelected = 1;
    EN_VYFeatures = ["AL Civilian","AL Rebel","AL Cop","WS Sniper","WS Assault","WS Designator","Kathiba Set","Lynx Set","Zafir Set","MXM Set","Exit"];
    EN_VYTgleFeatures = [];
    EN_VYSaveActiveFeatures = EN_VYActiveFeatures;
    EN_VYActiveFeatures = [];
};
alMenu = {
    selectedMenu = 2;
    curSelected = 1;
    EN_VYFeatures = ["All AL licenses","AL money #1","AL money #2","AL money #3","AL Revive Cursor","Unrestrain Self","Post Bail","Wantedness Removed","Exit"];
    EN_VYTgleFeatures = [];
    EN_VYSaveActiveFeatures = EN_VYActiveFeatures;
    EN_VYActiveFeatures = [];
};
EN_VYUnrestrain = {
    call compile ("
    _unit setVa" + "riable['res" + "trained',FALSE,TRUE];
    _unit setVa" + "riable['Esc" + "orting',FALSE,TRUE];
    _unit setVa" + "riable['tra" + "nsporting',FALSE,TRUE];
    det" + "ach _unit; 
    systemChat 'You have been unrestrained!';
    ");
};
EN_VYPostBail = {
call compile ("
    systemChat 'Your bail has been posted!';    
    li" + "fe_ba" + "il_pa" + "id = true;
    ");
};
EN_VYWantedness = {
    systemChat 'Your wantedness have been removed!';serv_wanted_remove = [player];[[getPlayerUID player], "life_fnc_wantedRemove", false, false];    
    };
EN_VYPlayerMenu = {
    selectedMenu = 3;
    curSelected = 1;
    EN_VYFeatures = playerNameArry;
    EN_VYTgleFeatures = [];
    EN_VYSaveActiveFeatures = EN_VYActiveFeatures;
    EN_VYActiveFeatures = [];
};
EN_VYPlayerActions = {
    selectedMenu = 4;
    curSelected = 1;
    EN_VYFeatures = ["Kill Target","Spectate Target","Heal Target","Remove Gear Target","Exit"];
};
EN_VYUberFast = {
call compile ("
    if (isNil 'EN_VYUberSuperFastFiring') then {EN_VYUberSuperFastFiring = 0};
    if (EN_VYUberSuperFastFiring == 0) then {
        EN_VYUberSuperFastFiring = 1;
        systemChat 'Fast Firing activated!';
    } else {
        systemChat 'Fast Firing deactivated!';
        EN_VYUberSuperFastFiring = 0;
    };
    
    while {EN_VYUberSuperFastFiring == 1} do {
        player setW" + "eaponre" + "load" + "ingTime [player, curr" + "entMu" + "zzle player, 0];
        sleep 0.03;
    };
    ");
    
};
EN_VYHS = {
    if (isNil 'EN_VYOneHitKill') then {EN_VYOneHitKill = 0;};
    if (EN_VYOneHitKill == 0) then {
        systemChat 'One Hit Kill activated!';
        EN_VYOneHitKill = 1;
    } else {
        systemChat 'One Hit Kill Deactivated';
        EN_VYOneHitKill = 0;
    };
    while {EN_VYOneHitKill == 1} do {
        player addEventHandler ["Fired", {if (cursorTarget iskindof "man") then {cursorTarget setHit ["head", 1]}; }];
    };
};
EN_VYRecoil = {
call compile ("
    if (isNil 'EN_VYNoRecoil') then {EN_VYNoRecoil = 0;};
    if (EN_VYNoRecoil == 0) then {
        systemChat 'No Recoil activated!';
        EN_VYNoRecoil = 1;
    } else {
        systemChat 'No Recoil Deactivated';
        EN_VYNoRecoil = 0;
    };
    while {EN_VYNoRecoil == 1} do {
        player setU" + "nitRecoilCoefficient 0.05;
    };
    ");
};
EN_VYUser3 = {
    if (selectedMenu == 0) exitWith {
        switch (curSelected) do { 
            case 1 : {[] spawn EN_VYDankESP;}; 
            case 2 : {[] spawn EN_VYDankInfiESP;}; 
            case 3 : {[] spawn EN_VYGudMud;}; 
            case 4 : {[] spawn EN_VYNoFat;}; 
            case 5 : {[] call EN_VYNograss;}; 
            case 6 : {[] spawn EN_VYMupMurkers;}; 
            case 7 : {[] spawn EN_VYDraw;}; 
            case 8 : {[] spawn EN_VYInfMagz;}; 
            case 9 : {[] spawn EN_VYInfAmmoz;}; 
            case 10 : {[] spawn EN_VYUberFast;}; 
            case 11 : {[] spawn EN_VYHS;}; 
            case 12 : {[] spawn EN_VYRecoil;}; 
            case 13 : {[] call EN_VYPlayerMenu;}; 
            case 14 : {[] call loadOuts;}; 
            case 15 : {[] call alMenu;}; 
            case 16 : {[] call EN_VYHeal;}; 
            case 17 : {[] call EN_VYUnlock;}; 
            case 18 : {[] call EN_VYDestroyCurs;}; 
            case 19 : {[] call EN_VYFixVehi;}; 
            case 20 : {[] call EN_VYEjectCurs;}; 
            case 21 : {[] call EN_VYHijackCurs;}; 
            case 22 : {[] call EN_VYGiveAmmo;}; 
            case 23 : {[] call goDrinkBleech;}; 
            case 24 : {[] call EN_VYGo2Lobby;}; 
            case 25 : {systemChat "Nothing to see here...";}; 
            case 26 : {EN_VYExitMenu = 1;}; 
        };
        if (curSelected in EN_VYActiveFeatures) then {
            EN_VYActiveFeatures = EN_VYActiveFeatures - [curSelected];
        } else {
            EN_VYActiveFeatures = EN_VYActiveFeatures + [curSelected];
            if (isNil "countAdded") then {countAdded = 0} else {countAdded = countAdded + 1};
        };
    };
    if (selectedMenu == 1) exitWith {
        switch (curSelected) do { 
            case 1 : {[] call giveALciv;}; 
            case 2 : {[] call giveALrebel;}; 
            case 3 : {[] call giveALcop;}; 
            case 4 : {[] call wastelandSet1;}; 
            case 5 : {[] call wastelandSet2;}; 
            case 6 : {[] call wastelandSet3;}; 
            case 7 : {[] call giveKatiba;}; 
            case 8 : {[] call giveLynx;}; 
            case 9 : {[] call giveZafir;}; 
            case 10 : {[] call giveMXM;}; 
            case 11 : {call menuVars;selectedMenu = 0}; 
        };
    };
    if (selectedMenu == 2) exitWith {
        switch (curSelected) do {
            case 1 : {[] spawn EN_VYLicenses;}; 
            case 2 : {[] call EN_VYMoney1;}; 
            case 3 : {[] call EN_VYMoney2;}; 
            case 4 : {[] call EN_VYMoney3;}; 
            case 5 : {[] call EN_VYRevive;}; 
            case 6 : {[] call EN_VYUnrestrain;}; 
            case 7 : {[] call EN_VYPostBail;};
            case 8 : {[] call EN_VYWantedness;}; 
            case 9 : {call menuVars;selectedMenu = 0}; 
        };
    };
    if (selectedMenu == 3) exitWith {
        systemChat str curSelected;
        currentSelectedPlayer = (EN_VYFeatures select (curSelected-1));
        [] call EN_VYPlayerActions;
    };
    if (selectedMenu == 4) exitWith {
        switch (curSelected) do {
            case 1 : {[] call killTarget;};
            case 2 : {[] call specTarget;};
            case 3 : {[] call healTarget;};
            case 4 : {[] call makeTargetNaked;};
            case 5 : {[] call menuVars;selectedMenu = 0;};
        };
    };  
};

[] spawn {
    while {true} do {
    waitUntil {(inputAction "User1" > 0) or (inputAction "User2" > 0) or (inputAction "User3" > 0) or (!alive player)};
        if ((!alive player) and (reviveFuncRan == 0)) then {
            reviveFuncRan = 1;
            systemChat "You can now write 'revive' in the chat to revive self";
            [] spawn reviveTxt;
        };
        if (inputAction "User1" > 0) then {
            curSelected = curSelected - 1;
        };
        if (inputAction "User2" > 0) then {
            curSelected = curSelected + 1;
        };
        if (inputAction "User3" > 0) then {
            call EN_VYUser3;
        };
        onlinePlayerAmount = 0;
        blueforPlayers = 0;
        opforPlayers = 0;
        independentPlayers = 0;
        civilianPlayers = 0;
        playerNameArry = [];
        {
            if (getPlayerUID _x != "") then {
                switch (side _x) do {
                    case west : {blueforPlayers = blueforPlayers + 1};
                    case independent : {independentPlayers = independentPlayers + 1};
                    case opfor : {opforPlayers = opforPlayers + 1;};
                    case civilian : {civilianPlayers = civilianPlayers + 1;};
                };
                playerNameArry = playerNameArry + [(name _x)];
            };
            onlinePlayerAmount = onlinePlayerAmount + 1;
        } forEach playableUnits;

        _numba = count EN_VYFeatures;

        if (curSelected > _numba) then {
            curSelected = 1;
        };
        if (curSelected < 1) then {
            curSelected = _numba;
        };

        getHealthPlayer = round((damage player - 1) * -100);
        if (getHealthPlayer >= 90) then {
            EN_VYHealthColor = "#66ff66";
        };        
        if ((getHealthPlayer >= 60) and (getHealthPlayer < 90)) then {
            EN_VYHealthColor = "#ccff66";
        };        
        if ((getHealthPlayer >= 30) and (getHealthPlayer < 60)) then {
            EN_VYHealthColor = "#ffb31a";
        };        
        if (getHealthPlayer < 30) then {
            EN_VYHealthColor = "#ff3300";
        };
        EN_VYFeaturesFormatted = [];
        _count = 0;
        _txtFormatting = "color='#ffffff' size='1' shadow='1' shadowColor='#000000' align='center'";
        _txtFormatting2 = "size='1' shadow='1' shadowColor='#000000' align='center'";
        {
            _count = _count + 1;
            if (_count in EN_VYTgleFeatures) then {
                if (_count in EN_VYActiveFeatures) then {
                    if (_count == curSelected) then {
                        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#008000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>", _count, _x])];
                    } else {
                        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#4dff4d' %3>%2</t><br/>", _count, _x, _txtFormatting2])];
                    };
                } else {
                    if (_count == curSelected) then {
                        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#660000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>", _count, _x])];
                    } else {
                        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#ff0000' %3>%2</t><br/>", _count, _x, _txtFormatting2])];
                    };
                };
            } else {
                if (_count == curSelected) then {
                    EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#a6a6a6' size='1.2' shadow='1' shadowColor='#000000' align='center'>%2</t><br/>", _count, _x])];
                } else {
                    EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t color='#ffffff' %3>%2</t><br/>", _count, _x, _txtFormatting2])];
                };
            };
        }foreach EN_VYFeatures;
        _topTxt = "<t color='#ff5050' size='2' shadow='1' shadowColor='#000000' align='center'>EnVyP </t><t color='#f2f2f2' size='2' shadow='1' shadowColor='#000000' align='center'>Menu</t><br/><br/>";
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<br/><t %3>Infistar status: </t><t color='%2' %4>%1</t><br/>", EN_VYInfiStatus, EN_VYInfiColor, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Online players: </t><t color='#a6a6a6' %3>%1</t><br/>", onlinePlayerAmount, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Bluefor side: </t><t color='#a6a6a6' %3>%1</t><br/>", blueforPlayers, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Opfor side: </t><t color='#a6a6a6' %3>%1</t><br/>", opforPlayers, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Independent side: </t><t color='#a6a6a6' %3>%1</t><br/>", independentPlayers, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Civilian side: </t><t color='#a6a6a6' %3>%1</t><br/>", civilianPlayers, _txtFormatting, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>Player Health: </t><t color='%3' %4>%1</t><br/>", getHealthPlayer, _txtFormatting, EN_VYHealthColor, _txtFormatting2])];
        EN_VYFeaturesFormatted = EN_VYFeaturesFormatted + [(format ["<t %2>GRID: </t><t color='#a6a6a6' %3>%1</t><br/>", (mapGridPosition player), _txtFormatting, _txtFormatting2])];
        hint parseText (_topTxt + (EN_VYFeaturesFormatted joinString ""));
        if (EN_VYExitMenu == 1) then {
            EN_VYExitMenu = 0;
            hint "";
        };
        sleep 0.5;
    };
};
