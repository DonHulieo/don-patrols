# don-patrols

Configurable Ped Patrols for QBCore! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5419769).

## Dependencies

- [qb-core](https://github.com/qbcore-framework/qb-core)

## Features

- Optimised code, resmon of 0.0ms.
- Configure Different Areas of Patrol
- 5 Locations Pre-Configured // Add as many as you want!
- Choose Between 3 Patrol/Guard Types, Walking, Driving and Static.
- Patrols only start if a Player is within 250 units of the Patrol Area.
- Patrols Despawn if no Players are within 500 units of the Patrol Area.
- If a Patrol is Killed or Despawned, it will respawn after a Configurable Cooldown.
- If a Certain Percentage of the Patrols are Killed (default 75%), the Active Patrol will Flee from the Player.
- EMS Workers by Default won't be Attacked!
- Patrols are Server Synced.

## Preview

- *coming soon*

## Installation

- Drag and Drop the `don-patrols` folder into your `resources` folder.

## Configuration

### Globals

```lua
Config.Cooldown = 60
Config.DeathPercent = 75 
Config.ResetsOnDeath = false
Config.SpawnDistance = 250.0
Config.DespawnDistance = 500.0
```

- `Config.Cooldown` is the Cooldown (in minutes) for the Active Patrol to respawn after it's been killed or despawned.
- `Config.DeathPercent` is the Percentage of the Active Patrol members that need to be killed before the Peds flee from the Player.
- `Config.ResetsOnDeath` if true, Killing the Above Amount of Peds, will Reset the Current Patrol and negates the Cooldown Timer.
- `Config.SpawnDistance` the Distance from a Patrol Point the Player needs to be within to trigger the Patrol.
- `Config.DespawnDistance` the Distance that if no Players are within, the patrol will Despawn.

### Adding Emergency Service Jobs

```lua
Config.AuthorizedJobs = 
{
    LEO = { 
        Jobs = {['police'] = true, ['fib'] = true, ['sheriff'] = true}, 
        Types = {['police'] = true, ['leo'] = true},
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Jobs[job] or Config.AuthorizedJobs.LEO.Types[jobtype] then return true end
        end
    },
    EMS = {
        Jobs = {['ambulance'] = true, ['fire'] = true}, 
        Types = {['ambulance'] = true, ['fire'] = true, ['ems'] = true},
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.EMS.Jobs[job] or Config.AuthorizedJobs.EMS.Types[jobtype] then return true end
        end
    },
    FirstResponder = {
        Check = function()
            local PlyData = QBCore.Functions.GetPlayerData()
            local job, jobtype = PlyData.job.name, PlyData.job.type
            if Config.AuthorizedJobs.LEO.Check(jobtype, job) or Config.AuthorizedJobs.EMS.Check(jobtype, job) then return true end            
        end
    }
}
```

- `Config.AuthorizedJobs.LEO` is the Table for the Police Jobs, you can add more jobs to the `Jobs` Table.
- `Config.AuthorizedJobs.EMS` is the Table for the EMS Jobs, you can add more jobs to the `Jobs` Table.
- `Config.AuthorizedJobs.FirstResponder` is the Table for the Combined Police and EMS Jobs, **DO NOT TOUCH THIS!**.

### Adding Patrol Areas

#### 1. Adding a Patrol Area

- To add a Patrol Area, you need to add a new Table to the `Config.Locations` Table.

##### 1.1 Name and Constants

```lua
name = 'Cayo_Perico_1',
activePatrols = true, 
activeGuards = true, 
activeVehicles = true,
```

- `name` is the Name of the Patrol Area, make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.).
- `activePatrols` is a boolean value, if true, Walking Patrols will be active for this location.
- `activeGuards` is a boolean value, if true, Static Guards will be active for this location.
- `activeVehicles` is a boolean value, if true, Driving Patrols will be active for this location.

##### 1.2 Models

```lua
models = {
    peds = { 
        `g_m_y_mexgoon_01`,
        `g_m_y_pologoon_01`,
        `g_m_y_mexgang_01`,
    },
    vehs = { 
        `dune`,
    },
},
```

- `models.peds` is the Table of Ped Models to use for the Patrols and Static Guards. Peds are randomly selected from this table, so you can add as many as you want, but make sure they're valid.
- `models.vehs` is the Table of Vehicle Models to use for the Patrols. Vehicles are selected in order, so the first vehicle patrols the first veh patrol route, the second vehicle patrols the second veh patrol route, etc.

##### 1.3 Patrol Routes

```lua
stopTime = {10000, 15000},  
patrols = {
    ped = { 
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
    guard = {
        [1] = vector4(5030.68, -4627.65, 21.68, 31.16),
        [2] = vector4(5102.79, -4577.9, 23.25, 52.63),
    },
    veh = { 
        [1] = {
            [1] = vector3(5156.56, -4624.2, 2.75),
            [2] = vector3(5125.77, -4573.53, 4.38),
            [3] = vector3(5038.37, -4548.1, 7.71),
            [4] = vector3(5021.44, -4603.49, 4.49),
            [5] = vector3(5088.23, -4615.6, 2.53),
        }
    }
},
```

- `stopTime` is the time to wait at each patrol point (in milliseconds) for walking patrols. This is a table of two numbers, the first number is the minimum time to wait, the second number is the maximum time to wait. The time to wait is randomly selected between the two numbers.
- `patrols.ped` is the Table of Ped Patrols. Each Patrol is a Table of Patrol Points. Each Patrol Point is a Table of two Vector3s, the first Vector3 is where the ped stands, the second Vector3 is where the ped faces. The ped will wait in this position for the time specified in `stopTime` and then move to the next patrol point. The ped will repeat this until it reaches the last patrol point, then it will move to the first patrol point and repeat the process.
- `patrols.guard` is the Table of Static Guards. Each Guard is a Vector4, the first three values are the position, the fourth value is the heading.
- `patrols.veh` is the Table of Vehicle Patrols. Each Patrol is a Table of Patrol Points. Each Patrol Point is a Vector3, this is where the vehicle will drive to. The vehicle will drive to the first patrol point, then the second patrol point, then the third patrol point, etc. The vehicle will repeat this until it reaches the last patrol point, then it will move to the first patrol point and repeat the process.

**Note:** The Vehicle Patrols need careful planning and testing. I recommend testing vehicle routes before using them on a live server as the pathing relies on the AI of the vehicles and they can get stuck in some situations. For example, originally Madrazo's Ranch had a vehicle patrol going around the outside of the ranch, but the vehicle would get stuck on the fence and not move, or randomly veer off the road. After extensive testing I noticed that none of the Native AI pathed here, leading me to assume that the AI Pathing Nodes here are broken. When first creating a route, start with a 4 point loop and test it. If it works, add more points. If it doesn't work, remove points until it does. If it still doesn't work, try a different route.

##### 1.4 Ped Settings

```lua
pedSettings = {
    blips = true, 
    health = 250, 
    armour = 0, 
    footsteps = 'quiet', 
    relationship = 4,
    relNameOverride = 'Cayo_Perico', 
    weapons = { 
        `WEAPON_BAT`,
        `WEAPON_BOTTLE`,
        `WEAPON_UNARMED`, 
    }, 
    combat = {
        ability = 80, 
        accuracy = 60, 
        alertness = 3, 
        range = 2, 
        movement = 2, 
    },
    pathing = { 
        avoidFire = true, 
        climbOver = true, 
        useLadders = true, 
        avoidWater = true, 
        dropFromHeight = true,
    },
},
```

###### 1.4.1 Main Settings

- `pedSettings.blips` is whether to show blips for the peds.
- `pedSettings.health` is the health of the peds.
- `pedSettings.armour` is the armour of the peds.
- `pedSettings.footsteps` is the footstep sounds of the peds. Set to `'loud'` for loud footstep sounds, set to `'quiet'` for quiet footstep sounds, set to `false` for no footstep sounds.
- `pedSettings.relationship` is the relationship group of the peds. Set to `0` for Companion, set to `1` for Respect, set to `2` for Like, set to `3` for Neutral, set to `4` for Dislike, set to `5` for Hate. By deault, the relationships are either 4 (Dislike) or 5 (Hate), so they peds will either shoot when aggravated or shoot on sight respectively.
- `pedSettings.relNameOverride` is the name of the relationship group. Set to `false` to not override the name. This is useful if you want to use the same relationship group for multiple areas, i.e Cayo Perico.

###### 1.4.2 Combat Settings

- `pedSettings.weapons` is the weapons to give the peds. Set to `false` to not give a weapon. The weapons are given randomly from the table, by having `WEAPON_UNARMED`, there's a chance for the ped to not have a weapon. The weapons are hashes, you can find the hashes [here](https://wiki.rage.mp/index.php?title=Weapons).
- `pedSettings.combat.ability` is the combat ability of the peds. Set to a number between `50` and `100`. Anything below `50` will make the peds flee, no matter the relationship.
- `pedSettings.combat.accuracy` is the accuracy of the peds. Set to a number between `0` and `100`.
- `pedSettings.combat.alertness` is the hearing range of the ped. Set to `0` for calm, set to `1` for close, set to `2` for normal, set to `3` for far.
- `pedSettings.combat.range` is the combat range of the peds (the range at which attacking another patrol member is considered a threat). Set to `0` for near, set to `1` for normal, set to `2` for far.
- `pedSettings.combat.movement` is how the ped paths during combat. Set to `0` for stationary (won't react), set to `1` for defensive (ped will find cover and blind fire), set to `2` for offensive (ped will rush the enemy, but still look for cover), set to `3` for suicidal (THIS IS SPARTA).

###### 1.4.3 Pathing Settings

*Note: These settings are to help contain the peds in certain areas, i.e. the top of a water tower. If you want the peds to be able to path freely, set all of these to `true`.*

- `pedSettings.pathing.avoidFire` is whether the peds avoid fire.
- `pedSettings.pathing.climbOver` is whether the peds can climb over objects.
- `pedSettings.pathing.useLadders` is whether the peds can use ladders.
- `pedSettings.pathing.avoidWater` is whether the peds avoid water.
- `pedSettings.pathing.dropFromHeight` is whether the peds can drop from height.

## Support

- Join my [discord](https://discord.gg/tVA58nbBuk) and use the relative support channels.
- Open a ticket and please have your Tebex Transation ID ready 🙂.

## Changelog

- v1.0.4 - Linting and General Fixes.
- v1.0.3 - Added Fail Safes' for Drivers Despawning when a Player is too far away.
- v1.0.2 - Added `pedSettings.relNameOverride` and Vehicle Patrols will now chase down the player if they are in a vehicle.
- v1.0.1 - Added Config Options for Distance Checks.
- v1.0.0 - Initial Release
