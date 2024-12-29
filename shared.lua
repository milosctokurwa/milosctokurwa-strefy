Config = {}
Config.Strefy = {
    -- ["Lotnia"] = {
    --     Coordy = { x = 1731.5195, y = 3308.7317, z = 41.2235 },

    --     Wynagrodzenie = math.random(150000, 300000),

    --     Coordy_Zone = 85.0,
        
    --     Blip_Typ = 433,
    --     Blip_Kolor = 62,
    --     Blip_Text = "Strefa - Lotnia",

    --     Bron_Dluga = false,
    --     Bron_Biala = true,
    --     Lootowanie = false,

    --     Cooldown = 0,
    --     Status = "Nieprzejęte",
    --     przejmowanieCzas = 0,
    --     przejetePrzez = nil
    -- },
    -- ["Rockford"] = {
    --     Coordy = { x = -929.7510, y = 175.2241, z = 66.3487 },

    --     Wynagrodzenie = math.random(150000, 300000),

    --     Coordy_Zone = 65.0,
        
    --     Blip_Typ = 433,
    --     Blip_Kolor = 62,
    --     Blip_Text = "Strefa - Rockford",

    --     itemy = {
    --         { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
    --     },

    --     Bron_Dluga = false,
    --     Bron_Biala = true,
    --     Lootowanie = false,

    --     Cooldown = 0,
    --     Status = "Nieprzejęte",
    --     przejmowanieCzas = 0,
    --     przejetePrzez = nil
    -- },
    ["Budowa"] = { -- yellow
        Coordy = { x = -450.8068, y = -912.2297, z = 47.9796 },

        Wynagrodzenie = math.random(150000, 300000),

        Coordy_Zone = 90.0,
        
        Blip_Typ = 433,
        Blip_Kolor = 46,
        Blip_Text = "Strefa - Budowa",

        itemy = {
            { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
        },

        Bron_Dluga = true,
        Bron_Biala = true,
        Lootowanie = false,

        Cooldown = 0,
        Status = "Nieprzejęte",
        przejmowanieCzas = 0,
        przejetePrzez = nil
    },

    -- ["Redwood"] = { -- green
    -- Coordy = { x =  1015.8292, y = 2370.2273, z = 51.6160 },

    -- Wynagrodzenie = math.random(20000, 40000),

    -- Coordy_Zone = 100.0,
    
    -- Blip_Typ = 433,
    -- Blip_Kolor = 25,
    -- Blip_Text = "Strefa - Redwood",

    -- itemy = {
    --     { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
    --     { nazwaitemu = "pisanka1312pozdro", min = 2, max = 7, szansa = 5 }
    -- },

    -- Bron_Dluga = false,
    -- Bron_Biala = true,
    -- Lootowanie = false,

    -- Cooldown = 0,
    -- Status = "Nieprzejęte",
    -- przejmowanieCzas = 0,
    -- przejetePrzez = nil
    -- },

    -- ["K1"] = { -- green
    -- Coordy = { x =  3816.2915, y = 4460.1104, z = 3.8429 },

    -- Wynagrodzenie = math.random(20000, 40000),

    -- Coordy_Zone = 100.0,
    
    -- Blip_Typ = 433,
    -- Blip_Kolor = 25,
    -- Blip_Text = "Strefa - K1",

    -- itemy = {
    --     { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
    --     { nazwaitemu = "pisanka1312pozdro", min = 2, max = 7, szansa = 5 }
    -- },

    -- Bron_Dluga = false,
    -- Bron_Biala = true,
    -- Lootowanie = false,

    -- Cooldown = 0,
    -- Status = "Nieprzejęte",
    -- przejmowanieCzas = 0,
    -- przejetePrzez = nil
    -- },

    ["Farma"] = { -- yellow
        Coordy = { x = 1903.2605, y = 4922.3892, z = 48.9452 },

        Wynagrodzenie = math.random(150000, 300000),

        Coordy_Zone = 90.0,
        
        Blip_Typ = 433,
        Blip_Kolor = 46,
        Blip_Text = "Strefa - Farma",

        itemy = {
            { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
        },

        Bron_Dluga = true,
        Bron_Biala = true,
        Lootowanie = false,

        Cooldown = 0,
        Status = "Nieprzejęte",
        przejmowanieCzas = 0,
        przejetePrzez = nil
    },

    ["Baza"] = {
        Coordy = { x = -1623.2015, y = 3192.2820, z = 30.1997 },

        Wynagrodzenie = math.random(150000, 300000),

        Coordy_Zone = 125.0,
        
        Blip_Typ = 433,
        Blip_Kolor = 46,
        Blip_Text = "Strefa - Baza",

        itemy = {
            { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
            { nazwaitemu = "pistol_ammo", min = 100, max = 150, szansa = 50 },
            { nazwaitemu = "meth_pooch", min = 25, max = 50, szansa = 5 },
        },

        Bron_Dluga = true,
        Bron_Biala = true,
        Lootowanie = false,

        Cooldown = 0,
        Status = "Nieprzejęte",
        przejmowanieCzas = 0,
        przejetePrzez = nil
    },
    ["LaFuentaBlancka"] = { -- Red
        Coordy = { x = 1453.7021, y = 1111.8031, z = 114.3339 },

        Wynagrodzenie = math.random(30000, 55000),

        Coordy_Zone = 125.0,
        
        Blip_Typ = 433,
        Blip_Kolor = 1,
        Blip_Text = "Strefa - La Fuenta",

        itemy = {
            { nazwaitemu = "zlom", min = 2, max = 7, szansa = 100 },
            { nazwaitemu = "smg_ammo", min = 50, max = 75, szansa = 25 },
            { nazwaitemu = "meth_pooch", min = 25, max = 50, szansa = 10 },
            { nazwaitemu = "bojowka_vandal", min = 1, max = 1, szansa = 1 },
        },

        Bron_Dluga = true,
        Bron_Biala = true,
        Lootowanie = false,

        Cooldown = 0,
        Status = "Nieprzejęte",
        przejmowanieCzas = 0,
        przejetePrzez = nil
    },

    ["doki"] = { -- Red
    Coordy = { x = -162.53926086426, y = -2710.4443359375, z = 6.011474609375 },

    Wynagrodzenie = math.random(30000, 55000),

    Coordy_Zone = 425.0,
    
    cwel = false,

    Blip_Typ = 305,
    Blip_Kolor = 3,
    Blip_Text = "Strefa Inicjacji - Doki",

    Bron_Dluga = false,
    Bron_Biala = true,
    Lootowanie = true,

    Cooldown = 0,
    Status = "Nieprzejęte",
    przejmowanieCzas = 0,
    przejetePrzez = nil
},
}

Config.BronieBiale = {
    GetHashKey("weapon_dagger"),
    GetHashKey("weapon_bat"),
	GetHashKey("weapon_bottle"),
	GetHashKey("weapon_crowbar"),
	GetHashKey("weapon_flashlight"),
	GetHashKey("weapon_golfclub"),
	GetHashKey("weapon_hammer"),
	GetHashKey("weapon_hatchet"),
	GetHashKey("weapon_knuckle"),
	GetHashKey("weapon_knife"),
	GetHashKey("weapon_machete"),
	GetHashKey("weapon_switchblade"),
	GetHashKey("weapon_nightstick"),
	GetHashKey("weapon_wrench"),
	GetHashKey("weapon_battleaxe"),
	GetHashKey("weapon_poolcue"),
	GetHashKey("weapon_stone_hatchet"),
	GetHashKey("weapon_candycane"),
}
Config.BronieDlugie = {
    GetHashKey("weapon_appistol"),
    GetHashKey("weapon_microsmg"),
	GetHashKey("weapon_smg"),
	GetHashKey("weapon_smg_mk2"),
	GetHashKey("weapon_assaultsmg"),
	GetHashKey("weapon_combatpdw"),
	GetHashKey("weapon_machinepistol"),
	GetHashKey("weapon_minismg"),
	GetHashKey("weapon_raycarbine"),
	GetHashKey("weapon_tecpistol"),
	GetHashKey("weapon_pumpshotgun"),
	GetHashKey("weapon_pumpshotgun_mk2"),
	GetHashKey("weapon_sawnoffshotgun"),
	GetHashKey("weapon_assaultshotgun"),
	GetHashKey("weapon_bullpupshotgun"),
	GetHashKey("weapon_musket"),
	GetHashKey("weapon_heavyshotgun"),
	GetHashKey("weapon_dbshotgun"),
	GetHashKey("weapon_autoshotgun"),
	GetHashKey("weapon_combatshotgun"),
	GetHashKey("weapon_assaultrifle"),
	GetHashKey("weapon_assaultrifle_mk2"),
	GetHashKey("weapon_carbinerifle"),
	GetHashKey("weapon_carbinerifle_mk2"),
	GetHashKey("weapon_advancedrifle"),
	GetHashKey("weapon_specialcarbine"),
	GetHashKey("weapon_specialcarbine_mk2"),
	GetHashKey("weapon_bullpuprifle"),
	GetHashKey("weapon_bullpuprifle_mk2"),
	GetHashKey("weapon_compactrifle"),
	GetHashKey("weapon_militaryrifle"),
	GetHashKey("weapon_heavyrifle"),
	GetHashKey("weapon_tacticalrifle"),
	GetHashKey("weapon_mg"),
	GetHashKey("weapon_combatmg"),
	GetHashKey("weapon_combatmg_mk2"),
	GetHashKey("weapon_gusenberg"),
	GetHashKey("weapon_sniperrifle"),
	GetHashKey("weapon_heavysniper"),
	GetHashKey("weapon_heavysniper_mk2"),
	GetHashKey("weapon_marksmanrifle"),
	GetHashKey("weapon_marksmanrifle_mk2"),
	GetHashKey("weapon_precisionrifle"),
	GetHashKey("weapon_rpg"),
	GetHashKey("weapon_grenadelauncher"),
	GetHashKey("weapon_grenadelauncher_smoke"),
	GetHashKey("weapon_minigun"),
	GetHashKey("weapon_firework"),
	GetHashKey("weapon_railgun"),
	GetHashKey("weapon_hominglauncher"),
	GetHashKey("weapon_compactlauncher"),
	GetHashKey("weapon_rayminigun"),
	GetHashKey("weapon_emplauncher"),
	GetHashKey("weapon_railgunxm3"),
    GetHashKey("WEAPON_GLITCHPOPVANDAL"),
	GetHashKey("WEAPON_UMP45"),
    GetHashKey("WEAPON_ANIMEM4"),
}