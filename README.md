# don-patrols

Configurable Ped Patrols for FiveM! This is a paid script, available on my [Tebex](https://dons-developments.tebex.io/package/5419769).

## Features

- Optimised code, resting resmon of 0.00ms and ~0.01ms whilst in use.
- Configure Different Areas of Patrol
- 23 Locations Pre-Configured // Add as many as you want!
- Choose Between 5 Patrol Types, Guarding, Walking, Driving, Flying and Boating.
- Patrols are Highly Configurable, with Global Settings for Cooldown, Spawn/Despawn Distances, Death Percentage and more.
- Patrols stay Tasked between Players and will go Dormant whilst no Players are nearby.
- Peds are Configurable, with Unique Settings for each Ped, including Health, Armour, Weapons, Ammo and their Model.
- Ability to Loot the Patrol Peds, and Set Custom Loot Tables for each Ped.
- Guards will Detect if They've Left their Guard Position and will Return to it.
- Vehicles are Configurable, with Unique Settings for each Vehicle, including Health, Plate, Lock Type and their Model.
- Vehicle Peds have the Ability to Control Mounted Turrets, and Vehicles have a Passenger Limit of 10 (if they can fit it!).
- Patrols have the Ability to Determine if a Players' Job is a Threat to them, and will Respond Accordingly.
- Patrols are Created Server-Side, and are Synced to all Players.

## Table of Contents

- [don-patrols](#don-patrols)
  - [Features](#features)
  - [Table of Contents](#table-of-contents)
    - [Credits](#credits)
    - [Preview](#preview)
    - [Installation](#installation)
      - [Dependencies](#dependencies)
      - [Initial Setup](#initial-setup)
    - [Configuration](#configuration)
      - [Globals](#globals)
      - [UI Settings](#ui-settings)
      - [Creating a Location](#creating-a-location)
      - [Routes](#routes)
        - [Adding a Guard](#adding-a-guard)
        - [Adding a Patrol](#adding-a-patrol)
        - [Adding a Vehicle Patrol](#adding-a-vehicle-patrol)
      - [Unique Ped Settings](#unique-ped-settings)
        - [Base Settings](#base-settings)
        - [Range Settings](#range-settings)
        - [Ped Vehicle Settings](#ped-vehicle-settings)
      - [Vehicle Config](#vehicle-config)
        - [Base Vehicle Settings](#base-vehicle-settings)
      - [Shared Ped Settings](#shared-ped-settings)
        - [Behaviour Settings](#behaviour-settings)
        - [Blip Settings](#blip-settings)
        - [Combat Settings](#combat-settings)
        - [Damage Settings](#damage-settings)
        - [Drop Settings](#drop-settings)
        - [Event Settings](#event-settings)
        - [Pathing Settings](#pathing-settings)
          - [Avoidance](#avoidance)
          - [Movement](#movement)
          - [Ragdoll](#ragdoll)
        - [Relationship Settings](#relationship-settings)
      - [Known Issues](#known-issues)
        - [Patrol Limits](#patrol-limits)
    - [Copyright](#copyright)
    - [TOS](#tos)
    - [Support](#support)
    - [Changelog](#changelog)

<!-- [ ] Add More Basic Drive Style Flags -->

### Credits

- [DurtyFrees' Data Dumps](https://github.com/DurtyFree/gta-v-data-dumps) for the various data dumps needed for this script.
- [PlebMasters](https://forge.plebmasters.de/) for their updated ped, vehicle and weapon viewers.
- [Vespura's Driving Style Calculator](https://vespura.com/fivem/drivingstyle/) for the inspiration for the Driving Style Calculator.
- mrnewb, Mintz, beauflexx & others who provided testing and feedback.

### Preview

- [Don Patrols YT Preview](https://www.youtube.com/watch?v=3FX-CfZ_oo8)
- [v1.4 Boat Patrol](https://streamable.com/0lbmex)
- [v1.4 Helicopter Patrol](https://streamable.com/a9jue7)

### Installation

#### Dependencies

**Depending on your Framework, you will need to have installed either of the following dependencies:**

- [QBCore](https://github.com/qbcore-framework/qb-core)
- [ESX](https://github.com/esx-framework/esx_core)

#### Initial Setup

- Always use the latest FiveM artifacts (tested on 6683), you can find them [here](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/).
- Ensure your `server.cfg` has `set sv_enforceGameBuild 2060` or above, you can find more info on game builds [here](https://docs.fivem.net/docs/server-manual/server-commands/#sv_enforcegamebuild-build)
- Download the latest version from your keymaster.
- Extract the contents of the zip file into your resources folder, into a folder which starts after your framework or;
- Ensure the script in your `server.cfg` after your framework.
- Configure the global `Config.DebugMode` before starting the script, to ensure correct startup and that debug are set to your liking.

```lua
Config.DebugMode = false
```

- `Config.DebugMode` boolean, if set true, the script will print debug messages to the console.

### Configuration

#### Globals

```lua
Config.Cooldown = 15
Config.DeathPercent = 80
Config.ResetsOnDeath = false
Config.DeleteOnReset = false
Config.SpawnDistance = 500.0
Config.DespawnDistance = 1000.0
```

- `Config.Cooldown` integer, the time (in minutes) to wait before a patrol can be spawned again.
- `Config.DeathPercent` integer, the percentage of peds that if killed, will cause the patrol to flee from the player.
- `Config.ResetsOnDeath` boolean, if set true, killing the above percentage of peds will cause the patrol to reset, opposed to waitng for the cooldown timer.
- `Config.DeleteOnReset` boolean, if set true, will delete the patrol entities on reset (patriculary handy if bodies aren't despawning naturally).
- `Config.SpawnDistance` float, the distance from any coordinate in a configured patrol area that triggers the patrol to spawn.
- `Config.DespawnDistance` float, the distance from any coordinate in a configured patrol area that triggers the patrol to despawn.

**Note:** Entities in FiveM (and GTA as a whole) have scope; that is, a distance of which players need to be within to know of it's existence. By default this is 424 units from the entity, `Config.SpawnDistance` will allow players to create entities outside of this scope, so this should be used with caution as it can cause performance issues and unexpected behaviour. Read more about scopes [here](https://docs.fivem.net/docs/scripting-reference/onesync/#whats-culling).

#### UI Settings

```lua
Config.UI = {
  uiType = 'drawtext',
  label = 'Search',
  icon = 'fas fa-search',
  ['Items'] = {
    notify = 'framework',
    title = 'Item Found',
    text = 'You found %s x %s',
    images = 'https://cfx-nui-qb-inventory/html/images/'
  },
}
```

- `Config.UI.uiType` string, the type of UI to use for the search, can be `qb-target`, `ox-target`, `drawtext` or `helptext`.
- `Config.UI.label` string, the label to display on the UI.
- `Config.UI.icon` string, the icon to display on the UI (only used for `qb-target` and `ox-target`).
- `Config.UI['Items'].notify` string|boolean, whether to notify the player when they find an item, can be `native`, `framework` or `false`.
- `Config.UI['Items'].title` string, the title of the notification (only used if `Config.UI['Items'].notify` is set to `native`).
- `Config.UI['Items'].text` string, the text of the notification, `%s` will be replaced with the item name and amount (only used if `Config.UI['Items'].notify` is set to `native`).
- `Config.UI['Items'].images` string, the path to the images folder for the notification (only used if `Config.UI['Items'].notify` is set to `native`).

#### Creating a Location

- To create a new location, you need to add a new Table to the `Config.Locations` Table.

```lua
Config.Locations = {
    {
        name = '',
        ['Enabled'] = {guards = false, patrols = false, vehicles = false},
        ['Routes'] = {
            guard = {...},
            patrol = {
                {...}
            },
            vehicle = {
                {...}
            }
        },
        ['Peds'] = {
            guard = {...},
            patrol = {...},
            vehicle = {
                {...}
            }
        },
        ['Vehicles'] = {
            {...}
        },
        ['Settings'] = {
            ['Behavior'] = {...},
            ['Blips'] = {...},
            ['Combat'] = {...},
            ['Damages'] = {...},
            ['Drops'] = {...},
            ['Events'] = {...},
            ['Pathing'] = {
                ['Avoidance'] = {...},
                ['Movement'] = {...},
                ['Ragdoll'] = {...},
            },
            ['Relationships'] = {...},
        }
    },
}
```

**Note:** Each patrol table is declared as a non-indexed table (i.e. instead of `[1] = {}`, it's just `{}`). However, this script does support number indexed tables, so if you want to use them, go ahead.

- `name` string, the name of the patrol area, make sure it's unique and doesn't have any spaces (i.e. Grapeseed_Weed_Farm, Humane_Labs, etc.).
- `Enabled` table;
  - `guards` boolean, whether the patrol will spawn guards.
  - `patrols` boolean, whether the patrol will spawn patrols.
  - `vehicles` boolean, whether the patrol will spawn vehicles.
  
#### Routes

- `Routes` table, split into three sub-tables, `guard`, `patrol` and `vehicle`. Each of these tables is a table of information for the respective patrol type.
- `guard` is the Table of Guard Positions, with each guard having one table declaring coords, heading, scenario and chair (if applicable).
- `patrol` is the Table of Patrols, with each patrol having one main table, with each patrol point having a table declaring coords, heading, time and scenario.
- `vehicle` is the Table of Vehicle Patrols, with each patrol having one main table, with each patrol point having a table declaring coords, speed and flags (ie. driving style).

**Note:** For patrol types with scenarios, only `'WORLD_HUMAN_..` & `'PROP_HUMAN_..` have been tested and known to work. Other scenarios may work, but are not guaranteed.

##### Adding a Guard

```lua
guard = {
    {coords = vector3(-2302.88, 3385.7, 31.26), heading = 143.86, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY', chair = `h4_prop_h4_weed_chair_01a`},
    {coords = vector3(-2301.31, 3387.83, 31.26), heading = 321.56, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY', chair = `h4_prop_h4_weed_chair_01a`}
},
```

**Note:** The amount of guards for a given location is not limited, so you can add as many as you want by adding more tables to the `guard` table.

- `coords` vector3, the coordinates of the Guard Position
- `heading` float, the heading of the Guard whilst at the Guard Position.
- `scenario` string, the Scenario of the Guard, you can find a list of scenarios [here](https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json).
- `chair` number|string|nil, nil if the guard is not sitting, otherwise the hash or name of the chair prop. You can find a list of chair props [here](https://forge.plebmasters.de/objects?search=chair).

##### Adding a Patrol

```lua
patrol = {
    {
        {coords = vector3(-1826.44, 3296.78, 32.83), heading = 332.92, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
        {coords = vector3(-1791.71, 3277.2, 32.77), heading = 238.37, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_BINOCULARS'},
        {coords = vector3(-1743.14, 3248.95, 32.81), heading = 333.22, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_PATROL'},
        {coords = vector3(-1785.16, 3176.31, 32.83), heading = 152.92, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_STAND_IMPATIENT'},
        {coords = vector3(-1819.5, 3195.79, 32.79), heading = 59.17, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_PATROL'},
        {coords = vector3(-1867.65, 3225.62, 32.85), heading = 153.11, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}
    }
},
```

**Note:** The amount of patrols for a given location is not limited, so you can add as many as you want by adding more tables to the `patrol` table.

- `coords` vector3, the coordinates of the Patrol Position.
- `heading` float, the heading of the Patrol Position.
- `time` integer, the time to wait at the Patrol Position (in milliseconds). This can be a number or a math.random() function, to randomise the time between two numbers.
- `scenario` string, the Scenario of the Guard, you can find a list of scenarios [here](https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json).

##### Adding a Vehicle Patrol

```lua
vehicle = {
    {
        {coords = vector3(-1851.93, 3318.97, 32.93), speed = 20.0, flags = 447},
        {coords = vector3(-1716.95, 3241.34, 32.54), speed = 20.0, flags = 447},
        {coords = vector3(-1741.59, 3161.12, 32.55), speed = 20.0, flags = 447},
        {coords = vector3(-1894.12, 3231.54, 32.56), speed = 20.0, flags = 447}
    }
},
```

**Note:** The amount of vehicle patrols for a given location is not limited, so you can add as many as you want by adding more tables to the `vehicle` table.

- `coords` vector3, the coordinates of the Patrol Position.
- `speed` float, the speed of the Vehicle going to the Patrol Position.
- `flags` integer, the Driving Style of the Vehicle going to the Patrol Position, you can calculate driving styles online [here](https://vespura.com/fivem/drivingstyle/) or in-game [here](https://github.com/DonHulieo/don-drivingstyle_calc/releases/tag/v1.0.0) and also find a list of flags [here](https://github.com/DurtyFree/gta-v-data-dumps/blob/master/drivingStyleFlagValues.json).

*Some Driving Styles:*
`447` - Will obey all traffic laws, and act like a normal civilian vehicle.
`262591`  - Will obey all traffic laws, and will path on dirt roads.
`786432` - Drives recklessly, and will path on dirt roads.

#### Unique Ped Settings

- `Peds` is split into three sub-tables, `guard`, `patrol` and `vehicle`. Each of these tables is a table of information for the respective patrol type. Vehicles have some extra functionality and tables, which will be explained [here](#ped-vehicle-settings).

```lua
['Peds'] = {
    guard = {
        {...}, -- Guard 1
        {...} -- Guard 2
    },
    patrol = {
        {...}, -- Patrol 1
        {...} -- Patrol 2
    },
    vehicle = {
        { -- Vehicle 1
            {...}, -- Passenger 1
            {...} -- Passenger 2
        }
        {...} -- Vehicle 2 w/ No Unique Passengers
    }
},
```

##### Base Settings

```lua
['Base'] = {
    model = 's_m_m_marine_01',
    weapon = 'weapon_pistol_mk2',
    health = 250,
    armour = 100,
    ammo = 250,
    brandish = true,
    -- flags = {},
    ['Loot'] = {...}
},
```

- `model` string|number, the Model of the Ped, this can be either a string or the hash. You can find a list of all Ped Models [here](https://forge.plebmasters.de/peds).
- `weapon` string|number, the Weapon of the Ped, this can be either a string or the hash. You can find weapon names and stats [here](https://forge.plebmasters.de/weapons/).
- `health` integer, a value between 0 and 1000, this is the health of the ped. Default ped health for males is between 100 to 200 and between 0 and 100 for females.
- `armour` integer, a value between 0 and 100, this is the armour of the ped.
- `ammo` integer, setting the ammo of the ped. This is only used if `useDiminishingAmmo` is set to `true` in the `Base` table of the `Settings` table.
- `brandish` boolean, whether the ped will brandish their weapon when spawned. Default is false, set to true to enable.
- `flags` integer[], array of flags to uniquely set on the ped. This is by default used by vehicle peds and care should be taken that the flags don't conflict with the global settings. A full list of flags can be found [here](https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags).
- `['Loot']` nil|boolean|table{item: string|string[], amount: integer|integer[]}
- `['Loot'].item` string|string[], the item to give the player when the ped is looted. If a string, it will give the item and configured amount. If a table, it will give a random item from the table and configured amount.
- `['Loot'].amount` integer|integer[], the amount of the item to give the player when the ped is looted. If an integer, it will give the item and configured amount. If a table, it will give a random amount between the two numbers.

##### Range Settings

```lua
['Ranges'] = {
    lod = 250.0,
    id = 100.0,
    seeing = 100.0,
    peripheral = 100.0,
    hearing = 100.0,
    shout = 100.0
}
```

- `lod` float, the distance the ped will be visible from.
- `id` float, the distance the ped will be visible to other peds from.
- `seeing` float, the distance the ped can see hostile actions from.
- `peripheral` float, the distance the ped can see hostile actions from the 'corner' of their eye.
- `hearing` float, the distance the ped can hear hostile actions from.
- `shout` float, the distance the ped can communicate to respected peds.

##### Ped Vehicle Settings

**Note:** The vehicles table can be declared in two ways, depending on how you want that vehicle configured.

- If you want the vehicle to have unique settings on each passenger, first declare the vehicle table and create a non-indexed table, with each table being the settings for that passenger (see Example 1).

- If you want the vehicle to have the same settings for each passenger, first declare the vehicle table and then populate that table the same as you would either guards or patrols (see Example 2). The amount of passengers will be declared in the `['Vehicles]` table, explained [here](#vehicle-config).

```lua
vehicle = {
    { -- Example 1
        {
            ['Base'] = {...},
            ['Ranges'] = {...}
        }, {
            ['Base'] = {...},
            ['Ranges'] = {...}
        }
    },
    { -- Example 2
        ['Base'] = {...},
        ['Ranges'] = {...}
    }
}
```

- `flags` integer[], array of flags to uniquely set on the ped. Here it is used to set the flags on the vehicle peds, the example array is my reccomended flags for vehicle peds. A full list of flags can be found [here](https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags).

#### Vehicle Config

- `Vehicles` is split into tables for each vehicle, with each vehicle having a table of settings. This table matches the index of the vehicle in the `['Route']` table, so if you have two vehicles in the Route table, you will need two tables in the Vehicles table.

```lua
['Vehicles'] = {
    {['Base']}, -- Vehicle 1
    {['Base']} -- Vehicle 2
},
```

##### Base Vehicle Settings

```lua
['Base'] = {
    model = 'crusader',
    vehType = 'automobile',
    passengers = false,
    lockType = 3,
    health = 1000.0,
    dirtLevel = 0.0,
    plate = 'ARMY'
}
```

- `model` string|number, the Model of the Vehicle, this can be either a string or the hash. You can find a list of Vehicle Models [here](https://forge.plebmasters.de/vehicles).
- `vehType` string, the Type of the Vehicle, this can be `automobile`, `bike`, `boat` or `heli`.
- `passengers` boolean|integer|nil, is either false|nil or an integer;
  - If false, the vehicle passengers will be configured individually and the amount determined by the amount of tables in the `['Peds'].vehicle[patrol]` table.
  - If an integer, the vehicle passengers will be configured the same as the vehicle driver and the amount determined by the integer.
- `lockType` integer, value between 0 and 5, this is the lock type of the vehicle. Default is `3` (LockedForPlayer). For more information on lock types, see [here](https://docs.fivem.net/natives/?_0xB664292EAECF7FA6).
- `health` float, the health of the vehicle. Default is `1000.0` and maximum is `1000.0`.
- `dirtLevel` float, the dirt level of the vehicle. Default is `0.0` and maximum is `15.0`.
- `plate` string, the plate of the vehicle. This has a character limit of `8`.

#### Shared Ped Settings

- `Settings` is split into eight sub-tables, `Behavior`, `Blips`, `Combat`, `Damages`, `Drops`, `Events`, `Pathing` and `Relationships`. Each of these tables globally set across the patrol.

```lua
['Settings'] = {
    ['Behavior'] = {...},
    ['Blips'] = {...},
    ['Combat'] = {...},
    ['Damages'] = {...},
    ['Drops'] = {...},
    ['Events'] = {...},
    ['Pathing'] = {
        ['Avoidance'] = {...},
        ['Movement'] = {...},
        ['Ragdoll'] = {...},
    },
    ['Relationships'] = {...},
},
```

##### Behaviour Settings

```lua
['Behavior'] = {
    ignoreMelee = false,
    ignoreFire = false,
    ignoreBeingJacked = false,
    ignoreSilencedClone = true,
    ignoreExplosion = false,
    preventMeleeTaunts = false,
    disableHurt = false,
    disableWrithe = false,
    preferInjuredGetup = true,
    onlyWritheFromWeapon = true,
    runFromFires = true,
    dontShoutTarget = false,
    dontCryForHelp = false
},
```

- `ignoreMelee` boolean, whether the ped will ignore melee actions.
- `ignoreFire` boolean, whether the ped will ignore fire.
- `ignoreBeingJacked` boolean, whether the ped will ignore being jacked from a vehicle.
- `ignoreSilencedClone` boolean, whether the ped will ignore silenced weapons.
- `ignoreExplosion` boolean, whether the ped will ignore explosions.
- `preventMeleeTaunts` boolean, whether the ped can melee taunt.
- `disableHurt` boolean, whether the ped can have hurt reactions.
- `disableWrithe` boolean, whether the ped can writhe on the ground.
- `preferInjuredGetup` boolean, whether the ped will prefer getting up from an injured state.
- `onlyWritheFromWeapon` boolean, whether the ped will only writhe from weapon damage.
- `runFromFires` boolean, whether the ped will run from fires.
- `dontShoutTarget` boolean, whether the ped will communicate their targets postion.
- `dontCryForHelp` boolean, whether the ped will call for help when injured.

##### Blip Settings

```lua
['Blips'] = {
    enabled = true,
    hasCone = true,
    forcedOn = false,
    colour = {enemy = 1, ally = 3},
    range = 50.0,
    clearOnDeath = true
},
```

- `enabled` boolean, whether the ped will have a blip.
- `hasCone` boolean, whether the blip has a view cone on the minimap whilst active.
- `forcedOn` boolean, whether the blip will be forced on the minimap. Default is `false`.
- `colour` table, `colour.enemy` for the colour of the blip when the ped is an enemy and `colour.ally` for the colour of the blip when the ped is an ally. A full list of colours can be found [here](https://docs.fivem.net/docs/game-references/blips/#blip-colors).
- `range` float, the distance the blip can be activated from.
- `clearOnDeath` boolean, whether the blip will be removed on death.

##### Combat Settings

```lua
['Combat'] = {
    attributes = {5, 14, 15, 46},
    ability = 100,
    accuracy = 100,
    alertness = 2,
    movement = 1,
    range = 2,
    targetResponse = 2,
    canAttackFriendly = false,
    canUseCover = true,
    useDiminishingAmmo = true,
    blockWeaponSwitching = false,
    enableWeaponBlocking = false,
    keepWeaponHolstered = true,
    disableMelee = false,
    disableUnarmedDriveby = false,
    disableWritheShooting = false,
    respondToHelpCries = true,
    treatDislikeAsHated = true,
    treatNonFriendlyAsHated = false,
},
```

- `attributes` integer[], array of attributes to set on the ped. A full list of attributes can be found [here](https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags).
- `ability` integer, between 0 and 100, this is the ability of the ped. A number between 0 and 50 is poor, 50 and 75 is average and 75 and above is professional.
- `accuracy` integer, between 0 and 100, this is the accuracy of the ped.
- `alertness` integer, between 0 and 3, this is the alertness of the ped. 0 is calm and 3 is paranoid.
- `movement` integer, between 0 and 3, this is the movement of the ped. 0 is stationary, 1 is defensive, 2 is will advance and 3 is will retreat.
- `range` integer, between 0 and 3, this is the range of the ped. 0 is near, 1 is medium, 2 is far and 3 is very far.
- `targetResponse` integer, between 0 and 2, this is the target response of the ped. 0 is exist task, 1 is never lose target and 2 is search for target.
- `canAttackFriendly` boolean, whether the ped can attack friendly peds.
- `canUseCover` boolean, whether the ped can use cover.
- `useDiminishingAmmo` boolean, whether the ped will use diminishing ammo. If set to false, the ped will have infinite ammo.
- `blockWeaponSwitching` boolean, whether the ped can switch weapons.
- `enableWeaponBlocking` boolean, whether the ped will be blocked by objects when shooting (or attempting to shoot).
- `keepWeaponHolstered` boolean, whether the ped will keep their weapon holstered until fired.
- `disableMelee` boolean, whether the ped can use melee attacks.
- `disableUnarmedDriveby` boolean, whether the ped can use unarmed drivebys.
- `disableWritheShooting` boolean, whether the ped can shoot whilst writheing on the ground.
- `respondToHelpCries` boolean, whether the ped will respond to help cries.
- `treatDislikeAsHated` boolean, whether the ped will treat dislike as hated (Relationship type 4).
- `treatNonFriendlyAsHated` boolean, whether the ped will treat non friendly as hated (Any Relationship from 3 and above).

##### Damage Settings

```lua
['Damages'] = {
    diesWhenInjured = false,
    incapacitation = true,
    criticals = true,
    bullets = true,
    fire = true,
    explosion = true,
    collision = true,
    steam = true,
    melee = true,
    drown = true,
    electric = true,
    ragdoll = false,
    invincible = false
},
```

- `diesWhenInjured` boolean, whether the ped will die when injured.
- `incapacitation` boolean, whether the ped will writhe when injured.
- `criticals` boolean, whether the ped will suffer critical hits.
- `bullets` boolean, whether the ped will suffer bullet damage.
- `fire` boolean, whether the ped will suffer fire damage.
- `explosion` boolean, whether the ped will suffer explosion damage.
- `collision` boolean, whether the ped will suffer collision damage.
- `steam` boolean, whether the ped will suffer steam damage.
- `melee` boolean, whether the ped will suffer melee damage.
- `drown` boolean, whether the ped will drown.
- `electric` boolean, whether the ped will suffer electric damage.
- `ragdoll` boolean, whether the ped will die when ragdolled.
- `invincible` boolean, whether the ped will be invincible.

##### Drop Settings

```lua
['Drops'] = {
    weapons = false,
    healthSnacks = false
},
```

- `weapons` boolean, whether the ped will drop their weapon when killed.
- `healthSnacks` boolean, whether the ped will drop a health snack when killed (like in GTA:O).

##### Event Settings

```lua
['Events'] = {
    listensToSoundEvents = true,
    checkLOSForSoundEvents = true,
    disableWeirdPedEvents = false,
    disableCryForHelpEvents = false,
    usePerceptionForAimEvents = true,
    disableShockingEvents = false,
    disableShockingDrivingEvents = false
},
```

- `listensToSoundEvents` boolean, whether the ped will listen to sound events.
- `checkLOSForSoundEvents` boolean, whether the ped will check line of sight to generate/respond to sound events.
- `disableWeirdPedEvents` boolean, whether the ped will disable weird ped events (ie. CEventShockingWeirdPed & CEventShockingWeirdPedApproaching)
- `disableCryForHelpEvents` boolean, whether the ped will disable cry for help events (ie. CEventShockingCryForHelp)
- `usePerceptionForAimEvents` boolean, whether the ped will use their perception to generate aim events
- `disableShockingEvents` boolean, whether the ped will respond to shocking events (ie. CEventShocking)
- `disableShockingDrivingEvents` boolean, whether the ped will respond to shocking driving events (ie. CEventShockingDriving)

##### Pathing Settings

###### Avoidance

```lua
['Avoidance'] = {
    avoidDrops = true,
    avoidFire = true,
    avoidPeds = true,
    avoidTearGas = true,
    avoidWater = true
},
```

- `avoidDrops` boolean, whether the ped will avoid falls from height whilst randomly pathing.
- `avoidFire` boolean, whether the ped will avoid fire whilst randomly pathing.
- `avoidPeds` boolean, whether the ped will avoid other peds whilst randomly pathing.
- `avoidTearGas` boolean, whether the ped will avoid tear gas whilst randomly pathing.
- `avoidWater` boolean, whether the ped will avoid water whilst randomly pathing.

###### Movement

```lua
['Movement'] = {
    disableCrouch = false,
    disableDives = false,
    disableClimbing = false,
    disableLadders = false
},
```

- `disableCrouch` boolean, whether the ped will can crouch.
- `disableDives` boolean, whether the ped will can evasive dive.
- `disableClimbing` boolean, whether the ped will can climb over objects.
- `disableLadders` boolean, whether the ped will can climb ladders.

###### Ragdoll

```lua
['Ragdolling'] = {
    canRagdoll = true,
    pedImpact = true,
    vehicleImpact = true,
    bulletImpact = true,
    explosion = true,
    fire = true,
    electrocution = true,
    objectImpact = true,
    melee = true,
    waterjetImpact = true,
    drowning = true,
    falling = true,
    onBoats = true,
    rubberBullet = true,
    smokeGrenades = true,
    pedCollision = true,
    vehicleCollision = true,
    playerImpact = true,
    aiRagdollImpact = true,
    playerRagdollImpact = true,
    minorPlayerImpact = true,
    ragdollOnDeath = true
}
```

- `canRagdoll` boolean, whether the ped can ragdoll.
- `pedImpact` boolean, whether the ped will ragdoll from ped impacts.
- `vehicleImpact` boolean, whether the ped will ragdoll from vehicle impacts.
- `bulletImpact` boolean, whether the ped will ragdoll from bullet impacts.
- `explosion` boolean, whether the ped will ragdoll from explosions.
- `fire` boolean, whether the ped will ragdoll from fires.
- `electrocution` boolean, whether the ped will ragdoll from being electrocuted.
- `objectImpact` boolean, whether the ped will ragdoll from object impacts.
- `melee` boolean, whether the ped will ragdoll from melee attacks.
- `waterjetImpact` boolean, whether the ped will ragdoll from water jet impacts.
- `drowning` boolean, whether the ped will ragdoll from drowning.
- `falling` boolean, whether the ped will ragdoll from falling.
- `onBoats` boolean, whether the ped will ragdoll from being on boats whilst they're moving.
- `rubberBullet` boolean, whether the ped will ragdoll from rubber bullet impacts.
- `smokeGrenades` boolean, whether the ped will ragdoll from smoke grenade impacts.
- `pedCollision` boolean, whether the ped will ragdoll from ped collisions.
- `vehicleCollision` boolean, whether the ped will ragdoll from vehicle collisions.
- `playerImpact` boolean, whether the ped will ragdoll from player impacts.
- `aiRagdollImpact` boolean, whether the ped will ragdoll from ai ragdoll impacts.
- `playerRagdollImpact` boolean, whether the ped will ragdoll from player ragdoll impacts.
- `minorPlayerImpact` boolean, whether the ped will ragdoll from minor player impacts.
- `ragdollOnDeath` boolean, whether the ped will ragdoll on death.

##### Relationship Settings

```lua
['Relationships'] = {
    [0] = {'police', 'ambulance', 'fire', 'ARMY'},
    [1] = 'security',
    [5] = 'PLAYER',
    override = 'Zancudo_Army_Base'
}
```

Relationships have 6 Levels, 0 for Companion, 1 for Respect, 2 for Like, 3 for Neutral, 4 for Dislike and 5 for Hate. Use the desired level as a table index and then specify the job or jobs you want to set the relationship for. For the Patrols general hostility towards players, ensure table index 5 or 4 has the string `PLAYER` in it.

0. Companion | Will never be triggered by hostile actions, and will help the player if they are attacked.
1. Respect | Will only be triggered by extreme hostile actions, and will help the player if they are attacked.
2. Like | Will only be triggered by extreme hostile actions.
3. Neutral | Will be triggered by hostile actions.
4. Dislike | Will be triggered by hostile actions, and will attack the player if they are attacked.
5. Hate | Will be triggered by any hostile action, and will attack the player on sight.

- `override` string, the name of the relationship override, this is used to set the same relationship between different Patrols.

#### Known Issues

##### Patrol Limits

- On FiveM build (6356) CPatrolNodeLimit has a lower cap (~50), throwing an error when trying to create more patrols than the ascribed limit. This issue has been resolved without the need to increase Game Pool sizes, and use's Sequences to replace TaskPatrol, thus alleviating the issue.

### Copyright

Copyright © 2022, Hulieo Anderson

### TOS

[Terms of Service](https://dons-developments.tebex.io/terms)

### Support

- Join my [discord](https://discord.gg/tVA58nbBuk).
- Open a ticket and please have your Tebex Transation ID ready 🙂.

### Changelog

- v1.4.4 - Update Lua Language Server comments & Fix Server Console Error Spam due to Uknown Entity.
- v1.4.3 - Various linting Updates, Added New Loot Ped Feature and Custom Loot Tables per Ped and More Fixes to Patrols Starting on ESX.
- v1.4.2 - Fixed Issue Where Guarding and Walking Patrols Wouldn't Face the Correct Heading, Fixed issue with Patrols not starting w/o a restart on ESX, Ensure Guarding Patrols Return to their Original Position after being Retasked & Fixed Issue Where Guards w/o Firearms would get Stuck Between Attacking and Guarding.
- v1.4.1 - Changed to Use Promises in Version Checker, Updated README & Added New Preview Links.
- v1.4.0 - Created Version Checker & Fix Bug Related to Reseting Patrols.
- v1.3.9 - Add Final Cayo Locations, Fix Bug with Vehicle Patrols Passengers not being able to Find their Seat when other Vehicles were Active in the Same Patrol.
- v1.3.8 - Improve Performance of ReTasking Event, Updates to Relationship Syncing & Add NextPoint in route check when re-tasking.
- v1.3.7 - Update README & Config links, Improve Comments & Add More Cayo Patrols.
- v1.3.6 - Improve typings in annotations (and annotations overall), Improve Flee function AI and to include all new vehicle types.
- v1.3.5 - Added chair prop to Guard Config, Add Scenarios to some default Patrols & Removed Unused Tables.
- v1.3.4 - Change Debug Prints to be More Descriptive & Add Scenarios to Patrols (not just Guards).
- v1.3.3 - Improve Blip Config, Added Ally & Enemy Blip Colours, Added Blip Forced On & Stopped Blips Appearing on main map.
- v1.3.2 - Implemented First Heli Patrol & Added Freeze function between tasking and net owner changes.
- v1.3.1 - Implemented First Boat Patrol, Finished Cayo Weed Farm and Start Cayo Town 3.
- v1.3.0 - Cleanup Pass; Remove Unused Code, Improve Code Readability & Reduced Wait time on spawning & tasking.
- v1.2.9 - Add Passenger Checks to Prevent Vehicle Patrols from leaving without their passengers & more Improvements to GetSeat.
- v1.2.8 - Improve GetSeat check for vehicle peds & Fixed Bug Where Vehicle would find new drivers whilst having one.
- v1.2.7 - Initialised 4 More Cayo Perico Patrols.
- v1.2.6 - Create Event to Sync Relationships across clients & Change PlayerDowned function to use framework specific metadata.
- v1.2.5 - Add Auto Framework Detection.
- v1.2.4 - Restructure File, moving `lib` and `config` to the `shared` folder & Refactor style to follow [Lua Style Guide](https://github.com/DonHulieo/lua-style-guide).
- v1.2.3 - Begin Implementing Cayo Perico Patrols.
- v1.2.2 - Add Job.type support for QBCore.
- v1.2.1 - Improve Tasking Functions, Improve JobData Collection & Add GameBuild 2060+ to Dependecies.
- v1.2.0 - Reworked Guard peds to be able to complete any Scenario whilst guarding, opposed to just using `StandGuard`.
- v1.1.9 - Changed all Walking tasks to utilise navmeshes for smoothness & All Old Patrols excluding Cayo Perico updated to the new format.
- v1.1.8 - Created First New Patrol Route (Zancudo Military), Create a death thread to ensure calm AI to downed players & add brandish to ped config.
- v1.1.7 - Rework README to implement config changes and improve readability.
- v1.1.6 - More Robust Ped & Patrol Configuration w/ functions to suit, Initialised EntityDump for tracking dropped peds on the server & Finished Statebag Implementation.
- v1.1.5 - Start of large refactor, Annotated all Code and Began Statebag Implementation.
- v1.1.4 - Added Multi-Framework Support.
- v1.1.3 - Added New Config Options `pedSettings.suffersCrits`, `pedSettings.diesWhenInjured` and `pedSettings.pathing.canRagdoll`. Small Code Cleanup.
- v1.1.2 - Fixed an error on the server where the Ped didn't exist and had it's coords checked.
- v1.1.1 - Added a table of Threads to handle Vehicle Patrols whilst having multiple clients nearby. This should fix drivers staying in the same place when the network owner leaves the area.
- v1.1.0 - Proper Syncing between Clients, Ensuring Vehicle Patrols stay Tasked when players leave area and Optimised Functionality for Checking for Closest Players.
- v1.0.9 - New Function for Finding Closest Player, and Added an Event to Retask a Patrol after changing Owners.
- v1.0.8 - Added a failsafe for when a player leaves the area but other players are nearby.
- v1.0.7 - More Failsafes for Vehicle Patrols.
- v1.0.6 - More Debug Prints, attempted Fixes of Patrols Duplicating.
- v1.0.5 - Added Debug Mode and Fixed a bug where Driver Peds wouldn't attack a Players Friends.
- v1.0.4 - Linting and General Fixes.
- v1.0.3 - Added Fail Safes' for Drivers Despawning when a Player is too far away.
- v1.0.2 - Added `pedSettings.relNameOverride` and Vehicle Patrols will now chase down the player if they are in a vehicle.
- v1.0.1 - Added Config Options for Distance Checks.
- v1.0.0 - Initial Release
