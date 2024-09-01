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

function is_active(item)
    return Tracker:FindObjectForCode(item).Active
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
    return has("bow")
    or has("hs")
    or has("zora")
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

function hitspot_trigger()
    return has ("bow")
        or has ("hs")
        or has("zora")
        or has("$bubbles")
        or has("chu")
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

function access_igosroom()
    return has("$access_castle") and has("$shoot_la")
        or has("$access_castle") and has("$use_keg") and has("$use_lens") and has("$shoot_fa")
 end

function kill_igos()
    return has("$access_castle") and has("$shoot_fa") and has("$any_sword") and has("mirror") and has("$shoot_la")
     or  has("$access_castle_upper") and has("$use_keg") and has("fa") and has("mirror")
end

function access_stt()
    return has("$access_ikana_upper") and has("elegy") and has("zora")
        or has("$access_ikana_upper") and has("elegy") and has("goron")
end

function access_istt()
    return has("$access_stt") and has("$shoot_la")
end

function kill_odolwa()
    return has("$open_wft") and has("bow")
end

function kill_goht()
    return has("$open_sht") and has("$explosion") and has("fa")
    or has("$open_sht") and has("$use_scarecrow") and has("fa")
end

function kill_gyorg()
    return has("$access_gbt") and has("$shoot_ia") and has("$shoot_fa")
end

function kill_sunblock()
    return has("mirror") or has("$shoot_la")
end

function access_secretshrine()
    return has("$access_ikana") and has("$shoot_la")
end

function access_ikana_canyon_ool()
    return has("goron") and has("$ikana_mask") and has("hs")
        or has("$play_epona") and has("$ikana_mask") and has("hs")
end

function access_ikana_upper_ool()
    return has("$access_ikana_canyon_ool") or has("$access_ikana_upper")
end

function access_castle_ool()
    return has("$access_ikana_upper_ool") and has("zora")
        or has("$access_ikana_upper_ool") and has("$shoot_la")
        or has("$access_ikana_upper_ool") and has("mirror")
end

function access_igosroom_ool()
    return has("$access_castle_ool") and has("$shoot_la")
        or has("$access_castle_ool") and has("$shoot_fa") and has("$use_keg") and has("mirror")
end

function kill_igos_ool()
    return has("$access_igosroom_ool") and has("$shoot_fa") and has("$any_sword") and has("mirror")
        or has("$access_igosroom_ool") and has("$shoot_fa") and has("$any_transform") and has("mirror")
end

function access_stt_ool()
    return has("$access_ikana_upper_ool") and has("$play_elegy") and has("zora")
        or has("$access_ikana_upper_ool") and has("$play_elegy") and has("goron")
end

function access_istt_ool()
    return has("$access_stt_ool") and has("$shoot_la")
end

function access_dekupalace_ool()
    return has("$kill_octo") and has("zora")
        or has("$kill_octo") and has("goron")
        or has("$kill_octo") and has("bottle")
        or has("$kill_octo") and has("pb")
end

function get_bluegoo_ool()
    return has("$access_ikana_canyon_ool") and has("$any_wallet") and has("bottle")
        or has("scents") and has("bottle")
end

function access_inn_ool()
    return has("zora") or has("bombs")
end

function all_osh_token(n)
    local count = Tracker:ProviderCountForCode('osh_token')
    local val = (count >= tonumber(30))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function all_ssh_token(n)
    local count = Tracker:ProviderCountForCode('ssh_token')
    local val = (count >= tonumber(30))
    if ENABLE_DEBUG_LOG then
        print(string.format("called has_more_then_n_consumable: count: %s, n: %s, val: %s", count, n, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function active_tokenshuffle_osh()
    return has("on_skullsanity") and has("$all_osh_token")
end

function active_tokenshuffle_ssh()
    return has("on_skullsanity") and has("$all_ssh_token")
end

function mask_count()
    local mask = 0
    if Tracker:FindObjectForCode("postman").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("anm").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("blast").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("stone").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("fairymask").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("keaton").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("bremen").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("bunny").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("dongero").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("scents").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("romani").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("circus").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("kafei").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("couples").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("truth").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("kamaro").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("gibdo").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("garo").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("captains").Active then mask = mask + 1 end
    if Tracker:FindObjectForCode("giant").Active then mask = mask + 1 end
    return mask
end

function mask_count_1()
    if mask_count() >= 1 then
        return true
    else
        return false
    end
end

function mask_count_2()
    if mask_count() >= 2 then
        return true
    else
        return false
    end
end

function mask_count_3()
    if mask_count() >= 3 then
        return true
    else
        return false
    end
end

function mask_count_4()
    if mask_count() >= 4 then
        return true
    else
        return false
    end
end

function mask_count_10()
    if mask_count() >= 10 then
        return true
    else
        return false
    end
end

function mask_count_20()
    if mask_count() == 20 then
        return true
    else
        return false
    end
end

function fairys_wf()
    local count = Tracker:ProviderCountForCode('WFTfairy')
    local val = (count >= 15)
    if ENABLE_DEBUG_LOG then
        print(string.format("called fairys_wf: count: %s, val: %s", count, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function fairys_sh()
    local count = Tracker:ProviderCountForCode('SHTfairy')
    local val = (count >= 15)
    if ENABLE_DEBUG_LOG then
        print(string.format("called fairys_sh: count: %s, val: %s", count, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function fairys_gb()
    local count = Tracker:ProviderCountForCode('GBTfairy')
    local val = (count >= 15)
    if ENABLE_DEBUG_LOG then
        print(string.format("called fairys_gb: count: %s, val: %s", count, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end

function fairys_st()
    local count = Tracker:ProviderCountForCode('STTfairy')
    local val = (count >= 15)
    if ENABLE_DEBUG_LOG then
        print(string.format("called fairys_st: count: %s, val: %s", count, val))
    end
    if val then
        return 1 -- 1 => access is in logic
    end
    return 0 -- 0 => no access
end
