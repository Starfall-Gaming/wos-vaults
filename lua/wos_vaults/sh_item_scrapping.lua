wOS = wOS or {}
wOS.vaults = wOS.vaults or {}

wOS.vaults.scrapper = wOS.vaults.scrapper or {}
wOS.vaults.scrapper.XP_bonus = .2

function wOS.vaults.scrapper.GetReward(item)
    for id, loot in pairs(T_WOSLEGACY.Config.LootTable) do
        if table.HasValue(loot.item_drops, item) then
            return loot.xp * wOS.vaults.scrapper.XP_bonus
        end
    end

    return 0
end

if SERVER then
    util.AddNetworkString("wOS.Scrapper.OpenScrapperMenu")
    util.AddNetworkString("wOS.Scrapper.CloseScrapperMenu")

    net.Receive("wOS.Scrapper.CloseScrapperMenu", function(len, ply)
        ply.InWOSScrapperMenu = false
    end)
end