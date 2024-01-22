Config = {}

Config.DebugMode = false -- Set true if you want to see debug messages in the console

Config.Cooldown = 15 -- In minutes // Cooldown for the active patrol to respawn after it's been spawned
Config.DeathPercent = 80 -- Percentage of patrol members that can die before the patrol is removed // 75 = 75% of the patrol members can die before the patrol is removed
Config.ResetsOnDeath = false -- Set true if you want the patrol to respawn after it's been removed due to deaths rather than waiting for the cooldown
Config.DeleteOnReset = false -- Set true if you want the patrol to be deleted when it's removed due to deaths rather than waiting for engine to despawn it
Config.SpawnDistance = 500.0 -- Distance from any patrol point to spawn the patrol // 250 = 250 meters from any patrol point
Config.DespawnDistance = 1000.0 -- Distance from any patrol point to despawn the patrol // 500 = 500 meters from any patrol point

Config.UI = {
  uiType = 'qb-target', -- Set to 'qb-target' for QBCore target, 'ox-target' for Ox target, 'drawtext' for Native Drawtext or 'helptext' for Native Helptext
  label = 'Search', -- Label for the target or Text message
  icon = 'fas fa-search', -- Icon for the target
  key = 38, -- Key to press to search the ped if not using a target system | https://docs.fivem.net/docs/game-references/controls/#controls
  ['Items'] = {
    notify = 'framework', -- Set to 'native', 'framework' or false
    title = 'Item Found', -- Title for the notification, only used if notify is set to 'native'
    text = 'You found %s x %s', -- Text for the notification, only used if notify is set to 'native'
    images = 'https://cfx-nui-qb-inventory/html/images/' -- Image for the notification, only used if notify is set to 'native'
  },
}

------------------------------------------------------------------------------------------------------------------------------

Config.Locations = {
  {
    name = 'Zancudo_SGate',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(-1593.87, 2797.64, 17.07), heading = 135.58, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Guard Booth | https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json
        {coords = vector3(-1592.11, 2799.16, 17.07), heading = 311.15, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'} -- Guard Booth
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 750, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095&#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 150.0, -- The range other peds can 'see' the ped from
            seeing = 150.0, -- The range the ped can see actions from
            peripheral = 150.0, -- The range the ped can see actions no directly in front of them
            hearing = 150.0, -- The range the ped can hear actions from
            shout = 150.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_specialcarbine',
            health = 200,
            armour = 50,
            ammo = 750,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped is blocked by the enviroment for raising their weapon
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base' -- If multiple patrols need to be friendly to each other, set this as the same for each patrol
      },
    }
  }, {
    name = 'Zancudo_NGate',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(-2302.88, 3385.7, 31.26), heading = 143.86, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Guard Booth | https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json
        {coords = vector3(-2301.31, 3387.83, 31.26), heading = 321.56, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'} -- Guard Booth
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 750, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 150.0, -- The range other peds can 'see' the ped from
            seeing = 150.0, -- The range the ped can see actions from
            peripheral = 150.0, -- The range the ped can see actions no directly in front of them
            hearing = 150.0, -- The range the ped can hear actions from
            shout = 150.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_specialcarbine',
            health = 200,
            armour = 50,
            ammo = 750,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base'
      }
    }
  }, {
    name = 'Zancudo_Barracks',
    ['Enabled'] = {guards = false, patrols = true, vehicles = true},
    ['Routes'] = {
      patrol = {
        { -- Barracks Patrol
          {coords = vector3(-1826.44, 3296.78, 32.83), heading = 332.92, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1791.71, 3277.2, 32.77), heading = 238.37, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1743.14, 3248.95, 32.81), heading = 333.22, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1785.16, 3176.31, 32.83), heading = 152.92, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1819.5, 3195.79, 32.79), heading = 59.17, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1867.65, 3225.62, 32.85), heading = 153.11, time = math.random(1000, 5000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}
        }
      },
      vehicle = {
        { -- Barrack Vehicle Patrol w/ 10 Guards
          {coords = vector3(-1843.61, 3314.74, 32.94), speed = 30.0, flags = 203966903},
          {coords = vector3(-1716.95, 3241.34, 32.54), speed = 30.0, flags = 203966903},
          {coords = vector3(-1741.59, 3161.12, 32.55), speed = 30.0, flags = 203966903},
          {coords = vector3(-1894.12, 3231.54, 32.56), speed = 30.0, flags = 203966903}
        }
      }
    },
    ['Peds'] = {
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_marine_03', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 750, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 150.0, -- The range other peds can 'see' the ped from
            seeing = 150.0, -- The range the ped can see actions from
            peripheral = 150.0, -- The range the ped can see actions no directly in front of them
            hearing = 150.0, -- The range the ped can hear actions from
            shout = 150.0 -- The range the ped can communicate with other peds from
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          ['Base'] = {
            model = 's_m_y_marine_02',
            weapon = 'weapon_combatpistol',
            health = 200,
            armour = 0,
            ammo = 250,
            brandish = false,
            flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
            ['Loot'] = {
              {item = 'weapon_combatpistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 500.0,
            id = 300.0,
            seeing = 300.0,
            peripheral = 300.0,
            hearing = 300.0,
            shout = 300.0
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'barracks', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 10, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 10.0, -- Range is 0.0 - 15.0
          plate = 'ARMY' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base'
      }
    }
  }, {
    name = 'Zancudo_MHanger',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(-1712.11, 3005.23, 33.19), heading = 14.08, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Guard Booth | https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json
        {coords = vector3(-1711.84, 3002.98, 33.19), heading = 190.94, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Guard Booth
        {coords = vector3(-1755.3, 3004.0, 59.34), heading = 243.71, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Hanger Sniper South
        {coords = vector3(-1824.28, 3043.96, 59.34), heading = 61.64, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'} -- Hanger Sniper North
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 750, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 150.0, -- The range other peds can 'see' the ped from
            seeing = 150.0, -- The range the ped can see actions from
            peripheral = 150.0, -- The range the ped can see actions no directly in front of them
            hearing = 150.0, -- The range the ped can hear actions from
            shout = 150.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_specialcarbine',
            health = 200,
            armour = 50,
            ammo = 750,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base' -- If multiple patrols need to be friendly to each other, set this as the same for each patrol
      },
    }
  }, {
    name = 'Zancudo_Mechanic',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(-1788.28, 3144.11, 33.07), heading = 66.14, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Guard Booth | https://github.com/DurtyFree/gta-v-data-dumps/blob/master/scenariosCompact.json
        {coords = vector3(-1793.07, 3083.93, 32.81), heading = 295.53, scenario = 'WORLD_HUMAN_SMOKING'}, -- Mechanic Shop
        {coords = vector3(-1716.27, 3148.69, 51.93), heading = 182.17, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- Water Tower Sniper South
        {coords = vector3(-1720.41, 3153.56, 51.93), heading = 71.29, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'} -- Water Tower Sniper North
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 750, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 150.0, -- The range other peds can 'see' the ped from
            seeing = 150.0, -- The range the ped can see actions from
            peripheral = 150.0, -- The range the ped can see actions no directly in front of them
            hearing = 150.0, -- The range the ped can hear actions from
            shout = 150.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_armymech_01',
            weapon = 'weapon_combatpistol',
            health = 200,
            armour = 50,
            ammo = 250,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_combatpistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_03',
            weapon = 'weapon_sniperrifle',
            health = 250,
            armour = 100,
            ammo = 150,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_sniperrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 500.0,
            id = 500.0,
            seeing = 500.0,
            peripheral = 500.0,
            hearing = 500.0,
            shout = 500.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_03',
            weapon = 'weapon_sniperrifle',
            health = 250,
            armour = 100,
            ammo = 150,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_sniperrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 500.0,
            id = 500.0,
            seeing = 500.0,
            peripheral = 500.0,
            hearing = 500.0,
            shout = 500.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base' -- If multiple patrols need to be friendly to each other, set this as the same for each patrol
      },
    }
  }, {
    name = 'Zancudo_A2Hanger',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(-1994.09, 3144.1, 55.4), heading = 151.63, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- South East Corner
      },
      patrol = {
        { -- South West Corner
          {coords = vector3(-2038.43, 3194.25, 50.29), heading = 12.17, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-2041.06, 3191.91, 50.29), heading = 61.35, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2052.23, 3177.46, 55.4), heading = 109.74, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2045.45, 3173.35, 55.4), heading = 215.35, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'}
        }, { -- North West Corner
          {coords = vector3(-2008.8, 3246.71, 55.4), heading = 40.63, time = math.random(15000, 30000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-2004.96, 3244.35, 55.4), heading = 268.43, time = math.random(15000, 30000), scenario = 'WORLD_HUMAN_BINOCULARS'}
        }, { -- North East Corner
          {coords = vector3(-1947.56, 3211.32, 55.4), heading = 286.59, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-1955.51, 3216.16, 55.4), heading = 26.37, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1962.44, 3192.9, 49.87), heading = 196.49, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-1954.44, 3204.48, 49.87), heading = 239.5, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-1948.18, 3209.95, 55.4), heading = 199.12, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}
        }
      },
      vehicle = {
        { -- Winky Patrol South
          {coords = vector3(-1968.27, 3143.59, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-1947.57, 3225.48, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-2028.55, 3253.17, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-1988.69, 3108.06, 32.81), speed = 15.0, flags = 447}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_marine_03', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_sniperrifle', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 150, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_sniperrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 500.0, -- The range players can see the ped from
            id = 500.0, -- The range other peds can 'see' the ped from
            seeing = 500.0, -- The range the ped can see actions from
            peripheral = 500.0, -- The range the ped can see actions no directly in front of them
            hearing = 500.0, -- The range the ped can hear actions from
            shout = 500.0 -- The range the ped can communicate with other peds from
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_03',
            weapon = 'weapon_marksmanrifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          {
            ['Base'] = {
              model = 's_m_m_marine_01',
              weapon = 'weapon_carbinerifle',
              health = 200,
              armour = 50,
              ammo = 500,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
              ['Loot'] = {
                {item = 'weapon_carbinerifle', amount = 1},
                {item = 'rifle_ammo', amount = {10, 15}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_m_marine_02',
              weapon = 'weapon_combatpistol',
              health = 100,
              armour = 0,
              ammo = 250,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_combatpistol', amount = 1},
                {item = 'pistol_ammo', amount = {15, 20}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'squaddie', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = false, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 0.0, -- Range is 0.0 - 15.0
          plate = 'ARMY' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base'
      }
    }
  }, {
    name = 'Zancudo_A1Hanger',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(-2137.17, 3320.52, 55.38), heading = 326.51, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- North West Corner (Roof)
        {coords = vector3(-2123.31, 3219.28, 55.38), heading = 149.97, scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'}, -- South East Corner (Roof)
      },
      patrol = {
        { -- South West Corner (Roof)
          {coords = vector3(-2168.26, 3268.79, 50.3), heading = 20.22, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-2170.66, 3266.66, 50.3), heading = 64.17, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2182.33, 3252.37, 55.38), heading = 96.16, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2175.83, 3248.28, 55.38), heading = 183.83, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'}
        }, { -- North East Corner (Roof)
          {coords = vector3(-2077.67, 3286.38, 55.38), heading = 283.98, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'},
          {coords = vector3(-2085.28, 3290.7, 55.38), heading = 20.71, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2092.18, 3267.84, 49.86), heading = 187.6, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_GUARD_STAND_ARMY'},
          {coords = vector3(-2084.33, 3279.3, 49.86), heading = 240.24, time = math.random(5000, 10000), scenario = 'WORLD_HUMAN_BINOCULARS'}
        }
      },
      vehicle = {
        { -- Winky Patrol North
          {coords = vector3(-2101.53, 3216.72, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-2077.08, 3300.55, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-2166.85, 3313.11, 32.81), speed = 15.0, flags = 447},
          {coords = vector3(-2142.79, 3198.52, 32.81), speed = 15.0, flags = 447}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_specialcarbine', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_specialcarbine', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 300.0, -- The range players can see the ped from
            id = 200.0, -- The range other peds can 'see' the ped from
            seeing = 200.0, -- The range the ped can see actions from
            peripheral = 200.0, -- The range the ped can see actions no directly in front of them
            hearing = 200.0, -- The range the ped can hear actions from
            shout = 200.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_03',
            weapon = 'weapon_sniperrifle',
            health = 250,
            armour = 100,
            ammo = 150,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_sniperrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 500.0,
            id = 500.0,
            seeing = 500.0,
            peripheral = 500.0,
            hearing = 500.0,
            shout = 500.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_01',
            weapon = 'weapon_marksmanrifle',
            health = 200,
            armour = 50,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_marine_03',
            weapon = 'weapon_marksmanrifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_marksmanrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          {
            ['Base'] = {
              model = 's_m_m_marine_01',
              weapon = 'weapon_carbinerifle',
              health = 200,
              armour = 50,
              ammo = 500,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
              ['Loot'] = {
                {item = 'weapon_carbinerifle', amount = 1},
                {item = 'rifle_ammo', amount = {10, 15}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_m_marine_02',
              weapon = 'weapon_combatpistol',
              health = 100,
              armour = 0,
              ammo = 250,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_combatpistol', amount = 1},
                {item = 'pistol_ammo', amount = {15, 20}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'squaddie', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = false, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 0.0, -- Range is 0.0 - 15.0
          plate = 'ARMY' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base'
      }
    }
  }, {
    name = 'Zancudo_Heli',
    ['Enabled'] = {guards = false, patrols = false, vehicles = true},
    ['Routes'] = {
      vehicle = {
        { -- Heli Patrol
          {coords = vector3(-1982.19, 2884.1, 75.53), speed = 15.0},
          {coords = vector3(-1990.79, 3107.77, 74.43), speed = 15.0},
          {coords = vector3(-2349.25, 3167.43, 68.58), speed = 15.0},
          {coords = vector3(-2387.64, 3024.77, 76.35), speed = 15.0}
        }
      }
    },
    ['Peds'] = {
      vehicle = {-- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
        {
          ['Base'] = {
            model = 's_m_m_marine_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_carbinerifle', -- https://forge.plebmasters.de/weapons/
            health = 200, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 500.0, -- The range players can see the ped from
            id = 500.0, -- The range other peds can 'see' the ped from
            seeing = 500.0, -- The range the ped can see actions from
            peripheral = 500.0, -- The range the ped can see actions no directly in front of them
            hearing = 500.0, -- The range the ped can hear actions from
            shout = 500.0 -- The range the ped can communicate with other peds from
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'valkyrie2', -- https://forge.plebmasters.de/vehicles
          vehType = 'heli', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 4, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 0.0, -- Range is 0.0 - 15.0
          plate = 'ARMY' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = true, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = true, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = true, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 42, 44, 46, 53, 80, 85}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 100, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 1, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = false, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = false, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Zancudo_Army_Base'
      }
    }
  }, {
    name = 'Grapeseed_Weed_Farm',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(2221.26, 5614.62, 54.87), heading = 113.48, scenario = 'WORLD_HUMAN_STUPOR'}, -- Front Door of House
        {coords = vector3(2229.87, 5574.94, 53.76), heading = 226.39, scenario = 'WORLD_HUMAN_DRUG_FIELD_WORKERS_RAKE'}, -- Weed Plants South
        {coords = vector3(2217.74, 5578.89, 53.76), heading = 24.41, scenario = 'WORLD_HUMAN_DRUG_FIELD_WORKERS_WEEDING'} -- Weed Plants North
      },
      patrol = {
        { -- Property Rotation
          {coords = vector3(2220.17, 5626.11, 55.08), heading = 96.24, time = math.random(5000, 10000)},
          {coords = vector3(2197.41, 5611.88, 53.6), heading = 323.59, time = math.random(5000, 10000)},
          {coords = vector3(2197.9, 5585.6, 53.66), heading = 251.47, time = math.random(5000, 10000)},
          {coords = vector3(2202.77, 5555.21, 54.09), heading = 351.83, time = math.random(5000, 10000)},
          {coords = vector3(2238.05, 5576.23, 54.02), heading = 85.72, time = math.random(5000, 10000)},
          {coords = vector3(2236.59, 5610.99, 54.71), heading = 273.5, time = math.random(5000, 10000)}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 'a_m_m_hillbilly_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_bottle', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_bottle', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 'u_m_o_taphillbilly',
            weapon = 'weapon_knife',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_knife', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }, {
          ['Base'] = {
            model = 'a_m_m_hillbilly_02',
            weapon = 'weapon_hatchet',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_hatchet', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 'ig_old_man2',
            weapon = 'weapon_doubleaction',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_doubleaction', amount = 1},
              {item = 'shotgun_ammo', amount = {10, 15}},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 2}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 46, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 60, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 40, -- 0 - 100
        alertness = 1, -- 0 = Calm, 3 = Paranoid
        movement = 2, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 1, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'AMBIENT_GANG_HILLBILLY', 'Oneills_Ranch'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
      }
    }
  }, {
    name = 'Oneills_Ranch',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(2435.67, 4968.85, 42.35), heading = 316.42, scenario = 'WORLD_HUMAN_DRUG_PROCESSORS_COKE'}, -- Basement Processing Room
        {coords = vector3(2432.58, 4960.12, 46.82), heading = 318.32, scenario = 'WORLD_HUMAN_GUARD_STAND_CLUBHOUSE'} -- Basement Stairs
      },
      patrol = {
        { -- Top Floor Rotation
          {coords = vector3(2453.9, 4970.12, 51.57), heading = 183.9, time = math.random(7500, 12500)},
          {coords = vector3(2460.72, 4976.71, 51.57), heading = 276.67, time = math.random(7500, 12500)},
          {coords = vector3(2449.4, 4988.46, 51.57), heading = 2.1, time = math.random(7500, 12500)},
          {coords = vector3(2434.74, 4973.68, 51.57), heading = 92.98, time = math.random(7500, 12500)},
          {coords = vector3(2447.33, 4976.63, 51.56), heading = 316.31, time = math.random(7500, 12500)}
        }, { -- Bottom Floor Rotation
          {coords = vector3(2432.42, 4975.99, 46.57), heading = 128.41, time = math.random(7500, 12500)},
          {coords = vector3(2440.75, 4963.22, 46.81), heading = 220.25, time = math.random(7500, 12500)},
          {coords = vector3(2447.6, 4963.3, 46.57), heading = 231.4, time = math.random(7500, 12500)},
          {coords = vector3(2464.16, 4975.25, 46.57), heading = 304.5, time = math.random(7500, 12500)},
          {coords = vector3(2447.25, 4991.27, 46.56), heading = 46.66, time = math.random(7500, 12500)}
        }
      },
      vehicle = {
        { -- Sanchez Property Rotation
          {coords = vector3(2436.89, 4991.56, 46.01), speed = 25.0, flags = 786432},
          {coords = vector3(2376.01, 4927.04, 42.42), speed = 25.0, flags = 786432},
          {coords = vector3(2494.14, 4819.83, 35.42), speed = 25.0, flags = 786432},
          {coords = vector3(2540.92, 4880.4, 37.57), speed = 25.0, flags = 786432},
          {coords = vector3(2481.42, 4994.92, 46.2), speed = 25.0, flags = 786432}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 'a_m_m_hillbilly_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_bottle', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_bottle', amount = 1},
              {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 'a_m_m_hillbilly_02',
            weapon = 'weapon_sawnoffshotgun',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_sawnoffshotgun', amount = 1},
              {item = 'shotgun_ammo', amount = {10, 15}},
              {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 'ig_old_man2',
            weapon = 'weapon_pistol',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_pistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}},
              {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }, {
          ['Base'] = {
            model = 'u_m_o_taphillbilly',
            weapon = 'weapon_pistol',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_pistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}},
              {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      },
      vehicle = {
        {  -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          {
            ['Base'] = {
              model = 'a_m_m_hillbilly_01',
              weapon = 'weapon_knife',
              health = 100,
              armour = 0,
              ammo = 0,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 366, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
              ['Loot'] = {
                {item = 'weapon_knife', amount = 1},
                {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 150.0,
              seeing = 150.0,
              peripheral = 150.0,
              hearing = 150.0,
              shout = 150.0
            }
          }, {
            ['Base'] = {
              model = 'u_m_o_taphillbilly',
              weapon = 'weapon_dbshotgun',
              health = 100,
              armour = 0,
              ammo = 250,
              brandish = true,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_dbshotgun', amount = 1},
                {item = 'shotgun_ammo', amount = {10, 15}},
                {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 150.0,
              seeing = 150.0,
              peripheral = 150.0,
              hearing = 150.0,
              shout = 150.0
            }
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'manchez', -- https://forge.plebmasters.de/vehicles
          vehType = 'bike', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = false, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 15.0, -- Range is 0.0 - 15.0
          plate = 'ONIELLS' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 46, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 60, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 40, -- 0 - 100
        alertness = 1, -- 0 = Calm, 3 = Paranoid
        movement = 2, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 1, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'AMBIENT_GANG_HILLBILLY', 'Grapeseed_Weed_Farm'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
      }
    }
  }, {
    name = 'Power_Station',
    ['Enabled'] = {guards = false, patrols = true, vehicles = true},
    ['Routes'] = {
      patrol = {
        { -- Outside Rotation
          {coords = vector3(2792.84, 1482.39, 24.54), heading = 252.73, time = math.random(10000, 15000)},
          {coords = vector3(2841.6, 1469.82, 24.56), heading = 31.1, time = math.random(10000, 15000)},
          {coords = vector3(2864.72, 1518.81, 24.57), heading = 69.71, time = math.random(10000, 15000)},
          {coords = vector3(2877.61, 1572.13, 24.57), heading = 118.73, time = math.random(10000, 15000)},
          {coords = vector3(2824.88, 1586.44, 24.56), heading = 212.23, time = math.random(10000, 15000)},
          {coords = vector3(2806.66, 1535.1, 24.54), heading = 255.71, time = math.random(10000, 15000)}
        }, { -- South Generators (inner) Rotation
          {coords = vector3(2847.28, 1518.05, 24.57), heading = 124.63, time = math.random(10000, 15000)},
          {coords = vector3(2810.52, 1527.73, 24.57), heading = 216.21, time = math.random(10000, 15000)},
          {coords = vector3(2807.33, 1517.32, 24.57), heading = 252.62, time = math.random(10000, 15000)},
          {coords = vector3(2843.6, 1507.71, 24.58), heading = 73.68, time = math.random(10000, 15000)},
          {coords = vector3(2841.03, 1498.31, 24.59), heading = 74.58, time = math.random(10000, 15000)},
          {coords = vector3(2805.21, 1507.78, 24.57), heading = 259.91, time = math.random(10000, 15000)},
          {coords = vector3(2802.89, 1498.31, 24.57), heading = 251.92, time = math.random(10000, 15000)},
          {coords = vector3(2839.11, 1488.71, 24.58), heading = 73.68, time = math.random(10000, 15000)}
        }
      },
      vehicle = {
        { -- Security Vehicle Rotation
          {coords = vector3(2766.9, 1414.67, 24.54), speed = 15.0, flags = 447},
          {coords = vector3(2799.21, 1532.0, 24.54), speed = 15.0, flags = 447},
          {coords = vector3(2823.47, 1671.34, 24.71), speed = 15.0, flags = 447},
          {coords = vector3(2707.13, 1703.1, 24.68), speed = 15.0, flags = 447},
          {coords = vector3(2687.02, 1616.73, 24.58), speed = 15.0, flags = 447}
        }
      }
    },
    ['Peds'] = {
      patrol = {
        {
          ['Base'] = {
            model = 's_m_m_armoured_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_flashlight', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 50, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = true, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_flashlight', amount = 1},
              {item = 'shotgun_ammo', amount = {10, 15}},
              {item = {'cokebaggy', 'crack_baggy', 'oxy', 'meth'}, amount = {1, 5}}
            }
          },
          ['Ranges'] = {
            lod = 150.0,
            id = 50.0,
            seeing = 50.0,
            peripheral = 50.0,
            hearing = 50.0,
            shout = 50.0
          }
        }, {
          ['Base'] = {
            model = 's_m_m_armoured_02',
            weapon = 'weapon_pistol',
            health = 250,
            armour = 50,
            ammo = 250,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_pistol', amount = 1},
              {item = 'pistol_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 150.0,
            id = 50.0,
            seeing = 50.0,
            peripheral = 50.0,
            hearing = 50.0,
            shout = 50.0
          }
        }
      },
      vehicle = {
        {  -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          ['Base'] = {
            model = 's_m_m_armoured_02',
            weapon = 'weapon_pistol',
            health = 250,
            armour = 50,
            ammo = 250,
            brandish = false,
            flags = {29, 32, 116, 151, 229, 241, 250, 366, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
            ['Loot'] = {
              {item = 'weapon_pistol', amount = 1},
              {item = 'pistol_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'dilettante2', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 1, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 0.0, -- Rangis is 0.0 - 15.0
          plate = 'SECURITY' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = true, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 3, ally = 4}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 14, 15, 22, 46}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 80, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 60, -- 0 - 100
        alertness = 2, -- 0 = Calm, 3 = Paranoid
        movement = 1, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 2, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = false, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'security', 'police', 'LEO', 'ambulance', 'fire', 'ARMY'}, -- Can be a table of jobs
        [3] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
      }
    }
  }, {
    name = 'Madrazos_Ranch',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(1414.07, 1138.14, 114.33), heading = 258.63, scenario = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER'}, -- Backyard Courtyard
        {coords = vector3(1382.75, 1168.57, 114.48), heading = 312.77, scenario = 'WORLD_HUMAN_GARDENER_PLANT'} -- Frontyard Golf Garden
      },
      patrol = {
        { -- South Pens Rotation
          {coords = vector3(1409.48, 1105.42, 114.29), heading = 182.12, time = math.random(8000, 10000)},
          {coords = vector3(1394.08, 1084.72, 114.33), heading = 273.59, time = math.random(8000, 10000)},
          {coords = vector3(1464.44, 1082.77, 114.33), heading = 180.16, time = math.random(8000, 10000)},
          {coords = vector3(1465.42, 1047.96, 114.33), heading = 4.58, time = math.random(8000, 10000)},
          {coords = vector3(1490.08, 1047.2, 114.33), heading = 4.58, time = math.random(8000, 10000)},
          {coords = vector3(1481.35, 1091.73, 114.33), heading = 1.92, time = math.random(8000, 10000)},
          {coords = vector3(1438.16, 1105.89, 114.12), heading = 94.67, time = math.random(8000, 10000)}
        }, { -- North Pens Rotation
          {coords = vector3(1482.77, 1129.84, 114.33), heading = 94.67, time = math.random(8000, 10000)},
          {coords = vector3(1474.28, 1174.85, 114.33), heading = 8.79, time = math.random(8000, 10000)},
          {coords = vector3(1440.49, 1175.31, 114.33), heading = 97.39, time = math.random(8000, 10000)},
          {coords = vector3(1442.92, 1131.99, 114.33), heading = 179.6, time = math.random(8000, 10000)}
        }
      },
      vehicle = {
        { -- Mesa Property Rotation
          {coords = vector3(1412.49, 1116.7, 114.84), speed = 10.0, flags = 262716},
          {coords = vector3(1431.78, 1095.73, 114.25), speed = 10.0, flags = 262716},
          {coords = vector3(1496.36, 1033.03, 113.68), speed = 10.0, flags = 262716},
          {coords = vector3(1503.51, 1169.32, 113.72), speed = 10.0, flags = 262716},
          {coords = vector3(1380.46, 1188.5, 112.74), speed = 10.0, flags = 262716},
          {coords = vector3(1352.54, 1145.55, 113.27), speed = 10.0, flags = 262716}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_gardener_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_hammer', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_hammer', amount = 1}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_m_gardener_01',
            weapon = 'weapon_golfclub',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_golfclub', amount = 1}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 'g_m_y_pologoon_01',
            weapon = 'weapon_unarmed',
            health = 150,
            armour = 0,
            ammo = 250,
            brandish = false,
            -- flags = {},
            ['Loot'] = false
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }, {
          ['Base'] = {
            model = 'g_m_y_pologoon_02',
            weapon = 'weapon_pistol',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_pistol', amount = 1},
              {item = 'pistol_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      },
      vehicle = {
        {  -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          ['Base'] = {
            model = 'g_m_y_pologoon_01',
            weapon = 'weapon_microsmg',
            health = 100,
            armour = 0,
            ammo = 500,
            brandish = false,
            flags = {29, 32, 116, 151, 229, 241, 250, 366, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
            ['Loot'] = {
              {item = 'weapon_microsmg', amount = 1},
              {item = 'smg_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 150.0,
            seeing = 150.0,
            peripheral = 150.0,
            hearing = 150.0,
            shout = 150.0
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'mesa', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 2, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 10.0, -- Range is 0.0 - 15.0
          plate = 'MADRAZO' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = true, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 21, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 80, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 60, -- 0 - 100
        alertness = 2, -- 0 = Calm, 3 = Paranoid
        movement = 2, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 2, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'police', 'LEO', 'ambulance', 'fire', 'AMBIENT_GANG_MEXICAN'}, -- Can be a table of jobs
        [1] = 'security', -- Or just a string
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
      }
    }
  }, {
    name = 'Cayo_Airport',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(4428.53, -4451.24, 4.33), heading = 341.6, scenario = 'WORLD_HUMAN_CLIPBOARD_FACILITY'}, -- Hanger Crates
        {coords = vector3(4424.36, -4452.15, 4.33), heading = 22.38, scenario = 'WORLD_HUMAN_INSPECT_STAND'}, -- Hanger 2nd Floor Room
        {coords = vector3(4446.58, -4451.53, 7.30), heading = 111.50, scenario = 'WORLD_HUMAN_GUARD_PATROL'} -- Hangar Patrol 2nd Floor
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 'ig_gustavo', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_gadgetpistol', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 250, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_gadgetpistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 'ig_helmsmanpavel',
            weapon = 'weapon_snspistol_mk2',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_snspistol_mk2', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_carbinerifle',
            health = 200,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Sniper_01',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(4879.06, -4486.11, 10.15), heading = 91.97, scenario = 'WORLD_HUMAN_LEANING'}, -- Bottom of Sniper Tower
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(4875.44, -4489.28, 26.93), heading = 136.21, time = 25000},
          {coords = vector3(4875.44, -4486.31, 26.93), heading = 77.04, time = 25000},
          {coords = vector3(4877.87, -4485.92, 26.93), heading = 4.72, time = 25000},
          {coords = vector3(4880.36, -4486.06, 26.93), heading = 260.11, time = 25000},
          {coords = vector3(4880.26, -4491.24, 26.93), heading = 224.92, time = 25000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_fieldworker_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_snspistol_mk2', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 250, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_snspistol_mk2', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_02',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Town_01',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(5035.41, -4631.62, 4.9), heading = 302.34, scenario = 'WORLD_HUMAN_SMOKING_POT'}, -- Bottom of Sniper Tower
        {coords = vector3(5092.69, -4683.02, 2.41), heading = 256.51, scenario = 'WORLD_HUMAN_DRUG_PROCESSORS_COKE'}, -- South Weed Processing
        {coords = vector3(5173.48, -4590.07, 3.73), heading = 167.78, scenario = 'WORLD_HUMAN_LEANING'}, -- Air Defense Bunker 1
        {coords = vector3(5173.57, -4591.74, 3.76), heading = 8.1, scenario = 'WORLD_HUMAN_HANG_OUT_STREET'} -- Air Defense Bunker 2
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(5033.29, -4633.29, 21.68), heading = 215.11, time = 25000},
          {coords = vector3(5030.27, -4632.82, 21.68), heading = 153.84, time = 25000},
          {coords = vector3(5030.63, -4627.96, 21.68), heading = 18.79, time = 25000},
          {coords = vector3(5035.84, -4628.91, 21.68), heading = 299.04, time = 25000}
        }
      },
      vehicle = {
        { -- Town Rotation
          {coords = vector3(5171.53, -4701.63, 1.61), speed = 15.0, flags = 6817912},
          {coords = vector3(5167.47, -4632.09, 2.0), speed = 15.0, flags = 6817912},
          {coords = vector3(5113.26, -4563.76, 3.56), speed = 15.0, flags = 6817912},
          {coords = vector3(5023.93, -4600.23, 4.17), speed = 15.0, flags = 6817912},
          {coords = vector3(5081.25, -4679.68, 1.89), speed = 15.0, flags = 6817912},
          {coords = vector3(5078.56, -4620.62, 1.94), speed = 15.0, flags = 6817912},
          {coords = vector3(5141.39, -4627.08, 1.87), speed = 15.0, flags = 6817912}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_fieldworker_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_snspistol_mk2', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 250, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_snspistol_mk2', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_m_drugprocess_01',
            weapon = 'weapon_machete',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_machete', amount = 1},
              {item = 'coke_small_brick', amount = {1, 2}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_02',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_03',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          {
            ['Base'] = {
              model = 's_m_y_blackops_01',
              weapon = 'weapon_carbinerifle',
              health = 250,
              armour = 100,
              ammo = 500,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
              ['Loot'] = {
                {item = 'weapon_carbinerifle', amount = 1},
                {item = 'rifle_ammo', amount = {10, 15}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_y_blackops_02',
              weapon = 'weapon_combatpistol',
              health = 250,
              armour = 100,
              ammo = 250,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_combatpistol', amount = 1},
                {item = 'pistol_ammo', amount = {15, 20}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'winky', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = false, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 15.0, -- Range is 0.0 - 15.0
          plate = 'CAYO' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Sniper_02',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(5142.17, -4953.36, 14.36), heading = 226.47, scenario = 'WORLD_HUMAN_STAND_MOBILE_UPRIGHT'}, -- Guard Booth
        {coords = vector3(5158.54, -4937.34, 14.04), heading = 348.71, scenario = 'WORLD_HUMAN_INSPECT_STAND'} -- Bottom of Sniper Tower
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(5156.57, -4933.76, 30.87), heading = 274.56, time = 25000},
          {coords = vector3(5154.18, -4936.06, 30.87), heading = 206.8, time = 25000},
          {coords = vector3(5150.63, -4933.27, 30.87), heading = 74.57, time = 25000},
          {coords = vector3(5153.99, -4928.97, 30.87), heading = 12.65, time = 25000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 'ig_helmsmanpavel', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_gadgetpistol', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 250, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_gadgetpistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_02',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Weed_Farm',
    ['Enabled'] = {guards = true, patrols = true, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(5465.81, -5238.44, 30.12), heading = 8.69, scenario = 'WORLD_HUMAN_HAMMERING'}, -- Bottom of Sniper Tower
        {coords = vector3(5320.2, -5224.88, 32.36), heading = 107.67, scenario = 'WORLD_HUMAN_DRUG_FIELD_WORKERS_RAKE'}, -- Farm 1
        {coords = vector3(5309.59, -5288.83, 33.9), heading = 39.67, scenario = 'WORLD_HUMAN_DRUG_FIELD_WORKERS_RAKE'} -- Farm 2
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(5467.76, -5234.81, 43.96), heading = 2.37, time = 25000},
          {coords = vector3(5468.66, -5237.84, 43.96), heading = 258.32, time = 25000},
          {coords = vector3(5463.59, -5238.99, 43.96), heading = 132.45, time = 25000},
          {coords = vector3(5462.67, -5233.64, 43.96), heading = 25.85, time = 25000},
          {coords = vector3(5466.03, -5238.73, 43.96), heading = 193.25, time = 25000}
        }
      },
      vehicle = {
        { -- Farm Vetir Loop Rotation
          {coords = vector3(5461.31, -5227.91, 27.24), speed = 12.0, flags = 203950200},
          {coords = vector3(5335.39, -5236.13, 32.51), speed = 7.5, flags = 203950200},
          {coords = vector3(5400.66, -5187.48, 32.17), speed = 7.5, flags = 203950200},
          {coords = vector3(5318.5, -5246.39, 32.58), speed = 7.5, flags = 203950200},
          {coords = vector3(5290.73, -5281.05, 32.34), speed = 7.5, flags = 203950200},
          {coords = vector3(5242.24, -5193.35, 14.58), speed = 25.0, flags = 203950200},
          {coords = vector3(5523.84, -5280.35, 12.86), speed = 25.0, flags = 203950200},
          {coords = vector3(5367.5, -5394.39, 44.05), speed = 15.0, flags = 203950200},
          {coords = vector3(5305.14, -5266.93, 32.74), speed = 20.0, flags = 203950200}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_lathandy_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_hammer', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_hammer', amount = 1}
            }
          },
          ['Ranges'] = {
            lod = 250.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_m_drugprocess_01',
            weapon = 'weapon_machete',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_machete', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }, {
          ['Base'] = {
            model = 's_m_m_drugprocess_01',
            weapon = 'weapon_machete',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_machete', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'rifle_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          ['Base'] = {
            model = 's_m_m_fieldworker_01',
            weapon = 'weapon_pistolxm3',
            health = 100,
            armour = 0,
            ammo = 250,
            brandish = false,
            flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
            ['Loot'] = {
              {item = 'weapon_pistolxm3', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'vetir', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 10, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 15.0, -- Range is 0.0 - 15.0
          plate = 'CAYO' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Radio',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(5361.55, -5434.67, 66.18), heading = 58.87, scenario = 'WORLD_HUMAN_INSPECT_STAND'} -- Sniper Tower
      },
      patrol = {
        { -- Radio Tower Loop
          {coords = vector3(5263.29, -5428.49, 141.05), heading = 148.9, scenario = 'WORLD_HUMAN_BINOCULARS', time = 45000},
          {coords = vector3(5265.34, -5426.6, 141.05), heading = 26.74, scenario = 'WORLD_HUMAN_BINOCULARS', time = 45000},
          {coords = vector3(5267.39, -5428.25, 141.05), heading = 275.84, scenario = 'WORLD_HUMAN_BINOCULARS', time = 45000},
          {coords = vector3(5266.94, -5430.47, 141.05), heading = 194.02, scenario = 'WORLD_HUMAN_BINOCULARS', time = 45000},
          {coords = vector3(5267.72, -5426.23, 141.05), heading = 330.93, scenario = 'WORLD_HUMAN_BINOCULARS', time = 45000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_02', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_carbinerifle', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_heavysniper',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_heavysniper', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 1000.0,
            id = 250.0,
            seeing = 500.0,
            peripheral = 500.0,
            hearing = 500.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Town_02',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(5187.33, -5147.79, 3.62), heading = 177.44, scenario = 'WORLD_HUMAN_DRUG_PROCESSORS_WEED', chair = `h4_prop_h4_weed_chair_01a`}, -- Weed Processing 1
        {coords = vector3(5184.16, -5152.1, 3.6), heading = 1.74, scenario = 'WORLD_HUMAN_DRUG_PROCESSORS_WEED', chair = `h4_prop_h4_weed_chair_01a`} -- Weed Processing 2
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(5147.79, -5056.03, 20.39), heading = 192.62, scenario = 'WORLD_HUMAN_GUARD_PATROL', time = 25000},
          {coords = vector3(5145.99, -5055.2, 20.39), heading = 85.73, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5146.66, -5050.88, 20.39), heading = 357.25, scenario = 'WORLD_HUMAN_GUARD_STAND', time = 25000},
          {coords = vector3(5151.13, -5050.91, 20.39), heading = 268.68, scenario = 'WORLD_HUMAN_INSPECT_STAND', time = 25000}
        }, { -- 2nd Sniper Tower Loop
          {coords = vector3(5044.26, -5117.33, 22.94), heading = 181.1, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5040.88, -5117.0, 22.94), heading = 94.36, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', time = 25000},
          {coords = vector3(5041.17, -5112.33, 22.94), heading = 6.45, scenario = 'WORLD_HUMAN_GUARD_PATROL', time = 25000},
          {coords = vector3(5046.31, -5112.59, 22.94), heading = 271.17, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000}
        }, { -- 3rd Sniper Tower Loop
          {coords = vector3(5140.04, -5241.72, 26.29), heading = 47.71, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5143.1, -5241.73, 26.29), heading = 343.88, scenario = 'WORLD_HUMAN_STAND_IMPATIENT', time = 25000},
          {coords = vector3(5143.09, -5246.32, 26.29), heading = 216.61, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5138.21, -5246.32, 26.29), heading = 130.49, scenario = 'WORLD_HUMAN_GUARD_PATROL', time = 25000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_m_drugprocess_01', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_machete', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 0, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_machete', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_m_drugprocess_01',
            weapon = 'weapon_machete',
            health = 100,
            armour = 0,
            ammo = 0,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_machete', amount = 1},
              {item = {'weed_whitewidow', 'weed_skunk', 'weed_purplehaze', 'weed_ogkush', 'weed_amnesia', 'weed_ak47'}, amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_03',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_02',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 53, 61, 80}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = false, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Town_03',
    ['Enabled'] = {guards = true, patrols = false, vehicles = true},
    ['Routes'] = {
      guard = {
        {coords = vector3(4837.34, -5177.69, 2.19), heading = 12.13, scenario = 'WORLD_HUMAN_LEANING'}, -- Air Defense Bunker 1
        {coords = vector3(4837.32, -5176.17, 2.18), heading = 185.74, scenario = 'WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE'} -- Air Defense Bunker 2
      },
      vehicle = {
        { -- Boat Rotation
          {coords = vector3(4915.12, -5125.88, 0.49), speed = 15.0, flags = 138938400},
          {coords = vector3(4776.8, -5260.9, 1.5), speed = 15.0, flags = 138938400},
          {coords = vector3(4691.77, -5197.42, 0.91), speed = 15.0, flags = 138938400},
          {coords = vector3(4863.2, -5145.86, 0.46), speed = 15.0, flags = 138938400}
        }, {
          {coords = vector3(4910.35, -5219.74, 2.1), speed = 5.0, flags = 2623496},
          {coords = vector3(4931.42, -5230.25, 2.05), speed = 15.0, flags = 2623496},
          {coords = vector3(4993.13, -5179.59, 2.06), speed = 15.0, flags = 2623496},
          {coords = vector3(4936.41, -5210.06, 2.06), speed = 15.0, flags = 2623496}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_02', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_carbinerifle', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      vehicle = {
        { -- If passenger number is set below, each peds copies the config from below and applies that to the amount of passengers deinfed below.
          {
            ['Base'] = {
              model = 's_m_y_blackops_01',
              weapon = 'weapon_carbinerifle',
              health = 250,
              armour = 100,
              ammo = 500,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398}, -- This has it's best use for vehicles, as no vehicle flags are set by default
              ['Loot'] = {
                {item = 'weapon_carbinerifle', amount = 1},
                {item = 'rifle_ammo', amount = {10, 15}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_y_blackops_02',
              weapon = 'weapon_combatpistol',
              health = 250,
              armour = 100,
              ammo = 250,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_combatpistol', amount = 1},
                {item = 'pistol_ammo', amount = {15, 20}}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_y_blackops_03',
              weapon = 'weapon_dagger',
              health = 250,
              armour = 100,
              ammo = 0,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_dagger', amount = 1}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }, {
            ['Base'] = {
              model = 's_m_y_blackops_01',
              weapon = 'weapon_switchblade',
              health = 250,
              armour = 100,
              ammo = 0,
              brandish = false,
              flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
              ['Loot'] = {
                {item = 'weapon_switchblade', amount = 1}
              }
            },
            ['Ranges'] = {
              lod = 250.0,
              id = 250.0,
              seeing = 250.0,
              peripheral = 250.0,
              hearing = 250.0,
              shout = 250.0
            }
          }
        }, {
          ['Base'] = {
            model = 'g_m_y_mexgoon_03',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            flags = {29, 32, 116, 151, 229, 241, 250, 184, 391, 398},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 150.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Vehicles'] = {
      {
        ['Base'] = {
          model = 'patrolboat', -- https://forge.plebmasters.de/vehicles
          vehType = 'boat', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = false, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 0.0, -- Range is 0.0 - 15.0
          plate = '' -- Can be omitted, but must have a maximum of 8 characters
        }
      }, {
        ['Base'] = {
          model = 'technical2', -- https://forge.plebmasters.de/vehicles
          vehType = 'automobile', -- Set to 'automobile' for cars, 'heli' for helicopters and 'boat' for boats
          passengers = 3, -- Can be omitted, will default to the table length of the peds array above
          lockType = 3, -- 0 = None, 1 = Unlocked, 2 = Locked, 3 = LockedForPlayer, 4 = LockedPlayerInside, 5 = LockedInitially
          health = 1000.0, -- Range is 0.0 - 1000.0
          dirtLevel = 15.0, -- Range is 0.0 - 15.0
          plate = 'CAYO' -- Can be omitted, but must have a maximum of 8 characters
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 53, 61, 80}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = false, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = false -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Sniper_03',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(4885.46, -5455.39, 30.74), heading = 357.43, scenario = 'WORLD_HUMAN_INSPECT_STAND'} -- Bottom of Sniper Tower
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(4889.95, -5458.33, 47.52), heading = 292.2, scenario = 'WORLD_HUMAN_INSPECT_STAND', time = 25000},
          {coords = vector3(4887.94, -5459.72, 47.52), heading = 181.5, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(4885.14, -5457.38, 47.52), heading = 92.32, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(4885.45, -5454.7, 47.52), heading = 337.93, scenario = 'WORLD_HUMAN_GUARD_PATROL', time = 25000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 'ig_helmsmanpavel', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_gadgetpistol', -- https://forge.plebmasters.de/weapons/
            health = 100, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 0, -- Range is 0-100
            ammo = 250, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_gadgetpistol', amount = 1},
              {item = 'pistol_ammo', amount = {15, 20}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_02',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            peripheral = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Sniper_04',
    ['Enabled'] = {guards = true, patrols = true, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(5105.09, -5525.19, 54.23), heading = 10.07, scenario = 'WORLD_HUMAN_LEANING'}, -- Air Defense Bunker 1
        {coords = vector3(5105.9, -5523.67, 54.22), heading = 141.52, scenario = 'WORLD_HUMAN_HANG_OUT_STREET_CLUBHOUSE'} -- Air Defense Bunker 2
      },
      patrol = {
        { -- Sniper Tower Loop
          {coords = vector3(5126.91, -5524.4, 70.97), heading = 351.19, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5126.32, -5528.62, 70.97), heading = 216.53, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000},
          {coords = vector3(5122.96, -5527.11, 70.97), heading = 124.5, scenario = 'WORLD_HUMAN_GUARD_PATROL', time = 25000},
          {coords = vector3(5121.84, -5525.15, 70.97), heading = 26.98, scenario = 'WORLD_HUMAN_BINOCULARS', time = 25000}
        }
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_03', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_carbinerifle', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      },
      patrol = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_militaryrifle',
            health = 250,
            armour = 100,
            ammo = 1000,
            brandish = true,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_militaryrifle', amount = 1},
              {item = 'snp_ammo', amount = {5, 10}}
            }
          },
          ['Ranges'] = {
            lod = 250.0,
            id = 250.0,
            seeing = 250.0,
            hearing = 250.0,
            shout = 250.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }, {
    name = 'Cayo_Mans_Gate',
    ['Enabled'] = {guards = true, patrols = false, vehicles = false},
    ['Routes'] = {
      guard = {
        {coords = vector3(4977.1, -5607.95, 23.77), heading = 326.87, scenario = 'WORLD_HUMAN_CLIPBOARD'}, -- Gate Boom
        {coords = vector3(4965.43, -5594.95, 23.74), heading = 90.04, scenario = 'WORLD_HUMAN_SMOKING'} -- Side Gate
      }
    },
    ['Peds'] = {
      guard = {
        {
          ['Base'] = {
            model = 's_m_y_blackops_03', -- Can be either a string or hash of the model ie. ('s_m_m_marine_01', `s_m_m_marine_01` or -220552467) | https://forge.plebmasters.de/peds
            weapon = 'weapon_carbinerifle', -- https://forge.plebmasters.de/weapons/
            health = 250, -- Default Male Ped Health is 100-200 & Female is 0-100
            armour = 100, -- Range is 0-100
            ammo = 500, -- Ped only uses ammo if useDiminishingAmmo is true
            brandish = false, -- Set to true if you want the ped to brandish their weapon when idle
            -- flags = {}, -- Can be used to set certain flags uniquely on peds, be careful however as most global patrol settings already utilise these below | https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#ePedConfigFlags
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0, -- The range players can see the ped from
            id = 100.0, -- The range other peds can 'see' the ped from
            seeing = 100.0, -- The range the ped can see actions from
            peripheral = 100.0, -- The range the ped can see actions no directly in front of them
            hearing = 100.0, -- The range the ped can hear actions from
            shout = 100.0 -- The range the ped can communicate with other peds from
          }
        }, {
          ['Base'] = {
            model = 's_m_y_blackops_01',
            weapon = 'weapon_carbinerifle',
            health = 250,
            armour = 100,
            ammo = 500,
            brandish = false,
            -- flags = {},
            ['Loot'] = {
              {item = 'weapon_carbinerifle', amount = 1},
              {item = 'rifle_ammo', amount = {10, 15}}
            }
          },
          ['Ranges'] = {
            lod = 200.0,
            id = 100.0,
            seeing = 100.0,
            peripheral = 100.0,
            hearing = 100.0,
            shout = 100.0
          }
        }
      }
    },
    ['Settings'] = {
      ['Behavior'] = {
        ignoreMelee = false, -- Set to true if you want the ped not react to melee actions
        ignoreFire = false, -- Set to true if you want the ped not react to fire
        ignoreBeingJacked = false, -- Set to true if you want the ped not react to being jacked
        ignoreSilencedClone = true, -- Set to true if you want the ped not react to silenced weapons
        ignoreExplosion = false, -- Set to true if you want the ped not react to explosions
        preventMeleeTaunts = false, -- Set to true if you want the ped not melee taunt
        disableHurt = false, -- Set to true if you want the ped not have hurt reactions
        disableWrithe = false, -- Set to true if you want the ped not writhe on the ground
        preferInjuredGetup = false, -- Set to true if you want the ped to prefer getting up from an injured state
        onlyWritheFromWeapon = false, -- Set to true if you want the ped to only writhe from weapon damage
        runFromFires = false, -- Set to true if you want the ped to run from fires
        dontShoutTarget = false, -- Set to true if you want the ped to not communicate their targets postion
        dontCryForHelp = false -- Set to true if you want the ped to not call for help when injured
      },
      ['Blips'] = {
        enabled = true, -- Set to true if you want the ped to have a blip
        hasCone = false, -- Whether the blip has a view cone on the minimap whilst active
        forcedOn = false, -- Whether the blip is always on the minimap
        colour = {enemy = 1, ally = 3}, -- https://docs.fivem.net/docs/game-references/blips/#blip-colors
        range = 50.0, -- The range the blip can be activated from
        clearOnDeath = true
      },
      ['Combat'] = {
        attributes = {5, 13, 14, 22, 46, 50, 61}, -- https://alexguirre.github.io/rage-parser-dumps/dump.html?game=gta5&build=3095#CCombatData__BehaviourFlags
        ability = 100, -- 0-50 = Poor, 50-75 = Average, 75+ = Professional
        accuracy = 80, -- 0 - 100
        alertness = 3, -- 0 = Calm, 3 = Paranoid
        movement = 3, -- 0 = Stationary, 1 = Defensive, 2 = WillAdvance, 3 = WillRetreat
        range = 3, -- 0 = Near, 1 = Medium, 2 = Far, 3 = VeryFar
        targetResponse = 2, -- 0 = Exist Task, 1 = Never Lose target, 2 = Search For Target
        canAttackFriendly = false, -- Whether the ped can attack friendly peds
        canUseCover = true, -- Whether the ped can use cover
        useDiminishingAmmo = true, -- Set false for the ped to have infinite ammo, true to use ammo declared in ['Peds']['Base'].ammo
        blockWeaponSwitching = false, -- Whether the ped can switch weapons
        enableWeaponBlocking = false, -- Whether the ped can block weapon attacks
        keepWeaponHolstered = true, -- Whether the ped will keep their weapon holstered until fired
        disableMelee = false, -- Whether the ped can use melee attacks
        disableUnarmedDriveby = false, -- Whether the ped can use unarmed drivebys
        disableWritheShooting = false, -- Whether the ped can shoot whilst writheing on the ground
        respondToHelpCries = true, -- Whether the ped will respond to help cries
        treatDislikeAsHated = true, -- Whether the ped will treat dislike as hated (Relationship type 4)
        treatNonFriendlyAsHated = true -- Whether the ped will treat non friendly as hated (Any Relationship from 3 and above)
      },
      ['Damages'] = {
        diesWhenInjured = false, -- Set to true if you want the ped to die when injured
        incapacitation = true, -- Set to true if you want the ped to writhe when injured
        criticals = true, -- Set to true if you want the ped to suffer critical hits
        bullets = true, -- Set to true if you want the ped to suffer bullet damage
        fire = true, -- Set to true if you want the ped to suffer fire damage
        explosion = true, -- Set to true if you want the ped to suffer explosion damage
        collision = true, -- Set to true if you want the ped to suffer collision damage
        steam = true, -- Set to true if you want the ped to suffer steam damage
        melee = true, -- Set to true if you want the ped to suffer melee damage
        drown = true, -- Set to true if you want the ped to drown
        electric = true, -- Set to true if you want the ped to suffer electric damage
        ragdoll = false, -- Set to true if you want the ped to die when ragdolled
        invincible = false -- Set to true if you want the ped to be invincible
      },
      ['Drops'] = {
        weapons = false, -- Set to true if you want the ped to drop their weapon when killed
        healthSnacks = false -- Set to true if you want the ped to drop a health snack when killed
      },
      ['Events'] = {
        listensToSoundEvents = true, -- Set to true if you want the ped to listen to sound events
        checkLOSForSoundEvents = true, -- Set to true if you want the ped to check line of sight to generate/respond sound events
        disableWeirdPedEvents = false, -- Set to true if you want the ped to disable weird ped events
        disableCryForHelpEvents = false, -- Set to true if you want the ped to disable cry for help events
        usePerceptionForAimEvents = true, -- Set to true if you want the ped to use perception for aim events
        disableShockingEvents = false, -- Set to true if you want the ped to disable shocking events
        disableShockingDrivingEvents = false -- Set to true if you want the ped to disable shocking driving events
      },
      ['Pathing'] = {
        ['Avoidance'] = {
          avoidDrops = true, -- Set to true if you want the ped to avoid falls from height
          avoidFire = true, -- Set to true if you want the ped to avoid fire
          avoidPeds = true, -- Set to true if you want the ped to avoid other peds
          avoidTearGas = true, -- Set to true if you want the ped to avoid tear gas
          avoidWater = true -- Set to true if you want the ped to avoid water
        },
        ['Movement'] = {
          disableCrouch = false, -- Set to true if you want the ped to disable crouching
          disableDives = false, -- Set to true if you want the ped to disable evasive diving
          disableClimbing = false, -- Set to true if you want the ped to disable climbing over objects
          disableLadders = false -- Set to true if you want the ped to disable climbing ladders
        },
        ['Ragdolling'] = {
          canRagdoll = true, -- Set to true if you want the ped to be able to ragdoll
          pedImpact = true, -- Set to true if you want the ped to ragdoll from ped impacts
          vehicleImpact = true, -- Set to true if you want the ped to ragdoll from vehicle impacts
          bulletImpact = true, -- Set to true if you want the ped to ragdoll from bullet impacts
          explosion = true, -- Set to true if you want the ped to ragdoll from explosions
          fire = true, -- Set to true if you want the ped to ragdoll from fires
          electrocution = true, -- Set to true if you want the ped to ragdoll from being electrocuted
          objectImpact = true, -- Set to true if you want the ped to ragdoll from object impacts
          melee = true, -- Set to true if you want the ped to ragdoll from melee attacks
          waterjetImpact = true, -- Set to true if you want the ped to ragdoll from water jet impacts
          drowning = true, -- Set to true if you want the ped to ragdoll from drowning
          falling = true, -- Set to true if you want the ped to ragdoll from falling
          onBoats = true, -- Set to true if you want the ped to ragdoll from being on boats whilst they're moving
          rubberBullet = true, -- Set to true if you want the ped to ragdoll from rubber bullet impacts
          smokeGrenades = true, -- Set to true if you want the ped to ragdoll from smoke grenade impacts
          pedCollision = true, -- Set to true if you want the ped to ragdoll from ped collisions
          vehicleCollision = true, -- Set to true if you want the ped to ragdoll from vehicle collisions
          playerImpact = true, -- Set to true if you want the ped to ragdoll from player impacts
          aiRagdollImpact = true, -- Set to true if you want the ped to ragdoll from ai ragdoll impacts
          playerRagdollImpact = true, -- Set to true if you want the ped to ragdoll from player ragdoll impacts
          minorPlayerImpact = true, -- Set to true if you want the ped to ragdoll from minor player impacts
          ragdollOnDeath = true -- Set to true if you want the ped to ragdoll on death
        }
      },
      ['Relationships'] = { -- 0 = Companion, 1 = Respect, 2 = Like, 3 = Neutral, 4 = Dislike, 5 = Hate
        [0] = {'ARMY', 'CIVMALE', 'CIVFEMALE'}, -- These Relationships can Randomly Spawn on Cayo
        [5] = 'PLAYER', -- Player specfies any player who doesn't have a job listed above
        override = 'Cayo_Perico'
      }
    }
  }
}
