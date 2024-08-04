-- Defines the entity's type, base, printable name, and author for shared access (both server and client)
ENT.Type = "anim" -- Sets the entity type to 'anim', indicating it's an animated entity.
ENT.Base = "base_gmodentity" -- Specifies that this entity is based on the 'base_gmodentity', inheriting its functionality.
ENT.PrintName = "wOS Item Scrapper WIP" -- The name that will appear in the spawn menu.
ENT.Author = "Froggles" -- The author's name for this entity.
ENT.Category = "[wOS] Vaults" -- The category for this entity in the spawn menu.
ENT.Contact = "STEAM_0:0:100858678" -- The contact details for the author of this entity.
ENT.Purpose = "Trade in items for money and xp" -- The purpose of this entity.
ENT.Spawnable = true -- Specifies whether this entity can be spawned by players in the spawn menu.

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