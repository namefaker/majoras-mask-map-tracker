-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/masks.json")
Tracker:AddItems("items/songs.json")
Tracker:AddItems("items/hints.json")
Tracker:AddItems("items/clickable items.json")
Tracker:AddItems("items/clickable locations.json")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.json")    
    -- Locations
    Tracker:AddLocations("locations/south clock town.json")
    Tracker:AddLocations("locations/north clock town.json")
    Tracker:AddLocations("locations/east clock town.json")
    Tracker:AddLocations("locations/west clock town.json")
    Tracker:AddLocations("locations/stock pot inn.json")
    Tracker:AddLocations("locations/termina field.json")
    Tracker:AddLocations("locations/milk road.json")
    Tracker:AddLocations("locations/romani ranch.json")
    Tracker:AddLocations("locations/road to swamp.json")
    Tracker:AddLocations("locations/southern swamp.json")
    Tracker:AddLocations("locations/woodfall.json")
    Tracker:AddLocations("locations/deku palace.json")
    Tracker:AddLocations("locations/mountain village.json")
    Tracker:AddLocations("locations/twin island.json")
    Tracker:AddLocations("locations/goron village.json")
    Tracker:AddLocations("locations/path to snowhead.json")
    Tracker:AddLocations("locations/great bay coast.json")
    Tracker:AddLocations("locations/zora cape.json")
    Tracker:AddLocations("locations/zora hall.json")
    Tracker:AddLocations("locations/pirate fortress exterior.json")
    Tracker:AddLocations("locations/pirate fortress sewers.json")
    Tracker:AddLocations("locations/pirate fortress interior.json")
    Tracker:AddLocations("locations/ikana graveyard.json")
    Tracker:AddLocations("locations/pinnacle rock.json")
    Tracker:AddLocations("locations/road to ikana.json")
    Tracker:AddLocations("locations/ikana canyon.json")
    Tracker:AddLocations("locations/secret shrine.json")
    Tracker:AddLocations("locations/beneath the well.json")
    Tracker:AddLocations("locations/ikana castle.json")
    Tracker:AddLocations("locations/stone tower.json")
    Tracker:AddLocations("locations/woodfall temple.json")
    Tracker:AddLocations("locations/snowhead temple.json")
    Tracker:AddLocations("locations/great bay temple.json")
    Tracker:AddLocations("locations/stone tower temple.json")
end

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/masks.json")
Tracker:AddLayouts("layouts/songs.json")
Tracker:AddLayouts("layouts/woth.json")
Tracker:AddLayouts("layouts/foolish.json")
Tracker:AddLayouts("layouts/always.json")
Tracker:AddLayouts("layouts/temporary.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
