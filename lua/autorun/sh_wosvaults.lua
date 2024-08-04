wOS = wOS or {}
wOS.vaults = wOS.vaults or {}

if CLIENT then
    AddCSLuaFile("vgui/sh_scrapper.lua")
    AddCSLuaFile("vgui/sh_publicvault.lua")
    AddCSLuaFile("vgui/sh_privatevault.lua")
end