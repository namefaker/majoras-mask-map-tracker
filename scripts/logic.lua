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

function accsess_observatory()
    return has("deku") or has("$projectile")
end

function accsess_inn()
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
    return has("bottle") or has("storms")
end

function kill_octo()
    return has("bow") or has("hs") or has("zora") or has("pb") or has("bottle")
end

function accsess_dekupalace()
    return has("deku") and has("$kill_octo")
end

function flying_bean()
    return has("$water_bean") and has("beans") 
            or has("deku") and has("bottle")
           or has("deku") and has("pb") and has("$water_bean")
           or has("deku") and has("$kill_octo") and has("$water_bean")
end

function open_wft()
    return has("deku") and has("sonata")
end

function open_sht()
    return has("goron") and has("lullaby")
end

function open_gbt()
    return has("zora") and has("nwbn")
end
