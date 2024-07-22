-- put logic functions here using the Lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
-- don't be afraid to use custom logic functions. it will make many things a lot easier to maintain, for example by adding logging.
-- to see how this function gets called, check: locations/locations.json
-- example:
function has_more_then_n_consumable(n)
    local count = Tracker:ProviderCountForCode('consumable')
    local val = (count > tonumber(n))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    if not amount then
        return count > 0
    else
        amount = tonumber(amount)
        return count >= amount
    end
end

function play_sot()
    return has("ocarina") and has("sot")
end

function play_healing()
    return has("ocarina") and has("healing")
end

function play_soaring()
    return has("ocarina") and has("soaring")
end

function play_storms()
    return has("ocarina") and has("storms")
end

function play_epona()
    return has("ocarina") and has("epona")
end

function play_sonata()
    return has("ocarina") and has("sonata")
end

function play_lullaby()
    return has("ocarina") and has("lullaby")
end

function play_nwbn()
    return has("ocarina") and has("nwbn")
end

function play_elegy()
    return has("ocarina") and has("elegy")
end

function play_oath()
    return has("ocarina") and has("oath")
end

function projectile()
    return has("bow") or has("hs") or has("zora")
            or has("deku") and has("magic")
end

function any_transform() 
    return has("deku") or has("goron") or has("zora")
end

function all_transform()
    return has("deku") and has("goron") and has("zora")
end

function explosion()
    return has("bombs") or has("blast") or has("chu")
end

function explosion_goron()
    return has("bombs") or has("blast") or has("goron") or has("chu")
end

function paper()
    return has("ldeed") or has("mdeed") or has("odeed")
    or has("sdeed") or has("ltk") or has("ltm")
end

function access_observatory()
    return has("deku") or has("$projectile")
end

function access_inn()
    return has("roomkey") or has("deku")
end

function bubbles()
    return has("deku") and has("magic")
end

function any_wallet()
    return has("wallet") or has("wallet2")
end

function any_sword()
    return has("sword") or has("gfs")
end

function water_bean()
    return has("bottle") or has("$play_storms")
end

function kill_octo()
    return has("bow") or has("hs") or has("zora") or has("pb") or has("bottle")
end

function access_dekupalace()
    return has("deku") and has("$kill_octo")
end

function access_ssh()
    return has("$kill_octo") and has("deku") or has("zora")
end

function flying_bean()
    return has("$water_bean") and has("beans") 
            or has("deku") and has("bottle")
           or has("deku") and has("pb") and has("$water_bean")
           or has("deku") and has("$kill_octo") and has("$water_bean")
end

function clear_ssh()
    return has("$any_sword") and has("bottle") and has("hs") and has("$access_ssh")
         or has("$any_sword") and has("bottle") and has("zora") and has("$access_ssh")
         or has("$any_sword") and has("bottle") and has("$explosion_goron") and has("$flying_bean") and has("$access_ssh")
end

function open_wft()
    return has("deku") and has("$play_sonata")
end

function open_sht()
    return has("goron") and has("$play_lullaby")
end

function open_gbt()
    return has("zora") and has("$play_nwbn")
end

function day1_ranch()
    return has("goron") and has("keg")
end
