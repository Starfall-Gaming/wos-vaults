wOS = wOS or {}
wOS.vaults = wOS.vaults or {}

local clientside = {
    "vgui/sh_scrapper.lua",
    "vgui/sh_public_vault.lua",
    "vgui/sh_private_vault.lua",
}
local shared = {
    "wos_vaults/sh_item_scrapping.lua",
}
local serverside = {}

for _, sharedfile in pairs(shared) do
    include(sharedfile)
end

if SERVER then
    for _, serverfile in pairs(serverside) do
        include(serverfile)
    end

    for _, sharedfile in pairs(shared) do
        AddCSLuaFile(sharedfile)
    end

    for _, clientfile in pairs(clientside) do
        AddCSLuaFile(clientfile)
    end
else
    for _, clientfile in pairs(clientside) do
        include(clientfile)
    end
end