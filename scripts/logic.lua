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

function access_beans()
    return has("$kill_octo") and has("deku")
        or has("beans") and has("deku")
end

function access_dekupalace()
    return has("deku") and has("$kill_octo")
end

function access_ssh()
    return has("$kill_octo") and has("deku") or has("zora")
end

function flying_bean()
    return has("$water_bean") and has("beans") 
            or has("$access_beans") and has("$water_bean")
end

function clear_ssh()
    return has("$any_sword") and has("bottle") and has("hs") and has("$access_ssh")
         or has("$any_sword") and has("bottle") and has("zora") and has("$access_ssh")
         or has("$any_sword") and has("bottle") and has("$explosion_goron") and has("$flying_bean") and has("$access_ssh")
end

function open_wft()
    return has("deku") and has("$play_sonata") and has("$kill_octo")
end

function use_keg()
    return has("goron") and has("keg")
end

function access_gbt()
    return has("zora") and has("$play_nwbn") and has("$play_epona") and has("hs")
end

function use_lens()
    return has("lens") and has("magic")
end

function day1_ranch()
    return has("goron") and has("keg")
end

function spikes()
    return has("goron") and has("magic")
end

function shoot_fa()
    return has("bow") and has("magic") and has("fa")
end

function shoot_ia()
    return has("bow") and has("ia") and has("magic")
end

function shoot_la()
    return has("bow") and has("la") and has("magic")
end

function access_mountain()
    return has("bow") and has("$explosion_goron")
        or has("$shoot_fa")
end

function ikana_mask()
    return has("garo") or has("gibdo")
end

function access_ikana()
    return has("hs") and has("$play_epona") and has("$ikana_mask")
end

function access_ikana_upper()
    return has("$access_ikana") and has("$shoot_ia")
end

function get_bluegoo()
    return has("$access_ikana") and has("$any_wallet") and has("bottle")
        or has("scents") and has("bottle")
end

function access_well_front()
    return has("$access_ikana_upper") and has("gibdo")
end

function get_hsw()
    return has("$access_mountain") and has("goron") and has("$use_lens") and has("bottle")
        or has("$access_well_front") and has("$get_bluegoo")
end

function open_sht()
    return has("$access_mountain") and has("$spikes") and has("$play_lullaby")
end

function use_scarecrow()
    return has("$access_observatory") and has("hs") and has("ocarina")
end

function access_spring()
    return has("$shoot_fa") and has("$open_sht") and has("$explosion") and has("goht")
        or has("$shoot_fa") and has("$open_sht") and has("$use_scarecrow") and has("goht")
end

function finish_gbt()
    return has("$access_gbt") and has("$shoot_ia") and has("$shoot_fa")
end

function access_pfe()
    return has("$play_epona") and has("zora")
end

function access_pfs()
    return has("$access_pfe") and has("goron")
end

function access_pfi()
    return has("$access_pfe") and has("hs")
        or has("$access_pfs")
end

function finish_graveknuckle()
    return has("$play_epona") and has("$any_sword") and has("captains")
        or has("$play_epona") and has("goron") and has("captains")
end

function kill_keeta()
    return has("sonata") and has("bow") and has("$any_sword")
        or has("sonata") and has("bow") and has("goron")
end

function get_bigpoe()
    return has("$play_epona") and has("captains") and has("bottle") and has("bow")
        or has("$access_ikana_upper") and has("bombs") and has("gibdo") and has("bottle")
end

function access_castle()
    return (has("$access_ikana_upper") and has("mirror"))
        or (has("$access_ikana_upper") and has("la"))
end

function access_castle_upper()
    return has("$access_castle") and has("deku") and has("lens")
end

function kill_igos()
    return has("$access_castle") and has("fa") and has("$any_sword")
     or  has("$access_castle_upper") and has("$use_keg") and has("fa")
end

function access_stt()
    return has("$access_ikana_upper") and has("elegy") and has("zora")
        or has("$access_ikana_upper") and has("elegy") and has("goron")
end

function access_istt()
    return has("$access_stt") and has("la")
end

function kill_odolwa()
    return has("$open_wft") and has("bow")
end

function kill_goht()
    return has("$open_sht") and has("$explosion") and has("fa")
    or has("$open_sht") and has("$use_scarecrow") and has("fa")
end

function kill_gyorg()
    return has("$access_gbt") and has("$shoot_ia") and has("fa")
end

function kill_sunblock()
    return has("mirror") or has("$shoot_la")
end

function access_secretshrine()
    return has("$access_ikana") and has("la")
end