Config = {}

Config.Cooldown = 60 -- In minutes // Cooldown for the active patrol to respawn after it's been spawned
Config.DeathPercent = 75 -- Percentage of patrol members that can die before the patrol is removed // 75 = 75% of the patrol members can die before the patrol is removed
Config.ResetsOnDeath = false -- Set true if you want the patrol to respawn after it's been removed due to deaths rather than waiting for the cooldown

--------------------------- ADD YOUR RELEVANT EMS JOBS HERE // DO NOT TOUCH THE FIRST RESPONDER SECTION ---------------------------
local QBCore = exports['qb-core']:GetCoreObject()
Config.AuthorizedJobs = 
{
    LEO = { -- this is for job checks which should only return true for police officers
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true}, -- If you want to add more jobs, add them here // DO NOT REMOVE ANY EVEN IF YOU DO NOT USE THEM
        Types = {['police'] = true, ['leo'] = true},
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
        end
    },
    EMS = { -- this if for job checks which should only return true for ems workers
        Jobs = {['ambulance'] = true, ['fire'] = true}, -- If you want to add more jobs, add them here // DO NOT REMOVE ANY EVEN IF YOU DO NOT USE THEM
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobtype] then return true end
        end
    },
    FirstResponder = { -- do not touch, this is a combined job checking function for emergency services (police and ems)
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Check(jobtype, job) or Config.AuthorizedJobs.EMS.Check(jobtype, job) then return true end            
        end
    }
}
------------------------------------------------------------------------------------------------------------------------------

Config.Locations = {
    [1] = { -- Grapeseed Weed Farm
        name = 'Grapeseed_Weed_Farm', -- Name of the location // Make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.)
        activePatrols = true, -- Set true if you want patrols for this location
        activeGuards = true, -- Set true if you want guards for this location
        activeVehicles = false, -- Set true if you want vehicles for this location
        models = { -- Models to use for the patrols (peds are randomly selected) // Vehicles are selected in order, i.e. the first vehicle patrols the first veh patrol route.
            peds = { -- https://docs.fivem.net/docs/game-references/ped-models/
                `a_m_m_hillbilly_01`,
                `a_m_m_hillbilly_02`,
                `u_m_o_taphillbilly`,
                `ig_old_man2`,
            },
        },
        stopTime = {5000, 7500}, -- Time to wait at each patrol point (in milliseconds) // Randomly selected between the two numbers
        patrols = { -- Patrol points
            ped = { -- Ped patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = {vector3(2216.3, 5625.51, 55.22), vector3(2204.96, 5627.15, 55.69)}, -- First point in patrol, where [1][1] is the position and [1][2] is where the ped will be facing
                    [2] = {vector3(2197.29, 5613.01, 53.67), vector3(2204.14, 5621.54, 54.61)},
                    [3] = {vector3(2198.69, 5585.95, 53.68), vector3(2205.28, 5585.34, 53.85)},
                    [4] = {vector3(2202.85, 5562.52, 53.86), vector3(2203.6, 5571.72, 53.69)},
                    [5] = {vector3(2237.88, 5570.5, 53.8), vector3(2241.92, 5568.27, 53.53)},
                    [6] = {vector3(2238.96, 5603.79, 54.36), vector3(2241.98, 5603.75, 54.18)}
                },
            },
            guard = { -- Guards // Static peds, Coords are Vector4 and not Vector3, the 4th value is the heading
                [1] = vector4(2220.89, 5614.42, 54.72, 105.12),
                [2] = vector4(2193.88, 5594.31, 53.76, 349.15),
            },
        },
        pedSettings = {
            blips = true, -- Show blips for the peds
            health = 250, -- Health of the ped // 200 is default civillian health // 350 means things get a bit more interesting
            armour = 0, -- Armour of the ped // 0-100
            footsteps = 'quiet', -- Footstep sounds // 'loud' or 'quiet' or false
            relationship = 4, -- Relationship group of the ped // 0-5 // 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
            weapons = { -- Weapon to give the ped // Set to false to not give a weapon // https://wiki.rage.mp/index.php?title=Weapons
                `WEAPON_BAT`,
                `WEAPON_BOTTLE`,
                `WEAPON_UNARMED`, -- By having this hash, it adds a chance for the ped to not have a weapon
            }, 
            combat = {
                ability = 80, -- Combat ability of the ped // 50-100
                accuracy = 60, -- Accuracy of the ped // 0-100
                alertness = 3, -- Alertness of the ped // 0-3 (0 = calm, 3 = paranoid)
                range = 2, -- Combat range of the ped // 0-2 (0 = near, 2 = far)
                movement = 2, -- Combat movement of the ped // 0-3 (0 = stand, 1 = defensive, 2 = offensive, 3 = suicidal)
            },
            pathing = { -- How the ped will path during combat
                avoidFire = true, -- Whether the ped avoids fire // true or false
                climbOver = true, -- Whether the ped can climb over objects // true or false
                useLadders = true, -- Whether the ped can use ladders // true or false
                avoidWater = true, -- Whether the ped avoids water // true or false
                dropFromHeight = true, --  Whether the ped can drop from height // true or false
            },
        },
    },
    [2] = { -- Power Station
        name = 'Power_Station', -- Name of the location // Make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.)
        activePatrols = true, -- Set true if you want patrols for this location
        activeGuards = false, -- Set true if you want guards for this location
        activeVehicles = true, -- Set true if you want vehicles for this location
        models = { -- Models to use for the patrols (peds are randomly selected) // Vehicles are selected in order, i.e. the first vehicle patrols the first veh patrol route.
            peds = { -- https://docs.fivem.net/docs/game-references/ped-models/
                `s_m_m_armoured_01`,
                `s_m_m_armoured_02`,
            },
            vehs = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
                `dilettante2`,
            },
        },
        stopTime = {10000, 15000}, -- Time to wait at each patrol point (in milliseconds) // Randomly selected between the two numbers
        patrols = { -- Patrol points
            ped = { -- Ped patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = {vector3(2793.86, 1482.13, 24.55), vector3(2795.27, 1481.56, 24.56)}, -- First point in patrol, where [1][1] is the position and [1][2] is where the ped will be facing
                    [2] = {vector3(2804.7, 1535.31, 24.52), vector3(2808.57, 1534.36, 24.56)},
                    [3] = {vector3(2868.45, 1518.33, 24.57), vector3(2864.95, 1519.27, 24.57)},
                    [4] = {vector3(2878.81, 1572.01, 24.57), vector3(2876.85, 1571.2, 24.57)},
                    [5] = {vector3(2826.64, 1586.32, 24.56), vector3(2828.16, 1583.92, 24.56)},
                    [6] = {vector3(2804.7, 1535.31, 24.52), vector3(2808.57, 1534.36, 24.56)},
                    [7] = {vector3(2868.45, 1518.33, 24.57), vector3(2864.95, 1519.27, 24.57)},
                    [8] = {vector3(2845.35, 1468.15, 24.56), vector3(2840.53, 1469.21, 24.56)},
                },
            },
            veh = { -- Vehicle patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want 
                [1] = {
                    [1] = vector3(2766.9, 1414.67, 24.54),
                    [2] = vector3(2799.21, 1532.0, 24.54),
                    [3] = vector3(2823.47, 1671.34, 24.71),
                    [4] = vector3(2707.13, 1703.1, 24.68),
                    [5] = vector3(2687.02, 1616.73, 24.58),
                },
            },
        },
        pedSettings = {
            blips = true, -- Show blips for the peds
            health = 350, -- Health of the ped // 200 is default civillian health
            armour = 100, -- Armour of the ped // 0-100
            footsteps = 'loud', -- Footstep sounds // 'loud' or 'quiet' or false
            relationship = 4, -- Relationship group of the ped // 0-5 // 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
            weapons = { -- Weapon to give the ped // Set to false to not give a weapon // https://wiki.rage.mp/index.php?title=Weapons
                `WEAPON_PISTOL`,
                `WEAPON_COMBATPISTOL`,
            }, 
            combat = {
                ability = 100, -- Combat ability of the ped // 50-100
                accuracy = 100, -- Accuracy of the ped // 0-100
                alertness = 3, -- Alertness of the ped // 0-3 (0 = calm, 3 = paranoid)
                range = 2, -- Combat range of the ped // 0-2 (0 = near, 2 = far)
                movement = 2, -- Combat movement of the ped // 0-3 (0 = stand, 1 = defensive, 2 = offensive, 3 = suicidal)
            },
            pathing = { -- How the ped will path during combat
                avoidFire = true, -- Whether the ped avoids fire // true or false
                climbOver = true, -- Whether the ped can climb over objects // true or false
                useLadders = true, -- Whether the ped can use ladders // true or false
                avoidWater = true, -- Whether the ped avoids water // true or false
                dropFromHeight = true, --  Whether the ped can drop from height // true or false
            },
        },
    },
    [3] = { -- Madrazo's Ranch
        name = 'Madrazo_Ranch', -- Name of the location // Make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.)
        activePatrols = true, -- Set true if you want patrols for this location
        activeGuards = false, -- Set true if you want guards for this location
        activeVehicles = false, -- Set true if you want vehicles for this location
        models = { -- Models to use for the patrols (peds are randomly selected) // Vehicles are selected in order, i.e. the first vehicle patrols the first veh patrol route.
            peds = { -- https://docs.fivem.net/docs/game-references/ped-models/
                `g_m_y_mexgang_01`,
                `g_m_y_mexgoon_01`,
                `g_m_y_mexgoon_02`,
                `g_m_y_mexgoon_03`,
            },
        },
        stopTime = {8000, 10000}, -- Time to wait at each patrol point (in milliseconds) // Randomly selected between the two numbers
        patrols = { -- Patrol points
            ped = { -- Ped patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = {vector3(1409.4, 1105.36, 114.29), vector3(1409.38, 1102.53, 114.31)},
                    [2] = {vector3(1394.07, 1084.87, 114.33), vector3(1396.34, 1084.85, 114.33)},
                    [3] = {vector3(1464.37, 1082.8, 114.33), vector3(1464.4, 1079.51, 114.33)},
                    [4] = {vector3(1465.38, 1047.97, 114.33), vector3(1465.45, 1049.97, 114.33)},
                    [5] = {vector3(1490.08, 1047.19, 114.33), vector3(1490.12, 1045.1, 114.33)},
                    [6] = {vector3(1481.31, 1091.8, 114.33), vector3(1481.25, 1095.38, 114.33)},
                    [7] = {vector3(1438.12, 1105.85, 114.12), vector3(1435.82, 1105.91, 114.17)},
                },
                [2] = {
                    [1] = {vector3(1482.78, 1129.85, 114.33), vector3(1481.3, 1129.89, 114.33)},
                    [2] = {vector3(1474.27, 1147.17, 114.33), vector3(1471.74, 1147.11, 114.3)},
                    [3] = {vector3(1442.42, 1147.09, 114.31), vector3(1439.7, 1147.06, 114.33)},
                    [4] = {vector3(1441.13, 1161.9, 114.33), vector3(1443.0, 1161.86, 114.3)},
                    [5] = {vector3(1472.22, 1161.89, 114.25), vector3(1473.4, 1161.92, 114.27)},
                    [6] = {vector3(1473.32, 1175.38, 114.33), vector3(1473.25, 1176.6, 114.33)},
                    [7] = {vector3(1441.13, 1175.51, 114.33), vector3(1439.45, 1175.52, 114.22)},
                    [8] = {vector3(1441.8, 1128.34, 114.32), vector3(1439.89, 1128.13, 114.34)},
                },
            },
        },
        pedSettings = {
            blips = true, -- Show blips for the peds
            health = 300, -- Health of the ped // 200 is default civillian health
            armour = 50, -- Armour of the ped // 0-100
            footsteps = 'loud', -- Footstep sounds // 'loud' or 'quiet' or false
            relationship = 5, -- Relationship group of the ped // 0-5 // 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
            weapons = { -- Weapon to give the ped // Set to false to not give a weapon // https://wiki.rage.mp/index.php?title=Weapons
                `WEAPON_PISTOL`,
                `WEAPON_PUMPSHOTGUN`,
                `WEAPON_UNARMED`,
            }, 
            combat = {
                ability = 100, -- Combat ability of the ped // 50-100
                accuracy = 80, -- Accuracy of the ped // 0-100
                alertness = 3, -- Alertness of the ped // 0-3 (0 = calm, 3 = paranoid)
                range = 2, -- Combat range of the ped // 0-2 (0 = near, 2 = far)
                movement = 2, -- Combat movement of the ped // 0-3 (0 = stand, 1 = defensive, 2 = offensive, 3 = suicidal)
            },
            pathing = { -- How the ped will path during combat
                avoidFire = true, -- Whether the ped avoids fire // true or false
                climbOver = true, -- Whether the ped can climb over objects // true or false
                useLadders = true, -- Whether the ped can use ladders // true or false
                avoidWater = true, -- Whether the ped avoids water // true or false
                dropFromHeight = true, --  Whether the ped can drop from height // true or false
            },
        },
    },
    [4] = { -- Oneill's Ranch
        name = 'Oneill_Ranch', -- Name of the location // Make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.)
        activePatrols = true, -- Set true if you want patrols for this location
        activeGuards = false, -- Set true if you want guards for this location
        activeVehicles = true, -- Set true if you want vehicles for this location
        models = { -- Models to use for the patrols (peds are randomly selected) // Vehicles are selected in order, i.e. the first vehicle patrols the first veh patrol route.
            peds = { -- https://docs.fivem.net/docs/game-references/ped-models/
                `a_m_m_hillbilly_01`,
                `a_m_m_hillbilly_02`,
                `u_m_o_taphillbilly`,
            },
            vehs = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
                `sanchez`,
            },
        },
        stopTime = {5000, 7500}, -- Time to wait at each patrol point (in milliseconds) // Randomly selected between the two numbers
        patrols = { -- Patrol points
            ped = { -- Ped patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = {vector3(2456.36, 4972.92, 51.57), vector3(2456.89, 4972.29, 51.57)}, -- First point in patrol, where [1][1] is the position and [1][2] is where the ped will be facing
                    [2] = {vector3(2451.61, 4985.81, 51.57), vector3(2452.05, 4986.19, 51.57)},
                    [3] = {vector3(2435.64, 4974.07, 51.57), vector3(2434.81, 4974.47, 51.57)},
                    [4] = {vector3(2444.98, 4966.09, 51.57), vector3(2445.34, 4965.7, 51.57)},
                },
                [2] = {
                    [1] = {vector3(2441.53, 4984.72, 46.81), vector3(2441.53, 4983.91, 46.81)},
                    [2] = {vector3(2450.82, 4987.0, 46.81), vector3(2449.48, 4988.97, 46.81)},
                    [3] = {vector3(2461.09, 4996.6, 45.98), vector3(2461.01, 4998.44, 46.13)},
                    [4] = {vector3(2453.43, 4959.68, 45.33), vector3(2454.41, 4958.58, 45.12)},
                },
            },
            veh = {
                [1] = {
                    [1] = vector3(2436.89, 4991.56, 46.01),
                    [2] = vector3(2376.01, 4927.04, 42.42),
                    [3] = vector3(2494.14, 4819.83, 35.42),
                    [4] = vector3(2540.92, 4880.4, 37.57),
                    [5] = vector3(2481.42, 4994.92, 46.2),
                },
            },
        },
        pedSettings = {
            blips = true, -- Show blips for the peds
            health = 250, -- Health of the ped // 200 is default civillian health
            armour = 50, -- Armour of the ped // 0-100
            footsteps = 'quiet', -- Footstep sounds // 'loud' or 'quiet' or false
            relationship = 5, -- Relationship group of the ped // 0-5 // 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
            weapons = { -- Weapon to give the ped // Set to false to not give a weapon // https://wiki.rage.mp/index.php?title=Weapons
                `WEAPON_BAT`,
                `WEAPON_HATCHET`,
                `WEAPON_PUMPSHOTGUN`,
                `WEAPON_UNARMED`,
            }, 
            combat = {
                ability = 80, -- Combat ability of the ped // 50-100
                accuracy = 60, -- Accuracy of the ped // 0-100
                alertness = 3, -- Alertness of the ped // 0-3 (0 = calm, 3 = paranoid)
                range = 2, -- Combat range of the ped // 0-2 (0 = near, 2 = far)
                movement = 3, -- Combat movement of the ped // 0-3 (0 = stand, 1 = defensive, 2 = offensive, 3 = suicidal)
            },
            pathing = { -- How the ped will path during combat
                avoidFire = true, -- Whether the ped avoids fire // true or false
                climbOver = true, -- Whether the ped can climb over objects // true or false
                useLadders = true, -- Whether the ped can use ladders // true or false
                avoidWater = true, -- Whether the ped avoids water // true or false
                dropFromHeight = true, --  Whether the ped can drop from height // true or false
            },
        },
    },
    [5] = { -- Cayo Perico // 1st Town
        name = 'Cayo_Perico_1', -- Name of the location // Make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.)
        activePatrols = true, -- Set true if you want patrols for this location
        activeGuards = true, -- Set true if you want guards for this location
        activeVehicles = true, -- Set true if you want vehicles for this location
        models = { -- Models to use for the patrols (peds are randomly selected) // Vehicles are selected in order, i.e. the first vehicle patrols the first veh patrol route.
            peds = { -- https://docs.fivem.net/docs/game-references/ped-models/
                `g_m_y_mexgoon_01`,
                `g_m_y_pologoon_01`,
                `g_m_y_mexgang_01`,
            },
            vehs = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
                `dune`,
            },
        },
        stopTime = {10000, 15000}, -- Time to wait at each patrol point (in milliseconds) // Randomly selected between the two numbers
        patrols = { -- Patrol points
            ped = { -- Ped patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = {vector3(5048.24, -4595.33, 2.93), vector3(5047.48, -4598.01, 2.93)},
                    [2] = {vector3(5076.69, -4606.03, 2.94), vector3(5075.96, -4609.74, 2.7)},
                    [3] = {vector3(5103.63, -4610.92, 2.42), vector3(5103.14, -4613.7, 2.43)},
                    [4] = {vector3(5146.23, -4623.33, 2.28), vector3(5145.47, -4626.95, 2.43)},
                    [5] = {vector3(5157.5, -4639.53, 2.64), vector3(5157.18, -4640.61, 2.64)},
                    [6] = {vector3(5132.34, -4643.26, 1.41), vector3(5131.85, -4645.13, 1.41)},
                    [7] = {vector3(5116.31, -4638.97, 1.41), vector3(5116.01, -4640.15, 1.41)},
                    [8] = {vector3(5080.77, -4626.92, 2.48), vector3(5078.0, -4625.97, 2.42)},
                },
                [2] = {
                    [1] = {vector3(5093.99, -4655.43, 1.78), vector3(5095.76, -4655.98, 1.73)},
                    [2] = {vector3(5102.73, -4667.05, 2.51), vector3(5103.27, -4665.57, 2.62)},
                    [3] = {vector3(5129.76, -4683.19, 1.68), vector3(5132.1, -4681.84, 1.59)},
                    [4] = {vector3(5087.5, -4685.35, 2.4), vector3(5084.06, -4684.3, 2.39)},
                    [5] = {vector3(5036.96, -4629.41, 4.9), vector3(5036.05, -4627.95, 4.9)},
                    [6] = {vector3(5072.32, -4617.28, 2.78), vector3(5074.97, -4618.12, 2.62)},
                },
            },
            guard = { -- Guards // Static peds, Coords are Vector4 and not Vector3, the 4th value is the heading
                [1] = vector4(5030.68, -4627.65, 21.68, 31.16),
                [2] = vector4(5102.79, -4577.9, 23.25, 52.63),
            },
            veh = { -- Vehicle patrols from 1 to 2, 2 to 3, 3 to 4 and back to 1, etc. // Add as many patrols and points as you want
                [1] = {
                    [1] = vector3(5156.56, -4624.2, 2.75),
                    [2] = vector3(5125.77, -4573.53, 4.38),
                    [3] = vector3(5038.37, -4548.1, 7.71),
                    [4] = vector3(5021.44, -4603.49, 4.49),
                    [5] = vector3(5088.23, -4615.6, 2.53),
                }
            }
        },
        pedSettings = {
            blips = true, -- Show blips for the peds
            health = 250, -- Health of the ped // 200 is default civillian health
            armour = 50, -- Armour of the ped // 0-100
            footsteps = 'quiet', -- Footstep sounds // 'loud' or 'quiet' or false
            relationship = 5, -- Relationship group of the ped // 0-5 // 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
            weapons = { -- Weapon to give the ped // Set to false to not give a weapon // https://wiki.rage.mp/index.php?title=Weapons
                `WEAPON_BAT`,
                `WEAPON_HATCHET`,
                `WEAPON_PUMPSHOTGUN`,
                `WEAPON_PISTOL`,
            }, 
            combat = {
                ability = 80, -- Combat ability of the ped // 50-100
                accuracy = 75, -- Accuracy of the ped // 0-100
                alertness = 3, -- Alertness of the ped // 0-3 (0 = calm, 3 = paranoid)
                range = 2, -- Combat range of the ped // 0-2 (0 = near, 2 = far)
                movement = 3, -- Combat movement of the ped // 0-3 (0 = stand, 1 = defensive, 2 = offensive, 3 = suicidal)
            },
            pathing = { -- How the ped will path during combat
                avoidFire = true, -- Whether the ped avoids fire // true or false
                climbOver = true, -- Whether the ped can climb over objects // true or false
                useLadders = true, -- Whether the ped can use ladders // true or false
                avoidWater = true, -- Whether the ped avoids water // true or false
                dropFromHeight = true, --  Whether the ped can drop from height // true or false
            },
        },
    },
}